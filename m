Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEFB10E9CD
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Feb 2022 19:26:46 +0000 (UTC)
Date: Sat, 5 Feb 2022 00:43:43 +0530
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Message-ID: <20220204191343.GA6021@arjun-NUC8i7BEH>
References: <20211209191334.30082-1-arjun.melkaveri@intel.com>
 <a4ea1e7c-2e85-5985-0a3d-8f9dbb30fb41@shipmail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4ea1e7c-2e85-5985-0a3d-8f9dbb30fb41@shipmail.org>
Subject: Re: [igt-dev] [i-g-t] tests/i915/gem_ctx_engines: Added out fence
 for execute-one subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas@shipmail.org>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 04, 2022 at 11:33:23AM +0100, Thomas Hellström wrote:
> Hi,
> 
> On 12/9/21 20:13, Arjun Melkaveri wrote:
> > To make spinner to be on same context for following execbuf,
> > spin out_fence is passed to execbuf.rsvd2.
> 
> Could we add some explanation to the commit message as to why they need to
> be on the same context, (or serialized as this patch achieves).
i'll refine commit message , Main issue was test was failing with 
error mentioned below . As we are creating ctx for
each engine .
(gem_ctx_engines:4117) CRITICAL: Failed assertion: __gem_execbuf(i915, &execbuf) == expected
(gem_ctx_engines:4117) CRITICAL: Failed to report the valid engine for slot 0 (valid at 0)
> 
> > 
> > Used IGT_SPIN_FENCE_OUT flag in spinner, we can stop
> > using no-preemption.
> 
> Also clarify that this is not the primary purpose of the patch but rather a
> desirable side-effect?
Will update commit message.
> 
> 
> > 
> > Added I915_EXEC_FENCE_IN to the execbuf.flags so that it
> > is executed after the spinner.
> > 
> > v3: Restore back to original code to use igt_spin_end
> > to avoid interference with the test and to keep debugging clean.
> > (Suggested by Chris Wilson).
> > 
> > Cc: Chris Wilson <chris.p.wilson@intel.com>
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > ---
> >   tests/i915/gem_ctx_engines.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> > index 003dd171..c74601c2 100644
> > --- a/tests/i915/gem_ctx_engines.c
> > +++ b/tests/i915/gem_ctx_engines.c
> > @@ -298,7 +298,7 @@ static void execute_one(int i915)
> >   			spin = igt_spin_new(i915,
> >   					    .ahnd = ahnd,
> >   					    .ctx = ctx,
> > -					    .flags = (IGT_SPIN_NO_PREEMPTION |
> > +					    .flags = (IGT_SPIN_FENCE_OUT |
> >   						      IGT_SPIN_POLL_RUN));
> >   			do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
> > @@ -314,13 +314,13 @@ static void execute_one(int i915)
> >   			}
> >   			cfg.num_engines = GEM_MAX_ENGINES;
> >   			ctx = intel_ctx_create(i915, &cfg);
> > +			execbuf.rsvd2 = spin->execbuf.rsvd2 >> 32;
> > -			igt_spin_busywait_until_started(spin);
> >   			for (int j = 0; j <= I915_EXEC_RING_MASK; j++) {
> >   				int expected = j == i ? 0 : -EINVAL;
> >   				execbuf.rsvd1 = ctx->id;
> > -				execbuf.flags = j;
> > +				execbuf.flags = j | I915_EXEC_FENCE_IN;
> >   				igt_assert_f(__gem_execbuf(i915, &execbuf) == expected,
> >   					     "Failed to report the %s engine for slot %d (valid at %d)\n",
> >   					     j == i ? "valid" : "invalid", j, i);
> > @@ -330,7 +330,8 @@ static void execute_one(int i915)
> >   			igt_assert_eq(batch_busy(busy.busy),
> >   				      i != -1 ? 1 << e->class : 0);
> > -			igt_spin_free(i915, spin);
> > +			igt_spin_end(spin);
> 
> Wouldn't we be leaking spinners if we replace igt_spin_end() with
> igt_spin_free()?
> 
> /Thomas
igt_spin_free also has simillar implementation . This change was
suggestion from chris to "keep excess work outside of the actual
submission as simple as possible to avoid interference with the test and
to keep debugging clean".
 Reverted back change to older code using igt_spin_end. 

i'll recheck this again and send updated patch 
-Arjun
> 
> 
> 
> > +			close(spin->execbuf.rsvd2 >> 32);
> >   			put_ahnd(ahnd);
> >   			gem_sync(i915, obj.handle);
