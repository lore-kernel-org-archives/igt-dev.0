Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85A06EC11
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 11:38:17 +0000 (UTC)
Date: Mon, 10 Feb 2020 13:37:54 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200210113754.GA31846@ideak-desk.fi.intel.com>
References: <20200207191524.19362-1-imre.deak@intel.com>
 <87y2tcwvt5.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2tcwvt5.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] lib/igt_draw: Refactor get_tiling
 calls
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
Cc: igt-dev@lists.freedesktop.org, Vanshidhar Konda <vanshidhar.r.konda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Feb 08, 2020 at 02:36:38PM -0800, Dixit, Ashutosh wrote:
> On Fri, 07 Feb 2020 11:15:17 -0800, Imre Deak wrote:
> >  void igt_draw_rect(int fd, drm_intel_bufmgr *bufmgr, drm_intel_context *context,
> >		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
> > -		   enum igt_draw_method method, int rect_x, int rect_y,
> > -		   int rect_w, int rect_h, uint32_t color, int bpp)
> > +		   uint32_t tiling, enum igt_draw_method method,
> > +		   int rect_x, int rect_y, int rect_w, int rect_h,
> > +		   uint32_t color, int bpp)
> >  {
> > +	uint32_t buf_tiling, swizzle;
> > +
> >	struct cmd_data cmd_data = {
> >		.bufmgr = bufmgr,
> >		.context = context,
> > @@ -667,24 +660,32 @@ void igt_draw_rect(int fd, drm_intel_bufmgr *bufmgr, drm_intel_context *context,
> >		.h = rect_h,
> >	};
> >
> > +	swizzle = I915_BIT_6_SWIZZLE_NONE;
> > +	if (tiling != I915_TILING_NONE && gem_available_fences(fd)) {
> > +		gem_get_tiling(fd, buf_handle, &buf_tiling, &swizzle);
> > +		igt_assert(tiling == buf_tiling);
> > +	}
> 
> Probably a nit, but looks a little strange to call gem_get_tiling() to get
> the swizzle and then doing an assert.

gem_get_tiling() is the way to get the swizzling for a buffer. The
assert only makes sure that the caller's and kernel's idea of the tiling
matches. While the callers will pick the tiling (when creating the
buffer), the swizzling is fixed based on this tiling and platform.

> Instead, since igt_draw_rect() has only two callers how about moving
> the gem_get_tiling() call into the callers and passing both tiling and
> swizzle into igt_draw_rect()?

Why?

> 
> > diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
> > index 2c765c34..9c2c3a5d 100644
> > --- a/tests/kms_frontbuffer_tracking.c
> > +++ b/tests/kms_frontbuffer_tracking.c
> > @@ -291,6 +291,7 @@ struct {
> >	int height;
> >	uint32_t color;
> >	int bpp;
> > +	uint32_t tiling;
> 
> Should not need this if we follow the suggestion above.

This contains the tiling of the buffer as now we won't have a way to
retrieve the same from the kernel.

--Imre
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
