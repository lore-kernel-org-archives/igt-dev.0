Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81086F47E
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:31:42 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 17:50:21 +0530
Message-Id: <20210603122027.27330-18-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
References: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 18/24] tests/device_reset: Unload snd driver
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Uma Shankar <uma.shankar@intel.com>

Unload the snd module before unbinding i915. Audio holds a wakeref which
triggers a warning otherwise, resulting in below warning and test failure.
Currently HSW/BDW and DG1 are the platforms affected, can be extended to
other platforms as well.

<4> [137.001006] ------------[ cut here ]------------
<4> [137.001010] i915 0000:00:02.0: i915 raw-wakerefs=1 wakelocks=1 on cleanup
<4> [137.001076] WARNING: CPU: 0 PID: 1417 at drivers/gpu/drm/i915/intel_runtime_pm.c:619 intel_runtime_pm_driver_release+0x56/0x60 [i915]
<4> [137.001078] Modules linked in: snd_hda_intel i915 snd_hda_codec_hdmi mei_hdcp intel_pmt_telemetry intel_pmt_core x86_pkg_temp_thermal coretemp smsc75xx crct10dif_pclmul usbnet crc32_pclmul mii ghash_clmulni_intel kvm_intel e1000e snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core ptp pps_core mei_me snd_pcm mei prime_numbers intel_pmt [last unloaded: i915]
<4> [137.001095] CPU: 0 PID: 1417 Comm: kworker/u16:7 Tainted: G U 5.9.0-g79478e23b1878-DII_3204+ #1
<4> [137.001097] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3197.A00.2005110542 05/11/2020
<4> [137.001102] Workqueue: events_unbound async_run_entry_fn
<4> [137.001140] RIP: 0010:intel_runtime_pm_driver_release+0x56/0x60 [i915]
<4> [137.001142] Code: fd 10 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 91 59 58 e1 45 89 e8 89 e9 4c 89 e2 48 89 c6 48 c7 c7 b0 f3 48 a0 e8 55 25 ef e0 <0f> 0b eb b5 66 0f 1f 44 00 00 48 8b 87 88 45 ff ff b9 02 00 00 00
<4> [137.001144] RSP: 0018:ffffc900007dbd68 EFLAGS: 00010286
<4> [137.001147] RAX: 0000000000000000 RBX: ffff88847338bea8 RCX: 0000000000000001
<4> [137.001148] RDX: 0000000080000001 RSI: ffffffff823efa86 RDI: 00000000ffffffff
<4> [137.001150] RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000001
<4> [137.001152] R10: 000000009bda34df R11: 00000000e2a8a89a R12: ffff88849b209880
<4> [137.001153] R13: 0000000000000001 R14: ffff88847338bea8 R15: ffff88847338fcc0
<4> [137.001155] FS: 0000000000000000(0000) GS:ffff8884a0600000(0000) knlGS:0000000000000000
<4> [137.001157] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [137.001159] CR2: 00007fc03597dd88 CR3: 0000000006610005 CR4: 0000000000770ef0
<4> [137.001160] PKRU: 55555554
<4> [137.001162] Call Trace:
<4> [137.001199] i915_drm_suspend_late+0x102/0x120 [i915]
<4> [137.001204] ? pci_pm_poweroff_late+0x30/0x30
<4> [137.001209] dpm_run_callback+0x61/0x270
<4> [137.001214] __device_suspend_late+0x8b/0x180
<4> [137.001217] async_suspend_late+0x15/0x90
<4> [137.001220] async_run_entry_fn+0x34/0x160
<4> [137.001224] process_one_work+0x26c/0x5c0
<4> [137.001231] worker_thread+0x37/0x380
<4> [137.001235] ? process_one_work+0x5c0/0x5c0
<4> [137.001238] kthread+0x149/0x170
<4> [137.001241] ? kthread_park+0x80/0x80
<4> [137.001246] ret_from_fork+0x1f/0x30
<4> [137.001256] irq event stamp: 2329

v2: Addressed Janusz review comment, added a DG1 platform check
and skip if module unload for audio fails.

v3: Extended the WA to HSW/BDW, added an igt  warning on unload to keep
visibility on the issue as suggested by Janusz

v4: Merged the revert of earlier WA within this patch and added
a flag to track the WA, as suggested by Janusz.

Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
(cherry picked from commit ab7e703161f97fee30c1bf3aae3144bb333c8821)
---
 tests/device_reset.c | 61 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 15 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index eef707330c..e6a468e6fa 100644
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
 
@@ -28,6 +30,7 @@ struct device_fds {
 		int drv_dir;
 	} fds;
 	char dev_bus_addr[DEV_BUS_ADDR_LEN];
