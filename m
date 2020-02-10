Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1A66E255
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 22:32:02 +0000 (UTC)
Date: Mon, 10 Feb 2020 14:32:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20200210223201.GO232048@mdroper-desk1.amr.corp.intel.com>
References: <20200207191524.19362-1-imre.deak@intel.com>
 <20200207191524.19362-2-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207191524.19362-2-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] tests/kms_frontbuffer_tracking:
 Skip set tiling calls if not supported
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org, Vanshidhar Konda <vanshidhar.r.konda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 09:15:18PM +0200, Imre Deak wrote:
> From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> 
> Skip the method that is setting tiling with invalid strides if the
> hardware does not support HW for tiling/de-tiling.
> 
> v2:
> - Use gem_available_fences() to check for HW detiling.
> 
> Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  tests/kms_frontbuffer_tracking.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
> index 9c2c3a5d..724f5d16 100644
> --- a/tests/kms_frontbuffer_tracking.c
> +++ b/tests/kms_frontbuffer_tracking.c
> @@ -2833,7 +2833,8 @@ static void badstride_subtest(const struct test_mode *t)
>  	struct modeset_params *params = pick_params(t);
>  	int rc;
>  
> -	try_invalid_strides();
> +	if (gem_available_fences(drm.fd))
> +		try_invalid_strides();
>  
>  	prepare_subtest(t, NULL);
>  
> -- 
> 2.23.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
