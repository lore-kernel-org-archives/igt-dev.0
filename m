Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA76110E034
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 08:22:36 +0000 (UTC)
Date: Wed, 5 Oct 2022 10:22:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yz0+yG6tTE4CLBK6@kamilkon-desk1>
References: <20220928193602.523414-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220928193602.523414-1-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t] Replaced get_current_dir_name() with
 getcwd() for BSD compatibility
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-09-28 at 14:36:02 -0500, Jake Freeland wrote:
> The get_current_dir_name() function is a GNU C extension that copies
> the current directory's absolute path into a memory allocated buffer.
> This patch replaces get_current_dir_name() with a POSIX compliant
> getcwd() that performs the same action.
> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/tools_test.c                  | 6 +++---
>  tools/i915-perf/i915_perf_control.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/tools_test.c b/tests/tools_test.c
> index 89a19d11..d0684d57 100644
> --- a/tests/tools_test.c
> +++ b/tests/tools_test.c
> @@ -69,7 +69,7 @@ static bool chdir_to_tools_dir(void)
>  	char path[PATH_MAX];
>  	char *cwd;
>  
> -	cwd = get_current_dir_name();
> +	cwd = getcwd(NULL, 0);
>  	igt_info("Current working directory: %s\n", cwd);
>  	free(cwd);
>  
> @@ -87,7 +87,7 @@ static bool chdir_to_tools_dir(void)
>  		chdir(dirname(path));
>  	}
>  
> -	cwd = get_current_dir_name();
> +	cwd = getcwd(NULL, 0);
>  	igt_info("Current working directory: %s\n", cwd);
>  	free(cwd);
>  
> @@ -103,7 +103,7 @@ igt_main
>  
>  		igt_require_f(chdir_to_tools_dir(),
>  			      "Unable to determine the tools directory, expecting them in $cwd/" TOOLS " or $path/" TOOLS "\n");
> -		path = get_current_dir_name();
> +		path = getcwd(NULL, 0);
>  		igt_info("Using tools from %s\n", path);
>  		free(path);
>  	}
> diff --git a/tools/i915-perf/i915_perf_control.c b/tools/i915-perf/i915_perf_control.c
> index be5996c0..f7db2f5c 100644
> --- a/tools/i915-perf/i915_perf_control.c
> +++ b/tools/i915-perf/i915_perf_control.c
> @@ -102,7 +102,7 @@ main(int argc, char *argv[])
>  
>  			fwrite(data, total_len, 1, command_fifo_file);
>  		} else {
> -			char *cwd = get_current_dir_name();
> +			char *cwd = getcwd(NULL, 0);
>  			uint32_t path_len = strlen(cwd) + 1 + strlen(dump_file) + 1;
>  			uint32_t total_len = sizeof(struct recorder_command_base) + path_len;
>  			struct {
> -- 
> 2.37.3
> 
