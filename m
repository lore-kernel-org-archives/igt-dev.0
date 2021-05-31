Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B94D6E40C
 for <igt-dev@lists.freedesktop.org>; Mon, 31 May 2021 15:08:27 +0000 (UTC)
Date: Mon, 31 May 2021 18:10:07 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YLT8TzLLUy9LVLaU@platvala-desk.ger.corp.intel.com>
References: <20210531134139.359240-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531134139.359240-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: Re: [igt-dev] [i-g-t V3 0/2] gem_exec_schedule: Report and check
 for timeslicing
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
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 31, 2021 at 07:11:37PM +0530, Tejas Upadhyay wrote:
> lib/i915: find timeslicing cap
> tests/gem_exec_schedule: Check for timeslicing as kernel explicitely
> reports timeslicing
> 
> Tejas Upadhyay (2):
>   lib/i915: find scheduler caps for timeslicing
>   i915/gem_exec_schedule: Check for timeslicing
> 
>  lib/i915/gem_scheduler.c       | 21 +++++++++++++++++++++
>  lib/i915/gem_scheduler.h       |  1 +
>  tests/i915/gem_exec_schedule.c | 17 ++++++-----------
>  3 files changed, 28 insertions(+), 11 deletions(-)

The series does what it says on the tin so
Acked-by: Petri Latvala <petri.latvala@intel.com>

Tvrtko, can you give an additional pair of eyes on this to verify this
matches what kernel side wants to do, I lost track of that
conversation?
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
