Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C39210EAEC
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 09:04:14 +0000 (UTC)
Date: Thu, 27 Apr 2023 11:04:10 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Message-ID: <20230427090410.pmy4vjsifxxjfmxe@zkempczy-mobl2>
References: <20230425154017.374465-1-zbigniew.kempczynski@intel.com>
 <20230425154017.374465-14-zbigniew.kempczynski@intel.com>
 <9afc47b4-03f2-99c2-f4af-b9c1bcaeb491@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9afc47b4-03f2-99c2-f4af-b9c1bcaeb491@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 13/15] lib/igt_fb: For xe assume vram
 is used on discrete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 12:14:06PM +0530, Modem, Bhanuprakash wrote:
> 
> On Tue-25-04-2023 09:10 pm, Zbigniew Kempczyński wrote:
> > Assume fb bo's were created on vram on discrete, otherwise use system
> > memory.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >   lib/igt_fb.c | 17 +++++++++++------
> >   1 file changed, 11 insertions(+), 6 deletions(-)
> > 
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 7379b99aa8..76f2e12456 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -2545,6 +2545,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
> >   {
> >   	struct intel_buf *buf;
> >   	uint32_t bo_name, handle, compression;
> > +	uint64_t region;
> >   	int num_surfaces;
> >   	int i;
> > @@ -2571,12 +2572,16 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
> >   	bo_name = gem_flink(fd, fb->gem_handle);
> >   	handle = gem_open(fd, bo_name);
> > -	buf = intel_buf_create_using_handle_and_size(bops, handle,
> > -						     fb->width, fb->height,
> > -						     fb->plane_bpp[0], 0,
> > -						     igt_fb_mod_to_tiling(fb->modifier),
> > -						     compression, fb->size,
> > -						     fb->strides[0]);
> > +	/* For i915 region doesn't matter, for xe does */
> > +	region = buf_ops_get_driver(bops) == INTEL_DRIVER_XE ?
> > +				vram_if_possible(fd, 0) : 0;
> ----------------------------------------------------------^
> For i915, region must be -1 right?

Not must but it will be consistent to current design. Thank
you for the review and spotting this.

--
Zbigniew

> 
> - Bhanu
> 
> > +	buf = intel_buf_create_full(bops, handle,
> > +				    fb->width, fb->height,
> > +				    fb->plane_bpp[0], 0,
> > +				    igt_fb_mod_to_tiling(fb->modifier),
> > +				    compression, fb->size,
> > +				    fb->strides[0],
> > +				    region);
> >   	intel_buf_set_name(buf, name);
> >   	/* Make sure we close handle on destroy path */
