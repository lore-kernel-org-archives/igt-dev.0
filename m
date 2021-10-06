Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F0E6E507
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 08:01:25 +0000 (UTC)
Date: Wed, 6 Oct 2021 10:01:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211006080114.GA3919@zkempczy-mobl2>
References: <20211005222935.42609-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005222935.42609-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: Refactor construction of
 unique tokens
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 03:29:34PM -0700, Ashutosh Dixit wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Wrap all the igt_tokencat(prefix, __LINE) into its own igt_unique() to
> reduce the clutter and make it easier to generate unique tokens for other
> common macros.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>

Ok, looks safe.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/igt_core.h | 54 ++++++++++++++++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 22 deletions(-)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 8d433fc1655..6b8dbf348d8 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -147,12 +147,12 @@ __noreturn void __igt_fixture_end(void);
>   * enumeration (e.g. when enumerating on systems without an intel gpu) such
>   * blocks should be annotated with igt_fixture.
>   */
> -#define igt_fixture for (volatile int igt_tokencat(__tmpint,__LINE__) = 0; \
> -			 igt_tokencat(__tmpint,__LINE__) < 1 && \
> +#define igt_fixture for (volatile int igt_unique(__tmpint) = 0; \
> +			 igt_unique(__tmpint) < 1 && \
>  			 (STATIC_ANALYSIS_BUILD || \
>  			 (__igt_fixture() && \
>  			 (sigsetjmp(igt_subtest_jmpbuf, 1) == 0))); \
> -			 igt_tokencat(__tmpint,__LINE__) ++, \
> +			 igt_unique(__tmpint) ++, \
>  			 __igt_fixture_complete())
>  
>  /* subtest infrastructure */
> @@ -203,6 +203,16 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name);
>   */
>  #define igt_tokencat(x, y) __igt_tokencat2(x, y)
>  
> +/**
> + * igt_unique:
> + * @prefix: local identifier
> + *
> + * C preprocessor helper to generate a custom 'unique' token by appending
> + * the line number onto the token.
> + */
> +#define igt_unique(prefix) \
> +	igt_tokencat(igt_tokencat(__igt_unique__, prefix), __LINE__)
> +
>  /**
>   * igt_subtest:
>   * @name: name of the subtest
> @@ -238,7 +248,7 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name);
>   * static string.
>   */
>  #define igt_subtest_f(f...) \
> -	__igt_subtest_f(igt_tokencat(__tmpchar, __LINE__), f)
> +	__igt_subtest_f(igt_unique(__tmpchar), f)
>  
>  /**
>   * igt_subtest_with_dynamic:
> @@ -315,7 +325,7 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name);
>   * format string instead of a static string.
>   */
>  #define igt_subtest_with_dynamic_f(f...) \
> -	__igt_subtest_with_dynamic_f(igt_tokencat(__tmpchar, __LINE__), f)
> +	__igt_subtest_with_dynamic_f(igt_unique(__tmpchar), f)
>  
>  /**
>   * igt_dynamic:
> @@ -358,7 +368,7 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name);
>   * instead of a static string.
>   */
>  #define igt_dynamic_f(f...) \
> -	__igt_dynamic_f(igt_tokencat(__tmpchar, __LINE__), f)
> +	__igt_dynamic_f(igt_unique(__tmpchar), f)
>  
>  const char *igt_subtest_name(void);
>  bool igt_only_list_subtests(void);
> @@ -380,15 +390,15 @@ void __igt_subtest_group_restore(int, int);
>   * clauses. If any common setup in a fixture fails, only the subtests in this
>   * group will fail or skip. Subtest groups can be arbitrarily nested.
>   */
> -#define igt_subtest_group for (int igt_tokencat(__tmpint,__LINE__) = 0, \
> -			       igt_tokencat(__save,__LINE__) = 0, \
> -			       igt_tokencat(__desc,__LINE__) = 0; \
> -			       igt_tokencat(__tmpint,__LINE__) < 1 && \
> -			       (__igt_subtest_group_save(& igt_tokencat(__save,__LINE__), \
> -							 & igt_tokencat(__desc,__LINE__) ), true); \
> -			       igt_tokencat(__tmpint,__LINE__) ++, \
> -			       __igt_subtest_group_restore(igt_tokencat(__save,__LINE__), \
> -							   igt_tokencat(__desc,__LINE__)))
> +#define igt_subtest_group for (int igt_unique(__tmpint) = 0, \
> +			       igt_unique(__save) = 0, \
> +			       igt_unique(__desc) = 0; \
> +			       igt_unique(__tmpint) < 1 && \
> +			       (__igt_subtest_group_save(& igt_unique(__save), \
> +							 & igt_unique(__desc) ), true); \
> +			       igt_unique(__tmpint) ++, \
> +			       __igt_subtest_group_restore(igt_unique(__save), \
> +							   igt_unique(__desc)))
>  
>  /**
>   * igt_main_args:
> @@ -404,15 +414,15 @@ void __igt_subtest_group_restore(int, int);
>   * #igt_subtest_init_parse_opts.
>   */
>  #define igt_main_args(short_opts, long_opts, help_str, opt_handler, handler_data) \
> -	static void igt_tokencat(__real_main, __LINE__)(void); \
> +	static void igt_unique(__real_main)(void); \
>  	int main(int argc, char **argv) { \
>  		igt_subtest_init_parse_opts(&argc, argv, \
>  					    short_opts, long_opts, help_str, \
>  					    opt_handler, handler_data); \
> -		igt_tokencat(__real_main, __LINE__)(); \
> +		igt_unique(__real_main)(); \
>  		igt_exit(); \
>  	} \
> -	static void igt_tokencat(__real_main, __LINE__)(void) \
> +	static void igt_unique(__real_main)(void) \
>  
>  
>  /**
> @@ -460,15 +470,15 @@ void igt_simple_init_parse_opts(int *argc, char **argv,
>   * #igt_simple_init_parse_opts.
>   */
>  #define igt_simple_main_args(short_opts, long_opts, help_str, opt_handler, handler_data) \
> -	static void igt_tokencat(__real_main, __LINE__)(void); \
> +	static void igt_unique(__real_main)(void); \
>  	int main(int argc, char **argv) { \
>  		igt_simple_init_parse_opts(&argc, argv, \
>  					   short_opts, long_opts, help_str, \
>  					   opt_handler, handler_data);	\
> -		igt_tokencat(__real_main, __LINE__)(); \
> +		igt_unique(__real_main)(); \
>  		igt_exit(); \
>  	} \
> -	static void igt_tokencat(__real_main, __LINE__)(void) \
> +	static void igt_unique(__real_main)(void) \
>  
>  
>  /**
> @@ -490,7 +500,7 @@ void igt_simple_init_parse_opts(int *argc, char **argv,
>   */
>  #define igt_constructor \
>  	__attribute__((constructor)) \
> -	static void igt_tokencat(__igt_constructor_l, __LINE__)(void)
> +	static void igt_unique(__igt_constructor_l)(void)
>  
>  __noreturn __attribute__((format(printf, 1, 2)))
>  void igt_skip(const char *f, ...);
> -- 
> 2.33.0
> 
