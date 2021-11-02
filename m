Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349146E83D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Nov 2021 23:30:48 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Tue,  2 Nov 2021 16:30:39 -0700
Message-Id: <cover.1635895537.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Return actual submission methods from
 submission method functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Change submission method functions to return actual submission method in
use in the kernel. Also change these function names to reflect this change
in functionality. Remove the "semaphores submission method" since it is not
a real submission method. While at this also fix
gem_ctx_shared/disjoint_timelines test requirements.

Ashutosh Dixit (4):
  Remove "semaphores" submission method
  lib/i915: Return actual submission method from gem_submission_method
  lib/i915: Clarify gem_submission function names
  tests/gem_ctx_shared: Fix disjoint_timelines test requirements

 lib/i915/gem_scheduler.c    |  2 +-
 lib/i915/gem_submission.c   | 62 ++++++++-----------------------------
 lib/i915/gem_submission.h   | 11 +++----
 tests/i915/gem_ctx_shared.c |  2 +-
 tests/i915/gem_exec_fair.c  |  2 +-
 tests/i915/gem_watchdog.c   |  2 +-
 6 files changed, 22 insertions(+), 59 deletions(-)

-- 
2.33.0
