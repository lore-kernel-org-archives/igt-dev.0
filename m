Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B0289E63
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Mar 2021 17:45:22 +0000 (UTC)
Date: Wed, 3 Mar 2021 09:45:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20210303174506.GJ2690983@mdroper-desk1.amr.corp.intel.com>
References: <20210303133501.29815-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303133501.29815-1-venkata.sai.patnana@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_3d: update stereo mode count
 static value
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
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 03, 2021 at 07:05:01PM +0530, venkata.sai.patnana@intel.com wrote:
> From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> 
> To set 3D mode, we need atleast one supported 3d mode is
> sufficient.

I'd suggest adding some clarification that some modes from the supplied
EDID may be pruned due to other platform limitations (e.g., restricted
link rates and such) which is why we wouldn't necessarily end up with
the full 13 on all platforms.

Aside from updating the commit message a bit, the code change is

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Sharma Swati2 <swati2.sharma@intel.com>
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>  tests/kms_3d.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> index 2622b2d0a6..a88a86eea3 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -69,7 +69,7 @@ igt_simple_main
>  			mode_count++;
>  	}
>  
> -	igt_assert_eq(mode_count, 13);
> +	igt_assert(mode_count);
>  
>  	/* set 3D modes */
>  	igt_info("Testing:\n");
> -- 
> 2.25.1
> 

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
