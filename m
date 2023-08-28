Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A5410E044
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Aug 2023 05:29:10 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
Date: Mon, 28 Aug 2023 05:29:00 +0000
Message-ID: <DM4PR11MB6312CFCA489BB2637E79EE3190E0A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230814080527.3017102-1-jeevan.b@intel.com>
 <ZOuPuw0BJA8qhGZk@ideak-desk.fi.intel.com>
In-Reply-To: <ZOuPuw0BJA8qhGZk@ideak-desk.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] RFC: tests/kms_setmode: rename subtest to
 simplify test combinations
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Deak, Imre <imre.deak@intel.com>
> Sent: Sunday, August 27, 2023 11:33 PM
> To: B, Jeevan <jeevan.b@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH] RFC: tests/kms_setmode: rename subtest to simplify
> test combinations
>=20
> On Mon, Aug 14, 2023 at 01:35:27PM +0530, Jeevan B wrote:
> > Both 'basic-clone-single-crtc' and 'invalid-clone-single-crtc' tests
> > aim to assess a scenario where two connectors are attempted to be run
> > with a single CRTC, which is not feasible.  Consequently, the  'basic-c=
lone-
> single-crtc'
> > test is marked as invalid and skipped due to the impractical scenario.
> > On the other hand, the 'invalid-clone-single-crtc' test serves as a
> > negative scenario, confirming the failure of the 'ioctl' and indicating=
 a
> successful test.
> >
> > similarly, the 'invalid-clone-exclusive-crtc' test attempts to run two
> > connectors with two CRTCs, which is indeed possible, rendering the test
> nonsensical.
> > Consequently, the 'clone-exclusive-crtc' test runs and passes as expect=
ed.
> >

Thanks for the inputs. Will work on the comments given. .

> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > Cc: Imre Deak <imre.deak@intel.com>
> > ---
> >  tests/kms_setmode.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index
> > 035bbd0b0..0c65e3937 100644
> > --- a/tests/kms_setmode.c
> > +++ b/tests/kms_setmode.c
> > @@ -932,12 +932,8 @@ igt_main_args("det:", NULL, help_str,
> opt_handler, NULL)
> >  		const char *name;
> >  	} tests[] =3D {
> >  		{ TEST_TIMINGS, "basic" },
> > -		{ TEST_CLONE | TEST_SINGLE_CRTC_CLONE,
> > -					"basic-clone-single-crtc" },
>=20
> It is feasible to use a single CRTC with two connectors, for instance in =
case of
> a VGA and an HDMI connector; so this subtest can't be removed.
>=20
> >  		{ TEST_INVALID | TEST_CLONE | TEST_SINGLE_CRTC_CLONE,
> > -					"invalid-clone-single-crtc" },
> > -		{ TEST_INVALID | TEST_CLONE |
> TEST_EXCLUSIVE_CRTC_CLONE,
>=20
> There are invalid configurations when each connector uses its own CRTC, f=
or
> instance when a connector uses a CRTC not compatible with the connector.
> So this subtest can't be removed either.
>=20
> I suppose you're fixing a problem where a subtest is failing if there are=
 no
> dynamic tests defined for it, on some platforms. In that case the subtest
> should be made to pass explicitly, perhaps by ensuring that there is at l=
east
> one dynamic test defined for each subtest.
>=20
> > -					"invalid-clone-exclusive-crtc" },
> > +					"clone-single-crtc-negative" },
> >  		{ TEST_CLONE | TEST_EXCLUSIVE_CRTC_CLONE,
> >  					"clone-exclusive-crtc" },
> >  		{ TEST_INVALID | TEST_CLONE | TEST_SINGLE_CRTC_CLONE
> |
> > TEST_STEALING,
> > --
> > 2.25.1
> >
