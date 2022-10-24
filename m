Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03E210E273
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Oct 2022 06:46:44 +0000 (UTC)
Date: Mon, 24 Oct 2022 08:46:40 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Drobnik <karolina.drobnik@intel.com>
Message-ID: <Y1Y00LMbpiOqsD3T@zkempczy-mobl2>
References: <cover.1666337964.git.karolina.drobnik@intel.com>
 <7df66abf7765bffb56fca00ae07191e3565eb88c.1666337964.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7df66abf7765bffb56fca00ae07191e3565eb88c.1666337964.git.karolina.drobnik@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/api_intel_bb: Add
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

On Fri, Oct 21, 2022 at 10:54:43AM +0200, Karolina Drobnik wrote:
> Exercise intel_bb with a custom context engines layout.
> 
> Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
> ---
>  tests/i915/api_intel_bb.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 6ba1fd1b..42959880 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -1209,6 +1209,36 @@ static void full_batch(struct buf_ops *bops)
>  	intel_bb_destroy(ibb);
>  }
> 
> +static void misplaced_blitter(struct buf_ops *bops)
> +{
> +	int i915 = buf_ops_get_fd(bops);
> +	struct intel_bb *ibb;
> +
> +	gem_require_contexts(i915);
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
> +	const intel_ctx_t *ctx = intel_ctx_create(i915, &cfg);
> +
> +	ibb = intel_bb_create_with_context(i915, ctx->id, &ctx->cfg, PAGE_SIZE);
> +
> +	intel_bb_emit_bbe(ibb);
> +	intel_bb_flush_blit(ibb);

BBE will work on each engine, can you prove it was executed on blitter?

--
Zbigniew

> +
> +	intel_bb_destroy(ibb);
> +	intel_ctx_destroy(i915, ctx);
> +}
> +
>  static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc,
>  		  uint32_t width, uint32_t height)
>  {
> @@ -1581,6 +1611,10 @@ igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
>  	igt_subtest("full-batch")
>  		full_batch(bops);
> 
> +	igt_describe("Execute intel_bb with set of engines provided by userspace");
> +	igt_subtest("misplaced-blitter")
> +		misplaced_blitter(bops);
> +
>  	igt_subtest_with_dynamic("render") {
>  		for (i = 0; i < ARRAY_SIZE(tests); i++) {
>  			const struct test *t = &tests[i];
> --
> 2.25.1
