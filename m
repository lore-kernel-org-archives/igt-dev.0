Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59E789BEC
 for <igt-dev@lists.freedesktop.org>; Tue, 25 May 2021 12:38:28 +0000 (UTC)
References: <20210524124806.241439-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <202ef9ea-8ecf-c843-af3d-84f3b3bc31cf@linux.intel.com>
Date: Tue, 25 May 2021 13:38:17 +0100
MIME-Version: 1.0
In-Reply-To: <20210524124806.241439-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [i-g-t 0/2] gem_exec_schedule: Report and check for
 timeslicing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>, igt-dev@lists.freedesktop.org, mahesh.meena@intel.com
List-ID: <igt-dev@lists.freedesktop.org>


Hi,

On 24/05/2021 13:48, Tejas Upadhyay wrote:
> lib/i915: Report timeslicing
> tests/gem_exec_schedule: Check for timeslicing as kernel explicitely
> reports timeslicing

This appears to depends on an un-merged i915 patch - 
https://patchwork.freedesktop.org/patch/419787/?series=86841&rev=1 - 
hence the CI failures (skips). You could resend that patch using the 
Test-with: tag in the cover letter, pointing to this IGT series, and see 
if it fixes the tests you expect it to?

Regards,

Tvrtko

> 
> Tejas Upadhyay (2):
>    lib/i915: Report scheduler caps for timeslicing
>    i915/gem_exec_schedule: Check for timeslicing
> 
>   include/drm-uapi/i915_drm.h    |  1 +
>   lib/i915/gem_scheduler.c       | 15 +++++++++++++++
>   lib/i915/gem_scheduler.h       |  1 +
>   tests/i915/gem_exec_schedule.c | 17 ++++++-----------
>   4 files changed, 23 insertions(+), 11 deletions(-)
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
