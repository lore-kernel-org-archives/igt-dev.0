Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19D8112AFF
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 13:31:26 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 May 2022 19:01:06 +0530
Message-Id: <20220517133112.25507-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] D3Cold Tool
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

Kernel d3cold feature is wip therefore spin off tool patches 
from below series in order to merge it.

https://patchwork.freedesktop.org/series/102780/

Anshuman Gupta (6):
  test/i915_pm_rpm: Add placement to gem-{mmap-type, execbuf}
  lib/igt_device: Get gfx PCI card root port
  lib/igt_pm: D3Cold runtime pm infrastructure
  lib: Optional autosuspend_delay_ms configuration
  tools: Add intel_pm_rpm tool
  tools/intel_pm_rpm: Add an option to setup d3cold

 lib/igt_device.c         |  28 ++++
 lib/igt_device.h         |   1 +
 lib/igt_pm.c             | 346 +++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h             |  25 +++
 tests/i915/i915_pm_rpm.c |  23 ++-
 tools/intel_pm_rpm.c     | 250 ++++++++++++++++++++++++++++
 tools/meson.build        |   1 +
 7 files changed, 666 insertions(+), 8 deletions(-)
 create mode 100644 tools/intel_pm_rpm.c

-- 
2.26.2
