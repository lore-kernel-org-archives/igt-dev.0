Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074FB6EA4A
 for <igt-dev@lists.freedesktop.org>; Tue, 25 May 2021 13:06:47 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 25 May 2021 18:27:16 +0530
Message-Id: <20210525125718.244109-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t 0/2] gem_exec_schedule: Report and check for
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
To: igt-dev@lists.freedesktop.org, mahesh.meena@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

lib/i915: Report timeslicing
tests/gem_exec_schedule: Check for timeslicing as kernel explicitely 
reports timeslicing

Test-with: 20210524124806.241439-1-tejaskumarx.surendrakumar.upadhyay@intel.com

Tejas Upadhyay (2):
  lib/i915: Report scheduler caps for timeslicing
  i915/gem_exec_schedule: Check for timeslicing

 include/drm-uapi/i915_drm.h    |  1 +
 lib/i915/gem_scheduler.c       | 15 +++++++++++++++
 lib/i915/gem_scheduler.h       |  1 +
 tests/i915/gem_exec_schedule.c | 17 ++++++-----------
 4 files changed, 23 insertions(+), 11 deletions(-)

-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
