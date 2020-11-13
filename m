Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 13 Nov 2020 15:05:02 +0000
Message-Id: <20201113150502.1349191-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915: Use igt_device_get_pci_device()
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Avoid hard coding the expected PCI location, and refer to the pci device
used for the test device instead.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_endless.c | 3 ++-
 tests/i915/gem_exec_latency.c | 3 ++-
 tests/i915/gem_workarounds.c  | 3 ++-
 tests/i915/gen7_exec_parse.c  | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
index 15026b910..f32e6dae0 100644
--- a/tests/i915/gem_exec_endless.c
+++ b/tests/i915/gem_exec_endless.c
@@ -26,6 +26,7 @@
 #include "i915/gem.h"
 #include "i915/gem_ring.h"
 #include "igt.h"
+#include "igt_device.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 
@@ -368,7 +369,7 @@ igt_main
 			igt_require(gem_scheduler_has_preemption(i915));
 
 			intel_register_access_init(&mmio,
-						   intel_get_pci_device(),
+						   igt_device_get_pci_device(i915),
 						   false, i915);
 
 			sysfs = igt_sysfs_open(i915);
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index 568d727f2..4de38288f 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -40,6 +40,7 @@
 #include "drm.h"
 
 #include "igt.h"
+#include "igt_device.h"
 #include "igt_sysfs.h"
 #include "igt_vgem.h"
 #include "igt_dummyload.h"
@@ -668,7 +669,7 @@ igt_main
 		if (ring_size > 1024)
 			ring_size = 1024;
 
-		intel_register_access_init(&mmio_data, intel_get_pci_device(), false, device);
+		intel_register_access_init(&mmio_data, igt_device_get_pci_device(device), false, device);
 		rcs_clock = clockrate(device, 0x2000 + TIMESTAMP);
 		igt_info("RCS timestamp clock: %.0fKHz, %.1fns\n",
 			 rcs_clock / 1e3, 1e9 / rcs_clock);
diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index 4f043d7dd..00b475c27 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -29,6 +29,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "igt_device.h"
 
 #define PAGE_SIZE 4096
 #define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)
@@ -258,7 +259,7 @@ igt_main
 		device = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(device);
 
-		intel_mmio_use_pci_bar(&mmio_data, intel_get_pci_device());
+		intel_mmio_use_pci_bar(&mmio_data, igt_device_get_pci_device(device));
 
 		gen = intel_gen(intel_get_drm_devid(device));
 
diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
index 2ba438c99..f7201bb9f 100644
--- a/tests/i915/gen7_exec_parse.c
+++ b/tests/i915/gen7_exec_parse.c
@@ -30,6 +30,7 @@
 #include <drm.h>
 
 #include "igt.h"
+#include "igt_device.h"
 #include "i915/gem.h"
 #include "sw_sync.h"
 
@@ -578,7 +579,7 @@ igt_main
 #undef REG
 
 		igt_fixture {
-			intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, fd);
+			intel_register_access_init(&mmio_data, igt_device_get_pci_device(fd), 0, fd);
 		}
 
 		for (int i = 0; i < ARRAY_SIZE(lris); i++) {
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
