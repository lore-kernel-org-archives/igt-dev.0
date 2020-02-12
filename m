Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E8B6F4A1
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 10:24:21 +0000 (UTC)
Date: Wed, 12 Feb 2020 12:23:56 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200212102356.GC4025@ideak-desk.fi.intel.com>
References: <20200211023108.25369-1-imre.deak@intel.com>
 <20200211023108.25369-5-imre.deak@intel.com>
 <87zhdove9u.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zhdove9u.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH v2 5/8] tests/kms_draw_crc: Fix generating
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

On Tue, Feb 11, 2020 at 04:29:49PM -0800, Dixit, Ashutosh wrote:
> On Mon, 10 Feb 2020 18:31:05 -0800, Imre Deak wrote:
> >
> > Generate reference CRCs by drawing through a CPU mapping, which is also
> > available on platforms w/o a GTT aperture.
> >
> > v2:
> > - Fix code comment in draw_method_subtest(). (Matt)
> >
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  tests/kms_draw_crc.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
> > index 6de9feae..0e762ad1 100644
> > --- a/tests/kms_draw_crc.c
> > +++ b/tests/kms_draw_crc.c
> > @@ -183,11 +183,11 @@ static void draw_method_subtest(enum igt_draw_method method,
> >
> >	igt_require(format_is_supported(formats[format_index], tiling));
> >
> > -	/* Use IGT_DRAW_MMAP_GTT on an untiled buffer as the parameter for
> > +	/* Use IGT_DRAW_MMAP_CPU on an untiled buffer as the parameter for
> >	 * comparison. Cache the value so we don't recompute it for every single
> >	 * subtest. */
> >	if (!base_crcs[format_index].set) {
> > -		get_method_crc(IGT_DRAW_MMAP_GTT, formats[format_index],
> > +		get_method_crc(IGT_DRAW_MMAP_CPU, formats[format_index],
> >			       LOCAL_DRM_FORMAT_MOD_NONE,
> >			       &base_crcs[format_index].crc);
> >		base_crcs[format_index].set = true;
> > @@ -225,7 +225,7 @@ static void fill_fb_subtest(void)
> >	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
> >		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
> >
> > -	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb, IGT_DRAW_MMAP_GTT,
> > +	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb, IGT_DRAW_MMAP_CPU,
> >			 0, 0, fb.width, fb.height, 0xFF);
> 
> Should be WC. CPU mapping will not work in all cases.

I can't see why. This will result in a frontbuffer drawing that calls
DRM_IOCTL_I915_GEM_SW_FINISH, which should flush CPU caches if needed.

--Imre
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
