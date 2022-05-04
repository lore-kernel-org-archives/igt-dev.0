Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2848410EAA4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 May 2022 07:29:01 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Wed,  4 May 2022 09:28:35 +0200
Message-Id: <20220504072837.2136657-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20220504072837.2136657-1-mauro.chehab@linux.intel.com>
References: <20220504072837.2136657-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/6] core_hotunplug: fix audio unbind logic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The current audio unbind logic is wrong: it expects the audio
driver to depend on i915 only on Haswell, Broadwell and DG1.

That doesn't match the Kernel driver, where snd-hda-audio binds
on i915 also on Skylake, Braswell and whenever it needs to use
pm runtime from the DRM driver.

Now that lib/igt-kmod has gained improved support for audio
unbind, update core_hotunplug to benefit from the newer logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/core_hotunplug.c | 54 +++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 32 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index f8a4d6f08f69..7c68b336e67b 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -54,7 +54,7 @@ struct hotunplug {
 	const char *failure;
 	bool need_healthcheck;
 	bool has_intel_perf;
-	bool snd_unload;
+ 	const char *snd_driver;
 };
 
 /* Helpers */
@@ -140,27 +140,22 @@ static void prepare(struct hotunplug *priv)
 static void driver_unbind(struct hotunplug *priv, const char *prefix,
 			  int timeout)
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
+	/*
+	 * FIXME: on some devices, the audio driver (snd_hda_intel)
+	 * binds into the i915 driver. On such hardware, kernel warnings
+	 * and errors may happen if i915 is unbind/removed before removing
+	 * first the audio driver.
+	 * So, add a logic that unloads the audio driver before trying to
+	 * unbind i915 driver, reloading it when binding again.
 	 */
-	if (priv->snd_unload) {
-		if (igt_audio_driver_unload(NULL)) {
-			priv->snd_unload = false;
-			igt_warn("Could not unload audio driver\n");
-			igt_kmod_list_loaded();
-			igt_lsof("/dev/snd");
-			igt_skip("Audio is in use, skipping\n");
-		} else {
-			igt_info("Preventively unloaded audio driver\n");
-		}
+	if (igt_audio_driver_unload(&priv->snd_driver)) {
+		if (priv->snd_driver)
+			igt_warn("Could not unload audio driver %s\n", priv->snd_driver);
+		igt_kmod_list_loaded();
+		igt_lsof("/dev/snd");
+		igt_skip("Audio is in use, skipping\n");
+	} else if (priv->snd_driver) {
+		igt_info("Unloaded audio driver %s\n", priv->snd_driver);
 	}
 
 	local_debug("%sunbinding the driver from the device\n", prefix);
@@ -192,8 +187,11 @@ static void driver_bind(struct hotunplug *priv, int timeout)
 				F_OK, 0),
 		      "Rebound device not present (%s)!\n", priv->dev_bus_addr);
 
-	if (priv->snd_unload)
-		igt_kmod_load("snd_hda_intel", NULL);
+	if (priv->snd_driver) {
+		igt_info("Realoading %s\n", priv->snd_driver);
+		igt_kmod_load(priv->snd_driver, NULL);
+		priv->snd_driver = NULL;
+	}
 }
 
 /* Remove (virtually unplug) the device from its bus */
@@ -606,7 +604,7 @@ igt_main
 		.failure	= NULL,
 		.need_healthcheck = true,
 		.has_intel_perf = false,
-		.snd_unload	= false,
+		.snd_driver	= NULL,
 	};
 
 	igt_fixture {
@@ -616,14 +614,6 @@ igt_main
 		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
 
 		if (is_i915_device(fd_drm)) {
-			uint32_t devid = intel_get_drm_devid(fd_drm);
-
-			if ((IS_HASWELL(devid) || IS_BROADWELL(devid) ||
-			     IS_DG1(devid)) && (igt_kmod_is_loaded("snd_hda_intel"))) {
-				igt_debug("Enable WA to unload snd driver\n");
-				priv.snd_unload = true;
-			}
-
 			gem_quiescent_gpu(fd_drm);
 			igt_require_gem(fd_drm);
 
-- 
2.35.1
