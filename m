Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA346E1D8
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2020 12:18:50 +0000 (UTC)
From: "Laxminarayan Bharadiya, Pankaj"
 <pankaj.laxminarayan.bharadiya@intel.com>
Date: Tue, 28 Jul 2020 12:18:46 +0000
Message-ID: <0718a083ce3c493c810de1fa070345a3@intel.com>
References: <20200722134758.26412-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200723121414.GD6112@intel.com>
In-Reply-To: <20200723121414.GD6112@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_big_fb: Use igt_assert on
 bufmgr
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: 23 July 2020 17:44
> To: Laxminarayan Bharadiya, Pankaj
> <pankaj.laxminarayan.bharadiya@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Latvala, Petri <petri.latvala@intel.co=
m>
> Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_big_fb: Use igt_assert =
on
> bufmgr
> =

> On Wed, Jul 22, 2020 at 07:17:58PM +0530, Pankaj Bharadiya wrote:
> > NULL bufmgr pointer leads to SIGSEGV. Assert on NULL bufmgr so that
> > correct failure reason will get dumped in the stack trace.
> >
> > Signed-off-by: Pankaj Bharadiya
> > <pankaj.laxminarayan.bharadiya@intel.com>
> > ---
> > * changes since v1:
> >  - Make the error message more helpful [Petri]
> >
> >  tests/kms_big_fb.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c index
> > a754b2997..48caa5cd1 100644
> > --- a/tests/kms_big_fb.c
> > +++ b/tests/kms_big_fb.c
> > @@ -607,6 +607,7 @@ igt_main
> >  {
> >  	igt_fixture {
> >  		drmModeResPtr res;
> > +		const struct intel_device_info *info;
> >
> >  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> >
> > @@ -649,6 +650,10 @@ igt_main
> >  			data.render_copy =3D
> igt_get_render_copyfunc(data.devid);
> >
> >  		data.bufmgr =3D drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
> > +		info =3D intel_get_device_info(data.devid);
> > +		igt_assert_f(data.bufmgr, "Update libdrm for %s support\n",
> > +			     info->gen ? info->codename : "<unknown chipset>");
> > +
> =

> How many individual tests are you going to have to patch like this?
> Would probably make more sense to plop this into some wrapper.

Creating a wrapper only for drm_intel_bufmgr_gem_init() and leaving behind =

other drm_intel_bufmgr_* calls  unwrapped will lead to confusion. Any sugge=
stions here?

Thanks,
Pankaj
> =

> >  		data.batch =3D intel_batchbuffer_alloc(data.bufmgr, data.devid);
> >  	}
> >
> > --
> > 2.23.0
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> =

> --
> Ville Syrj=E4l=E4
> Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
