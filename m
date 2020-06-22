Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 22 Jun 2020 18:44:15 +0200
Message-Id: <20200622164415.30352-9-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200622164415.30352-1-janusz.krzysztofik@linux.intel.com>
References: <20200622164415.30352-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [RFC PATCH i-g-t v2 8/8] tests/core_hotunplug: Add 'GEM
 batch' variant
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Verify if a device with a GEM batch job still running on a GPU can be
hot-unplugged cleanly and released, then recovered.

v2: rebase on upstream

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7cb699cc2..672ff661d 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -33,6 +33,7 @@
 #include "i915/gem_vm.h"
 #include "igt.h"
 #include "igt_device_scan.h"
+#include "igt_dummyload.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
 
@@ -408,6 +409,32 @@ static void prime_hotunplug_lateclose(void)
 	healthcheck();
 }
 
+static void batch_hotunplug_lateclose(void)
+{
+	struct hotunplug priv;
+	igt_spin_t *spin;
+
+	prepare_for_rescan(&priv);
+
+	igt_require_gem(priv.fd.drm);
+
+	local_debug("running dummy load");
+	spin = __igt_spin_new(priv.fd.drm, .flags = IGT_SPIN_POLL_RUN |
+						    IGT_SPIN_NO_PREEMPTION);
+	igt_spin_busywait_until_started(spin);
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
@@ -501,4 +528,11 @@ igt_main
 
 	igt_fixture
 		igt_abort_on_f(failure, "%s\n", failure);
+
+	igt_describe("Check if a device with a still running batch can be cleanly unplugged, then released and recovered");
+	igt_subtest("batch-hotunplug-lateclose")
+		batch_hotunplug_lateclose();
+
+	igt_fixture
+		igt_abort_on_f(failure, "%s\n", failure);
 }
-- 
2.21.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
