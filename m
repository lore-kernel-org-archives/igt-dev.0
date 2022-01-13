Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1030C10E610
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jan 2022 22:14:37 +0000 (UTC)
Date: Thu, 13 Jan 2022 14:14:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <YeCkShIaCU5DF+Uw@mdroper-desk1.amr.corp.intel.com>
References: <20220110061141.1655017-1-priyanka.dandamudi@intel.com>
 <20220110061141.1655017-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110061141.1655017-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] lib/igt_gt: Check for shared
 reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 10, 2022 at 11:41:40AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Function to check if a platform has shared reset domain.
> 
> v2: Some minor fixes (Ashutosh)
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  lib/igt_gt.c | 17 +++++++++++++++++
>  lib/igt_gt.h |  2 ++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index 7c7df95e..daec5c0c 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -637,3 +637,20 @@ int gem_execbuf_flags_to_engine_class(unsigned int flags)
>  		igt_assert(0);
>  	}
>  }
> +
> +bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx)
> +{
> +	const struct intel_execution_engine2 *e;
> +	bool rcs0 = false;
> +	bool ccs0 = false;
> +
> +	for_each_ctx_engine(fd, ctx, e) {
> +		if (rcs0 && ccs0)
> +			break;
> +		else if (e->class == I915_ENGINE_CLASS_RENDER)
> +			rcs0 = true;
> +		else if (e->class == I915_ENGINE_CLASS_COMPUTE)
> +			ccs0 = true;
> +	}
> +	return (rcs0 && ccs0);

It looks like this is checking to see whether the platform has both RCS
and CCS engines.  But what about platforms with no RCS but multiple CCS?
All of the CCS engines still share a reset domain, even though there's
no RCS engine present.


Matt

> +}
> diff --git a/lib/igt_gt.h b/lib/igt_gt.h
> index c5059817..f0340552 100644
> --- a/lib/igt_gt.h
> +++ b/lib/igt_gt.h
> @@ -84,4 +84,6 @@ extern const struct intel_execution_engine2 {
>  
>  int gem_execbuf_flags_to_engine_class(unsigned int flags);
>  
> +bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx);
> +
>  #endif /* IGT_GT_H */
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
