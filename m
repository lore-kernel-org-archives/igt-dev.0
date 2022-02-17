Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591C410EB95
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 15:44:50 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Feb 2022 21:14:33 +0530
Message-Id: <20220217154434.13877-2-anshuman.gupta@intel.com>
In-Reply-To: <20220217154434.13877-1-anshuman.gupta@intel.com>
References: <20220217154434.13877-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kmod: Don't use process exit
 return value
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Kmod igt library functions like igt_i915_driver_{load, unload}
uses process exit IGT_EXIT_{FAILURE, SKIP, SUCCESS} return values.
Let these function return actual return values
from returned igt_kmod_{load, unload} functions.

Suggested-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/igt_kmod.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index a249ea922..cf7a3b228 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -355,22 +355,26 @@ igt_kmod_list_loaded(void)
 int
 igt_i915_driver_load(const char *opts)
 {
+	int ret;
+
 	if (opts)
 		igt_info("Reloading i915 with %s\n\n", opts);
 
-	if (igt_kmod_load("i915", opts)) {
+	ret = igt_kmod_load("i915", opts);
+	if (ret) {
 		igt_warn("Could not load i915\n");
-		return IGT_EXIT_FAILURE;
+		return ret;
 	}
 
 	bind_fbcon(true);
 	igt_kmod_load("snd_hda_intel", NULL);
 
-	return IGT_EXIT_SUCCESS;
+	return 0;
 }
 
 int __igt_i915_driver_unload(const char **who)
 {
+	int ret;
 	const char *sound[] = {
 		"snd_hda_intel",
 		"snd_hdmi_lpe_audio",
@@ -390,32 +394,36 @@ int __igt_i915_driver_unload(const char **who)
 		if (igt_kmod_is_loaded(*m)) {
 			igt_terminate_process(SIGTERM, "alsactl");
 			kick_snd_hda_intel();
-			if (igt_kmod_unload(*m, 0)) {
+			ret = igt_kmod_unload(*m, 0);
+			if (ret) {
 				if (who)
 					*who = *m;
-				return IGT_EXIT_FAILURE;
+				return ret;
 			}
 		}
 	}
 
 	for (const char **m = aux; *m; m++) {
-		if (igt_kmod_is_loaded(*m))
-			if (igt_kmod_unload(*m, 0)) {
+		if (igt_kmod_is_loaded(*m)) {
+			ret = igt_kmod_unload(*m, 0);
+			if (ret) {
 				if (who)
 					*who = *m;
-				return IGT_EXIT_FAILURE;
+				return ret;
 			}
+		}
 	}
 
 	if (igt_kmod_is_loaded("i915")) {
-		if (igt_kmod_unload("i915", 0)) {
+		ret = igt_kmod_unload("i915", 0);
+		if (ret) {
 			if (who)
 				*who = "i915";
-			return IGT_EXIT_FAILURE;
+			return ret;
 		}
 	}
 
-	return IGT_EXIT_SUCCESS;
+	return 0;
 }
 
 /**
@@ -447,10 +455,10 @@ igt_i915_driver_unload(void)
 
 	if (igt_kmod_is_loaded("i915")) {
 		igt_warn("i915.ko still loaded!\n");
-		return IGT_EXIT_FAILURE;
+		return -EBUSY;
 	}
 
-	return IGT_EXIT_SUCCESS;
+	return 0;
 }
 
 /**
-- 
2.26.2
