Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA956E040
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 03:34:49 +0000 (UTC)
Date: Mon, 7 Jun 2021 20:34:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20210608033445.GF6936@mdroper-desk1.amr.corp.intel.com>
References: <20210604203927.494340-1-matthew.d.roper@intel.com>
 <20210604203927.494340-6-matthew.d.roper@intel.com>
 <cd08f3fe7e870b9adb68f5d036d642178463d88b.camel@intel.com>
 <20210607075821.GA3783533@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607075821.GA3783533@ideak-desk.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/6] lib/i915: Add ADL-P stride
 restrictions for non-linear buffers
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
To: Imre Deak <imre.deak@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Taylor,
 Clinton A" <clinton.a.taylor@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 10:58:21AM +0300, Imre Deak wrote:
> On Fri, Jun 04, 2021 at 11:51:51PM +0300, Souza, Jose wrote:
> > Hum we can drop this change, Imre landed changes to make framebuffers
> > strides power of two for adl_p, so for userspace it should be
> > transparent.
> =

> Yes, it should be transparent for CCS framebuffers too, however that's a
> TODO item. I suspect that kernel would need to recreate the CCS plane if
> the main surface stride changes (since the layout of each CCS page would
> change, so we can't just remap the CCS pages), hence left this part for
> a follow-up.
> =

> So this patch is needed.

Are there any changes required, or can we consider this r-b?

Thanks.


Matt

> =

> > On Fri, 2021-06-04 at 13:39 -0700, Matt Roper wrote:
> > > From: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> > > =

> > > ADL-P tiled framebuffer strides must be power-of-two aligned and has a
> > > minimum of 8 tiles. For non-CCS framebuffers the driver supports FBs =
not
> > > meeting this requirement by remapping the framebuffer and padding the
> > > stride as required, but for CCS FBs userspace must ensure the alignme=
nt.
> > > Adding remap support for CCS FBs to the driver is to be done as a
> > > follow-up.
> > > =

> > > Cc: Juha-Pekka Heikkil=E4 <juha-pekka.heikkila@intel.com>
> > > Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > > Cc: Clinton Taylor <Clinton.A.Taylor@intel.com>
> > > Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> > > Cc: Imre Deak <imre.deak@intel.com>
> > > Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >  lib/igt_fb.c | 26 +++++++++++++++++++++-----
> > >  1 file changed, 21 insertions(+), 5 deletions(-)
> > > =

> > > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > > index 585ede38..ce2aa6ce 100644
> > > --- a/lib/igt_fb.c
> > > +++ b/lib/igt_fb.c
> > > @@ -729,8 +729,16 @@ static uint32_t calc_plane_stride(struct igt_fb =
*fb, int plane)
> > >  		/* clear color always fixed to 64 bytes */
> > >  		return 64;
> > >  	} else if (is_gen12_ccs_plane(fb, plane)) {
> > > -		/* A main surface using a CCS AUX surface must be 4x4 tiles aligne=
d. */
> > > -		return ALIGN(min_stride, 64);
> > > +		/*
> > > +		 * A main surface using a CCS AUX surface must be 4x4 tiles
> > > +		 * aligned.  On ADL_P the minimum main surface stride is 8
> > > +		 * tiles (2 * 64 byte on CCS surface) and it has to be POT
> > > +		 * aligned.
> > > +		 */
> > > +		if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
> > > +			return roundup_power_of_two(max(min_stride, 128u));
> > > +		else
> > > +			return ALIGN(min_stride, 64);
> > >  	} else if (!fb->modifier && is_nouveau_device(fb->fd)) {
> > >  		int align;
> > >  =

> > > @@ -743,14 +751,22 @@ static uint32_t calc_plane_stride(struct igt_fb=
 *fb, int plane)
> > >  		return ALIGN(min_stride, align);
> > >  	} else {
> > >  		unsigned int tile_width, tile_height;
> > > +		uint32_t stride;
> > >  =

> > >  		igt_get_fb_tile_size(fb->fd, fb->modifier, fb->plane_bpp[plane],
> > >  				     &tile_width, &tile_height);
> > >  =

> > > -		if (is_gen12_ccs_modifier(fb->modifier))
> > > -			tile_width *=3D 4;
> > > +		if (is_gen12_ccs_modifier(fb->modifier)) {
> > > +			stride =3D ALIGN(min_stride, tile_width * 4);
> > >  =

> > > -		return ALIGN(min_stride, tile_width);
> > > +			/* TODO: add support to kernel to POT align CCS format strides */
> > > +			if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)))
> > > +				stride =3D roundup_power_of_two(max(stride, tile_width * 8));
> > > +		} else {
> > > +			stride =3D ALIGN(min_stride, tile_width);
> > > +		}
> > > +
> > > +		return stride;
> > >  	}
> > >  }
> > >  =

> > =


-- =

Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
