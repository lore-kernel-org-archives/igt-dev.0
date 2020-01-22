Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAFC6F44F
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2020 09:35:02 +0000 (UTC)
Date: Wed, 22 Jan 2020 11:34:57 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200122093457.GB12448@ideak-desk.fi.intel.com>
References: <20200120220320.17092-1-imre.deak@intel.com>
 <20200120220320.17092-2-imre.deak@intel.com>
 <875zh4c9lt.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875zh4c9lt.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_fb: Use render copy/blit
 for tiled formats on platforms w/o HW detiling
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

On Tue, Jan 21, 2020 at 10:02:06PM -0800, Dixit, Ashutosh wrote:
> On Mon, 20 Jan 2020 14:03:19 -0800, Imre Deak wrote:
> >
> > On platforms without HW detiling use render copy or blitting to convert
> > between a tiled and a linear framebuffer.
> >
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  lib/igt_fb.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index c81b9de8..b5b1750e 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -1975,17 +1975,27 @@ static bool blitter_ok(const struct igt_fb *fb)
> >	return true;
> >  }
> >
> > +static bool hw_can_detile(const struct igt_fb *fb)
> > +{
> > +	if (fb->modifier == DRM_FORMAT_MOD_NONE)
> > +		return true;
> 
> The problem with doing this afais is that the code will next try to
> mmap_gtt() (i.e. do a linear copy via the aperture) which will also fail
> (see igt_get_cairo_surface()). So we may need to use the blitter even for
> linear copies (DRM_FORMAT_MOD_NONE).

Yes, but we'll still have a way to map the buffer directly in which case
we can avoid the copies.

> 
> May want to look at this:
> 
> https://patchwork.freedesktop.org/patch/345926/?series=71083&rev=2
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
