Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAFD10E3C3
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Oct 2022 12:53:54 +0000 (UTC)
Date: Tue, 25 Oct 2022 15:53:46 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Y1fcWrRnq4wQxbaK@platvala-desk.ger.corp.intel.com>
References: <cover.1666680959.git.karolina.drobnik@intel.com>
 <eca32324040a1ce100d6bf9fb39cb5d2643cc85b.1666680959.git.karolina.drobnik@intel.com>
 <Y1ekWXpp7q2M+8f5@zkempczy-mobl2>
 <b48186ee-77f1-c2d1-fc26-51ace3fe1377@intel.com>
 <Y1fbU2z+uFHSu8ih@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y1fbU2z+uFHSu8ih@zkempczy-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/3] tests/api_intel_bb: Add
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

On Tue, Oct 25, 2022 at 02:49:23PM +0200, Zbigniew Kempczyński wrote:
> On Tue, Oct 25, 2022 at 02:33:11PM +0200, Karolina Drobnik wrote:
> > On 25.10.2022 10:54, Zbigniew Kempczyński wrote:
> > > On Tue, Oct 25, 2022 at 09:15:01AM +0200, Karolina Drobnik wrote:
> > > > Exercise intel_bb with a custom context engines layout.
> > > > 
> > > > Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
> > > > ---
> > > >   tests/i915/api_intel_bb.c | 38 ++++++++++++++++++++++++++++++++++++++
> > > >   1 file changed, 38 insertions(+)
> > > > 
> > > > diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> > > > index 6ba1fd1b..44272e9a 100644
> > > > --- a/tests/i915/api_intel_bb.c
> > > > +++ b/tests/i915/api_intel_bb.c
> > > > @@ -50,6 +50,8 @@
> > > >   #define COLOR_77	0x77
> > > >   #define COLOR_CC	0xcc
> > > > +#define MI_FLUSH_DW	(0x26 << 23)
> > > > +
> > > >   IGT_TEST_DESCRIPTION("intel_bb API check.");
> > > >   enum reloc_objects {
> > > > @@ -1209,6 +1211,38 @@ static void full_batch(struct buf_ops *bops)
> > > >   	intel_bb_destroy(ibb);
> > > >   }
> > > > +static void misplaced_blitter(struct buf_ops *bops)
> > > > +{
> > > > +	int i915 = buf_ops_get_fd(bops);
> > > > +	struct intel_bb *ibb;
> > > > +
> > > > +	gem_require_contexts(i915);
> > > > +
> > > > +	/* Use custom configuration with blitter at index 0 */
> > > > +	const intel_ctx_cfg_t cfg = (intel_ctx_cfg_t) {
> > > > +			.num_engines = 2,
> > > > +			.engines = {
> > > > +				{ .engine_class = I915_ENGINE_CLASS_COPY,
> > > > +				  .engine_instance = 0
> > > > +				},
> > > > +				{ .engine_class = I915_ENGINE_CLASS_RENDER,
> > > > +				  .engine_instance = 0
> > > > +				},
> > > > +			},
> > > > +		};
> > > 
> > > Compiler complains:
> > > 
> > > ../tests/i915/api_intel_bb.c:1222:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
> > >   1222 |         const intel_ctx_cfg_t cfg = (intel_ctx_cfg_t) {
> > > 
> > > Please fix this.
> > 
> > I defined it already as const because that's what intel_ctx_create()
> > expects, but I can change it.
> 
> Problem is related to variable definition is after gem_require_contexts(i915).
> Changing the order should solve this. Const is fine for me, keep it.
> 
> > 
> > Also, with kernel now using C11, don't we want to change the standard for
> > IGTs as well? (that's more of a general comment, not to this warning)
> 
> Question to maintainers :)


meson.build:

          'c_std=gnu11',

We're already using it. However, we also use

cc_args = [
        ...
        '-Wdeclaration-after-statement',
        ...



-- 
Petri Latvala



> 
> --
> Zbigniew
> 
> > 
> > > > +	const intel_ctx_t *ctx = intel_ctx_create(i915, &cfg);
> > > > +
> > > > +	ibb = intel_bb_create_with_context(i915, ctx->id, &ctx->cfg, PAGE_SIZE);
> > > > +
> > > > +	/* Try to execute blitter-specific instruction */
> > > > +	intel_bb_out(ibb, MI_FLUSH_DW);
> > > 
> > > Are you sure? Check instruction length and required data.
> > 
> > Will double check.
> > 
> > Thanks,
> > Karolina
> > 
> > > --
> > > Zbigniew
> > > 
> > > > +	intel_bb_emit_bbe(ibb);
> > > > +	intel_bb_flush_blit(ibb);
> > > > +
> > > > +	intel_bb_destroy(ibb);
> > > > +	intel_ctx_destroy(i915, ctx);
> > > > +}
> > > > +
> > > >   static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc,
> > > >   		  uint32_t width, uint32_t height)
> > > >   {
> > > > @@ -1581,6 +1615,10 @@ igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
> > > >   	igt_subtest("full-batch")
> > > >   		full_batch(bops);
> > > > +	igt_describe("Execute intel_bb with set of engines provided by userspace");
> > > > +	igt_subtest("misplaced-blitter")
> > > > +		misplaced_blitter(bops);
> > > > +
> > > >   	igt_subtest_with_dynamic("render") {
> > > >   		for (i = 0; i < ARRAY_SIZE(tests); i++) {
> > > >   			const struct test *t = &tests[i];
> > > > -- 
> > > > 2.25.1
> > > > 
