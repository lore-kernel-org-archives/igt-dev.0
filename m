Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EB86E5C5
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 06:52:44 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 26 Jul 2021 06:52:35 +0000
Message-ID: <DM8PR11MB571900774B24723D769E659C8DE89@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20210724165317.32000-1-vidya.srinivas@intel.com>
 <20210726060630.28834-1-vidya.srinivas@intel.com>
In-Reply-To: <20210726060630.28834-1-vidya.srinivas@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Return false in gem_has_lmem
 for kernels not having DRM_I915_QUERY_MEMORY_REGIONS support
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
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Lin,
 Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Monday, July 26, 2021 11:37 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>; Almahallawy, Khaled <khaled.almahallawy@intel.com>;
> Joshi, Kunal1 <kunal1.joshi@intel.com>; Heikkila, Juha-pekka <juha-
> pekka.heikkila@intel.com>; Lin, Charlton <charlton.lin@intel.com>; Latvala,
> Petri <petri.latvala@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Srinivas, Vidya <vidya.srinivas@intel.com>; Lin, Charlton
> <charlton.lin@intel.com>
> Subject: [PATCH i-g-t] lib/i915: Return false in gem_has_lmem for kernels not
> having DRM_I915_QUERY_MEMORY_REGIONS support
> 
> Starting commit (tests/kms: Create buffer object from LMEM for discrete)
> it checks for LMEM. This is breaking older kernels like 5.4 without
> DRM_I915_QUERY_MEMORY_REGIONS support.
> 
> Kernel writes length back to userspace if ret and
> length differ, indicating an error condition. In this case, the length
> written back is -22 which is EINVAL. Patch checks negative item length
> and returns false from gem_has_lmem.
> 
> Credits-to: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Lin Charlton <charlton.lin@intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> Change-Id: Ia404b77fbe4c1fc22ca462a15f26640f9ffa4120
> ---
>  lib/i915/intel_memory_region.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 144ae12ca7a0..8db3e69e9913 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -164,6 +164,15 @@ uint8_t gem_get_lmem_region_count(int fd)
>   */
>  bool gem_has_lmem(int fd)
>  {
> +	struct drm_i915_query_item item;
> +	int ret;
> +
> +	memset(&item, 0, sizeof(item));
> +	item.query_id = DRM_I915_QUERY_MEMORY_REGIONS;
> +	ret = __i915_query_items(fd, &item, 1);
> +	if (ret != 0 || item.length < 0)
> +		return false;
> +

I guess, this logic is redundant. As Ashutosh mentioned in earlier revisions,
we need to fix this at gem_get_query_memory_regions()

gem_has_lmem --> gem_get_lmem_region_count --> gem_get_query_memory_regions

>  	return gem_get_lmem_region_count(fd) > 0;
>  }
> 
> --
> 2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
