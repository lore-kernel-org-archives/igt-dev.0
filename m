Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B83110E22E
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 12:00:28 +0000 (UTC)
Date: Thu, 7 Sep 2023 13:59:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230907115943.q2cp4dpgfazyvtad@kamilkon-desk.igk.intel.com>
References: <20230829161759.9315-1-mohammed.thasleem@intel.com>
 <20230907085407.935-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230907085407.935-1-mohammed.thasleem@intel.com>
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

On 2023-09-07 at 14:24:07 +0530, Mohammed Thasleem wrote:
> Due to the higher number of iterations, "modeset-transition" tests are
> getting timed out on CI. Reducing the number of iterations can save a
> lot of execution time.
> 
> Instead of having (2 ^ j) iterations, reduce it to (2 * j) where j is
> the number of active pipes.
> 
> v2: Update commit message. (Swati)
> v3: Update commit message and minor changes. (Bhanu)
> v4: Add simulation check. (Kamil)
----- ^
s/Add/Restore/

with this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/kms_atomic_transition.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index a470eb88c..1eba6c5b5 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -966,7 +966,7 @@ retry:
>  		}
>  	}
>  
> -	iter_max = 1 << j;
> +	iter_max = (j > 0) ? (j << 1) : 1;
>  
>  	if (igt_run_in_simulation() && iter_max > 1)
>  		iter_max = iter_max >> 1;
> -- 
> 2.34.1
> 
