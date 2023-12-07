Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD6B10E8B7
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 14:55:32 +0000 (UTC)
Date: Thu, 7 Dec 2023 15:55:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_pat: limit number of
 dynamic tests
Message-ID: <20231207145528.mmwt2swyhrvhfeg5@kamilkon-desk.igk.intel.com>
References: <20231206121203.270852-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231206121203.270852-1-matthew.auld@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Matthew,
On 2023-12-06 at 12:12:03 +0000, Matthew Auld wrote:
> Due to of the all the combinations here, we generate hundreds of dynamic
> testcases. This does allow running any individual testcase quite easily,
> but the sheer number of tests is a bit unwieldy for CI to handle. Trim
> this back to the following tests:
> 
> xe-pat-index@{xelp, xehpc, xelpg, xe2}-{dw, blt, render}

build/tests/xe_pat --l
pat-index-all
userptr-coh-none
prime-self-import-coh
prime-external-import-coh
pat-index-xelp
pat-index-xehpc
pat-index-xelpg
pat-index-xe2

So this should be:

pat-index-{xelp, xehpc, xelpg, xe2}@{dw, blt, render}

> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_pat.c | 128 +++++++++++++++++++++----------------------
>  1 file changed, 64 insertions(+), 64 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 8189390a8..7273242b0 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -369,13 +369,15 @@ static void pat_index_render(struct xe_pat_param *p)
>  	int bpp = 32;
>  	int i;
>  
> -	bops = buf_ops_create(fd);
> -
>  	render_copy = igt_get_render_copyfunc(devid);
>  	igt_require(render_copy);
> -	igt_require(!p->r2_compressed); /* XXX */
>  	igt_require(xe_has_engine_class(fd, DRM_XE_ENGINE_CLASS_RENDER));
>  
> +	if (p->r2_compressed) /* XXX */
> +		return;

This looks unrelated, please send in separate patch with
a similar change below.

