Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CB610F46E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 12:59:51 +0000 (UTC)
Date: Wed, 25 May 2022 15:57:34 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Yo4nvho0QLxbMR49@platvala-desk.ger.corp.intel.com>
References: <20220524120717.748348-1-mauro.chehab@linux.intel.com>
 <20220524120717.748348-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524120717.748348-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_core: use print_backtrace()
 on internal_assert()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 24, 2022 at 02:07:16PM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> When internal_assert() hits, it is desired to know what part
> of the code actually hit the issue.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/igt_core.c | 124 +++++++++++++++++++++++++------------------------
>  1 file changed, 63 insertions(+), 61 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index b7116f4e5433..e7425326b7f0 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -351,6 +351,67 @@ static bool stderr_needs_sentinel = false;
>  
>  static int _igt_dynamic_tests_executed = -1;
>  
> +static void print_backtrace(void)
> +{
> +	unw_cursor_t cursor;
> +	unw_context_t uc;
> +	int stack_num = 0;
> +
> +	Dwfl_Callbacks cbs = {
> +		.find_elf = dwfl_linux_proc_find_elf,
> +		.find_debuginfo = dwfl_standard_find_debuginfo,
> +	};
> +
> +	Dwfl *dwfl = dwfl_begin(&cbs);
> +
> +	if (dwfl_linux_proc_report(dwfl, getpid())) {
> +		dwfl_end(dwfl);
> +		dwfl = NULL;
> +	} else
> +		dwfl_report_end(dwfl, NULL, NULL);
> +
> +	igt_info("Stack trace:\n");
> +
> +	unw_getcontext(&uc);
> +	unw_init_local(&cursor, &uc);
> +	while (unw_step(&cursor) > 0) {
> +		char name[255];
> +		unw_word_t off, ip;
> +		Dwfl_Module *mod = NULL;
> +
> +		unw_get_reg(&cursor, UNW_REG_IP, &ip);
> +
> +		if (dwfl)
> +			mod = dwfl_addrmodule(dwfl, ip);
> +
> +		if (mod) {
> +			const char *src, *dwfl_name;
> +			Dwfl_Line *line;
> +			int lineno;
> +			GElf_Sym sym;
> +
> +			line = dwfl_module_getsrc(mod, ip);
> +			dwfl_name = dwfl_module_addrsym(mod, ip, &sym, NULL);
> +
> +			if (line && dwfl_name) {
> +				src = dwfl_lineinfo(line, NULL, &lineno, NULL, NULL, NULL);
> +				igt_info("  #%d %s:%d %s()\n", stack_num++, src, lineno, dwfl_name);
> +				continue;
> +			}
> +		}
> +
> +		if (unw_get_proc_name(&cursor, name, 255, &off) < 0)
> +			igt_info("  #%d [<unknown>+0x%x]\n", stack_num++,
> +				 (unsigned int) ip);
> +		else
> +			igt_info("  #%d [%s+0x%x]\n", stack_num++, name,
> +				 (unsigned int) off);
> +	}
> +
> +	if (dwfl)
> +		dwfl_end(dwfl);
> +}
> +
>  __attribute__((format(printf, 2, 3)))
>  static void internal_assert(bool cond, const char *format, ...)
>  {
> @@ -362,6 +423,8 @@ static void internal_assert(bool cond, const char *format, ...)
>  		va_end(ap);
>  		fprintf(stderr, "please refer to lib/igt_core documentation\n");
>  
> +		print_backtrace();
> +
>  		assert(0);
>  	}
>  }
> @@ -1766,67 +1829,6 @@ static void write_stderr(const char *str)
>  	__write_stderr(str, strlen(str));
>  }
>  
> -static void print_backtrace(void)
> -{
> -	unw_cursor_t cursor;
> -	unw_context_t uc;
> -	int stack_num = 0;
> -
> -	Dwfl_Callbacks cbs = {
> -		.find_elf = dwfl_linux_proc_find_elf,
> -		.find_debuginfo = dwfl_standard_find_debuginfo,
> -	};
> -
> -	Dwfl *dwfl = dwfl_begin(&cbs);
> -
> -	if (dwfl_linux_proc_report(dwfl, getpid())) {
> -		dwfl_end(dwfl);
> -		dwfl = NULL;
> -	} else
> -		dwfl_report_end(dwfl, NULL, NULL);
> -
> -	igt_info("Stack trace:\n");
> -
> -	unw_getcontext(&uc);
> -	unw_init_local(&cursor, &uc);
> -	while (unw_step(&cursor) > 0) {
> -		char name[255];
> -		unw_word_t off, ip;
> -		Dwfl_Module *mod = NULL;
> -
> -		unw_get_reg(&cursor, UNW_REG_IP, &ip);
> -
> -		if (dwfl)
> -			mod = dwfl_addrmodule(dwfl, ip);
> -
> -		if (mod) {
> -			const char *src, *dwfl_name;
> -			Dwfl_Line *line;
> -			int lineno;
> -			GElf_Sym sym;
> -
> -			line = dwfl_module_getsrc(mod, ip);
> -			dwfl_name = dwfl_module_addrsym(mod, ip, &sym, NULL);
> -
> -			if (line && dwfl_name) {
> -				src = dwfl_lineinfo(line, NULL, &lineno, NULL, NULL, NULL);
> -				igt_info("  #%d %s:%d %s()\n", stack_num++, src, lineno, dwfl_name);
> -				continue;
> -			}
> -		}
> -
> -		if (unw_get_proc_name(&cursor, name, 255, &off) < 0)
> -			igt_info("  #%d [<unknown>+0x%x]\n", stack_num++,
> -				 (unsigned int) ip);
> -		else
> -			igt_info("  #%d [%s+0x%x]\n", stack_num++, name,
> -				 (unsigned int) off);
> -	}
> -
> -	if (dwfl)
> -		dwfl_end(dwfl);
> -}
> -
>  static const char hex[] = "0123456789abcdef";
>  
>  static void
> -- 
> 2.36.1
> 
