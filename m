Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBE16E44F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2020 14:59:45 +0000 (UTC)
From: Uma Shankar <uma.shankar@intel.com>
Date: Thu, 27 Aug 2020 21:02:28 +0530
Message-Id: <20200827153228.13476-1-uma.shankar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/device_reset: Unload snd driver
 before i915 unbind
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
Cc: marcin.bernatowicz@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Unload the snd module before unbinding i915. Audio holds
a wakeref which triggers a warning otherwise, resulting in
test failure.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 tests/device_reset.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index b1181b3b..c979d46e 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -5,11 +5,13 @@
 #include <fcntl.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
+#include <signal.h>
 
 #include "i915/gem.h"
 #include "igt.h"
 #include "igt_device_scan.h"
 #include "igt_sysfs.h"
+#include "igt_kmod.h"
 
 IGT_TEST_DESCRIPTION("Examine behavior of a driver on device sysfs reset");
 
@@ -164,6 +166,20 @@ static bool is_sysfs_reset_supported(int fd)
 /* Unbind the driver from the device */
 static void driver_unbind(struct device_fds *dev)
 {
+	if (igt_kmod_is_loaded("snd_hda_intel")) {
+		igt_terminate_process(SIGTERM, "alsactl");
+
+		/* unbind snd_hda_intel */
+		kick_snd_hda_intel();
+
+		if (igt_kmod_unload("snd_hda_intel", 0)) {
+			igt_warn("Could not unload snd_hda_intel\n");
+			igt_kmod_list_loaded();
+			igt_lsof("/dev/snd");
+			return IGT_EXIT_FAILURE;
+		}
+	}
+
 	igt_debug("unbind the driver from the device\n");
 	igt_assert(igt_sysfs_set(dev->fds.drv_dir, "unbind",
 		   dev->dev_bus_addr));
@@ -175,6 +191,7 @@ static void driver_bind(struct device_fds *dev)
 	igt_debug("rebind the driver to the device\n");
 	igt_abort_on_f(!igt_sysfs_set(dev->fds.drv_dir, "bind",
 		       dev->dev_bus_addr), "driver rebind failed");
+	igt_kmod_load("snd_hda_intel", NULL);
 }
 
 /* Initiate device reset */
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
