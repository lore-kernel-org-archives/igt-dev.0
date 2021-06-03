Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9136F48B
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 14:50:38 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <af525429-803a-ae46-ed1c-47223afa4c52@linux.intel.com>
References: <20210531134139.359240-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210531134139.359240-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <a9be772c-8ece-ee64-e1e2-aa7773345118@linux.intel.com>
 <SN6PR11MB34212A492A43A9C2B00C7CEADF3E9@SN6PR11MB3421.namprd11.prod.outlook.com>
 <af525429-803a-ae46-ed1c-47223afa4c52@linux.intel.com>
From: Chris Wilson <chris.p.wilson@intel.com>
Date: Thu, 03 Jun 2021 15:50:32 +0100
Message-ID: <162273183238.31652.14624257692001935012@build.alporthouse.com>
Subject: Re: [igt-dev] [i-g-t V3 1/2] lib/i915: find scheduler caps for
 timeslicing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2021-06-01 11:24:00)
> 
> On 01/06/2021 11:10, Surendrakumar Upadhyay, TejaskumarX wrote:
> >> -----Original Message-----
> >> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> >> Sent: 01 June 2021 15:38
> >> To: Surendrakumar Upadhyay, TejaskumarX
> >> <tejaskumarx.surendrakumar.upadhyay@intel.com>; igt-
> >> dev@lists.freedesktop.org
> >> Subject: Re: [igt-dev] [i-g-t V3 1/2] lib/i915: find scheduler caps for timeslicing
> >>
> >>
> >> On 31/05/2021 14:41, Tejas Upadhyay wrote:
> >>> Check scheduler capability for timeslicing in appropriate way, which
> >>> requires wrappers to be created for IGT.
> >>>
> >>> V3:
> >>>       removed conditional error - petri
> >>> V2: has_timeslice = has_semaphore && has_preemption ||
> >>>       has_guc_submission - Tvrtko
> >>>
> >>> Signed-off-by: Tejas Upadhyay
> >>> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> >>> ---
> >>>    lib/i915/gem_scheduler.c | 21 +++++++++++++++++++++
> >>>    lib/i915/gem_scheduler.h |  1 +
> >>>    2 files changed, 22 insertions(+)
> >>>
> >>> diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c index
> >>> 184da843..f59c451f 100644
> >>> --- a/lib/i915/gem_scheduler.c
> >>> +++ b/lib/i915/gem_scheduler.c
> >>> @@ -29,6 +29,7 @@
> >>>    #include "ioctl_wrappers.h"
> >>>
> >>>    #include "i915/gem_scheduler.h"
> >>> +#include "i915/gem_submission.h"
> >>>
> >>>    /**
> >>>     * SECTION:gem_scheduler
> >>> @@ -129,6 +130,22 @@ bool gem_scheduler_has_engine_busy_stats(int
> >> fd)
> >>>             I915_SCHEDULER_CAP_ENGINE_BUSY_STATS;
> >>>    }
> >>>
> >>> +/**
> >>> + * gem_scheduler_has_timeslicing:
> >>> + * @fd: open i915 drm file descriptor
> >>> + *
> >>> + * Feature test macro to query whether the driver supports using HW
> >>> +preemption
> >>> + * to implement timeslicing of userspace batches. This allows
> >>> +userspace to
> >>> + * implement micro-level scheduling within their own batches.
> >>> + */
> >>> +bool gem_scheduler_has_timeslicing(int fd) {
> >>> +   return ((gem_scheduler_capability(fd) &
> >>> +           (I915_SCHEDULER_CAP_PREEMPTION |
> >>> +            I915_SCHEDULER_CAP_SEMAPHORES))

This bitwise or is incorrect, both are required.

> >>> +           || gem_has_guc_submission(fd));

This is not always true.

And it removes the clarity of being a simple wrapper.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
