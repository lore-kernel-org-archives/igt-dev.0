Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EAC10E524
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Aug 2023 13:51:43 +0000 (UTC)
Date: Wed, 30 Aug 2023 15:51:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230830135109.ssdr3kkwalja35pa@kamilkon-desk.igk.intel.com>
References: <20230829161759.9315-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230829161759.9315-1-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition: Reduce the
 execution time on modest-transition
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

Hi,

there is no such e-mail address at fdo: Thasleem@freedesktop.org
Please stop adding it to Cc.

On 2023-08-29 at 21:47:59 +0530, Thasleem, Mohammed wrote:
> Due to the more number of iterations, "modest-transition" tests are
> getting timed out on CI. Reducing the number of iterations to half
> can save a lot of execution time.
> 
> Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
---------------- ^ ------- ^
Should be:
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

You should also consider adding From: at begin of patch.

> ---
>  tests/kms_atomic_transition.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index a470eb88c..690202271 100644
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
> +	iter_max = j << 1;

This do not match with your description and looks wrong.

Regards,
Kamil

>  
>  	if (igt_display_try_commit_atomic(&data->display,
>  				DRM_MODE_ATOMIC_TEST_ONLY |
> -- 
> 2.34.1
> 
