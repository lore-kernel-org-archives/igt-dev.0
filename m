Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43E710E118
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Dec 2021 11:20:18 +0000 (UTC)
Date: Thu, 9 Dec 2021 13:19:34 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbHmRgAoJzLhb+Cu@platvala-desk.ger.corp.intel.com>
References: <20211208172416.136412-1-zbigniew.kempczynski@intel.com>
 <20211208172416.136412-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211208172416.136412-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915/intel_memory_region:
 Provide system memory region stub
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 08, 2021 at 06:24:15PM +0100, Zbigniew Kempczyński wrote:
> For stable kernels we can currently get -ENODEV on integrated gens
> when no CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM is set.
> 
> Provide system memory region stub to avoid failing on querying
> kernel for memory regions.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/i915/intel_memory_region.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 058b273dc..668e39439 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -123,9 +123,18 @@ struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd)
>  	 * Any DRM_I915_QUERY_MEMORY_REGIONS specific errors are encoded in the
>  	 * item.length, even though the ioctl might still return success.
>  	 */
> +
>  	if (item.length < 0) {
> -		igt_critical("DRM_I915_QUERY_MEMORY_REGIONS failed with %d\n",
> -			     item.length);
> +		/*
> +		 * If kernel supports query but not memory regions query
> +		 * just return predefined system memory region only.
> +		 */
> +		size_t sys_qi_size =
> +			(char *) &query_info->regions[1] - (char *) query_info;
> +
> +		query_info = calloc(1, sys_qi_size);
> +		query_info->num_regions = 1;
> +		query_info->regions[0].region.memory_class = I915_MEMORY_CLASS_SYSTEM;
>  		goto out;
>  	}
>  
> -- 
> 2.26.0
> 

Oh wow, I thought this was stubbed "properly" (for lack of a better
word) a long time ago...


Reviewed-by: Petri Latvala <petri.latvala@intel.com>
