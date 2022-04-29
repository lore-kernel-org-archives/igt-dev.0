Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938A410E814
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 08:54:37 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 29 Apr 2022 14:24:17 +0530
Message-Id: <20220429085425.24568-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/8] D3Cold Tool & IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This series adds support for D3Cold Tool and IGT.

v2 rev has addressed the review comment mentioned in 
commit version log.

Anshuman Gupta (8):
  test/i915_pm_rpm: Add placement to gem-{mmap-type, execbuf}
  lib/igt_device: Get gfx PCI card root port
  lib/igt_pm: D3Cold runtime pm infrastructure
  tools: Add intel_pm_rpm tool
  i915_pm_rpm: Add D3Cold basic subtest
  i915_pm_rpm: Extend gem_exec_stress test with D3Cold
  i915_pm_rpm: Extend gem_execbuf test with D3Cold
  i915_pm_rpm: Extend gem-mmap-type test with D3Cold

 lib/igt_device.c         |  28 ++++
 lib/igt_device.h         |   1 +
 lib/igt_pm.c             | 290 +++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h             |  23 ++++
 tests/i915/i915_pm_rpm.c | 190 +++++++++++++++++++++++--
 tools/intel_pm_rpm.c     | 206 +++++++++++++++++++++++++++
 tools/meson.build        |   1 +
 7 files changed, 731 insertions(+), 8 deletions(-)
 create mode 100644 tools/intel_pm_rpm.c

-- 
2.26.2
