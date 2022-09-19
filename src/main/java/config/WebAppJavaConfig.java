//package config;
//
//import org.hibernate.SessionFactory;
//import org.hibernate.annotations.common.util.impl.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.MessageSource;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.ComponentScan;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.context.support.ResourceBundleMessageSource;
//import org.springframework.transaction.annotation.EnableTransactionManagement;
//import org.springframework.web.multipart.commons.CommonsMultipartResolver;
//import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
//import org.springframework.web.servlet.config.annotation.EnableWebMvc;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
//import org.springframework.web.servlet.view.InternalResourceViewResolver;
//import org.springframework.web.servlet.view.JstlView;
//
//@Configuration
//@EnableWebMvc
//@EnableTransactionManagement
//@ComponentScan({"wuli", "home"})
//public class WebAppJavaConfig implements WebMvcConfigurer {
//
//
//  private SessionFactory factory;
//
//  @Autowired
//  private RequestMappingHandlerAdapter requestMappingHandlerAdapter;
//
//  @Autowired
//  public WebAppJavaConfig(SessionFactory factory) {
//    this.factory = factory;
//  }
//
//  @Bean
//  public InternalResourceViewResolver viewResolver() {
//    InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//    resolver.setPrefix("/WEB-INF/views/");
//    resolver.setSuffix(".jsp");
//    resolver.setViewClass(JstlView.class);
//    return resolver;
//  }
//  /*
//  解決靜態資源的問題:
//  在組態檔中配置
//  <mvc:default-servlet-handler/>
//   *
//   */
//  @Bean
//  public CommonsMultipartResolver multipartResolver() {
//    CommonsMultipartResolver resolver = new CommonsMultipartResolver();
//    resolver.setDefaultEncoding("UTF-8");
//    resolver.setMaxUploadSize(81920000);
//    return resolver;
//  }
//
//  @Override
//  public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
//    configurer.enable();
//  }
//
//
//
//
//
//  @Bean
//  public MessageSource messageSource() { // 方法名不能亂打
//    ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
//
//    // messageSource.setBasename("MemberMessage");
//    messageSource.setBasenames("MemberMessage", "ValidationMessages");
//    return messageSource;
//  }
//}
