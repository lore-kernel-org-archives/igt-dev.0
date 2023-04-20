Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874C410E5A5
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Apr 2023 19:15:38 +0000 (UTC)
From: Anna Karas <anna.karas@intel.com>
Date: Thu, 20 Apr 2023 21:14:54 +0200
Message-Id: <20230420191454.497237-3-anna.karas@intel.com>
In-Reply-To: <20230420191454.497237-1-anna.karas@intel.com>
References: <20230420191454.497237-1-anna.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [igt-dev] [RFC 2/2] tests/xe: Use xe_require_gpu() in existing tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Joonas Lahtinen <joonas.lahtinen@intel.com>, Maarten Lankhorst <maarten.lankhorst@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add xe_require_gpu() to all existing xe tests.

Reference: Jira VLK-46235
Signed-off-by: Anna Karas <anna.karas@intel.com>
---
 tests/xe/xe_compute.c           | 2 ++
 tests/xe/xe_create.c            | 2 ++
 tests/xe/xe_debugfs.c           | 2 ++
 tests/xe/xe_dma_buf_sync.c      | 2 ++
 tests/xe/xe_evict.c             | 2 ++
 tests/xe/xe_exec_balancer.c     | 2 ++
 tests/xe/xe_exec_basic.c        | 2 ++
 tests/xe/xe_exec_compute_mode.c | 2 ++
 tests/xe/xe_exec_fault_mode.c   | 2 ++
 tests/xe/xe_exec_reset.c        | 2 ++
 tests/xe/xe_exec_threads.c      | 2 ++
 tests/xe/xe_guc_pc.c            | 2 ++
 tests/xe/xe_huc_copy.c          | 2 ++
 tests/xe/xe_mmap.c              | 2 ++
 tests/xe/xe_mmio.c              | 2 ++
 tests/xe/xe_noexec_ping_pong.c  | 2 ++
 tests/xe/xe_pm.c                | 2 ++
 tests/xe/xe_prime_self_import.c | 2 ++
 tests/xe/xe_query.c             | 2 ++
 tests/xe/xe_vm.c                | 2 ++
 tests/xe/xe_waitfence.c         | 2 ++
 21 files changed, 42 insertions(+)

