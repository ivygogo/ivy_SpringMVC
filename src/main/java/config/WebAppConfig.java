package config;


import javax.annotation.PostConstruct;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.support.OpenSessionInViewInterceptor;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@EnableTransactionManagement // 本註釋必須與@Configuration出現在同一個類別
@ComponentScan({"wuli", "home"})
public class WebAppConfig implements WebMvcConfigurer {

  private static Logger log = LoggerFactory.getLogger(WebAppConfig.class);

  private SessionFactory factory;

  @Autowired private RequestMappingHandlerAdapter requestMappingHandlerAdapter;

  @Autowired
  public WebAppConfig(SessionFactory factory) {
    log.info("已建立WebAppConfig物件");
    this.factory = factory;
  }

  // 取消"redirect+冒號..."時會掛上QueryString
  //	@PostConstruct
  public void init() {
    requestMappingHandlerAdapter.setIgnoreDefaultModelOnRedirect(true);
  }

  @PostConstruct
  public void init2() {
    requestMappingHandlerAdapter.setIgnoreDefaultModelOnRedirect(true);
  }

  @Bean
  public InternalResourceViewResolver internalResourceViewResolver() {
    InternalResourceViewResolver resolver = new InternalResourceViewResolver();
    resolver.setPrefix("/WEB-INF/views/");
    resolver.setSuffix(".jsp");
    return resolver;
  }

  @Bean
  public CommonsMultipartResolver multipartResolver() {
    CommonsMultipartResolver resolver = new CommonsMultipartResolver();
    resolver.setDefaultEncoding("UTF-8");
    resolver.setMaxUploadSize(81920000);
    return resolver;
  }

  @Override
  public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
    configurer.enable();
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    OpenSessionInViewInterceptor openSessionInViewInterceptor = new OpenSessionInViewInterceptor();
    //CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor();
    //registry.addInterceptor(checkLoginInterceptor);
    openSessionInViewInterceptor.setSessionFactory(factory);
    registry
        .addWebRequestInterceptor(openSessionInViewInterceptor)
        .addPathPatterns("/_05_orderProcess/orderDetail");
  }
}
