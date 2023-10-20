Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF6910E0E2
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:18:44 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c5039d4e88so12682241fa.3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 06:18:44 -0700 (PDT)
Date: Fri, 20 Oct 2023 16:18:40 +0300
From: Petri Latvala <adrinael@adrinael.net>
Message-ID: <ZTJ+MDme83/yhZIy@adrinael.net>
References: <20231020102146.121478-1-mauro.chehab@linux.intel.com>
 <20231020102146.121478-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020102146.121478-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] igt_runner: output planned job_list
 tasks in dry-run mode
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

On Fri, Oct 20, 2023 at 12:20:33PM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> If igt_runner is executed in dry-run mode, show what jobs
> were planned to be executed. That helps debugging issues at
> the runner job plan logic.

If you only need this for debugging, look at the job list file the dry
run created.


-- 
Petri Latvala


> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  runner/executor.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index d3e6296dd6d8..3b9e39f4001b 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -2287,6 +2287,12 @@ bool execute(struct execute_state *state,
>  	bool status = true;
>  
>  	if (state->dry) {
> +		for (; state->next < job_list->size; state->next++) {
> +			char *job_name;
> +
> +			job_name = entry_display_name(&job_list->entries[state->next]);
> +			outf("dry-run: %s\n", job_name);
> +		}
>  		outf("Dry run, not executing. Invoke igt_resume if you want to execute.\n");
>  		return true;
>  	}
> -- 
> 2.41.0
> 

