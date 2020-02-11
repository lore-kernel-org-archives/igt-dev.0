Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35086E27A
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 00:38:55 +0000 (UTC)
Date: Tue, 11 Feb 2020 02:38:32 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200211003832.GB10361@ideak-desk.fi.intel.com>
References: <20200207191524.19362-1-imre.deak@intel.com>
 <20200207191524.19362-5-imre.deak@intel.com>
 <20200210225803.GR232048@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210225803.GR232048@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/8] tests/kms_draw_crc: Fix generating
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
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 02:58:03PM -0800, Matt Roper wrote:
> On Fri, Feb 07, 2020 at 09:15:21PM +0200, Imre Deak wrote:
> > Generate reference CRCs by drawing through a CPU mapping, which is also
> > available on platforms w/o a GTT aperture.
> > 
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  tests/kms_draw_crc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
> > index 6de9feae..f9d4b178 100644
> > --- a/tests/kms_draw_crc.c
> > +++ b/tests/kms_draw_crc.c
> > @@ -187,7 +187,7 @@ static void draw_method_subtest(enum igt_draw_method method,
> >  	 * comparison. Cache the value so we don't recompute it for every single
> >  	 * subtest. */
> 
> It doesn't show in the context here, but the comment line just above
> this says "Use IGT_DRAW_MMAP_GTT" --- that should be updated to match
> the code change below.

Ok.

> 
> 
> Matt
> 
> >  	if (!base_crcs[format_index].set) {
> > -		get_method_crc(IGT_DRAW_MMAP_GTT, formats[format_index],
> > +		get_method_crc(IGT_DRAW_MMAP_CPU, formats[format_index],
> >  			       LOCAL_DRM_FORMAT_MOD_NONE,
> >  			       &base_crcs[format_index].crc);
> >  		base_crcs[format_index].set = true;
> > @@ -225,7 +225,7 @@ static void fill_fb_subtest(void)
> >  	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
> >  		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
> >  
> > -	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb, IGT_DRAW_MMAP_GTT,
> > +	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb, IGT_DRAW_MMAP_CPU,
> >  			 0, 0, fb.width, fb.height, 0xFF);
> >  
> >  	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> > -- 
> > 2.23.1
> > 
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation
> (916) 356-2795
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
