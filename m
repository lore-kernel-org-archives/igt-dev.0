Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C256F53E
 for <igt-dev@lists.freedesktop.org>; Fri, 28 May 2021 06:05:03 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Fri, 28 May 2021 11:25:34 +0530
Message-Id: <20210528055536.343744-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t V2 0/2] gem_exec_schedule: Report and check for
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

lib/i915: find timeslicing cap
tests/gem_exec_schedule: Check for timeslicing as kernel explicitely
reports timeslicing

Tejas Upadhyay (2):
  lib/i915: find scheduler caps for timeslicing
  i915/gem_exec_schedule: Check for timeslicing

 lib/i915/gem_scheduler.c       | 21 +++++++++++++++++++++
 lib/i915/gem_scheduler.h       |  1 +
 tests/i915/gem_exec_schedule.c | 17 ++++++-----------
 3 files changed, 28 insertions(+), 11 deletions(-)

-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
