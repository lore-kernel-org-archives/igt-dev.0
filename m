Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D47D10E5CB
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 14:11:09 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 15 Feb 2022 19:40:52 +0530
Message-Id: <20220215141053.27928-2-anshuman.gupta@intel.com>
In-Reply-To: <20220215141053.27928-1-anshuman.gupta@intel.com>
References: <20220215141053.27928-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] lib: Add silent
 __igt_i915_driver_unload
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
Cc: chris.p.wilson@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add silent __igt_i915_driver_unload(), which will not
print any warning in case of passed argument is NULL.
This will be used by some igt test, which marks i915
module busy and expect i915 module unload to fail.
These tests requires a silent lib function to unload
the i915 module correctly.

v2:
- Change commit log. [Ashutosh]
- Change whom to who. [Ashutosh]
- When aux audule unload fails mark who with module name. [Ashutosh]
- Keep same type of return type in
  __igt_i915_driver_unload(). [Ashutosh]

Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_kmod.c | 90 ++++++++++++++++++++++++++++++--------------------
 lib/igt_kmod.h |  1 +
 2 files changed, 56 insertions(+), 35 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 10e983844..a249ea922 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -369,54 +369,74 @@ igt_i915_driver_load(const char *opts)
 	return IGT_EXIT_SUCCESS;
 }
 
-/**
- * igt_i915_driver_unload:
- *
- * Unloads the i915 driver and its dependencies.
- *
- */
-int
-igt_i915_driver_unload(void)
+int __igt_i915_driver_unload(const char **who)
 {
+	const char *sound[] = {
+		"snd_hda_intel",
+		"snd_hdmi_lpe_audio",
+		NULL,
+	};
+
+	const char *aux[] = {
+		/* gen5: ips uses symbol_get() so only a soft module dependency */
+		"intel_ips",
+		NULL,
+	};
+
 	/* unbind vt */
 	bind_fbcon(false);
 
-	if (igt_kmod_is_loaded("snd_hda_intel")) {
-		igt_terminate_process(SIGTERM, "alsactl");
-
-		/* unbind snd_hda_intel */
-		kick_snd_hda_intel();
-
-		if (igt_kmod_unload("snd_hda_intel", 0)) {
-			igt_warn("Could not unload snd_hda_intel\n");
-			igt_kmod_list_loaded();
-			igt_lsof("/dev/snd");
-			return IGT_EXIT_FAILURE;
+	for (const char **m = sound; *m; m++) {
+		if (igt_kmod_is_loaded(*m)) {
+			igt_terminate_process(SIGTERM, "alsactl");
+			kick_snd_hda_intel();
+			if (igt_kmod_unload(*m, 0)) {
+				if (who)
+					*who = *m;
+				return IGT_EXIT_FAILURE;
+			}
 		}
 	}
 
-	if (igt_kmod_is_loaded("snd_hdmi_lpe_audio")) {
-		igt_terminate_process(SIGTERM, "alsactl");
+	for (const char **m = aux; *m; m++) {
+		if (igt_kmod_is_loaded(*m))
+			if (igt_kmod_unload(*m, 0)) {
+				if (who)
+					*who = *m;
+				return IGT_EXIT_FAILURE;
+			}
+	}
 
-		if (igt_kmod_unload("snd_hdmi_lpe_audio", 0)) {
-			igt_warn("Could not unload snd_hdmi_lpe_audio\n");
-			igt_kmod_list_loaded();
-			igt_lsof("/dev/snd");
+	if (igt_kmod_is_loaded("i915")) {
+		if (igt_kmod_unload("i915", 0)) {
+			if (who)
+				*who = "i915";
 			return IGT_EXIT_FAILURE;
 		}
 	}
 
-	/* gen5: ips uses symbol_get() so only a soft module dependency */
-	if (igt_kmod_is_loaded("intel_ips"))
-		igt_kmod_unload("intel_ips", 0);
+	return IGT_EXIT_SUCCESS;
+}
 
-	if (igt_kmod_is_loaded("i915")) {
-		if (igt_kmod_unload("i915", 0)) {
-			igt_warn("Could not unload i915\n");
-			igt_kmod_list_loaded();
-			igt_lsof("/dev/dri");
-			return IGT_EXIT_SKIP;
-		}
+/**
+ * igt_i915_driver_unload:
+ *
+ * Unloads the i915 driver and its dependencies.
+ *
+ */
+int
+igt_i915_driver_unload(void)
+{
+	const char *who;
+	int ret;
+
+	ret = __igt_i915_driver_unload(&who);
+	if (ret) {
+		igt_warn("Could not unload %s\n", who);
+		igt_kmod_list_loaded();
+		igt_lsof("/dev/dri");
+		igt_lsof("/dev/snd");
+		return ret;
 	}
 
 	if (igt_kmod_is_loaded("intel-gtt"))
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 04c87516f..0898122b3 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -38,6 +38,7 @@ int igt_kmod_unload(const char *mod_name, unsigned int flags);
 
 int igt_i915_driver_load(const char *opts);
 int igt_i915_driver_unload(void);
+int __igt_i915_driver_unload(const char **whom);
 
 int igt_amdgpu_driver_load(const char *opts);
 int igt_amdgpu_driver_unload(void);
-- 
2.26.2
