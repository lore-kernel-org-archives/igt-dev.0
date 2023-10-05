Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E2710E186
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 19:31:05 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 18:57:18 +0000
Message-ID: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/17] [RFC] benchmarks/gem_wsim: added
 basic xe support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added basic xe support. Single binary handles both i915 and Xe devices.

Some functionality is still missing: working sets, bonding.

The tool is handy for scheduling tests, we find it useful to verify vGPU
profiles defining different execution quantum/preemption timeout
settings.

There is also some rationale for the tool in following thread:
https://lore.kernel.org/dri-devel/a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com/

With this patch it should be possible to run following on xe device:

gem_wsim -w benchmarks/wsim/media_load_balance_fhd26u7.wsim -c 36 -r 600

Best with drm debug logs disabled:

echo 0 > /sys/module/drm/parameters/debug

v2:
- split patches to easy review (Kamil), 
  all benchmarks/gem_wsim patches before [RFC] one
  contain fixes (for scale duration option), cleanups (checkpatch.pl),
  refactors (some code moved to functions),
  not related to xe and ready to be applied
- lib/xe_spin is under review in other thread https://patchwork.freedesktop.org/series/122624/

v3: 
- minimizing divergence - same workload syntax for both drivers,
  so most existing examples should run on xe unmodified (Tvrtko)
  This version creates one common VM per workload.
  Explicit VM management, compute mode, improved engine handling
  to come in next patchset.
- split patches to easy review (Tvrtko)
- dropped already merged patches, added documentation to public
  lib functions, some code cleanups (Kamil)

v4:
- addressed review comments in previous patches
- added patch with for_each_dep macro (Tvrtko)
- added patch with bb_size field in w_step
- grouped xe specific fields (Tvrtko)
- moved is_xe boolean next to fd (Tvrtko)
- use xe_ prefix for Xe specific things (Tvrtko)
- left throttling untouched (Tvrtko)
- parse errors vs silent skips on not implemented steps (Tvrtko)
- add 'Xe and i915 differences' section to README (Tvrtko)
  for now no data dependency implemented, left -1 <=> f-1
  to not modify examples (maybe too optimistic assumption?)
- need to think on better engine handling in next version

v5:
- correct out of bound access if file ends with hash (Tvrtko)
- new patches intruducing for_each_ctx, for_each_w_step macros
- corrected engines mappings for xe
  ex. "M.1.VCS,B.1,1.DEFAULT.1000.0.1" should use VCS
- verified engines selection works on MTL (Tvrtko)
- prevent misuse combinations of fence and implicit data deps (Tvrtko)
  ex. "f,1.DEFAULT.1000.-1.0" should fail,
      "f,1.DEFAULT.1000.f-1.0" is valid
- corrected error messages (Tvrtko)
- missing xe_device_put (Tvrtko)
- moved wsim_err up to be accessible from parse_dependencies
- left fini_workload cleanup for separate patch
- README updates

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Marcin Bernatowicz (17):
  lib/igt_device_scan: added functions to get first Xe card
  benchmarks/gem_wsim: reposition the unbound duration boolean
  benchmarks/gem_wsim: fix duration range check
  benchmarks/gem_wsim: extract duration parsing code to new function
  benchmarks/gem_wsim: fix conflicting SSEU #define and enum
  benchmarks/gem_wsim: cleanups
  benchmarks/gem_wsim: reposition repeat_start variable
  benchmarks/gem_wsim: use lib code to query engines
  benchmarks/gem_wsim: allow comments in workload description files
  benchmarks/gem_wsim: introduce w_step_sync function
  benchmarks/gem_wsim: extract allocate and prepare contexts code to new
    functions
  benchmarks/gem_wsim: extract prepare working sets code to new function
  benchmarks/gem_wsim: group i915 fields
  benchmarks/gem_wsim: for_each_dep macro
  benchmarks/gem_wsim: for_each_ctx macro
  benchmarks/gem_wsim: for_each_w_step macro
  benchmarks/gem_wsim: added basic xe support

 benchmarks/gem_wsim.c  | 1177 +++++++++++++++++++++++++++-------------
 benchmarks/wsim/README |   25 +-
 lib/igt_device_scan.c  |   52 +-
 lib/igt_device_scan.h  |    2 +
 4 files changed, 860 insertions(+), 396 deletions(-)

-- 
2.42.0
