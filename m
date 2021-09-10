Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312436EA58
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Sep 2021 19:12:11 +0000 (UTC)
Date: Fri, 10 Sep 2021 15:12:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YTuuByXnNL2CW/pN@intel.com>
References: <20210902173043.821318-1-alan.previn.teres.alexis@intel.com>
 <20210902173043.821318-11-alan.previn.teres.alexis@intel.com>
 <YTupsRZ/pezHuJnQ@intel.com>
 <6946df5a42ff24634d67f0a346905ed416da6426.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6946df5a42ff24634d67f0a346905ed416da6426.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v9 10/16] Verify execbuf fails with
 stale PXP context after teardown
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 10, 2021 at 07:04:13PM +0000, Teres Alexis, Alan Previn wrote:
> 
> On Fri, 2021-09-10 at 14:53 -0400, Rodrigo Vivi wrote:
> > On Thu, Sep 02, 2021 at 10:30:37AM -0700, Alan Previn wrote:
> > > Add a subtest to verify that reusing a stale protected context
> > > in a gem_execbuff after a teardown fails with -EIO error because
> > > it's banned. Trigger the teardown via the pxp invalidation
> > > debugfs that simulates a HW teardown IRQ.
> > > 
> > > NOTE: The end-to-end architecture requirement includes that
> > > any break in the links of the PXP sessions needs to trigger a
> > > full teardown and the application needs to be made aware of that
> > > allowing it to re-establish the end-to-end pipeline of buffers,
> > > contexts and renders again if it chooses to. This stricter
> > > behavior targets only contexts created with PXP enabled.
> > > 
> > > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > ---
> > >  lib/intel_batchbuffer.c |   2 +-
> > >  lib/intel_batchbuffer.h |   3 +
> > >  tests/i915/gem_pxp.c    | 151 ++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 155 insertions(+), 1 deletion(-)
> > > 
> > > +static void test_pxp_stale_ctx_execution(int i915)
> > > +{
> > > +	int ret;
> > > +	struct simple_exec_assets data = {0};
> > > +
> > > +	/*
> > > +	 * Use normal buffers for testing for invalidation
> > > +	 * of protected contexts to ensure kernel is catching
> > > +	 * the invalidated context (not buffer)
> > > +	 */
> > > +	prepare_exec_assets(i915, &data, true, false);
> > > +	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
> > > +	igt_assert(ret == 0);
> > > +
> > > +	trigger_pxp_debugfs_forced_teardown(i915);
> > > +
> > > +	ret = gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.fencebuf);
> > > +	igt_assert_f((ret == -EIO), "Executing stale pxp context didn't fail with -EIO\n");
> > 
> > I believe you meant the opposite right?
> > other then that, the patch looks good to me...
> 
> No, I actually DID want to ensure I get the -EIO failure when executing with stale PXP and so the error
> does read correctly. I can modify it to "Executing stale pxp was expected to fail with -EIO\n" if you
> like. Can i still get a conditional R-v-b at least? (i do have to double check that the error type hasnt
> changed - this had changed a few times on the kernel side and i need to check the latest rev today).

Sorry man...
I need coffee and a break... but before:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> 
> ...alan
