Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0976E9B7
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 08:39:48 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date: Tue, 18 Feb 2020 13:52:39 +0530
Message-Id: <20200218082240.21853-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/1] lib/i915/gem_ring : set the engine
 to default context
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
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Copy the existing engine map from default context to 
newly created  default context

v2: addressed the review comments

Bommu Krishnaiah (1):
  lib/i915/gem_ring : set the engine to default context

 lib/i915/gem_ring.c              | 8 ++++++--
 lib/i915/gem_ring.h              | 2 +-
 tests/i915/gem_busy.c            | 2 +-
 tests/i915/gem_ctx_persistence.c | 2 +-
 tests/i915/gem_eio.c             | 6 +++---
 tests/i915/gem_exec_await.c      | 2 +-
 tests/i915/gem_exec_fence.c      | 2 +-
 tests/i915/gem_exec_latency.c    | 2 +-
 tests/i915/gem_exec_schedule.c   | 6 +++---
 tests/i915/gem_ringfill.c        | 2 +-
 tests/perf_pmu.c                 | 2 +-
 11 files changed, 20 insertions(+), 16 deletions(-)

-- 
2.25.0.4.g0ad7144999

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
