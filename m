Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD8410E154
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Apr 2022 12:51:01 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Apr 2022 18:20:39 +0530
Message-Id: <20220418125048.7969-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/9] D3Cold Tool & IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This series adds support for D3Cold Tools and IGT.

Anshuman Gupta (9):
  test/i915_pm_rpm: Add placement to gem-{mmap-type, execbuf}
  lib/igt_device: Get gfx PCI card root port
  lib/igt_pm: D3Cold runtime pm infrastructure
  lib/intel_device_info: Add IS_DGFX() support
  tools: Add intel_pm_rpm tool
  i915_pm_rpm: Add D3Cold basic subtest
  i915_pm_rpm: Test D3Cold with gem_exec_stress
  i915_pm_rpm: Extend gem_execbuf test with D3Cold
  i915_pm_rpm: Extend gem-mmap-type test with D3Cold

 lib/igt_device.c         |  28 +++++
 lib/igt_device.h         |   1 +
 lib/igt_pm.c             | 226 +++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h             |  21 ++++
 lib/intel_chipset.h      |   2 +
 lib/intel_device_info.c  |   2 +
 tests/i915/i915_pm_rpm.c | 161 ++++++++++++++++++++++++++--
 tools/intel_pm_rpm.c     | 209 ++++++++++++++++++++++++++++++++++++
 tools/meson.build        |   1 +
 9 files changed, 643 insertions(+), 8 deletions(-)
 create mode 100644 tools/intel_pm_rpm.c

-- 
2.26.2
