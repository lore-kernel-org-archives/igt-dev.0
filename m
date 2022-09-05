Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A57D10E3AC
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 13:55:05 +0000 (UTC)
Date: Mon, 5 Sep 2022 16:53:53 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: janga.rahul.kumar@intel.com
Message-ID: <YxX/ce428cCpzUmR@platvala-desk.ger.corp.intel.com>
References: <20220905125320.3475254-1-janga.rahul.kumar@intel.com>
 <20220905125320.3475254-2-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905125320.3475254-2-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_core.h: Introduce
 igt_subtest_group_named
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 06:23:20PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> igt_subtest_group_named will check for requirements only
> when the subtest inside igt_subtest_group_named are executed.
> 
> This will help in avoiding the logging related to requirements of
> subgroup tests when tests outside the subgroup are executed
> individually.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

How is this supposed to be used? Does one need to list all subtests a
subtest_group is going to have one by one? That's prone to errors and
a maintenance nightmare.

If the purpose is just to get logging easier to read, a better
solution is in my TODO with the runner communications rework that puts
the result reason alongside the result text itself.


-- 
Petri Latvala



> ---
>  lib/igt_core.c | 23 +++++++++++++++++++++++
>  lib/igt_core.h | 20 ++++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index e7425326..7d84e145 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -658,6 +658,29 @@ void __igt_fixture_end(void)
>  	siglongjmp(igt_subtest_jmpbuf, 1);
>  }
>  
> +bool __igt_check_subtest_list(const char *subtest_name, ...)
> +{
> +	va_list valist;
> +	bool match = false;
> +	char *next_subtest_name = (char *)subtest_name;
> +
> +	if (!run_single_subtest)
> +		return true;
> +
> +	va_start(valist, *subtest_name);
> +
> +	while (next_subtest_name != NULL) {
> +		if (uwildmat(run_single_subtest, next_subtest_name) != 0)
> +			match = true;
> +
> +		next_subtest_name = va_arg(valist, char *);
> +	}
> +
> +	va_end(valist);
> +
> +	return match;
> +}
> +
>  /*
>   * If the test takes out the machine, in addition to the usual dmesg
>   * spam, the kernel may also emit a "death rattle" -- extra debug
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index aa98e8ed..774e1893 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -138,6 +138,7 @@ struct _GKeyFile *igt_load_igtrc(void);
>  bool __igt_fixture(void);
>  void __igt_fixture_complete(void);
>  __noreturn void __igt_fixture_end(void);
> +bool __igt_check_subtest_list(const char *subtest_name, ...);
>  /**
>   * igt_fixture:
>   *
> @@ -401,6 +402,25 @@ void __igt_subtest_group_restore(int, int);
>  			       __igt_subtest_group_restore(igt_unique(__save), \
>  							   igt_unique(__desc)))
>  
> +/**
> + * igt_subtest_group_named:
> + *
> + * Group a set of subtests together with their common setup code
> + *
> + * This macro will execute common setup only when subtests under the
> + * group are ran.
> + */
> +#define igt_subtest_group_named(...) for (int igt_unique(__tmpint) = 0, \
> +					  igt_unique(__save) = 0, \
> +					  igt_unique(__desc) = 0; \
> +					  __igt_check_subtest_list(__VA_ARGS__, NULL) && \
> +					  igt_unique(__tmpint) < 1 && \
> +					  (__igt_subtest_group_save(&igt_unique(__save), \
> +								    &igt_unique(__desc)), true); \
> +					  igt_unique(__tmpint) ++, \
> +					  __igt_subtest_group_restore(igt_unique(__save), \
> +								      igt_unique(__desc)))
> +
>  /**
>   * igt_main_args:
>   * @extra_short_opts: getopt_long() compliant list with additional short options
> -- 
> 2.25.1
> 
