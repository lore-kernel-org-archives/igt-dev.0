Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD49910E146
 for <igt-dev@lists.freedesktop.org>; Sat,  6 May 2023 00:55:37 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  5 May 2023 17:55:13 -0700
Message-Id: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/15] PMU: multi-tile support
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

From: root <root@DUT4385MTLH.fm.intel.com>

Enable IGT PMU support for multi-tile platforms.
Add multi-tile support for intel_gpu_top.

v2: (Tvrtko)
- Instead of adding gtN suffix to item, add it to parent group
- Show split gt values only if -p option is specified
- Display aggregate value as default without -p option
- Break down patches into reviewable units

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Riana Tauro (1):
  perf_pmu: Use correct pmu config for multi-tile

Tvrtko Ursulin (3):
  perf_pmu: Support multi-tile in rc6 subtest
  perf_pmu: Two new rc6 subtests
  perf_pmu: Support multi-tile in frequency subtest

Umesh Nerlige Ramappa (11):
  perf_pmu: Quiesce GPU if measuring idle busyness without spinner
  intel_gpu_top: Add an array of freq and rc6 counters
  intel_gpu_top: Determine number of tiles
  intel_gpu_top: Capture freq and rc6 counters from each gt
  intel_gpu_top: Switch pmu_counter to use aggregated values
  intel_gpu_top: Add definitions for gt-specific items and groups
  intel_gpu_top: Bump up size of groups to accomodate multi-gt
  intel_gpu_top: Increase visibility for class_view
  intel_gpu_top: Show gt specific values if requested
  intel_gpu_top: Reduce one level of indent
  intel_gpu_top: Add gt specific values to header in interactive mode

 include/drm-uapi/i915_drm.h |  17 +-
 tests/i915/perf_pmu.c       | 381 +++++++++++++++++++++++++++---------
 tools/intel_gpu_top.c       | 238 ++++++++++++++++++----
 3 files changed, 507 insertions(+), 129 deletions(-)

-- 
2.34.1
