Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F596E192
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2020 08:09:35 +0000 (UTC)
Date: Thu, 13 Feb 2020 10:09:08 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200213080908.GA31496@ideak-desk.fi.intel.com>
References: <20200211023108.25369-5-imre.deak@intel.com>
 <20200212215036.27407-1-imre.deak@intel.com>
 <87imkbunhn.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87imkbunhn.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH v3 5/8] tests/kms_draw_crc: Fix generating
 reference CRCs on platforms w/o aperture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 08:20:36PM -0800, Dixit, Ashutosh wrote:
> On Wed, 12 Feb 2020 13:50:34 -0800, Imre Deak wrote:
> >
> > Generate reference CRCs by drawing through a WC mapping on platforms w/o
> > a GTT aperture.
> >
> > v2:
> > - Fix code comment in draw_method_subtest(). (Matt)
> > v3:
> > - Use WC instead of CPU mapping. (Ashutosh)
> >
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com> (v2)
> > ---
> >  tests/kms_draw_crc.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
> > index 6de9feaeb..fa7433ab2 100644
> > --- a/tests/kms_draw_crc.c
> > +++ b/tests/kms_draw_crc.c
> > @@ -183,11 +183,13 @@ static void draw_method_subtest(enum igt_draw_method method,
> >
> >	igt_require(format_is_supported(formats[format_index], tiling));
> >
> > -	/* Use IGT_DRAW_MMAP_GTT on an untiled buffer as the parameter for
> > +	/* Use IGT_DRAW_MMAP_GTT/WC on an untiled buffer as the parameter for
> >	 * comparison. Cache the value so we don't recompute it for every single
> >	 * subtest. */
> >	if (!base_crcs[format_index].set) {
> > -		get_method_crc(IGT_DRAW_MMAP_GTT, formats[format_index],
> > +		get_method_crc(gem_has_mappable_ggtt(drm_fd) ? IGT_DRAW_MMAP_GTT :
> > +							       IGT_DRAW_MMAP_WC,
> > +			       formats[format_index],
> >			       LOCAL_DRM_FORMAT_MOD_NONE,
> >			       &base_crcs[format_index].crc);
> >		base_crcs[format_index].set = true;
> > @@ -225,7 +227,9 @@ static void fill_fb_subtest(void)
> >	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
> >		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
> >
> > -	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb, IGT_DRAW_MMAP_GTT,
> > +	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb,
> > +			 gem_has_mappable_ggtt(drm_fd) ? IGT_DRAW_MMAP_GTT :
> > +							 IGT_DRAW_MMAP_WC,
> 
> Not sure if the conditional switch between GTT and WC is really needed.

We can't use either one unconditionally since neither is available on
all platforms. So using GTT if available as before and if not WC.

> For example, __gem_mmap__device_coherent() unconditionally prefers WC over
> GTT. In any case:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
