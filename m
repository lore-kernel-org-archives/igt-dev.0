Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4F310E384
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 09:18:25 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 08:44:15 +0000
Message-ID: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/14] [RFC] benchmarks/gem_wsim: added
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
- minimizing divergence - same workload syntax for both drivers,
  so most existing examples should run on xe unmodified (Tvrtko)
  This version creates one common VM per workload.
  Explicit VM management, compute mode, improved engine handling
  to come in next patchset.
- split patches to easy review (Tvrtko)
- dropped already merged patches, added documentation to public
  lib functions, some code cleanups (Kamil)

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Marcin Bernatowicz (14):
  lib/igt_device_scan: Xe get integrated/discrete card functions
  benchmarks/gem_wsim: reposition the unbound duration boolean
  benchmarks/gem_wsim: fix scaling of period steps
  benchmarks/gem_wsim: fix duration range check
  benchmarks/gem_wsim: extract duration parsing code to new function
  benchmarks/gem_wsim: fix conflicting SSEU #define and enum
  benchmarks/gem_wsim: cleanups
  benchmarks/gem_wsim: reposition repeat_start variable
  benchmarks/gem_wsim: use lib code to query engines
  benchmarks/gem_wsim: allow comments in workload description files
  benchmarks/gem_wsim: introduce w_step_sync function
  benchmarks/gem_wsim: extract prepare contexts code to new function
  benchmarks/gem_wsim: extract prepare working sets code to new function
  benchmarks/gem_wsim: added basic xe support

 benchmarks/gem_wsim.c  | 963 +++++++++++++++++++++++++++++------------
 benchmarks/wsim/README |   8 +-
 lib/igt_device_scan.c  |  52 ++-
 lib/igt_device_scan.h  |   2 +
 4 files changed, 729 insertions(+), 296 deletions(-)

-- 
2.42.0
