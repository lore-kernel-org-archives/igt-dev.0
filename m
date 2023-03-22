Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804C510E043
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 05:16:48 +0000 (UTC)
Date: Wed, 22 Mar 2023 05:16:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZBqPFhpw4UQ9zVXn@DUT025-TGLU.fm.intel.com>
References: <20230320163259.67310-1-zbigniew.kempczynski@intel.com>
 <ZBqMqtcqRCjxh4St@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBqMqtcqRCjxh4St@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe_query: Recover original vram_*
 macros semantics
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

On Wed, Mar 22, 2023 at 05:05:46AM +0000, Matthew Brost wrote:
> On Mon, Mar 20, 2023 at 05:32:59PM +0100, Zbigniew Kempczyński wrote:
> > On multi tile vram_possible() semantics was changed what was wrong
> > and must be recover.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> This works for now to fix PVC and all current platforms but at some
> point this will break if media GTs have VRAM.
> 
> Let's properly fix this in a follow up but for now this works.
> 
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 

Actually, let's just fix this properly... This should do it:

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a6926057..b80df61f 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -361,7 +361,8 @@ uint64_t vram_memory(int fd, int gt)
        igt_assert(xe_dev);
        igt_assert(gt >= 0 && gt < xe_dev->number_gt);

-       return native_region_for_gt(xe_dev->gts, gt);
+       return xe_has_vram(fd) ?
+               native_region_for_gt(xe_dev->gts, gt) : 0;
 }

 /**
@@ -374,11 +375,7 @@ uint64_t vram_memory(int fd, int gt)
  */
 uint64_t vram_if_possible(int fd, int gt)
 {
-       uint64_t regions = all_memory_regions(fd);
-       uint64_t system_memory = regions & 0x1;
-       uint64_t vram = regions & (~0x1);
-
-       return vram ? vram : system_memory;
+       return vram_memory(fd, gt) ? vram_memory(fd, gt) : system_memory(fd);
 }

 /**

Matt

> > ---
> >  lib/xe/xe_query.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
> > 
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > index 1835232804..4598c0d5a1 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -356,13 +356,9 @@ uint64_t system_memory(int fd)
> >   */
> >  uint64_t vram_memory(int fd, int gt)
> >  {
> > -	struct xe_device *xe_dev;
> > -
> > -	xe_dev = find_in_cache(fd);
> > -	igt_assert(xe_dev);
> > -	igt_assert(gt >= 0 && gt < xe_dev->number_gt);
> > +	uint64_t regions = all_memory_regions(fd);
> >  
> > -	return native_region_for_gt(xe_dev->gts, gt);
> > +	return regions & (0x2 << gt);
> >  }
> >  
> >  /**
> > @@ -375,11 +371,10 @@ uint64_t vram_memory(int fd, int gt)
> >   */
> >  uint64_t vram_if_possible(int fd, int gt)
> >  {
> > -	uint64_t regions = all_memory_regions(fd);
> > -	uint64_t system_memory = regions & 0x1;
> > -	uint64_t vram = regions & (~0x1);
> > +	uint64_t smemory = system_memory(fd);
> > +	uint64_t vram = vram_memory(fd, gt);
> >  
> > -	return vram ? vram : system_memory;
> > +	return vram ? vram : smemory;
> >  }
> >  
> >  /**
> > -- 
> > 2.34.1
> > 
