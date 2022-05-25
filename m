Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45BF10F54E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 07:07:56 +0000 (UTC)
Date: Wed, 25 May 2022 09:07:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <Yo3VyHjr8TdjW0NN@zkempczy-mobl2>
References: <20220524111836.152123-1-zbigniew.kempczynski@intel.com>
 <87r14it8pf.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r14it8pf.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Use detected
 start offset in intel-bb instead 0x0
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

On Tue, May 24, 2022 at 11:41:48PM -0700, Dixit, Ashutosh wrote:
> On Tue, 24 May 2022 04:18:36 -0700, Zbigniew Kempczyński wrote:
> >
> > On some platforms (like on ATS) 0x0 may not be available so allocator
> > should be instantiated with safe start offset to avoid getting -ENOSPC.
> > Change require also relaxation of automatic range selection in the
> > allocator.
> 
> The patch LGTM:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks for the review.

> 
> Do other callers of intel_allocator_open_full() also need to be modified to
> provide a safe start offset?

Unfortunately yes. I wondered about this - for alignment passing 0 was natural
to treat this as a hint to get detected value. For start there's not so easy,
0 is correct and user who instantiates allocator may want to start from this
offset (even if it may be not correct for some platform). We may use -1 casted
to uint64_t as a hint to get detected start offset but this will still require
changing all the tests which are using this. 

We may alter get_..._ahnd() helpers, assuming they will always select safe
start offset. Only where intel_allocator_open_full() is used directly we 
will need to be feeded manually.

--
Zbigniew

> 
> >
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> > ---
> >  lib/intel_allocator.c   | 2 +-
> >  lib/intel_batchbuffer.c | 3 +++
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> > index 340b888286..7882e484b5 100644
> > --- a/lib/intel_allocator.c
> > +++ b/lib/intel_allocator.c
> > @@ -909,7 +909,7 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
> >	struct alloc_resp resp;
> >	uint64_t gtt_size;
> >
> > -	if (!start && !end) {
> > +	if (!end) {
> >		igt_assert_f(can_report_gtt_size(fd), "Invalid fd\n");
> >		gtt_size = gem_aperture_size(fd);
> >		if (!gem_uses_full_ppgtt(fd))
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > index 8680c9ba93..555618e463 100644
> > --- a/lib/intel_batchbuffer.c
> > +++ b/lib/intel_batchbuffer.c
> > @@ -1359,6 +1359,9 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
> >	if (!ibb->uses_full_ppgtt)
> >		do_relocs = true;
> >
> > +	/* Use safe start offset instead assuming 0x0 is safe */
> > +	start = max_t(uint64_t, start, gem_detect_safe_start_offset(i915));
> > +
> >	/* if relocs are set we won't use an allocator */
> >	if (do_relocs)
> >		allocator_type = INTEL_ALLOCATOR_NONE;
> > --
> > 2.32.0
> >