+	bool snd_unload;
 };
 
 static int __open_sysfs_dir(int fd, const char* path)
@@ -82,6 +85,7 @@ static void init_device_fds(struct device_fds *dev)
 {
 	char dev_path[PATH_MAX];
 	char *addr_pos;
+	uint32_t devid;
 
 	igt_debug("open device\n");
 	/**
@@ -91,9 +95,18 @@ static void init_device_fds(struct device_fds *dev)
 	 */
 	dev->fds.dev = __drm_open_driver(DRIVER_ANY);
 	igt_assert_fd(dev->fds.dev);
-	if (is_i915_device(dev->fds.dev))
+	if (is_i915_device(dev->fds.dev)) {
 		igt_require_gem(dev->fds.dev);
 
+		devid = intel_get_drm_devid(dev->fds.dev);
+		if ((IS_HASWELL(devid) || IS_BROADWELL(devid) ||
+		     IS_DG1(devid)) &&
+		     (igt_kmod_is_loaded("snd_hda_intel"))) {
+			igt_debug("Enable WA to unload snd driver\n");
+			dev->snd_unload = true;
+		}
+	}
+
 	igt_assert(device_sysfs_path(dev->fds.dev, dev_path));
 	addr_pos = strrchr(dev_path, '/');
 	igt_assert(addr_pos);
@@ -164,6 +177,34 @@ static bool is_sysfs_reset_supported(int fd)
 /* Unbind the driver from the device */
 static void driver_unbind(struct device_fds *dev)
 {
+	/**
+	 * FIXME: Unbinding the i915 driver on affected platforms with
+	 * audio results in a kernel WARN on "i915 raw-wakerefs=1
+	 * wakelocks=1 on cleanup". The below CI friendly user level
+	 * workaround to unload and de-couple audio from IGT testing,
+	 * prevents the warning from appearing. Drop this hack as soon
+	 * as this is fixed in the kernel. unbind/re-bind validation
+	 * on audio side is not robust and we could have potential
+	 * failures blocking display CI, currently this seems to the
+	 * safest and easiest way out.
+	 */
+	if (dev->snd_unload) {
+		igt_terminate_process(SIGTERM, "alsactl");
+
+		/* unbind snd_hda_intel */
+		kick_snd_hda_intel();
+
+		if (igt_kmod_unload("snd_hda_intel", 0)) {
+			dev->snd_unload = false;
+			igt_warn("Could not unload snd_hda_intel\n");
+			igt_kmod_list_loaded();
+			igt_lsof("/dev/snd");
+			igt_skip("Audio is in use, skipping\n");
+		} else {
+			igt_warn("Preventively unloaded snd_hda_intel\n");
+		}
+	}
+
 	igt_debug("unbind the driver from the device\n");
 	igt_assert(igt_sysfs_set(dev->fds.drv_dir, "unbind",
 		   dev->dev_bus_addr));
@@ -175,6 +216,9 @@ static void driver_bind(struct device_fds *dev)
 	igt_debug("rebind the driver to the device\n");
 	igt_abort_on_f(!igt_sysfs_set(dev->fds.drv_dir, "bind",
 		       dev->dev_bus_addr), "driver rebind failed");
+
+	if (dev->snd_unload)
+		igt_kmod_load("snd_hda_intel", NULL);
 }
 
 /* Initiate device reset */
@@ -235,19 +279,6 @@ static void unbind_reset_rebind(struct device_fds *dev)
 	igt_debug("close the device\n");
 	close_if_opened(&dev->fds.dev);
 
-	/**
-	 * FIXME: Unbinding the i915 driver on some platforms with Azalia audio
-	 * results in a kernel WARN on "i915 raw-wakerefs=1 wakelocks=1 on cleanup".
-	 * The below CI friendly user level workaround prevents the warning from
-	 * appearing. Drop this hack as soon as this is fixed in the kernel.
-	 */
-	if (is_i915_device(dev->fds.dev)) {
-		uint32_t devid = intel_get_drm_devid(dev->fds.dev);
-		if (igt_warn_on_f(IS_HASWELL(devid) || IS_BROADWELL(devid),
-		    "Manually enabling audio PM to work around a kernel WARN\n"))
-			igt_pm_enable_audio_runtime_pm();
-	}
-
 	driver_unbind(dev);
 
 	initiate_device_reset(dev);
@@ -257,7 +288,7 @@ static void unbind_reset_rebind(struct device_fds *dev)
 
 igt_main
 {
-	struct device_fds dev = { .fds = {-1, -1, -1}, .dev_bus_addr = {0}};
+	struct device_fds dev = { .fds = {-1, -1, -1}, .dev_bus_addr = {0}, };
 
 	igt_fixture {
 		char dev_path[PATH_MAX];
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
