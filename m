Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0080010E2BA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 17:58:14 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:58:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230710175811.jfi7aczn77dbo2ds@kamilkon-desk1>
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
 <20230710115354.699245-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230710115354.699245-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 2/7] lib/igt_core: use the macro when
 checking for list_subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

this is a function in igt_core.c: igt_only_list_subtests() so

lib/igt_core: use the macro when checking for list_subtests
----------------- ^^^^^^^^^
s/the macro/the function/

With that fixed,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

Subject: Re: [igt-dev] [PATCH i-g-t v5 2/7] lib/igt_core: use the macro when
 checking for list_subtests

On 2023-07-10 at 13:53:49 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> We're implementing a new argument to display all tests. Before
> doing that, make the check for it more generic to prepare for
> the changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  lib/igt_core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3ee3a01c3668..9a0029d294a8 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -870,7 +870,7 @@ static void print_version(void)
>  {
>  	struct utsname uts;
>  
> -	if (list_subtests)
> +	if (igt_only_list_subtests())
>  		return;
>  
>  	uname(&uts);
> @@ -1198,12 +1198,12 @@ static int common_init(int *argc, char **argv,
>  			break;
>  		case OPT_RUN_SUBTEST:
>  			assert(optarg);
> -			if (!list_subtests)
> +			if (!igt_only_list_subtests())
>  				run_single_subtest = strdup(optarg);
>  			break;
>  		case OPT_RUN_DYNAMIC_SUBTEST:
>  			assert(optarg);
> -			if (!list_subtests)
> +			if (!igt_only_list_subtests())
>  				run_single_dynamic_subtest = strdup(optarg);
>  			break;
>  		case OPT_DESCRIPTION:
> @@ -1265,7 +1265,7 @@ out:
>  		/* exit with no error for -h/--help */
>  		exit(ret == -1 ? 0 : IGT_EXIT_INVALID);
>  
> -	if (!list_subtests) {
> +	if (!igt_only_list_subtests()) {
>  		bind_fbcon(false);
>  		igt_kmsg(KMSG_INFO "%s: executing\n", command_str);
>  		print_version();
> @@ -3098,7 +3098,7 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>  	if (!thread_id)
>  		return;
>  
> -	if (list_subtests && level <= IGT_LOG_WARN)
> +	if (igt_only_list_subtests() && level <= IGT_LOG_WARN)
>  		return;
>  
>  	if (vasprintf(&line, format, args) == -1)
> -- 
> 2.40.1
> 

