Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED4F10E489
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 11:48:36 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Fri,  6 May 2022 13:48:28 +0200
Message-Id: <20220506114829.2288273-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 5/6] lib/igt_kmod: make it less pedantic
 with audio driver removal
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

Current Linux Kernel don't report if the audio driver binds
into the DRM driver. As this is CPU specific, allow audio
driver unload fail without skipping the IGT tests on legacy
Kernels, as this may not be mandatory.

On new kernels where lsmod will properly display the dependency
between the audio and DRM drivers, skip the core hotunplug
test if it fails to unload the audio driver, as this is
unrelated to the DRM driver - and it could simply because there
are some userspace code using the audio device while the IGT
test is running.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_kmod.c         | 33 +++++++++++++++++++++++++++++----
 tests/core_hotunplug.c |  7 ++-----
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index ca74c602ce66..5a1d1658b367 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -399,17 +399,35 @@ static int igt_always_unload_audio_driver(const char **who)
 		NULL,
 	};
 
+	/*
+	 * With old Kernels, the dependencies between audio and DRM drivers
+	 * are not shown. So, it may not be mandatory to remove the audio
+	 * driver before unload/unbind the DRM one. So, let's print warnings,
+	 * but return 0 on errors, as, if the dependency is mandatory, this
+	 * will be detected later when trying to unbind/unload the DRM driver.
+	 */
 	for (const char **m = sound; *m; m++) {
 		if (igt_kmod_is_loaded(*m)) {
 			if (who)
 				*who = *m;
-			if (igt_lsof_kill_audio_processes())
-				return EACCES;
+
+			ret = igt_lsof_kill_audio_processes();
+
+			if (ret) {
+				igt_warn("Could not stop %d audio process(es)\n", ret);
+				igt_kmod_list_loaded();
+				igt_lsof("/dev/snd");
+				return 0;
+			}
 
 			kick_snd_hda_intel();
 			ret = igt_kmod_unload(*m, 0);
-			if (ret)
-				return ret;
+			if (ret) {
+				igt_warn("Could not unload audio driver %s\n", *m);
+				igt_kmod_list_loaded();
+				igt_lsof("/dev/snd");
+				return 0;
+			}
 		}
 	}
 	return 0;
@@ -599,6 +617,13 @@ int igt_audio_driver_unload(const char **who)
 	}
 
 ret:
+	if (ret) {
+		igt_warn("Couldn't unload %s, which is using the %s driver\n",
+			 mod[pos].name, drm_driver);
+		igt_kmod_list_loaded();
+		igt_lsof("/dev/snd");
+	}
+
 	free_module_ref(mod, num_mod);
 
 	return ret;
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7c68b336e67b..3888c660d4ac 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -149,11 +149,8 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
 	 * unbind i915 driver, reloading it when binding again.
 	 */
 	if (igt_audio_driver_unload(&priv->snd_driver)) {
-		if (priv->snd_driver)
-			igt_warn("Could not unload audio driver %s\n", priv->snd_driver);
-		igt_kmod_list_loaded();
-		igt_lsof("/dev/snd");
-		igt_skip("Audio is in use, skipping\n");
+		igt_skip("Audio driver %s in use, skipping test\n",
+			 priv->snd_driver);
 	} else if (priv->snd_driver) {
 		igt_info("Unloaded audio driver %s\n", priv->snd_driver);
 	}
-- 
2.35.1
