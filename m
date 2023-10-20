Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0848110E5A9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 11:29:41 +0000 (UTC)
Date: Fri, 20 Oct 2023 13:29:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231020112936.2vyf7upwtdhhhiu5@kamilkon-desk.igk.intel.com>
References: <20231020102146.121478-1-mauro.chehab@linux.intel.com>
 <20231020102146.121478-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,
On 2023-10-20 at 12:20:33 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> If igt_runner is executed in dry-run mode, show what jobs
> were planned to be executed. That helps debugging issues at
> the runner job plan logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I will add Pteri on cc.

Regards,
Kamil

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

