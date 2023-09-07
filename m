Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F55910E784
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 07:58:54 +0000 (UTC)
Date: Thu, 7 Sep 2023 09:58:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230907075822.55wzotgaymqn6qme@kamilkon-desk.igk.intel.com>
References: <20230829161759.9315-1-mohammed.thasleem@intel.com>
 <20220421141935.1460-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220421141935.1460-1-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition: Reduce the
 number of iterations on modeset-transition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mohammed,

On 2022-04-21 at 19:49:35 +0530, Mohammed Thasleem wrote:
> Due to the higher number of iterations, "modeset-transition" tests are
> getting timed out on CI. Reducing the number of iterations can save a
> lot of execution time.
> 
> Instead of having (2 ^ j) iterations, reduce it to (2 * j) where j is
> the number of active pipes.
> 
> v2: Update commit message.
> v3: Update commit message and minor changes.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/kms_atomic_transition.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index a470eb88c..6c914ec21 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -966,10 +966,7 @@ retry:
>  		}
>  	}
>  
> -	iter_max = 1 << j;
> -
> -	if (igt_run_in_simulation() && iter_max > 1)
> -		iter_max = iter_max >> 1;

Why did you deleted above two in_simulation lines?
Now for j=1 and in_simulation() true, number of iterations
will be 2 instead of 1, so it will increase.

> +	iter_max = (j > 0) ? (j << 1) : 1;

Move this above before in_simulation check.

Regards,
Kamil

>  
>  	if (igt_display_try_commit_atomic(&data->display,
>  				DRM_MODE_ATOMIC_TEST_ONLY |
> -- 
> 2.25.1
> 
