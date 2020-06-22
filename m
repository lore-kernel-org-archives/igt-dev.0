Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 22 Jun 2020 17:18:42 +0200
Message-Id: <20200622151845.4520-6-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200622151845.4520-1-janusz.krzysztofik@linux.intel.com>
References: <20200622151845.4520-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 5/8] tests/core_hotunplug: Add 'GEM
 address space' variant
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
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Verify if an additional address space associated with an open device
file descriptor is cleaned up correctly on device hotunplug.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index f736a991f..6d9f530b1 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -34,6 +34,8 @@
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
 
+#include "i915/gem_vm.h"
+
 IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug");
 
 struct hotunplug {
@@ -330,6 +332,29 @@ static void hotreplug_lateclose(void)
 	healthcheck();
 }
 
+static void vm_hotunplug_lateclose(void)
+{
+	struct hotunplug priv;
+
+	prepare_for_rescan(&priv);
+
+	gem_require_vm(priv.fd.drm);
+
+	local_debug("creating additional GEM user address space");
+	igt_ignore_warn(gem_vm_create(priv.fd.drm));
+
+	local_debug("hot unplugging the device");
+	device_unplug(priv.fd.sysfs_dev);
+
+	local_debug("late closing the removed device instance");
+	close(priv.fd.drm);
+
+	local_debug("recovering the device");
+	bus_rescan(priv.fd.sysfs_bus);
+
+	healthcheck();
+}
+
 /* Main */
 
 igt_main
@@ -402,4 +427,11 @@ igt_main
 
 	igt_fixture
 		igt_abort_on_f(failure, "%s\n", failure);
+
+	igt_describe("Check if a still open device with extra GEM address space can be cleanly unplugged, then released and recovered");
+	igt_subtest("vm-hotunplug-lateclose")
+		vm_hotunplug_lateclose();
+
+	igt_fixture
+		igt_abort_on_f(failure, "%s\n", failure);
 }
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
