Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7758D6EABE
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Sep 2021 21:23:51 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Fri, 10 Sep 2021 21:23:48 +0000
Message-ID: <DM6PR11MB3786C1FD4B6306359606743C8AD69@DM6PR11MB3786.namprd11.prod.outlook.com>
References: <20210902173043.821318-1-alan.previn.teres.alexis@intel.com>
 <20210902173043.821318-11-alan.previn.teres.alexis@intel.com>
 <YTupsRZ/pezHuJnQ@intel.com>
 <6946df5a42ff24634d67f0a346905ed416da6426.camel@intel.com>
 <YTuuByXnNL2CW/pN@intel.com>
In-Reply-To: <YTuuByXnNL2CW/pN@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

No apologies necessary - thanks so much for reviewing all the patches in th=
is series through multiple design revs and thanks for the r-v-b on these 3 =
today.=20

...alan

-----Original Message-----
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Friday, September 10, 2021 12:12 PM
To: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t v9 10/16] Verify execbuf fails with sta=
le PXP context after teardown

On Fri, Sep 10, 2021 at 07:04:13PM +0000, Teres Alexis, Alan Previn wrote:
>=20
> On Fri, 2021-09-10 at 14:53 -0400, Rodrigo Vivi wrote:
> > On Thu, Sep 02, 2021 at 10:30:37AM -0700, Alan Previn wrote:
> > > Add a subtest to verify that reusing a stale protected context in=20
> > > a gem_execbuff after a teardown fails with -EIO error because it's=20
> > > banned. Trigger the teardown via the pxp invalidation debugfs that=20
> > > simulates a HW teardown IRQ.
> > >=20
> > > NOTE: The end-to-end architecture requirement includes that any=20
> > > break in the links of the PXP sessions needs to trigger a full=20
> > > teardown and the application needs to be made aware of that=20
> > > allowing it to re-establish the end-to-end pipeline of buffers,=20
> > > contexts and renders again if it chooses to. This stricter=20
> > > behavior targets only contexts created with PXP enabled.
> > >=20
> > > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > ---
> > >  lib/intel_batchbuffer.c |   2 +-
> > >  lib/intel_batchbuffer.h |   3 +
> > >  tests/i915/gem_pxp.c    | 151 ++++++++++++++++++++++++++++++++++++++=
++
> > >  3 files changed, 155 insertions(+), 1 deletion(-)
> > >=20
> > > +static void test_pxp_stale_ctx_execution(int i915) {
> > > +	int ret;
> > > +	struct simple_exec_assets data =3D {0};
> > > +
> > > +	/*
> > > +	 * Use normal buffers for testing for invalidation
> > > +	 * of protected contexts to ensure kernel is catching
> > > +	 * the invalidated context (not buffer)
> > > +	 */
> > > +	prepare_exec_assets(i915, &data, true, false);
> > > +	ret =3D gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.f=
encebuf);
> > > +	igt_assert(ret =3D=3D 0);
> > > +
> > > +	trigger_pxp_debugfs_forced_teardown(i915);
> > > +
> > > +	ret =3D gem_execbuf_flush_store_dw(i915, data.ibb, data.ctx, data.f=
encebuf);
> > > +	igt_assert_f((ret =3D=3D -EIO), "Executing stale pxp context didn't=
=20
> > > +fail with -EIO\n");
> >=20
> > I believe you meant the opposite right?
> > other then that, the patch looks good to me...
>=20
> No, I actually DID want to ensure I get the -EIO failure when=20
> executing with stale PXP and so the error does read correctly. I can=20
> modify it to "Executing stale pxp was expected to fail with -EIO\n" if=20
> you like. Can i still get a conditional R-v-b at least? (i do have to dou=
ble check that the error type hasnt changed - this had changed a few times =
on the kernel side and i need to check the latest rev today).

Sorry man...
I need coffee and a break... but before:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



>=20
> ...alan
