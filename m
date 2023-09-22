Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B583C10E19B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 21:52:38 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:52:28 -0700
Message-Id: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Update IGT tests to support new engine
 busyness interface
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

MTL introduces a new mechanism to query engine busyness from GuC that is less
error prone and does not need the KMD to extend counters to 64 bits. This means
KMD can get rid of the worker that regularly updates counters to 64 bits and is
a simpler implementation.

GuC provides 2 counters to calculate busyness:

(1) xxxx-busy-ticks that provides engine busyness in ticks
(2) total-active-ticks[-gtN] that provides how long the gt has been active

The 2 values enable user to calculate the busyness % as follows:

busyness % = (delta xxxx-busy-ticks * 100) / (delta total-active-ticks)

Update IGT tests to use this new interface.

While this simplifies the implemantation and reduces a bunch of races that
existed with current upstream version, the granularity for the active busyness
of an engine is now 100 ms. Any higher granularity will add overhead to GuC
since GuC is periodically updating this busyness.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (5):
  i915/pmu: Add helpers to convert ticks to ns
  i915/pmu: Pass config directly to the init test
  i915/pmu: Switch to new busyness counter if old one is unavailable
  lib/i915: Export engine to gt mapping
  i915/pmu: Add a new test to use total_active_ticks for busyness

 lib/i915/gem_engine_topology.c |   2 +-
 lib/i915/gem_engine_topology.h |   1 +
 lib/i915/i915_drm_local.h      |  10 ++
 tests/intel/perf_pmu.c         | 276 +++++++++++++++++++++++++++------
 4 files changed, 241 insertions(+), 48 deletions(-)

-- 
2.38.1
