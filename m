Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA3A6E42E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Aug 2021 08:50:57 +0000 (UTC)
Date: Thu, 5 Aug 2021 10:50:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210805085052.GH3295@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-7-zbigniew.kempczynski@intel.com>
 <87im0ku6zb.wl-ashutosh.dixit@intel.com>
 <87fsvou65n.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsvou65n.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 06/52] lib/intel_batchbuffer: Add
 allocator support in blitter src copy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 04, 2021 at 04:44:20PM -0700, Dixit, Ashutosh wrote:
> On Wed, 04 Aug 2021 16:26:32 -0700, Dixit, Ashutosh wrote:
> >
> > On Mon, 26 Jul 2021 12:59:40 -0700, Zbigniew Kempczyński wrote:
> > >
> > > @@ -808,9 +816,21 @@ void igt_blitter_src_copy(int fd,
> > >	uint32_t src_pitch, dst_pitch;
> > >	uint32_t dst_reloc_offset, src_reloc_offset;
> > >	uint32_t gen = intel_gen(intel_get_drm_devid(fd));
> > > +	uint64_t batch_offset, src_offset, dst_offset;
> > >	const bool has_64b_reloc = gen >= 8;
> > >	int i = 0;
> > >
> > > +	batch_handle = gem_create(fd, 4096);
> > > +	if (ahnd) {
> > > +		src_offset = get_offset(ahnd, src_handle, src_size, 0);
> > > +		dst_offset = get_offset(ahnd, dst_handle, dst_size, 0);
> > > +		batch_offset = get_offset(ahnd, batch_handle, 4096, 0);
> > > +	} else {
> > > +		src_offset = 16 << 20;
> > > +		dst_offset = ALIGN(src_offset + src_size, 1 << 20);
> > > +		batch_offset = ALIGN(dst_offset + dst_size, 1 << 20);
> >
> > For the !ahnd case, we are providing relocations right? We still need to
> > provide these offsets or they can all be 0?
> 
> This is probably needed because of I915_EXEC_NO_RELOC added in the next
> patch (Patch 07/20)?

Yes, we want to avoid relocations. We pass offsets which should be ok
but if kernel will decide they are not it will relocate. But if we hit
we need to provide bb properly patched.

--
Zbigniew
