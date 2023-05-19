Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587DF10E0FA
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 12:45:52 +0000 (UTC)
Date: Fri, 19 May 2023 14:45:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230519124525.uw3aqwjge6i65rpg@kamilkon-desk1>
References: <20230519083049.3739356-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230519083049.3739356-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_engine_topology: Support
 gem_list_engines on platforms prior to MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: vikas.srivastava@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh,

On 2023-05-19 at 01:30:49 -0700, Ashutosh Dixit wrote:
> gem_list_engines() should list engines correctly on platforms prior to
> MTL. But at present it doesn't, it only supports MTL, and it skips on the
----------------------------------------------------- ^
s/, and/ and/

> 'igt_require(IS_METEORLAKE)' check for prior platforms. Fix this by
-- ^

imho better: 
s/skips on the ... prior platforms/skips on other platforms/

> modifying gem_engine_to_gt_map() to return gt 0 for prior platforms,
> because the only multi-gt platform supported at present in MTL.
--------------------------------------------------------- ^
s/in/is/

We do support multi-gpu, for example two or more DG2 or
ATS-M cards ?

> 
> Fixes: d2f39ce8186a ("lib/i915/gem_engine_topology: list engines specific to gt")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/i915/gem_engine_topology.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> index 6c8929ec591a..7c6cd9ba97db 100644
> --- a/lib/i915/gem_engine_topology.c
> +++ b/lib/i915/gem_engine_topology.c
> @@ -372,8 +372,12 @@ mtl_engine_to_gt_map(const struct i915_engine_class_instance *e)
>  
>  static int gem_engine_to_gt_map(int i915, const struct i915_engine_class_instance *engine)
>  {
> -	igt_require(IS_METEORLAKE(intel_get_drm_devid(i915)));
> -	return mtl_engine_to_gt_map(engine);
> +	uint32_t devid = intel_get_drm_devid(i915);
> +
> +	/* Only MTL multi-gt supported at present */
> +	igt_require(intel_graphics_ver(devid) <= IP_VER(12, 70));
> +
> +	return IS_METEORLAKE(devid) ? mtl_engine_to_gt_map(engine) : 0;
>  }
>  
>  /**
> -- 
> 2.38.0
> 
