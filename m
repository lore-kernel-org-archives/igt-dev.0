Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243956E14F
 for <igt-dev@lists.freedesktop.org>; Mon,  3 May 2021 19:43:50 +0000 (UTC)
Date: Mon, 3 May 2021 22:43:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YJBScZmyJylibAjR@intel.com>
References: <20210503182555.12284-1-mario.kleiner.de@gmail.com>
 <20210503182555.12284-3-mario.kleiner.de@gmail.com>
 <YJBFTJtnHhQx74jd@intel.com>
 <CAEsyxyjE8AzJWm8EsQ7W6kAv4_DN26RFWe7OE3Qc51i4xqT0dA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEsyxyjE8AzJWm8EsQ7W6kAv4_DN26RFWe7OE3Qc51i4xqT0dA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: Add support for testing
 of 16 bpc fixed point formats.
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
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 03, 2021 at 09:32:19PM +0200, Mario Kleiner wrote:
> On Mon, May 3, 2021 at 8:48 PM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Mon, May 03, 2021 at 08:25:55PM +0200, Mario Kleiner wrote:
> > > This is used to support testing the 16 bpc formats, e.g., via:
> > >
> > > kms_plane --run-subtest pixel-format-pipe-A-planes
> > >
> > > So far this was successfully tested on AMD RavenRidge with DCN-1
> > > display hw.
> > >
> > > The new conversion routines are slightly adapted copies of the
> > > convert_float_to_fp16() and convert_fp16_to_float() functions,
> > > with the conversion math modified for float <-> uint16 instead.
> > >
> > > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > ---
> > >  lib/igt_fb.c | 123 +++++++++++++++++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 123 insertions(+)
> > >
> > > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > > index 954e1181..148e6c0f 100644
> > > --- a/lib/igt_fb.c
> > > +++ b/lib/igt_fb.c
> > > @@ -220,6 +220,22 @@ static const struct format_desc_struct {
> > >         .cairo_id =3D CAIRO_FORMAT_RGBA128F, .convert =3D true,
> > >         .num_planes =3D 1, .plane_bpp =3D { 64, },
> > >       },
> > > +     { .name =3D "XRGB16161616", .depth =3D -1, .drm_id =3D DRM_FORM=
AT_XRGB16161616,
> > > +       .cairo_id =3D CAIRO_FORMAT_RGBA128F, .convert =3D true,
> > > +       .num_planes =3D 1, .plane_bpp =3D { 64, },
> > > +     },
> > > +     { .name =3D "ARGB16161616", .depth =3D -1, .drm_id =3D DRM_FORM=
AT_ARGB16161616,
> > > +       .cairo_id =3D CAIRO_FORMAT_RGBA128F, .convert =3D true,
> > > +       .num_planes =3D 1, .plane_bpp =3D { 64, },
> > > +     },
> > > +     { .name =3D "XBGR16161616", .depth =3D -1, .drm_id =3D DRM_FORM=
AT_XBGR16161616,
> > > +       .cairo_id =3D CAIRO_FORMAT_RGBA128F, .convert =3D true,
> > > +       .num_planes =3D 1, .plane_bpp =3D { 64, },
> > > +     },
> > > +     { .name =3D "ABGR16161616", .depth =3D -1, .drm_id =3D DRM_FORM=
AT_ABGR16161616,
> > > +       .cairo_id =3D CAIRO_FORMAT_RGBA128F, .convert =3D true,
> > > +       .num_planes =3D 1, .plane_bpp =3D { 64, },
> > > +     },
> > >       { .name =3D "NV12", .depth =3D -1, .drm_id =3D DRM_FORMAT_NV12,
> > >         .cairo_id =3D CAIRO_FORMAT_RGB24, .convert =3D true,
> > >         .num_planes =3D 2, .plane_bpp =3D { 8, 16, },
> > > @@ -3365,9 +3381,13 @@ static const unsigned char *rgbx_swizzle(uint3=
2_t format)
> > >       default:
> > >       case DRM_FORMAT_XRGB16161616F:
> > >       case DRM_FORMAT_ARGB16161616F:
> > > +     case DRM_FORMAT_XRGB16161616:
> > > +     case DRM_FORMAT_ARGB16161616:
> > >               return swizzle_bgrx;
> > >       case DRM_FORMAT_XBGR16161616F:
> > >       case DRM_FORMAT_ABGR16161616F:
> > > +     case DRM_FORMAT_XBGR16161616:
> > > +     case DRM_FORMAT_ABGR16161616:
> > >               return swizzle_rgbx;
> > >       }
> > >  }
> > > @@ -3451,6 +3471,97 @@ static void convert_float_to_fp16(struct fb_co=
nvert *cvt)
> > >       }
> > >  }
> > >
> > > +static void float_to_uint16(const float *f, uint16_t *h, unsigned in=
t num)
> > > +{
> > > +     for (int i =3D 0; i < num; i++)
> > > +             h[i] =3D f[i] * 65535.0f + 0.5f;
> > > +}
> > > +
> > > +static void uint16_to_float(const uint16_t *h, float *f, unsigned in=
t num)
> > > +{
> > > +     for (int i =3D 0; i < num; i++)
> > > +             f[i] =3D ((float) h[i]) / 65535.0f;
> >
> > nit: the cast shouldn't be necessary.
> >
> > Looks good otherwise.
> > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> Thanks for the quick review. Compiler and test results agree with you :).
> =

> However, all other uintsomething_to_float() conversion routines, e.g.,
> for the yuv formats and for fp16_to_float() all use that apparently
> redundant cast, which is why I left it for consistency with the rest
> of the code. And in case those wiser people who wrote those bits may
> know something that i don't see?
> =

> Should I change the patch to drop the cast, and resend?

Maybe not be worth the hassl esp. if there are redundant casts all over
anyway. We could do a global pass later to clear them all up, or just
squint and pretend they're not there :P

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
