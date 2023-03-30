Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3200410E2B7
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 00:37:02 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Mar 2023 17:36:49 -0700
Message-Id: <20230330003656.1294873-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/7] Add MTL PMU support for multi-gt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, arjun.melkaveri@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add support for using gt specific counters in IGT and intel_gpu_top.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Riana Tauro (1):
  tests/i915/perf_pmu: Use correct pmu config for multi-tile

Tvrtko Ursulin (4):
  lib/debugfs: GT directory helpers
  tests/i915/perf_pmu: Support multi-tile in rc6 subtest
  tests/i915/perf_pmu: Two new rc6 subtests
  tests/i915/perf_pmu: Support multi-tile in frequency subtest

Umesh Nerlige Ramappa (2):
  tests/i915/perf_pmu: Quiesce GPU if measuring idle busyness without
    spinner
  tools/intel_gpu_top: Add support for gt specific counters

 include/drm-uapi/i915_drm.h |  22 +-
 lib/igt_debugfs.c           |  60 ++++++
 lib/igt_debugfs.h           |   4 +
 tests/i915/perf_pmu.c       | 389 +++++++++++++++++++++++++++---------
 tools/intel_gpu_top.c       |  56 ++++--
 5 files changed, 422 insertions(+), 109 deletions(-)

-- 
2.36.1