diff --git a/tests/xe/xe_compute.c b/tests/xe/xe_compute.c
index 7ac64dfe..fff1fe04 100644
--- a/tests/xe/xe_compute.c
+++ b/tests/xe/xe_compute.c
@@ -15,6 +15,7 @@
 
 #include "igt.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 #include "xe/xe_compute.h"
 
 /**
@@ -37,6 +38,7 @@ igt_main
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(xe);
 		xe_device_get(xe);
 	}
 
diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index ae841f80..f1da0f2c 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -17,6 +17,7 @@
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 
 #define PAGE_SIZE 0x1000
 
@@ -93,6 +94,7 @@ igt_main
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(xe);
 		xe_device_get(xe);
 	}
 
diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index 6bdd3ef0..ee7404e2 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -17,6 +17,7 @@
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 
 #include <fcntl.h>
 #include <string.h>
@@ -247,6 +248,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_dev = xe_device_get(fd);
 		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
 	}
diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
index 8920b141..d01761d0 100644
--- a/tests/xe/xe_dma_buf_sync.c
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -18,6 +18,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_gpu.h"
 #include <string.h>
 #include <linux/dma-buf.h>
 #include <sys/poll.h>
@@ -232,6 +233,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 
 		xe_for_each_hw_engine(fd, hwe)
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 5687cce3..b467885a 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -18,6 +18,7 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 #include <string.h>
 
 #define MAX_N_ENGINES 16
@@ -668,6 +669,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_vram_size(fd, 0);
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index 2018c810..9927dc34 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -21,6 +21,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_gpu.h"
 #include <string.h>
 
 #define MAX_INSTANCE 9
@@ -628,6 +629,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 	}
 
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index 2a176a5b..52ae2505 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -17,6 +17,7 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 #include <string.h>
 
 #define MAX_N_ENGINES 16
@@ -313,6 +314,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 	}
 
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index 68519399..e6aa2a00 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -20,6 +20,7 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 #include <string.h>
 
 #define MAX_N_ENGINES 16
@@ -329,6 +330,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 	}
 
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
index a3ab1727..cbb2dc2d 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -21,6 +21,7 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 #include <string.h>
 
 #define MAX_N_ENGINES 16
@@ -524,6 +525,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 		igt_require(xe_supports_faults(fd));
 	}
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index 0d72a3f2..922f7ee4 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -19,6 +19,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_gpu.h"
 #include <string.h>
 
 /**
@@ -833,6 +834,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 	}
 
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index 3f2c2de9..64d3741a 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -21,6 +21,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_gpu.h"
 #include <string.h>
 
 #define MAX_N_ENGINES	16
@@ -1393,6 +1394,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 	}
 
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 5c71ae14..bebbd189 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -18,6 +18,7 @@
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 
 #include <string.h>
 #include <sys/time.h>
@@ -387,6 +388,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 
 		sysfs = igt_sysfs_open(fd);
diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
index cd68dbb5..36b5df40 100644
--- a/tests/xe/xe_huc_copy.c
+++ b/tests/xe/xe_huc_copy.c
@@ -22,6 +22,7 @@
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 
 #define SIZE_DATA           0x1000
 #define SIZE_BATCH          0x1000
@@ -158,6 +159,7 @@ igt_main
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(xe);
 		xe_device_get(xe);
 	}
 
diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index 6b313a18..e93a53a0 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -16,6 +16,7 @@
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 
 #include <string.h>
 
@@ -63,6 +64,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 	}
 
diff --git a/tests/xe/xe_mmio.c b/tests/xe/xe_mmio.c
index 42b6241b..7215787b 100644
--- a/tests/xe/xe_mmio.c
+++ b/tests/xe/xe_mmio.c
@@ -16,6 +16,7 @@
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 
 #include <string.h>
 
@@ -79,6 +80,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 	}
 
diff --git a/tests/xe/xe_noexec_ping_pong.c b/tests/xe/xe_noexec_ping_pong.c
index 36767188..7034728d 100644
--- a/tests/xe/xe_noexec_ping_pong.c
+++ b/tests/xe/xe_noexec_ping_pong.c
@@ -10,6 +10,7 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 
 #define NUM_VMS 10
 #define NUM_BOS 1
@@ -99,6 +100,7 @@ igt_simple_main
 {
 
 	fd = drm_open_driver(DRIVER_XE);
+	xe_require_gpu(fd);
 	xe_device_get(fd);
 
 	test_ping_pong(fd, xe_hw_engine(fd, 0));
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 44154143..7db07dd1 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -25,6 +25,7 @@
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 
 #define MAX_N_ENGINES 16
 #define NO_SUSPEND -1
@@ -367,6 +368,7 @@ igt_main
 	igt_fixture {
 		memset(&device, 0, sizeof(device));
 		device.fd_xe = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(device.fd_xe);
 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
 		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
 
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index 4e8fd5d4..22848a7b 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -51,6 +51,7 @@
 #include "drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 
 IGT_TEST_DESCRIPTION("Check whether prime import/export works on the same"
 		     " device... but with different fds.");
@@ -534,6 +535,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 	}
 
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 3f038225..724e863a 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -18,6 +18,7 @@
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gpu.h"
 #include "intel_hwconfig_types.h"
 
 void dump_hex(void *buffer, int len);
@@ -441,6 +442,7 @@ igt_main
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(xe);
 		xe_device_get(xe);
 	}
 
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index d4cec104..987b457f 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -18,6 +18,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_gpu.h"
 #include <string.h>
 
 static uint32_t
@@ -1621,6 +1622,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 
 		xe_for_each_hw_engine(fd, hwe)
diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
index cdfcacdb..4f4e5ddf 100644
--- a/tests/xe/xe_waitfence.c
+++ b/tests/xe/xe_waitfence.c
@@ -11,6 +11,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_gpu.h"
 #include <string.h>
 
 /**
@@ -90,6 +91,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_require_gpu(fd);
 		xe_device_get(fd);
 	}
 
-- 
2.25.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.