> +
> +	bops = buf_ops_create(fd);
> +
>  	ibb = intel_bb_create_full(fd, 0, 0, NULL, xe_get_default_alignment(fd),
>  				   0, 0, p->size->alignment,
>  				   INTEL_ALLOCATOR_SIMPLE,
> @@ -456,8 +458,8 @@ static void pat_index_dw(struct xe_pat_param *p)
>  	int bpp = 32, i, n_engines;
>  	uint32_t ctx, vm;
>  
> -	igt_require(!p->r1_compressed);
> -	igt_require(!p->r2_compressed);
> +	if (p->r1_compressed || p->r2_compressed)
> +		return;

Same here, this should be in separate patch.

Rest looks ok, I tested it on ats-m.

Regards,
Kamil

>  
>  	bops = buf_ops_create(fd);
>  
> @@ -901,84 +903,82 @@ static void subtest_pat_index_modes_with_regions(int fd,
>  
>  		copy_mode = copy_modes[igt_collection_get_value(copies, 0)];
>  
> -		for_each_variation_r(regions, 2, regions_set) {
> -			struct igt_collection *pat_modes;
> -			uint32_t r1, r2;
> -			char *reg_str;
> +		igt_dynamic_f("%s", copy_mode.name) {
> +			for_each_variation_r(regions, 2, regions_set) {
> +				struct igt_collection *pat_modes;
> +				uint32_t r1, r2;
> +				char *reg_str;
>  
> -			r1 = igt_collection_get_value(regions, 0);
> -			r2 = igt_collection_get_value(regions, 1);
> +				r1 = igt_collection_get_value(regions, 0);
> +				r2 = igt_collection_get_value(regions, 1);
>  
> -			reg_str = xe_memregion_dynamic_subtest_name(fd, regions);
> +				reg_str = xe_memregion_dynamic_subtest_name(fd, regions);
>  
> -			for_each_variation_r(pat_modes, 2, pat_index_set) {
> -				struct igt_collection *sizes;
> -				struct pat_index_entry r1_entry, r2_entry;
> -				int r1_idx, r2_idx;
> +				for_each_variation_r(pat_modes, 2, pat_index_set) {
> +					struct igt_collection *sizes;
> +					struct pat_index_entry r1_entry, r2_entry;
> +					int r1_idx, r2_idx;
>  
> -				r1_idx = igt_collection_get_value(pat_modes, 0);
> -				r2_idx = igt_collection_get_value(pat_modes, 1);
> +					r1_idx = igt_collection_get_value(pat_modes, 0);
> +					r2_idx = igt_collection_get_value(pat_modes, 1);
>  
> -				r1_entry = modes_arr[r1_idx];
> -				r2_entry = modes_arr[r2_idx];
> +					r1_entry = modes_arr[r1_idx];
> +					r2_entry = modes_arr[r2_idx];
>  
> -				if (r1_entry.get_pat_index) {
> -					p.r1_pat_index = r1_entry.get_pat_index(fd, &p.r1_compressed);
> -				} else {
> -					p.r1_pat_index = r1_entry.pat_index;
> -					p.r1_compressed = r1_entry.compressed;
> -				}
> +					if (r1_entry.get_pat_index) {
> +						p.r1_pat_index = r1_entry.get_pat_index(fd, &p.r1_compressed);
> +					} else {
> +						p.r1_pat_index = r1_entry.pat_index;
> +						p.r1_compressed = r1_entry.compressed;
> +					}
>  
> -				if (r2_entry.get_pat_index)
> -					p.r2_pat_index = r2_entry.get_pat_index(fd, &p.r2_compressed);
> -				else {
> -					p.r2_pat_index = r2_entry.pat_index;
> -					p.r2_compressed = r2_entry.compressed;
> -				}
> +					if (r2_entry.get_pat_index)
> +						p.r2_pat_index = r2_entry.get_pat_index(fd, &p.r2_compressed);
> +					else {
> +						p.r2_pat_index = r2_entry.pat_index;
> +						p.r2_compressed = r2_entry.compressed;
> +					}
>  
> -				p.r1 = r1;
> -				p.r2 = r2;
> +					p.r1 = r1;
> +					p.r2 = r2;
>  
> -				for_each_variation_r(sizes, 1, sizes_set) {
> -					int size_mode_idx = igt_collection_get_value(sizes, 0);
> -					int bpp = 32;
> -					int size;
> +					for_each_variation_r(sizes, 1, sizes_set) {
> +						int size_mode_idx = igt_collection_get_value(sizes, 0);
> +						int bpp = 32;
> +						int size;
>  
> -					p.size = &size_modes[size_mode_idx];
> +						p.size = &size_modes[size_mode_idx];
>  
> -					size = p.size->width * p.size->height * bpp / 8;
> -					p.r1_bo = create_object(fd, p.r1, size, r1_entry.coh_mode,
> -								r1_entry.force_cpu_wc);
> -					p.r1_map = xe_bo_map(fd, p.r1_bo, size);
> +						size = p.size->width * p.size->height * bpp / 8;
> +						p.r1_bo = create_object(fd, p.r1, size, r1_entry.coh_mode,
> +									r1_entry.force_cpu_wc);
> +						p.r1_map = xe_bo_map(fd, p.r1_bo, size);
>  
> -					p.r2_bo = create_object(fd, p.r2, size, r2_entry.coh_mode,
> -								r2_entry.force_cpu_wc);
> -					p.r2_map = xe_bo_map(fd, p.r2_bo, size);
> +						p.r2_bo = create_object(fd, p.r2, size, r2_entry.coh_mode,
> +									r2_entry.force_cpu_wc);
> +						p.r2_map = xe_bo_map(fd, p.r2_bo, size);
>  
> -					igt_debug("[r1]: r: %u, idx: %u, coh: %u, wc: %d, comp: %d\n",
> -						  p.r1, p.r1_pat_index, r1_entry.coh_mode,
> -						  r1_entry.force_cpu_wc, p.r1_compressed);
> -					igt_debug("[r2]: r: %u, idx: %u, coh: %u, wc: %d, comp: %d, w: %u, h: %u, a: %u\n",
> -						  p.r2, p.r2_pat_index, r2_entry.coh_mode,
> -						  r1_entry.force_cpu_wc, p.r2_compressed,
> -						  p.size->width, p.size->height,
> -						  p.size->alignment);
> +						igt_debug("[r1]: r: %u, idx: %u (%s), coh: %u, wc: %d, comp: %d\n",
> +							  p.r1, p.r1_pat_index, r1_entry.name, r1_entry.coh_mode,
> +							  r1_entry.force_cpu_wc, p.r1_compressed);
> +						igt_debug("[r2]: r: %u, idx: %u (%s), coh: %u, wc: %d, comp: %d, w: %u, h: %u, a: %u\n",
> +							  p.r2, p.r2_pat_index, r2_entry.name, r2_entry.coh_mode,
> +							  r1_entry.force_cpu_wc, p.r2_compressed,
> +							  p.size->width, p.size->height,
> +							  p.size->alignment);
>  
> -					igt_dynamic_f("%s-%s-%s-%s-%s",
> -						      copy_mode.name,
> -						      reg_str, r1_entry.name,
> -						      r2_entry.name, p.size->name)
>  						copy_mode.fn(&p);
>  
> -					munmap(p.r1_map, size);
> -					munmap(p.r2_map, size);
> +						munmap(p.r1_map, size);
> +						munmap(p.r2_map, size);
>  
> -					gem_close(fd, p.r1_bo);
> -					gem_close(fd, p.r2_bo);
> +						gem_close(fd, p.r1_bo);
> +						gem_close(fd, p.r2_bo);
> +					}
>  				}
> +
> +				free(reg_str);
>  			}
> -
> -			free(reg_str);
>  		}
>  	}
>  }
> -- 
> 2.43.0
> 
