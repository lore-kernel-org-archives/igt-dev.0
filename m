Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56EC6E20C
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Sep 2021 17:43:49 +0000 (UTC)
Date: Mon, 13 Sep 2021 19:43:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210913174343.GB60883@zkempczy-mobl2>
References: <20210901154846.3323879-1-apoorva1.singh@intel.com>
 <20210901154846.3323879-3-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210901154846.3323879-3-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/gem_render_copy: Add support
 for local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: thomas.hellstrom@linux.intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 01, 2021 at 09:18:46PM +0530, apoorva1.singh@intel.com wrote:
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Add support for local memory region (Device memory)
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_render_copy.c | 61 +++++++++++++++++++++++++-----------
>  1 file changed, 42 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
> index e48b5b99..3aac1628 100644
> --- a/tests/i915/gem_render_copy.c
> +++ b/tests/i915/gem_render_copy.c
> @@ -213,12 +213,13 @@ scratch_buf_copy(data_t *data,
>  static void scratch_buf_init(data_t *data, struct intel_buf *buf,
>  			     int width, int height,
>  			     uint32_t req_tiling,
> -			     enum i915_compression compression)
> +			     enum i915_compression compression,
> +			     uint32_t region)
>  {
>  	int bpp = 32;
>  
> -	intel_buf_init(data->bops, buf, width, height, bpp, 0,
> -		       req_tiling, compression);
> +	intel_buf_init_in_region(data->bops, buf, width, height, bpp, 0,
> +				 req_tiling, compression, region);
>  
>  	igt_assert(intel_buf_width(buf) == width);
>  	igt_assert(intel_buf_height(buf) == height);
> @@ -338,7 +339,8 @@ dump_intel_buf_to_file(data_t *data, struct intel_buf *buf, const char *filename
>  static void test(data_t *data, uint32_t src_tiling, uint32_t dst_tiling,
>  		 enum i915_compression src_compression,
>  		 enum i915_compression dst_compression,
> -		 int flags)
> +		 int flags,
> +		 struct igt_collection *memregion_set)
>  {
>  	struct intel_bb *ibb;
>  	struct intel_buf ref, src_tiled, src_ccs, dst_ccs, dst;
> @@ -370,6 +372,7 @@ static void test(data_t *data, uint32_t src_tiling, uint32_t dst_tiling,
>  		},
>  	};
>  	int num_src = ARRAY_SIZE(src);
> +	uint32_t region = igt_collection_get_value(memregion_set, 0);
>  	const bool src_mixed_tiled = flags & SOURCE_MIXED_TILED;
>  	const bool src_compressed = src_compression != I915_COMPRESSION_NONE;
>  	const bool dst_compressed = dst_compression != I915_COMPRESSION_NONE;
> @@ -401,21 +404,21 @@ static void test(data_t *data, uint32_t src_tiling, uint32_t dst_tiling,
>  
>  	for (int i = 0; i < num_src; i++)
>  		scratch_buf_init(data, &src[i].buf, WIDTH, HEIGHT, src[i].tiling,
> -				 I915_COMPRESSION_NONE);
> +				 I915_COMPRESSION_NONE, region);
>  	if (!src_mixed_tiled)
>  		scratch_buf_init(data, &src_tiled, WIDTH, HEIGHT, src_tiling,
> -				 I915_COMPRESSION_NONE);
> +				 I915_COMPRESSION_NONE, region);
>  	scratch_buf_init(data, &dst, WIDTH, HEIGHT, dst_tiling,
> -			 I915_COMPRESSION_NONE);
> +			 I915_COMPRESSION_NONE, region);
>  
>  	if (src_compressed)
>  		scratch_buf_init(data, &src_ccs, WIDTH, HEIGHT,
> -				 src_tiling, src_compression);
> +				 src_tiling, src_compression, region);
>  	if (dst_compressed)
>  		scratch_buf_init(data, &dst_ccs, WIDTH, HEIGHT,
> -				 dst_tiling, dst_compression);
> +				 dst_tiling, dst_compression, region);
>  	scratch_buf_init(data, &ref, WIDTH, HEIGHT, I915_TILING_NONE,
> -			 I915_COMPRESSION_NONE);
> +			 I915_COMPRESSION_NONE, region);
>  
>  	for (int i = 0; i < num_src; i++)
>  		scratch_buf_draw_pattern(data, &src[i].buf,
> @@ -782,6 +785,8 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
>  		  0, },
>  	};
>  	int i;
> +	struct drm_i915_query_memory_regions *regions;
> +	struct igt_collection *set, *region_set;
>  
>  	data_t data = {0, };
>  
> @@ -798,11 +803,19 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
>  
>  		data.bops = buf_ops_create(data.drm_fd);
>  
> +		regions = gem_get_query_memory_regions(data.drm_fd);
> +		igt_assert(regions);
> +
> +		set = get_memory_region_set(regions,
> +					    I915_SYSTEM_MEMORY,
> +					    I915_DEVICE_MEMORY);
> +
>  		igt_fork_hang_detector(data.drm_fd);
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(tests); i++) {
>  		const struct test_desc *t = &tests[i];
> +		char name[128];
>  		char src_mode[32];
>  		char dst_mode[32];
>  		const bool src_mixed_tiled = t->flags & SOURCE_MIXED_TILED;
> @@ -832,23 +845,33 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
>  		    t->dst_compression == I915_COMPRESSION_NONE)
>  			src_mode[0] = '\0';
>  
> -		igt_subtest_f("%s%s%s%s",
> -			      src_mode,
> -			      src_mode[0] ? "-to-" : "",
> -			      force_vebox_dst_copy ? "vebox-" : "",
> -			      dst_mode) {
> +		snprintf(name, sizeof(name),
> +			 "%s%s%s%s",
> +			 src_mode,
> +			 src_mode[0] ? "-to-" : "",
> +			 force_vebox_dst_copy ? "vebox-" : "",
> +			 dst_mode);
> +		igt_subtest_with_dynamic(name) {
>  			igt_require_f(data.vebox_copy || !vebox_copy_used,
>  				      "no vebox-copy function\n");
> +			for_each_combination(region_set, 1, set) {
> +				char *sub_name = memregion_dynamic_subtest_name(region_set);
>  
> -			test(&data,
> -			     t->src_tiling, t->dst_tiling,
> -			     t->src_compression, t->dst_compression,
> -			     t->flags);
> +				igt_dynamic_f("%s", sub_name)
> +					test(&data,
> +					     t->src_tiling, t->dst_tiling,
> +					     t->src_compression, t->dst_compression,
> +					     t->flags,
> +					     region_set);
> +
> +				free(sub_name);
> +			}
>  		}
>  	}
>  
>  	igt_fixture {
>  		igt_stop_hang_detector();
>  		buf_ops_destroy(data.bops);
> +		igt_collection_destroy(set);
>  	}
>  }
> -- 
> 2.25.1
>

Looks ok,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 
