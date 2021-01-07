Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E38889C8D
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jan 2021 09:55:22 +0000 (UTC)
Date: Thu, 7 Jan 2021 11:55:17 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20210107095517.GM7444@platvala-desk.ger.corp.intel.com>
References: <20210106140035.3802594-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210106140035.3802594-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Abort the run after a kernel
 taint is discovered
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 06, 2021 at 02:00:35PM +0000, Chris Wilson wrote:
> Since we no longer immediately abort a test upon a taint, that taint may
> persist into the next test causing unrelated incompletes. Avoid the
> tainted inheritance by aborting between tests if the kernel is tainted.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---
>  runner/executor.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index faf272d85..8cddcf1ce 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1801,6 +1801,7 @@ bool execute(struct execute_state *state,
>  
>  	for (; state->next < job_list->size;
>  	     state->next++) {
> +		unsigned long taints;
>  		char *reason = NULL;
>  		int result;
>  
> @@ -1836,6 +1837,13 @@ bool execute(struct execute_state *state,
>  			break;
>  		}
>  
> +		if (settings->abort_mask & ABORT_TAINT && tainted(&taints)) {
> +			outf("Stopping the rung because the kernel is tainted: %#x.\n",
> +			     taintss);
> +			status = false;
> +			break;
> +		}
> +

We already call need_to_abort() a couple of lines above this:

if (reason != NULL || (reason = need_to_abort(settings)) != NULL) {


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
