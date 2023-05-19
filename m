Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1942A10E112
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 15:46:54 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 19 May 2023 08:46:34 -0700
Message-Id: <20230519154650.3751855-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 00/16] PMU: multi-tile support
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

Enable IGT PMU support for multi-tile platforms.
Add multi-tile support for intel_gpu_top.

v2: (Tvrtko)
- Instead of adding gtN suffix to item, add it to parent group
- Show split gt values only if -p option is specified
- Display aggregate value as default without -p option
- Break down patches into reviewable units

v3: (Ashutosh, Tvrtko)
- Reformat GT info in INTERACTIVE mode
- Use i915_for_each_gt
- Move uapi to i915_drm_local.h
- Use gem_list_engines() and drop unnecessary code

v4: Rebase to resolve conflict and rerun CI
v5: Include Ashutosh's patch for CI runs

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Ashutosh Dixit (1):
  i915/gem_engine_topology: Support gem_list_engines on platforms prior
    to MTL

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

 lib/i915/gem_engine_topology.c |   8 +-
 lib/i915/i915_drm_local.h      |  15 ++
 tests/i915/perf_pmu.c          | 307 +++++++++++++++++++++++----------
 tools/intel_gpu_top.c          | 238 ++++++++++++++++++++-----
 4 files changed, 438 insertions(+), 130 deletions(-)

-- 
2.36.1
