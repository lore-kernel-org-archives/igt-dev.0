Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4BD10E227
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Nov 2022 04:24:41 +0000 (UTC)
Date: Thu, 3 Nov 2022 05:24:37 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Drobnik <karolina.drobnik@intel.com>
Message-ID: <20221103042437.6ixpfyjqsgxgpciw@zkempczy-mobl2>
References: <cover.1667391118.git.karolina.drobnik@intel.com>
 <68baa86ff2f0812a0cfa050c205b2fefb3a3db97.1667391118.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68baa86ff2f0812a0cfa050c205b2fefb3a3db97.1667391118.git.karolina.drobnik@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/3] tests/api_intel_bb: Add
 misplaced_blitter test
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

On Wed, Nov 02, 2022 at 01:15:14PM +0100, Karolina Drobnik wrote:
> Exercise intel_bb with a custom context engines layout.
> 
> Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
> ---
>  tests/i915/api_intel_bb.c | 70 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index a881d6b0..d448f02d 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -40,11 +40,15 @@
>  #include "intel_bufops.h"
>  #include "i915/gem_vm.h"
>  #include "i915/i915_crc.h"
> +#include "i915/i915_blt.h"
>  
>  #define PAGE_SIZE 4096
>  
> -#define WIDTH 64
> -#define HEIGHT 64
> +#define WIDTH	64
> +#define HEIGHT	64
> +#define STRIDE	(WIDTH * 4)
> +#define SIZE	(HEIGHT * STRIDE)
> +
>  #define COLOR_00	0x00
>  #define COLOR_33	0x33
>  #define COLOR_77	0x77
> @@ -1209,6 +1213,62 @@ static void full_batch(struct buf_ops *bops)
>  	intel_bb_destroy(ibb);
>  }
>  
> +static void misplaced_blitter(struct buf_ops *bops)
> +{
> +	int i915 = buf_ops_get_fd(bops), i;
> +	struct intel_bb *ibb;
> +	struct intel_buf *src, *dst;
> +	uint64_t value, *psrc, *pdst;
> +	int cmp;
> +
> +	/* Use custom configuration with blitter at index 0 */
> +	const intel_ctx_cfg_t cfg = (intel_ctx_cfg_t) {
> +			.num_engines = 2,
> +			.engines = {
> +				{ .engine_class = I915_ENGINE_CLASS_COPY,
> +				  .engine_instance = 0
> +				},
> +				{ .engine_class = I915_ENGINE_CLASS_RENDER,
> +				  .engine_instance = 0
> +				},
> +			},
> +		};
> +
> +	const intel_ctx_t *ctx = intel_ctx_create(i915, &cfg);
> +
> +	ibb = intel_bb_create_with_context(i915, ctx->id, &ctx->cfg, PAGE_SIZE);
> +
> +	/* Prepare for blitter copy, done to verify we found the blitter engine */
> +	src = intel_buf_create(bops, WIDTH, HEIGHT, 32, 0, I915_TILING_NONE,
> +			       I915_COMPRESSION_NONE);
> +	dst = intel_buf_create(bops, WIDTH, HEIGHT, 32, 0, I915_TILING_NONE,
> +			       I915_COMPRESSION_NONE);
> +	psrc = intel_buf_device_map(src, true);
> +	pdst = intel_buf_device_map(dst, true);
> +
> +	/* Populate src with dummy values */
> +	memset(&value, COLOR_33, 8);
> +	for (i = 0; i < SIZE / sizeof(value); i++)
> +		memset(&psrc[i], value, 8);
> +
> +	intel_bb_copy_intel_buf(ibb, src, dst, SIZE);
> +	intel_bb_flush_blit(ibb);
> +	intel_bb_sync(ibb);
> +
> +	cmp = memcmp(pdst, psrc, SIZE);
> +
> +	intel_buf_unmap(src);
> +	intel_buf_unmap(dst);
> +	intel_buf_destroy(src);
> +	intel_buf_destroy(dst);
> +
> +	intel_bb_destroy(ibb);
> +	intel_ctx_destroy(i915, ctx);
> +
> +	/* Expect to see a successful copy */
> +	igt_assert_eq(cmp, 0);
> +}
> +
>  static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc,
>  		  uint32_t width, uint32_t height)
>  {
> @@ -1581,6 +1641,12 @@ igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
>  	igt_subtest("full-batch")
>  		full_batch(bops);
>  
> +	igt_describe("Execute intel_bb with set of engines provided by userspace");
> +	igt_subtest("misplaced-blitter") {
> +		gem_require_contexts(i915);
> +		misplaced_blitter(bops);
> +	}
> +
>  	igt_subtest_with_dynamic("render") {
>  		for (i = 0; i < ARRAY_SIZE(tests); i++) {
>  			const struct test *t = &tests[i];
> -- 
> 2.25.1
>

Ok, looks good for me now:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 
