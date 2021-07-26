Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 26 Jul 2021 15:02:36 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20210726093235.GA20437@intel.com>
References: <20210708122554.1874987-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210708122554.1874987-1-matthew.auld@intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/3]
 lib/intel_memory_region: verify item.length
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
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-07-08 at 13:25:52 +0100, Matthew Auld wrote:
> If the regions query fails then the error will be encoded in the
> item.length, while the ioctl will still return success.
> 
> Reported-by: Ville Syrjala <ville.syrjala@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  lib/i915/intel_memory_region.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 144ae12c..e1e210f2 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -119,6 +119,13 @@ struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd)
>  	memset(&item, 0, sizeof(item));
>  	item.query_id = DRM_I915_QUERY_MEMORY_REGIONS;
>  	i915_query_items(fd, &item, 1);
> +	/*
> +	 * Any DRM_I915_QUERY_MEMORY_REGIONS specific errors are encoded in the
> +	 * item.length, even though the ioctl might still return success.
> +	 */
> +	igt_assert_f(item.length > 0,
> +		     "DRM_I915_QUERY_MEMORY_REGIONS failed with %d\n",
> +		     item.length);
LGTM.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
>  
>  	query_info = calloc(1, item.length);
>  
> -- 
> 2.26.3
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
