Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E878E6EA16
 for <igt-dev@lists.freedesktop.org>; Tue, 25 May 2021 13:09:51 +0000 (UTC)
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 25 May 2021 13:07:56 +0000
Message-ID: <SN6PR11MB3421F98A128EE1F6E933DB99DF259@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20210524124806.241439-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <202ef9ea-8ecf-c843-af3d-84f3b3bc31cf@linux.intel.com>
In-Reply-To: <202ef9ea-8ecf-c843-af3d-84f3b3bc31cf@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 0/2] gem_exec_schedule: Report and check for
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Meena,
 Mahesh" <mahesh.meena@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Done, thanks

> -----Original Message-----
> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Sent: 25 May 2021 18:08
> To: Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>; igt-
> dev@lists.freedesktop.org; Meena, Mahesh <mahesh.meena@intel.com>
> Subject: Re: [igt-dev] [i-g-t 0/2] gem_exec_schedule: Report and check for
> timeslicing
> 
> 
> Hi,
> 
> On 24/05/2021 13:48, Tejas Upadhyay wrote:
> > lib/i915: Report timeslicing
> > tests/gem_exec_schedule: Check for timeslicing as kernel explicitely
> > reports timeslicing
> 
> This appears to depends on an un-merged i915 patch -
> https://patchwork.freedesktop.org/patch/419787/?series=86841&rev=1 -
> hence the CI failures (skips). You could resend that patch using the
> Test-with: tag in the cover letter, pointing to this IGT series, and see if it fixes
> the tests you expect it to?
> 
> Regards,
> 
> Tvrtko
> 
> >
> > Tejas Upadhyay (2):
> >    lib/i915: Report scheduler caps for timeslicing
> >    i915/gem_exec_schedule: Check for timeslicing
> >
> >   include/drm-uapi/i915_drm.h    |  1 +
> >   lib/i915/gem_scheduler.c       | 15 +++++++++++++++
> >   lib/i915/gem_scheduler.h       |  1 +
> >   tests/i915/gem_exec_schedule.c | 17 ++++++-----------
> >   4 files changed, 23 insertions(+), 11 deletions(-)
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
