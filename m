Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C5410E4AD
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 09:15:10 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.17.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5E110580E30
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 02:15:09 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qtP7T-000AqO-0a
 for igt-dev@lists.freedesktop.org; Thu, 19 Oct 2023 11:15:07 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 Oct 2023 11:15:05 +0200
Message-ID: <20231019091505.41673-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/device_reset: fix logic to unbind
 when snd_hda_intel is loaded
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

For i915 devices are used, there's a glue with snd_hda_intel.
Currently, such glue requires that the audio driver to be unused
and removed before being able to remove the i915 driver.

There is already a logic at igt library to do it the right way,
but device_reset currently doesn't use.

Also, the logic is hardcoded to work only with Haswell, Broadwell
and DG1.

Change the logic to use the proper logic to remove such
module using the library.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/device_reset.c | 47 ++++++--------------------------------------
 1 file changed, 6 insertions(+), 41 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 9ebd479dfefa..ef08164aad41 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -65,7 +65,7 @@ struct device_fds {
 		int slot_dir; /* pci hotplug slots fd */
 	} fds;
 	char dev_bus_addr[DEV_BUS_ADDR_LEN];
-	bool snd_unload;
+	char *snd_driver;
 };
 
 static int __open_sysfs_dir(int fd, const char* path)
@@ -188,7 +188,6 @@ static void init_device_fds(struct device_fds *dev)
 {
 	char dev_path[PATH_MAX];
 	char *addr_pos;
-	uint32_t devid;
 
 	igt_debug("open device\n");
 	/**
@@ -198,18 +197,9 @@ static void init_device_fds(struct device_fds *dev)
 	 */
 	dev->fds.dev = __drm_open_driver(DRIVER_ANY);
 	igt_assert_fd(dev->fds.dev);
-	if (is_i915_device(dev->fds.dev)) {
+	if (is_i915_device(dev->fds.dev))
 		igt_require_gem(dev->fds.dev);
 
-		devid = intel_get_drm_devid(dev->fds.dev);
-		if ((IS_HASWELL(devid) || IS_BROADWELL(devid) ||
-		     IS_DG1(devid)) &&
-		     (igt_kmod_is_loaded("snd_hda_intel"))) {
-			igt_debug("Enable WA to unload snd driver\n");
-			dev->snd_unload = true;
-		}
-	}
-
 	igt_assert(device_sysfs_path(dev->fds.dev, dev_path));
 	addr_pos = strrchr(dev_path, '/');
 	igt_assert(addr_pos);
@@ -312,33 +302,8 @@ static bool is_sysfs_cold_reset_supported(int slot_fd)
 /* Unbind the driver from the device */
 static void driver_unbind(struct device_fds *dev)
 {
-	/**
-	 * FIXME: Unbinding the i915 driver on affected platforms with
-	 * audio results in a kernel WARN on "i915 raw-wakerefs=1
-	 * wakelocks=1 on cleanup". The below CI friendly user level
-	 * workaround to unload and de-couple audio from IGT testing,
-	 * prevents the warning from appearing. Drop this hack as soon
-	 * as this is fixed in the kernel. unbind/re-bind validation
-	 * on audio side is not robust and we could have potential
-	 * failures blocking display CI, currently this seems to the
-	 * safest and easiest way out.
-	 */
-	if (dev->snd_unload) {
-		igt_terminate_process(SIGTERM, "alsactl");
-
-		/* unbind snd_hda_intel */
-		kick_snd_hda_intel();
-
-		if (igt_kmod_unload("snd_hda_intel", 0)) {
-			dev->snd_unload = false;
-			igt_warn("Could not unload snd_hda_intel\n");
-			igt_kmod_list_loaded();
-			igt_lsof("/dev/snd");
-			igt_skip("Audio is in use, skipping\n");
-		} else {
-			igt_info("Preventively unloaded snd_hda_intel\n");
-		}
-	}
+	if (is_i915_device(dev->fds.dev))
+		igt_audio_driver_unload(&dev->snd_driver);
 
 	igt_debug("unbind the driver from the device\n");
 	igt_assert(igt_sysfs_set(dev->fds.drv_dir, "unbind",
@@ -352,8 +317,8 @@ static void driver_bind(struct device_fds *dev)
 	igt_abort_on_f(!igt_sysfs_set(dev->fds.drv_dir, "bind",
 		       dev->dev_bus_addr), "driver rebind failed");
 
-	if (dev->snd_unload)
-		igt_kmod_load("snd_hda_intel", NULL);
+	if (dev->snd_driver)
+		igt_kmod_load(dev->snd_driver, NULL);
 }
 
 /* Initiate device reset */
-- 
2.41.0
