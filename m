Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7AC6EC3C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 19:41:06 +0000 (UTC)
Date: Tue, 5 Oct 2021 15:14:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YVykFyOAiKq20zsg@intel.com>
References: <20211005151022.2161424-1-alan.previn.teres.alexis@intel.com>
 <20211005151022.2161424-2-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005151022.2161424-2-alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v13 01/16] i915_drm.h sync PXP default
 session
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 08:10:07AM -0700, Alan Previn wrote:
> Sync UAPI for to get I915_PROTECTED_CONTENT_DEFAULT_SESSION define value.
> 
> Taken from kernel commit:
> commit cbbd3764b2399ad882cda98435b25144e9ea2124
>        ("drm/i915/pxp: Create the arbitrary session after boot.")

This is not accurate. The i915_drm.h in this commit has more changes
other than I915_PROTECTED_CONTENT_DEFAULT_SESSION.

We should combine the patches 1 and 2 of this series and make a simply
i915_drm.h sync and add some reasoning in the commit message saying
that it is because of the PXP. But the new include/drm-uapi/i915_drm.h
should include all the new api additions from i915_drm.h uapi.


> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  include/drm-uapi/i915_drm.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> index b9632bb2..f4691fcc 100644
> --- a/include/drm-uapi/i915_drm.h
> +++ b/include/drm-uapi/i915_drm.h
> @@ -2990,6 +2990,9 @@ struct drm_i915_gem_create_ext_memory_regions {
>  	__u64 regions;
>  };
>  
> +/* ID of the protected content session managed by i915 when PXP is active */
> +#define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.25.1
> 
