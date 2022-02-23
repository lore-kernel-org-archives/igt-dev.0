Return-path: <SRS0=UqwI=TG=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E9C10E145
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 10:34:33 +0000 (UTC)
Date: Wed, 23 Feb 2022 11:34:30 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <YhYNtkcftKE3UqLl@zkempczy-mobl2>
References: <20220221084123.22684-1-zbigniew.kempczynski@intel.com>
 <871qzu7fi9.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871qzu7fi9.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Use safe
 alignment in fast-copy raw
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

On Tue, Feb 22, 2022 at 01:33:50PM -0800, Dixit, Ashutosh wrote:
> On Mon, 21 Feb 2022 00:41:23 -0800, Zbigniew Kempczyński wrote:
> >
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > index e5666cd4f..23055855b 100644
> > --- a/lib/intel_batchbuffer.c
> > +++ b/lib/intel_batchbuffer.c
> > @@ -990,13 +990,14 @@ void igt_blitter_fast_copy__raw(int fd,
> >	uint32_t dword0, dword1;
> >	uint32_t src_pitch, dst_pitch;
> >	uint64_t batch_offset, src_offset, dst_offset;
> > +	uint64_t align = gem_detect_safe_alignment(fd);
> >	int i = 0;
> >
> >	batch_handle = gem_create(fd, 4096);
> >	if (ahnd) {
> > -		src_offset = get_offset(ahnd, src_handle, src_size, 0);
> > -		dst_offset = get_offset(ahnd, dst_handle, dst_size, 0);
> > -		batch_offset = get_offset(ahnd, batch_handle, 4096, 0);
> > +		src_offset = get_offset(ahnd, src_handle, src_size, align);
> > +		dst_offset = get_offset(ahnd, dst_handle, dst_size, align);
> > +		batch_offset = get_offset(ahnd, batch_handle, 4096, align);
> 
> Is it possible to modify the allocator so that say '0' (or alternatively
> -1ULL) denotes the "default" alignment? And the default alignment will the
> safe_alignment which can be stored as part of the allocator itself?
> 
> This will avoid having to pass this safe_alignment in a large number of
> IGT's. If some IGT's want to override the default alignment they can always
> do so. Thoughts?

Yes. I like your idea - we can save a lot of time to avoid rewriting tests.

Here it is:

https://patchwork.freedesktop.org/series/100627/

--
Zbigniew
