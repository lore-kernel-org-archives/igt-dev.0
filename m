Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067546E509
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jun 2021 05:30:38 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Fri, 11 Jun 2021 10:49:52 +0530
Message-Id: <20210611052005.303-4-venkata.sai.patnana@intel.com>
In-Reply-To: <20210611052005.303-1-venkata.sai.patnana@intel.com>
References: <20210611052005.303-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 04/17] tests/core_hotunplug: Unload snd
 driver before i915 unbind
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
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Uma Shankar <uma.shankar@intel.com>

Unload the snd module before unbinding i915. Audio holds a wakeref
which triggers a warning otherwise, resulting in below warning and
test failure. Currently HSW/BDW and DG1 are the platforms affected,
can be extended to other platforms as well.

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

Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 53 +++++++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index a639cfb4b4..878efcc7bf 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -29,6 +29,7 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <unistd.h>
+#include <signal.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
@@ -53,6 +54,7 @@ struct hotunplug {
 	const char *failure;
 	bool need_healthcheck;
 	bool has_intel_perf;
+	bool snd_unload;
 };
 
 /* Helpers */
@@ -138,6 +140,34 @@ static void prepare(struct hotunplug *priv)
 static void driver_unbind(struct hotunplug *priv, const char *prefix,
 			  int timeout)
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
+	if (priv->snd_unload) {
+		igt_terminate_process(SIGTERM, "alsactl");
+
+		/* unbind snd_hda_intel */
+		kick_snd_hda_intel();
+
+		if (igt_kmod_unload("snd_hda_intel", 0)) {
+			priv->snd_unload = false;
+			igt_warn("Could not unload snd_hda_intel\n");
+			igt_kmod_list_loaded();
+			igt_lsof("/dev/snd");
+			igt_skip("Audio is in use, skipping\n");
+		} else {
+			igt_warn("Preventively unloaded snd_hda_intel\n");
+		}
+	}
+
 	local_debug("%sunbinding the driver from the device\n", prefix);
 	priv->failure = "Driver unbind failure!";
 
@@ -166,6 +196,9 @@ static void driver_bind(struct hotunplug *priv, int timeout)
 	igt_fail_on_f(faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr,
 				F_OK, 0),
 		      "Rebound device not present!\n");
+
+	if (priv->snd_unload)
+		igt_kmod_load("snd_hda_intel", NULL);
 }
 
 /* Remove (virtually unplug) the device from its bus */
@@ -574,6 +607,7 @@ igt_main
 		.failure	= NULL,
 		.need_healthcheck = true,
 		.has_intel_perf = false,
+		.snd_unload	= false,
 	};
 
 	igt_fixture {
@@ -585,23 +619,16 @@ igt_main
 		if (is_i915_device(fd_drm)) {
 			uint32_t devid = intel_get_drm_devid(fd_drm);
 
+			if ((IS_HASWELL(devid) || IS_BROADWELL(devid) ||
+			     IS_DG1(devid)) && (igt_kmod_is_loaded("snd_hda_intel"))) {
+				igt_debug("Enable WA to unload snd driver\n");
+				priv.snd_unload = true;
+			}
+
 			gem_quiescent_gpu(fd_drm);
 			igt_require_gem(fd_drm);
 
 			priv.has_intel_perf = local_i915_perf_healthcheck(fd_drm);
-
-			/**
-			 * FIXME: Unbinding the i915 driver on some Haswell
-			 * platforms with Azalia audio results in a kernel WARN
-			 * on "i915 raw-wakerefs=1 wakelocks=1 on cleanup".  The
-			 * below CI friendly user level workaround prevents the
-			 * warning from appearing.  Drop this hack as soon as
-			 * this is fixed in the kernel.
-			 */
-			if (igt_warn_on_f(IS_HASWELL(devid) ||
-					  IS_BROADWELL(devid),
-			    "Manually enabling audio PM to work around a kernel WARN\n"))
-				igt_pm_enable_audio_runtime_pm();
 		}
 
 		/* Make sure subtests always reopen the same device */
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
