Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E689589826
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Aug 2021 05:37:14 +0000 (UTC)
Date: Mon, 16 Aug 2021 07:37:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210816053709.GA6051@zkempczy-mobl2>
References: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
 <20210813074703.18778-3-zbigniew.kempczynski@intel.com>
 <87zgtlgjnp.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zgtlgjnp.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/9] tests/gem_ctx_persistence: Adopt to
 use allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 13, 2021 at 01:43:38PM -0700, Dixit, Ashutosh wrote:
> On Fri, 13 Aug 2021 00:46:56 -0700, Zbigniew Kempczyński wrote:
> >
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> But please check and fix below.
> 
> > @@ -703,12 +739,16 @@ static void test_process(int i915)
> >
> >	igt_fork(child, 1) {
> >		igt_spin_t *spin;
> > +		uint64_t ahnd;
> >
> > +		intel_allocator_init();
> >		i915 = gem_reopen_driver(i915);
> >		gem_quiescent_gpu(i915);
> >
> >		gem_context_set_persistence(i915, 0, false);
> > -		spin = igt_spin_new(i915, .flags = IGT_SPIN_FENCE_OUT);
> > +		ahnd = get_reloc_ahnd(i915, 0);
> > +		spin = igt_spin_new(i915, .ahnd = ahnd,
> > +				    .flags = IGT_SPIN_FENCE_OUT);
> >		sendfd(sv[0], spin->out_fence);
> >
> >		igt_list_del(&spin->link); /* prevent autocleanup */
> 
> Missing put_ahnd?
> 
> > @@ -747,12 +787,16 @@ static void test_userptr(int i915)
> >
> >	igt_fork(child, 1) {
> >		igt_spin_t *spin;
> > +		uint64_t ahnd;
> >
> > +		intel_allocator_init();
> >		i915 = gem_reopen_driver(i915);
> >		gem_quiescent_gpu(i915);
> >
> >		gem_context_set_persistence(i915, 0, false);
> > -		spin = igt_spin_new(i915, .flags = IGT_SPIN_FENCE_OUT | IGT_SPIN_USERPTR);
> > +		ahnd = get_reloc_ahnd(i915, 0);
> > +		spin = igt_spin_new(i915, .ahnd = ahnd,
> > +				    .flags = IGT_SPIN_FENCE_OUT | IGT_SPIN_USERPTR);
> >		sendfd(sv[0], spin->out_fence);
> >
> >		igt_list_del(&spin->link); /* prevent autocleanup */
> 
> Missing put_ahnd?
> 
> > @@ -795,9 +839,12 @@ static void test_process_mixed(int pfd, const intel_ctx_cfg_t *cfg,
> >		for (int persists = 0; persists <= 1; persists++) {
> >			igt_spin_t *spin;
> >			const intel_ctx_t *ctx;
> > +			uint64_t ahnd;
> >
> > +			intel_allocator_init();
> >			ctx = ctx_create_persistence(i915, cfg, persists);
> > -			spin = igt_spin_new(i915, .ctx = ctx,
> > +			ahnd = get_reloc_ahnd(i915, ctx->id);
> > +			spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
> >					    .engine = engine,
> >					    .flags = IGT_SPIN_FENCE_OUT);
> 
> Missing put_ahnd?
> 
> >  static void test_processes(int i915)
> > @@ -912,11 +963,15 @@ static void test_processes(int i915)
> >		igt_fork(child, 1) {
> >			igt_spin_t *spin;
> >			int pid;
> > +			uint64_t ahnd;
> >
> > +			intel_allocator_init();
> >			i915 = gem_reopen_driver(i915);
> >			gem_context_set_persistence(i915, 0, i);
> >
> > -			spin = igt_spin_new(i915, .flags = IGT_SPIN_FENCE_OUT);
> > +			ahnd = get_reloc_ahnd(i915, 0);
> > +			spin = igt_spin_new(i915, .ahnd = ahnd,
> > +					    .flags = IGT_SPIN_FENCE_OUT);
> >			/* prevent autocleanup */
> >			igt_list_del(&spin->link);
> 
> Missing put_ahnd?
> 
> > @@ -1256,9 +1316,21 @@ igt_main
> >
> >		igt_subtest("many-contexts")
> >			many_contexts(i915, &ctx->cfg);
> > +	}
> > +
> > +	igt_subtest_group {
> > +		igt_fixture {
> > +			gem_require_contexts(i915);
> > +			intel_allocator_multiprocess_start();
> > +		}
> >
> >		igt_subtest("smoketest")
> >			smoketest(i915, &ctx->cfg);
> > +
> > +		igt_fixture {
> > +			intel_allocator_multiprocess_stop();
> > +		}
> > +
> 
> Also, why are we not putting intel_allocator_multiprocess_start/stop around
> the multiprocess tests above? Is that because they all do "igt_fork(child, 1)"?
> At least test_processes() seems to be creating multiple child processes. Thanks.

No, if you will call intel_allocator_init() in child it will "detach"
from IPC, it will prepare allocator structures locally and no allocator
thread is necessary.  You can use this if you have creating new contexts
in child, they are independent so we can skip using IPC here.
gem_reopen_driver() is also such case because we have individual fd to i915.

--
Zbigniew
