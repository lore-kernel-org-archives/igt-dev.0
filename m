Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6A0732ED
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Nov 2021 07:51:07 +0000 (UTC)
Date: Wed, 3 Nov 2021 08:51:03 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211103075103.GA4779@zkempczy-mobl2>
References: <20211102083941.9644-1-zbigniew.kempczynski@intel.com>
 <20211102083941.9644-2-zbigniew.kempczynski@intel.com>
 <87zgqml529.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zgqml529.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/gem_sync: Use softpin path
 for no-reloc gens
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

On Tue, Nov 02, 2021 at 12:40:14PM -0700, Dixit, Ashutosh wrote:
> On Tue, 02 Nov 2021 01:39:41 -0700, Zbigniew Kempczyński wrote:
> >
> > Migrate to softpin with pre-warming batch or an allocator. Some tests
> > which don't fork can use pre-warming batch which establishes offsets in
> > the kernel before real work is performed. For such adding pinned flag
> > + zeroing relocation is enough. For multiprocess scenarios we need to
> > arbitrate and an allocator need to be used instead.
> >
> > v2: fix also tests which are not running on CI (Ashutosh)
> >
> > v3: use appropriate allocator handle (ahnd) within active_wakeup_ring
> >     spinners (Ashutosh)
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> One question below though.
> 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  tests/i915/gem_sync.c | 59 ++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 55 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> > index 0093ca25f..8c435845e 100644
> > --- a/tests/i915/gem_sync.c
> > +++ b/tests/i915/gem_sync.c
> > @@ -237,6 +237,7 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> >	    int timeout, int wlen)
> >  {
> >	struct intel_engine_data ied;
> > +	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
> 
> Is this really needed in the parent even when they are only used in the
> child processes? This pattern is used everywhere in this patch. Is this a
> requirement of the allocator API? Thanks.

It removes race which may generate errors when children requests for offsets
from the allocator. Example of error behavior (order in time):

child 1:
	ahnd = get_reloc_ahnd();  // creates new allocator, ahnd refcount 0->1
        offset = get_offset(ahnd, ...); //allocator returns first offset, lets say 0x10000
        put_ahnd(ahnd);           // ahnd refcount 1->0, thus frees allocator

child 2:
        ahnd = get_reloc_ahnd();  // creates new allocator, ahnd refcount 0->1
        offset = get_offset(ahnd, ...); //allocator returns first offset, again same 0x10000
        put_ahnd(ahnd);           // ahnd refcount 1->0, thus frees allocator
  
Additional empty handler around children keeps refcount > 0 so allocator
won't be free and recreated so proposed offsets in reloc pseudoallocator
will be contigues.

--
Zbigniew
