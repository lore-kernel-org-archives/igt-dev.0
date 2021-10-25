Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9609989C21
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Oct 2021 09:22:32 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Mon, 25 Oct 2021 14:53:04 +0530
Message-Id: <20211025092305.14742-2-anshuman.gupta@intel.com>
In-Reply-To: <20211025092305.14742-1-anshuman.gupta@intel.com>
References: <20211025092305.14742-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Add silent __igt_i915_driver_unload
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
Cc: chris.p.wilson@intel.com, badal.nilawar@intel.com, Anshuman Gupta <anshuman.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add silent __igt_i915_driver_unload(), which will not
print any warning in case of passed argument is NULL.

Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_kmod.c | 86 ++++++++++++++++++++++++++++++--------------------
 lib/igt_kmod.h |  1 +
 2 files changed, 52 insertions(+), 35 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 10e983844..ce9bfc07a 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -369,56 +369,72 @@ igt_i915_driver_load(const char *opts)
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
+int __igt_i915_driver_unload(const char **whom)
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
+				if (whom)
+					*whom = *m;
+				return IGT_EXIT_FAILURE;
+			}
 		}
 	}
 
-	if (igt_kmod_is_loaded("snd_hdmi_lpe_audio")) {
-		igt_terminate_process(SIGTERM, "alsactl");
-
-		if (igt_kmod_unload("snd_hdmi_lpe_audio", 0)) {
-			igt_warn("Could not unload snd_hdmi_lpe_audio\n");
-			igt_kmod_list_loaded();
-			igt_lsof("/dev/snd");
-			return IGT_EXIT_FAILURE;
-		}
+	for (const char **m = aux; *m; m++) {
+		if (igt_kmod_is_loaded(*m))
+			igt_kmod_unload(*m, 0);
 	}
 
-	/* gen5: ips uses symbol_get() so only a soft module dependency */
-	if (igt_kmod_is_loaded("intel_ips"))
-		igt_kmod_unload("intel_ips", 0);
-
 	if (igt_kmod_is_loaded("i915")) {
 		if (igt_kmod_unload("i915", 0)) {
-			igt_warn("Could not unload i915\n");
-			igt_kmod_list_loaded();
-			igt_lsof("/dev/dri");
+			if (whom)
+				*whom = "i915";
 			return IGT_EXIT_SKIP;
 		}
 	}
 
+	return IGT_EXIT_SUCCESS;
+}
+
+/**
+ * igt_i915_driver_unload:
+ *
+ * Unloads the i915 driver and its dependencies.
+ *
+ */
+int
+igt_i915_driver_unload(void)
+{
+	const char *whom;
+	int ret;
+
+	ret = __igt_i915_driver_unload(&whom);
+	if (ret) {
+		igt_warn("Could not unload %s\n", whom);
+		igt_kmod_list_loaded();
+		igt_lsof("/dev/dri");
+		igt_lsof("/dev/snd");
+		return ret;
+	}
+
 	if (igt_kmod_is_loaded("intel-gtt"))
 		igt_kmod_unload("intel-gtt", 0);
 
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
