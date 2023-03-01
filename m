Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9701910E25A
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Mar 2023 13:24:58 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id j17so13891320ljq.11
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Mar 2023 05:24:58 -0800 (PST)
Date: Wed, 1 Mar 2023 15:24:55 +0200
From: Petri Latvala <adrinael@adrinael.net>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <Y/9SJxemufRVHwK1@adrinael.net>
References: <20230228212538.47984-1-kamil.konieczny@linux.intel.com>
 <20230228212538.47984-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228212538.47984-2-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] runner/resume: change exit code for
 results gen fail
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 10:25:38PM +0100, Kamil Konieczny wrote:
> When results generation fails exit with code 3, it will help
> to differentiate from failed exection at resume runs. Added
> also some debug messages at different error points.
> 
> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Petri Latvala <adrinael@adrinael.net>


> ---
>  runner/resume.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/resume.c b/runner/resume.c
> index eb8074e3..0f4e42bf 100644
> --- a/runner/resume.c
> +++ b/runner/resume.c
> @@ -31,10 +31,13 @@ int main(int argc, char **argv)
>  		return 127;
>  	}
>  
> -	if (!initialize_execute_state_from_resume(dirfd, &state, &settings, &job_list))
> +	if (!initialize_execute_state_from_resume(dirfd, &state, &settings, &job_list)) {
> +		fprintf(stderr, "resume failed at initialization step\n");
>  		return 127;
> +	}
>  
>  	if (!execute(&state, &settings, &job_list)) {
> +		fprintf(stderr, "resume failed at execute step\n");
>  		exitcode = 1;
>  	}
>  
> @@ -43,11 +46,13 @@ int main(int argc, char **argv)
>  		 * Overall timeout happened. Results generation can
>  		 * override this
>  		 */
> +		fprintf(stderr, "resume failed at timeout\n");
>  		exitcode = 2;
>  	}
>  
>  	if (!generate_results_path(settings.results_path)) {
> -		exitcode = 1;
> +		fprintf(stderr, "resume failed at generating results\n");
> +		exitcode = 3;
>  	}
>  
>  	printf("Done.\n");
> -- 
> 2.37.2
> 
