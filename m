Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C305989AAE
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Oct 2021 10:54:59 +0000 (UTC)
Date: Wed, 27 Oct 2021 13:54:53 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20211027105453.GA2794745@ideak-desk.fi.intel.com>
References: <20211026212620.2718277-1-imre.deak@intel.com>
 <20211026212620.2718277-3-imre.deak@intel.com>
 <YXkf464pWE0LUrXy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YXkf464pWE0LUrXy@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/igt_fb/tgl+: Prevent CCS FB UV
 surface offset overalignment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 27, 2021 at 12:46:11PM +0300, Ville Syrj=E4l=E4 wrote:
> On Wed, Oct 27, 2021 at 12:26:18AM +0300, Imre Deak wrote:
> > The offset of semiplanar UV surfaces in CCS FBs must be 64 kbyte aligned
> > as required by the Vebox engine which IGT uses to convert between tiling
> > formats. At the same time the display engine requires the offset to be
> > tile-row aligned. So far we ensured both of these alignment requirements
> > by aligning all color surface widths/heights to 4x4 tiles. This however
> > wastes memory in case the number of tiles in one tile-row modulo 16 is 0
> > or 8 where 1 or 2 tile-row alignment correspondingly would be enough.
> >=20
> > The next patch removes the 4x4 tile alignment, here prepare for that by
> > aligning TGL+ UV surface offsets to LCM(tile-row size, 64 kbyte)
> > ensuring the minimum tile-row size and 64 kbyte alignment.
> >=20
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  lib/igt_fb.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >=20
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index b8b2396d3..86d0ae426 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -392,6 +392,12 @@ bool igt_format_is_yuv_semiplanar(uint32_t format)
> >  	return igt_format_is_yuv(format) && f->num_planes =3D=3D 2;
> >  }
> > =20
> > +static bool is_yuv_semiplanar_plane(const struct igt_fb *fb, int color=
_plane)
> > +{
> > +	return igt_format_is_yuv_semiplanar(fb->drm_format) &&
> > +	       color_plane =3D=3D 1;
> > +}
> > +
> >  /**
> >   * igt_get_fb_tile_size:
> >   * @fd: the DRM file descriptor
> > @@ -843,16 +849,61 @@ static uint64_t calc_plane_size(struct igt_fb *fb=
, int plane)
> >  	}
> >  }
> > =20
> > +static unsigned int gcd(unsigned int a, unsigned int b)
> > +{
> > +	if (b =3D=3D 0)
> > +		return a;
> > +
> > +	return gcd(b, a % b);
>=20
> I would write that w/o the recursion.=20

Ok, will change it.

> --=20
> Ville Syrj=E4l=E4
> Intel
