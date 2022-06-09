Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDA4113F24
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jun 2022 09:56:38 +0000 (UTC)
Date: Thu, 9 Jun 2022 12:52:22 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YqHC1jgqpbLTo/n5@platvala-desk.ger.corp.intel.com>
References: <20220607052411.7357-1-zbigniew.kempczynski@intel.com>
 <20220607052411.7357-5-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220607052411.7357-5-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/api_intel_bb: Add crc32
 checking test for DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 07:24:11AM +0200, Zbigniew Kempczyński wrote:
> Add simple test which compares crc32 sums and calculation times on cpu
> and gpu.
> 
> v2: - addressing review comments - igt_debug + igt_time_elapsed (Kamil)
>     - exercise crc for size smaller than page size
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/api_intel_bb.c | 63 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 92f44cecf4..d6998af692 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -22,6 +22,7 @@
>   */
>  
>  #include "igt.h"
> +#include "igt_crc.h"
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include <unistd.h>
> @@ -38,6 +39,7 @@
>  #include <zlib.h>
>  #include "intel_bufops.h"
>  #include "i915/gem_vm.h"
> +#include "i915/i915_crc.h"
>  
>  #define PAGE_SIZE 4096
>  
> @@ -1395,6 +1397,51 @@ static void render_ccs(struct buf_ops *bops)
>  	igt_assert_f(fails == 0, "render-ccs fails: %d\n", fails);
>  }
>  
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
> +	igt_debug("[engine: %s, region: %s]\n", e->name,
> +		  region == REGION_SMEM ? "smem" : "lmem");
> +	for (int i = 2; i < 21; i += 2) {
> +		struct timespec start, end;
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
> +		clock_gettime(CLOCK_MONOTONIC, &start);
> +		cpu_crc = igt_cpu_crc32(ptr, size);
> +		clock_gettime(CLOCK_MONOTONIC, &end);
> +		cpu_time = igt_time_elapsed(&start, &end);
> +		munmap(ptr, size);
> +
> +		clock_gettime(CLOCK_MONOTONIC, &start);
> +		gpu_crc = i915_crc32(i915, ahnd, ctx, e, data, size);
> +		clock_gettime(CLOCK_MONOTONIC, &end);
> +		gpu_time = igt_time_elapsed(&start, &end);

Mandatory question: Explain choice of CLOCK_MONOTONIC
vs. CLOCK_MONOTONIC_RAW vs. CLOCK_MONOTONIC_COARSE. And as a
corollary, why igt_gettime's choice of monotonic clock type is not
sufficient.


-- 
Petri Latvala



> +		igt_debug("size: %10lld, cpu crc: 0x%08x (time: %.3f), "
> +			  "gpu crc: 0x%08x (time: %.3f) [ %s ]\n",
> +			  (long long) size, cpu_crc, cpu_time, gpu_crc, gpu_time,
> +			  cpu_crc == gpu_crc ? "EQUAL" : "DIFFERENT");
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
> @@ -1552,6 +1599,22 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
>  	igt_subtest("render-ccs")
>  		render_ccs(bops);
>  
> +	igt_describe("Compare cpu and gpu crc32 sums on input object");
> +	igt_subtest_with_dynamic_f("crc32") {
> +		const intel_ctx_t *ctx;
> +		const struct intel_execution_engine2 *e;
> +
> +		igt_require(supports_i915_crc32(i915));
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
