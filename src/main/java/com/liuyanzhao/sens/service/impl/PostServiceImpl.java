//package com.liuyanzhao.sens.service.impl;
//
//import com.baomidou.mybatisplus.plugins.Page;
//import com.google.common.base.Strings;
//import com.liuyanzhao.sens.entity.*;
//import com.liuyanzhao.sens.mapper.PostMapper;
//import com.liuyanzhao.sens.model.dto.Archive;
//import com.liuyanzhao.sens.model.dto.PostBriefDto;
//import com.liuyanzhao.sens.model.dto.PostViewsDto;
//import com.liuyanzhao.sens.model.enums.PostStatusEnum;
//import com.liuyanzhao.sens.model.enums.PostTypeEnum;
//import com.liuyanzhao.sens.service.PostService;
//import com.liuyanzhao.sens.utils.SensUtils;
//import cn.hutool.http.HtmlUtil;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.cache.annotation.CacheEvict;
//import org.springframework.cache.annotation.Cacheable;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.io.IOException;
//import java.util.*;
//import java.util.concurrent.TimeUnit;
//import java.util.stream.Collectors;
//
///**
// * <pre>
// *     记录业务逻辑实现类
// * </pre>
// *
// * @author : saysky
// * @date : 2017/11/14
// */
//@Service
//@Slf4j
//public class PostServiceImpl implements PostService {
//
//    private static final String POSTS_CACHE_NAME = "posts";
//
//    private static final String CATEGORIES_CACHE_NAME = "categories";
//
//    private static final String TAGS_CACHE_NAME = "tags";
//
//
//    @Autowired(required = false)
//    private PostMapper postMapper;
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public Post saveByPost(Post post) {
//        post.setPostUpdate(new Date());
//        //更新记录
//        if (post != null && post.getPostId() != null) {
//            postMapper.updateById(post);
//
//        }
//        //添加记录
//        else {
//            postMapper.insert(post);
//            return post;
//        }
//    }
//
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public void removeByPostId(Long postId) {
//            postMapper.deleteById(postId);
//    }
//
//    @Override
//    @CacheEvict(value = POSTS_CACHE_NAME, allEntries = true, beforeInvocation = true)
//    public Post updatePostStatus(Long postId, Integer status) {
//        Post post = this.findByPostId(postId);
//        post.setPostStatus(status);
//        postMapper.updateById(post);
//        return post;
//    }
//
//    @Override
//    @CacheEvict(value = POSTS_CACHE_NAME, allEntries = true, beforeInvocation = true)
//    public void updateAllSummary(Integer postSummary) {
//        List<Post> posts = this.findPostByStatus(PostStatusEnum.PUBLISHED.getCode(), PostTypeEnum.POST_TYPE_POST.getDesc());
//        for (Post post : posts) {
//            String text = HtmlUtil.cleanHtmlTag(post.getPostContent());
//            if (text.length() > postSummary) {
//                postMapper.updatePostSummary(post.getPostId(), text.substring(0, postSummary));
//            } else {
//                postMapper.updatePostSummary(post.getPostId(), text);
//            }
//        }
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_type_'+#postType")
//    public List<Post> findAllPosts(String postType) {
//        return postMapper.findPostsByPostType(postType);
//    }
//
//    @Override
//    public Page<Post> searchPosts(String keyWord, Page<Post> page) {
//        return page.setRecords(postMapper.pagingByPostTitleLike(keyWord, page));
//    }
//
//
//    @Override
//    public Page<Post> findPostByStatus(Integer status, String postType, Page<Post> page) {
//        List<Post> posts = postMapper.pagingPostsByPostStatusAndPostType(status, postType, page);
//        return page.setRecords(posts);
//    }
//
//
//    @Override
//    public Page<Post> findPostByUserIdAndStatus(Long userId, Integer status, String postType, Page<Post> page) {
//        List<Post> posts = postMapper.pagingPostsByUserIdAndPostStatusAndPostType(userId, status, postType, page);
//        return page.setRecords(posts);
//    }
//
//    @Override
//    public Page<Post> findPostByStatusWithContent(Integer status, String postType, Page<Post> page) {
//        return page.setRecords(postMapper.pagingPostsWithContentByPostStatusAndPostType(status, postType, page));
//    }
//
//    @Override
//    public Page<Post> findPostByStatus(Page<Post> page) {
//        //需要封装分类
//        List<Post> postList = postMapper.pagingPostsByPostStatusAndPostType(PostStatusEnum.PUBLISHED.getCode(), PostTypeEnum.POST_TYPE_POST.getDesc(), page);
//        return page.setRecords(postList);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_status_type_'+#status+'_'+#postType")
//    public List<Post> findPostByStatus(Integer status, String postType) {
//        return postMapper.findPostsByPostStatusAndPostType(status, postType);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_id_'+#postId", unless = "#result == null")
//    public Post findByPostId(Long postId) {
//        return postMapper.selectById(postId);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_id_type_' + #postId + '_' + #postType", unless = "#result == null")
//    public Post findByPostId(Long postId, String postType) {
//        return postMapper.findPostByPostIdAndPostType(postId, postType);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_url_'+#postUrl", unless = "#result == null")
//    public Post findByPostUrl(String postUrl) {
//        return postMapper.findPostByPostUrl(postUrl);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_url_type_'+#postUrl+'_'+#postType", unless = "#result == null")
//    public Post findByPostUrl(String postUrl, String postType) {
//        return postMapper.findPostByPostUrlAndPostType(postUrl, postType);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_latest'")
//    public List<Post> findPostLatest() {
//        return postMapper.findTopFive();
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_next_id_'+#postId+'_type_'+#postType", unless = "#result == null")
//    public Post findNextPost(Long postId, String postType) {
//        return postMapper.findByPostIdAfter(postId, postType);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_precious_id_'+#postId+'_type_'+#postType", unless = "#result == null")
//    public Post findPreciousPost(Long postId, String postType) {
//        return postMapper.findByPostIdBefore(postId, postType);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'post_year_month'")
//    public List<Archive> findPostGroupByYearAndMonth() {
//        List<Archive> archives = postMapper.findPostGroupByYearAndMonth();
//        for (int i = 0; i < archives.size(); i++) {
//            archives.get(i).setPosts(this.findPostByYearAndMonth(archives.get(i).getYear(), archives.get(i).getMonth()));
//        }
//        return archives;
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'post_year'")
//    public List<Archive> findPostGroupByYear() {
//        List<Archive> archives = postMapper.findPostGroupByYear();
//        for (int i = 0; i < archives.size(); i++) {
//            archives.get(i).setPosts(this.findPostByYear(archives.get(i).getYear()));
//        }
//        return archives;
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_year_month_'+#year+'_'+#month")
//    public List<PostBriefDto> findPostByYearAndMonth(String year, String month) {
//        return postMapper.findPostByYearAndMonth(year, month);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_year_'+#year")
//    public List<PostBriefDto> findPostByYear(String year) {
//        return postMapper.findPostByYear(year);
//    }
//
//    @Override
//    public Page<Post> findPostByYearAndMonth(String year, String month, Page<Post> page) {
//        return page.setRecords(postMapper.pagingPostByYearAndMonth(year, month, null));
//    }
//
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_hot'")
//    public List<Post> hotPosts() {
//        return postMapper.listHotPosts(10);
//    }
//
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_count_type_'+#postType+'_status_'+#status")
//    public Integer countByPostTypeAndStatus(String postType, Integer status) {
//        return postMapper.countByPostStatusAndPostType(status, postType);
//
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_type_'+#postType+'_status_'+#status")
//    public List<Post> findByPostTypeAndStatus(String postType, Integer status) {
//        return postMapper.findPostsByPostStatusAndPostType(status, postType);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_count_uid_'+#userId+'_status_'+#status")
//    public Integer countArticleByUserIdAndStatus(Long userId, Integer status) {
//        return postMapper.countByUserIdAndPostStatusAndPostType(userId, status, PostTypeEnum.POST_TYPE_POST.getDesc());
//    }
//
//    @Override
//    public String buildRss(List<Post> posts) {
//        String rss = "";
//        try {
//            rss = SensUtils.getRss(posts);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return rss;
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_sitemap'")
//    public String buildArticleSiteMap() {
//        List<Post> posts = this.findPostByStatus(0, PostTypeEnum.POST_TYPE_POST.getDesc());
//        return SensUtils.getSiteMap(posts);
//    }
//
//    @Override
//    public String syncAllPostView() {
//        log.info("======================开始 同步记录访问量======================");
//        Long startTime = System.nanoTime();
//        List<PostViewsDto> dtoList = new ArrayList<>();
//        //从redis取值封装List
//        Integer prefixLength = "posts_views::posts_views_id_".length();
//        Set<String> keySet = redisUtil.keys("posts_views::posts_views_id_*");
//        for (String key : keySet) {
//            dtoList.add(new PostViewsDto(Long.parseLong(key.substring(prefixLength)), Long.parseLong(redisUtil.get(key))));
//        }
//        //更新到数据库中
//        postMapper.batchUpdatePostViews(dtoList);
//        Long endTime = System.nanoTime();
//        String total = (endTime - startTime) / 1000000 + "ms";
//        log.info("本次记录访问量同步成功, 总耗时: {}", total);
//        log.info("======================结束 记录访问量结束======================");
//        return total;
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'last_update_time'")
//    public Date getLastUpdateTime() {
//        Date date = postMapper.selectMaxPostUpdate();
//        if (date == null) {
//            return new Date();
//        }
//        return date;
//    }
//
//    @Override
//    public void resetAllPostCommentSize() {
//        System.out.println(Thread.currentThread().getName() + "开始");
//        Long start = System.currentTimeMillis();
//        List<Long> ids = postMapper.selectAllPostIds();
//        ids.forEach(id -> {
//            postMapper.updateCommentSize(id);
//        });
//        Long end = System.currentTimeMillis();
//        System.out.println("重置成功，耗时：" + (end - start) + "ms");
//        System.out.println(Thread.currentThread().getName() + "结束");
//        log.info("重置成功，耗时：" + (end - start) + "ms");
//    }
//
//    @Override
//    @CacheEvict(value = POSTS_CACHE_NAME, allEntries = true, beforeInvocation = true)
//    public void updateCommentSize(Long postId) {
//        postMapper.updateCommentSize(postId);
//    }
//
//    @Override
//    @CacheEvict(value = POSTS_CACHE_NAME, allEntries = true, beforeInvocation = true)
//    public void updatePostLikes(Long postId) {
//        postMapper.updatePostLikes(postId);
//    }
//
//    @Override
//    @CacheEvict(value = POSTS_CACHE_NAME, allEntries = true, beforeInvocation = true)
//    public void removeByUserId(Long userId) {
//        postMapper.deleteByUserId(userId);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_uid_'+#userId+'_status_'+#status+'_page_'+#page.current", condition = "#page.current < 5")
//    public Page<Post> findByUserIdAndStatus(Long userId, Integer status, Page<Post> page) {
//        List<Post> postList = postMapper.findByUserIdAndStatus(userId, status, page);
//        for (int i = 0; i < postList.size(); i++) {
//            List<Category> categories = categoryService.findByPostId(postList.get(i).getPostId());
//            postList.get(i).setCategories(categories);
//        }
//        return page.setRecords(postList);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_count_uid_'+#userId")
//    public Integer countByUserId(Long userId) {
//        return postMapper.countByUserId(userId);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_ids_uid'+#userId")
//    public List<Long> selectIdsByUserId(Long userId) {
//        return postMapper.selectIdsByUserId(userId);
//    }
//
//    @Override
//    @Cacheable(value = POSTS_CACHE_NAME, key = "'posts_related_id_'+#postId")
//    public List<Post> listRelatedPosts(Long postId) {
//        Post post = this.findByPostId(postId);
//        if (post != null && !Strings.isNullOrEmpty(post.getRelatedIds())) {
//            String[] arr = post.getRelatedIds().split(",|，");
//            List<Long> list = new ArrayList(Arrays.asList(arr));
//            return postMapper.selectBatchIds(list);
//        }
//        return this.hotPosts();
//    }
//
//
//}
