Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EB210E50F
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 07:22:12 +0000 (UTC)
Date: Fri, 25 Feb 2022 08:22:08 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <YhiDoGz7ZrY/rsBU@zkempczy-mobl2>
References: <20220224075415.18663-1-zbigniew.kempczynski@intel.com>
 <20220224075415.18663-3-zbigniew.kempczynski@intel.com>
 <87y2209g0p.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y2209g0p.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/api_intel_allocator: Add
 default-alignment test
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

On Thu, Feb 24, 2022 at 12:16:38PM -0800, Dixit, Ashutosh wrote:
> On Wed, 23 Feb 2022 23:54:15 -0800, Zbigniew Kempczyński wrote:
> >
> > diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> > index 7ae4a00b7..32d1aad70 100644
> > --- a/tests/i915/api_intel_allocator.c
> > +++ b/tests/i915/api_intel_allocator.c
> > @@ -120,6 +120,34 @@ static void reserve(int fd, uint8_t type)
> >	igt_assert_eq(intel_allocator_close(ahnd), true);
> >  }
> >
> > +static void default_alignment(int fd)
> > +{
> > +	struct test_obj obj[3];
> > +	uint64_t ahnd, default_alignment = 0x4000;
> > +
> > +	ahnd = intel_allocator_open_full(fd, 0, 0, 0, INTEL_ALLOCATOR_SIMPLE,
> > +					 ALLOC_STRATEGY_LOW_TO_HIGH,
> > +					 default_alignment);
> > +
> > +	for (int i = 0; i < ARRAY_SIZE(obj); i++) {
> > +		obj[i].handle = gem_handle_gen();
> > +		obj[i].offset = intel_allocator_alloc(ahnd, obj[i].handle, 4096,
> > +				i == 2 ? 4096 : 0);
> > +		igt_debug("obj[%d].offset: %llx, handle: %u\n", i,
> > +			 (long long) obj[i].offset, obj[i].handle);
> > +	}
> > +
> > +	igt_assert_eq(obj[1].offset - obj[0].offset, default_alignment);
> 
> What would happen here if we had not specified default_alignment (i.e. let
> the allocator choose safe_alignment silently)? Do we need a
> "get_alignment()" API? Or clients know that the default default_alignment
> is safe_alignment?
> 
> In any case, this patch is fine so:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

I think caller shouldn't do any assumptions regarding default alignment 
setting if it passes 0. At the moment I haven't seen any reason to
export this value - this is simple change and it can be done if someone
will require it.

Test above exercises possibility to explicitly set alignment we want
and objects will be placed according to our alignment requirements
in alloc(). BTW take a look to api_intel_allocator.c:reuse(). We use 0x40 
as default alignment there.

Thanks for the review.
--
Zbigniew
 
