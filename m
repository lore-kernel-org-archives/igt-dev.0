Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Tue, 13 Jul 2021 17:14:17 +0000
Message-ID: <BY5PR11MB43728F704DB5A7170101B1A189149@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1622176443-12682-1-git-send-email-vidya.srinivas@intel.com>
 <YLTv/Z8j9rCf2koN@intel.com>
 <BY5PR11MB4372AB95A5AC6DE9AC0FA552893F9@BY5PR11MB4372.namprd11.prod.outlook.com>
 <SN6PR11MB34216722158A9BCB2AC4CCE9DF039@SN6PR11MB3421.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB34216722158A9BCB2AC4CCE9DF039@SN6PR11MB3421.namprd11.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] [RFC] tests/kms_prime:
 Aligned pitch to 64 byte for Intel platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "Surendrakumar Upadhyay, TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Lin,
 Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hello All,

Very sorry to bother you all again. Kindly can you help so that we can clos=
e on this please?
We have submitted both IGT and kernel patches. If none are okay, should we =
skip the subtest for panels which have width not 64 byte aligned for Intel =
platforms?

https://patchwork.freedesktop.org/patch/435794/  - IGT patch (we are aligni=
ng width itself as workaround due to missing alignment in VGEM before reach=
ing i915)
https://patchwork.freedesktop.org/patch/436199/  - Kernel patch

Tejas has submitted another solution https://patchwork.freedesktop.org/patc=
h/441967/ (256B alignment) - this too works.

Regards
Vidya

-----Original Message-----
From: Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhy=
ay@intel.com> =

Sent: Monday, June 28, 2021 4:39 PM
To: Srinivas, Vidya <vidya.srinivas@intel.com>; Ville Syrj=E4l=E4 <ville.sy=
rjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; Lin, Ch=
arlton <charlton.lin@intel.com>
Subject: RE: [igt-dev] [PATCH i-g-t] [RFC] tests/kms_prime: Aligned pitch t=
o 64 byte for Intel platforms



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of =

> Srinivas, Vidya
> Sent: 31 May 2021 20:18
> To: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: igt-dev@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; =

> Lin, Charlton <charlton.lin@intel.com>
> Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] [RFC] =

> tests/kms_prime: Aligned pitch to 64 byte for Intel platforms
> =

> Hello Ville,
> =

> Thank you very much.
> Before reaching our i915's i915_gem_dumb_create, it goes to =

> vgem_gem_dumb_create for kms_prime.
> =

> The pitch gets calculated there and it is not 64 byte aligned. Due to =

> this, intel_framebuffer_init reports "pitch must be 64 byte aligned"
> and framebuffer creation fails. I tried submitting vgem patch where 64 =

> byte alignment can be done in vgem_gem_dumb_create and that also =

> passes. But we did not get approval yet as few of them felt, vgem is =

> generic and other platforms might fail if we do 64 byte alignment there.
> =

> Kindly suggest. Thanks a lot.
> =

> Regards
> Vidya
> =

> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Monday, May 31, 2021 7:48 PM
> To: Srinivas, Vidya <vidya.srinivas@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org; =

> Lin, Charlton <charlton.lin@intel.com>
> Subject: Re: [igt-dev] [PATCH i-g-t] [RFC] tests/kms_prime: Aligned =

> pitch to 64 byte for Intel platforms
> =

> On Fri, May 28, 2021 at 10:04:03AM +0530, Vidya Srinivas wrote:
> > For Intel platforms, pitch needs to be 64 byte aligned.
> > Kernel code vgem_gem_dumb_create which is platform generic code
> doesnt
> > do the alignment. This causes frame buffer creation to fail on Intel =

> > platforms where the pitch is not 64 byte aligned.
> >
> > tests: test run on Intel platforms with panel resolution 1366x768
> >
> > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > ---
> >  tests/kms_prime.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_prime.c b/tests/kms_prime.c index
> > 8cb2ca2a9dc3..fdc941fe8100 100644
> > --- a/tests/kms_prime.c
> > +++ b/tests/kms_prime.c
> > @@ -51,6 +51,8 @@ static struct {
> >  	{ .r =3D 1.0, .g =3D 0.0, .b =3D 0.0, .color =3D 0xffff0000 },  };
> >
> > +bool check_platform;
> > +
> >  IGT_TEST_DESCRIPTION("Prime tests, focusing on KMS side");
> >
> >  static bool has_prime_import(int fd) @@ -101,7 +103,7 @@ static =

> > void prepare_scratch(int exporter_fd, struct
> dumb_bo *scratch,
> >  	scratch->bpp =3D 32;
> >
> >  	scratch->handle =3D kmstest_dumb_create(exporter_fd,
> > -			scratch->width,
> > +			check_platform? ALIGN(scratch->width, 64): scratch-
> >width,
> =

> The dumb_create ioctl already does this for us.

I915_dumb_create does it for us but "vgem_gem_dumb_create" does not do 64 A=
LIGN. And kms_prime is using "vgem_gem_dumb_create" never call i915 dumb_cr=
eate() as the IGT creates buffer through VGEM driver, see below IGT snippet=
 :

/* ANY =3D anything that is not VGEM */
                first_fd =3D __drm_open_driver_another(0, DRIVER_ANY | DRIV=
ER_VGEM);
                igt_require(first_fd >=3D 0);

                second_fd =3D __drm_open_driver_another(1, DRIVER_ANY | DRI=
VER_VGEM);

Thanks,
Tejas
> =

> >  			scratch->height,
> >  			scratch->bpp,
> >  			&scratch->pitch,
> > @@ -262,6 +264,7 @@ igt_main
> >
> >  		/* ANY =3D anything that is not VGEM */
> >  		first_fd =3D __drm_open_driver_another(0, DRIVER_ANY |
> DRIVER_VGEM);
> > +		check_platform =3D is_i915_device(first_fd);
> >  		igt_require(first_fd >=3D 0);
> >
> >  		second_fd =3D __drm_open_driver_another(1, DRIVER_ANY |
> DRIVER_VGEM);
> > --
> > 2.7.4
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> =

> --
> Ville Syrj=E4l=E4
> Intel
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
