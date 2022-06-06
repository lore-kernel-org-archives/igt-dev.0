Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D09710EB17
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 14:47:04 +0000 (UTC)
Date: Mon, 6 Jun 2022 16:47:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yp4TZMZgTHEKbEqh@kamilkon-desk1>
References: <20220603130502.47049-1-zbigniew.kempczynski@intel.com>
 <20220603130502.47049-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220603130502.47049-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/api_intel_bb: Add crc32
 checking test for DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zbigniew,

On 2022-06-03 at 15:05:02 +0200, Zbigniew Kempczyński wrote:
> Add simple test which compares crc32 sums and calculation times on cpu
> and gpu.
> 
> v2: convert to dynamic
> v3: add assert when cpu_crc != gpu_crc
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/api_intel_bb.c | 67 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 92f44cecf4..3213a1df75 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -38,6 +38,7 @@
>  #include <zlib.h>
>  #include "intel_bufops.h"
>  #include "i915/gem_vm.h"
> +#include "i915/i915_crc.h"
>  
>  #define PAGE_SIZE 4096
>  
> @@ -1395,6 +1396,57 @@ static void render_ccs(struct buf_ops *bops)
>  	igt_assert_f(fails == 0, "render-ccs fails: %d\n", fails);
>  }
>  
> +static double elapsed(const struct timeval *start,
> +		      const struct timeval *end)
> +{
> +	return (1e6*(end->tv_sec - start->tv_sec) + (end->tv_usec - start->tv_usec)) / 1e6;

imho you can use igt_time_elapsed from igt_core.h instead.

> +}
> +
> +static void test_crc32(int i915, const intel_ctx_t *ctx,
> +		       const struct intel_execution_engine2 *e,
> +		       struct drm_i915_gem_memory_class_instance *r)
> +{
> +	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
> +	uint32_t data, *ptr;
> +
> +	uint32_t region = INTEL_MEMORY_REGION_ID(r->memory_class,
> +						 r->memory_instance);
> +
> +	igt_info("[engine: %s, region: %s]\n", e->name,
> +		 region == REGION_SMEM ? "smem" : "lmem");

Please make it igt_debug.

> +	for (int i = 12; i < 21; i++) {
> +		struct timeval start, end;
> +		uint64_t size = 1 << i;
> +		uint32_t cpu_crc, gpu_crc;
> +
> +		double cpu_time, gpu_time;
> +
> +		data = gem_create_in_memory_regions(i915, size, region);
> +		ptr = gem_mmap__device_coherent(i915, data, 0, size, PROT_WRITE);
> +		for (int j = 0; j < size / sizeof(*ptr); j++)
> +			ptr[j] = j;
> +
> +		gettimeofday(&start, NULL);
> +		cpu_crc = cpu_crc32(ptr, size);
> +		gettimeofday(&end, NULL);
> +		cpu_time = elapsed(&start, &end);
> +
> +		gettimeofday(&start, NULL);
> +		gpu_crc = i915_crc32(i915, ahnd, ctx, e, data, size);
> +		gettimeofday(&end, NULL);
> +		gpu_time = elapsed(&start, &end);
> +		igt_info("size: %10lld, cpu crc: 0x%08x (time: %.3f), "

imho igt_debug would be better.

> +				 "gpu crc: 0x%08x (time: %.3f) [ %s ]\n",
> +			 (long long) size, cpu_crc, cpu_time, gpu_crc, gpu_time,
> +			 cpu_crc == gpu_crc ? "EQUAL" : "DIFFERENT");
> +		munmap(ptr, size);

imho munmap should be after cpu_time calculation ?

> +		gem_close(i915, data);
> +		igt_assert(cpu_crc == gpu_crc);
> +	}
> +
> +	put_ahnd(ahnd);
> +}
> +
>  static int opt_handler(int opt, int opt_index, void *data)
>  {
>  	switch (opt) {
> @@ -1552,6 +1604,21 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
>  	igt_subtest("render-ccs")
>  		render_ccs(bops);
>  

Please add description to subtest.

With that fixed you can add my r-b tag.

--
Kamil

> +	igt_subtest_with_dynamic_f("crc32") {
> +		const intel_ctx_t *ctx;
> +		const struct intel_execution_engine2 *e;
> +
> +		igt_require(supports_gpu_crc32(i915));
> +
> +		ctx = intel_ctx_create_all_physical(i915);
> +		for_each_ctx_engine(i915, ctx, e) {
> +			for_each_memory_region(r, i915) {
> +				igt_dynamic_f("%s-%s", e->name, r->name)
> +					test_crc32(i915, ctx, e, &r->ci);
> +			}
> +		}
> +	}
> +
>  	igt_fixture {
>  		buf_ops_destroy(bops);
>  		close(i915);
> -- 
> 2.32.0
> 
