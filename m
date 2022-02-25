Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F4810E302
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 07:04:56 +0000 (UTC)
Date: Fri, 25 Feb 2022 08:04:42 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <Yhh/ilGNvqQxUuxE@zkempczy-mobl2>
References: <20220224075415.18663-1-zbigniew.kempczynski@intel.com>
 <20220224075415.18663-2-zbigniew.kempczynski@intel.com>
 <87v8x4htv3.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v8x4htv3.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/intel_allocator: Add safe
 alignment as a default
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

On Thu, Feb 24, 2022 at 12:50:24PM -0800, Dixit, Ashutosh wrote:
> On Wed, 23 Feb 2022 23:54:14 -0800, Zbigniew Kempczyński wrote:
> >
> > diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> > index eabff1f9a..340b88828 100644
> > --- a/lib/intel_allocator.c
> > +++ b/lib/intel_allocator.c
> > @@ -283,7 +283,8 @@ static bool __allocator_put(struct allocator *al)
> >  static struct intel_allocator *intel_allocator_create(int fd,
> >						      uint64_t start, uint64_t end,
> >						      uint8_t allocator_type,
> > -						      uint8_t allocator_strategy)
> > +						      uint8_t allocator_strategy,
> > +						      uint64_t default_alignment)
> >  {
> >	struct intel_allocator *ial = NULL;
> >
> > @@ -321,6 +322,7 @@ static struct intel_allocator *intel_allocator_create(int fd,
> >
> >	ial->type = allocator_type;
> >	ial->strategy = allocator_strategy;
> > +	ial->default_alignment = default_alignment;
> 
> Isn't this a better place to set default_alignment to
> gem_detect_safe_alignment() rather than in __intel_allocator_open_full()
> below (though I understand they are roughly equivalent)?

No, default alignment which will be used in simple allocator should
be caller specific. If user doesn't care and it want to have safe
alignment it passes 0 as a requested default alignment. Then using
alloc() you can request specific alignment. I think place where
establishing default alignment is correct, we should evaluate this
in same place where we decide about start/end of vm space.

> 
> > @@ -903,6 +920,9 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
> >		req.open.end = gtt_size;
> >	}
> >
> > +	if (!default_alignment)
> > +		req.open.default_alignment = gem_detect_safe_alignment(fd);
> > +
> 
> /snip/
> 
> > @@ -948,20 +970,24 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
> >  uint64_t intel_allocator_open_full(int fd, uint32_t ctx,
> >				   uint64_t start, uint64_t end,
> >				   uint8_t allocator_type,
> > -				   enum allocator_strategy strategy)
> > +				   enum allocator_strategy strategy,
> > +				   uint64_t default_alignment)
> 
> So we have added default_alignment to all these API's now and that does
> provide additional flexibility but I am wondering if the additional
> flexibility is really needed and will any IGT ever set default_alignment
> other than 0 (i.e. let allocator choose safe_alignment)? And also does
> having a different default_alignment improve test coverage in any way?
> 
> In any case, this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

We just started to handle discrete so I prefer to have this flexibility
than try to add this later if you don't mind.

Thank you for the review. I dare to commit as it is.

--
Zbigniew
