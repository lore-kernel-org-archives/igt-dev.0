Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011E789B8F
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 04:41:03 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Wed, 27 Oct 2021 21:40:54 -0700
Message-Id: <cover.1635395331.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Return actual submission methods from
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
Cc: John Harrison <john.c.harrison@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Change submission method functions to return actual submission method in
use in the kernel. Also change these function names to reflect this change
in functionality. While at this also fix gem_ctx_shared/disjoint_timelines
test requirements.

Ashutosh Dixit (3):
  lib/i915: Return actual submission method from gem_submission_method
  lib/i915: Clarify gem_submission function names
  tests/gem_ctx_shared: Fix disjoint_timelines test requirements

 lib/i915/gem_scheduler.c    |  2 +-
 lib/i915/gem_submission.c   | 16 ++++++++--------
 lib/i915/gem_submission.h   |  6 +++---
 tests/i915/gem_ctx_shared.c |  2 +-
 tests/i915/gem_exec_fair.c  |  2 +-
 tests/i915/gem_watchdog.c   |  2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.33.0
