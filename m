Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38B5C54E60
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 19:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBDD10E267;
	Wed, 13 Mar 2024 19:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXGaJ/0j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B9D10E267
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710358451; x=1741894451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3ppaDlZj2Ef1kSFZBQ0mOw+NldaInZ4EAWh1i2WJtPY=;
 b=kXGaJ/0j2+n/neav3bfueRJXLiQ8uqnRIQdP6OrE26mmK2xQ/Ddgwwsu
 T07hTEVVIrkDj7tV64VJQ6E1888lNBuroa6DpJS//InsDqL7dmFxqRZlW
 MAlfxhOgu2iMPEez9xfE4Y2I12jLV2YGCnt58LZaLZiE5lkl2UpD9iZ+u
 /RzDEfJCXdGaVXh8qDRJM+5Y8cpwBM37F1/iWt4I8AgMV0zFsJAF8YMwO
 V7ZUnUUB1TVjrzutFJwQ76FoU0bE4QGYuuI9G1XwpqjUD7GjR3C9LdgVn
 ENTGRr08ap7gOX1czbEtxwJEfnVr8aYYgYLnLcB1+VUqo9DUfS4U3ae26 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5320960"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5320960"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:34:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="11967731"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:34:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: stop using KMOD_REMOVE_FORCE
Date: Wed, 13 Mar 2024 12:34:41 -0700
Message-ID: <20240313193441.2599125-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The flag to force remove a module should never be used. The flag is
intended for end users to decide if they want to have a broken system
left after that. Maybe it's a "controlled breakage". It's not something
for a testsuite to use.

If the kernel ever resorts to honoring the flag (due to module's kref
not being 0), we will have a tainted kernel, potential leaks and memory
corruption. It's better to just handle the error returned by libkmod and
fix the root cause.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c                 | 37 ++++++++++++++++------------------
 lib/igt_kmod.h                 |  2 +-
 tests/intel/i915_module_load.c |  4 ++--
 tests/kms_content_protection.c |  2 +-
 tests/vgem_basic.c             |  2 +-
 5 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 7f2bb9388..b4b884898 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -258,7 +258,7 @@ out:
 	return err < 0 ? err : 0;
 }
 
-static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
+static int igt_kmod_unload_r(struct kmod_module *kmod)
 {
 #define MAX_TRIES	20
 #define SLEEP_DURATION	500000
@@ -272,7 +272,7 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
 	holders = kmod_module_get_holders(kmod);
 	kmod_list_foreach(pos, holders) {
 		struct kmod_module *it = kmod_module_get_module(pos);
-		err = igt_kmod_unload_r(it, flags);
+		err = igt_kmod_unload_r(it);
 		kmod_module_unref(it);
 		if (err < 0)
 			break;
@@ -292,7 +292,7 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
 	}
 
 	for (tries = 0; tries < MAX_TRIES; tries++) {
-		err = kmod_module_remove_module(kmod, flags);
+		err = kmod_module_remove_module(kmod, 0);
 
 		/* Only loop in the following cases */
 		if (err != -EBUSY && err != -EAGAIN)
@@ -379,16 +379,13 @@ static void igt_drop_devcoredump(const char *driver)
 /**
  * igt_kmod_unload:
  * @mod_name: Module name.
- * @flags: flags are passed directly to libkmod and can be:
- * KMOD_REMOVE_FORCE or KMOD_REMOVE_NOWAIT.
  *
  * Returns: 0 in case of success or -errno otherwise.
  *
  * Removes the module @mod_name.
- *
  */
 int
-igt_kmod_unload(const char *mod_name, unsigned int flags)
+igt_kmod_unload(const char *mod_name)
 {
 	struct kmod_ctx *ctx = kmod_ctx();
 	struct kmod_module *kmod;
@@ -403,7 +400,7 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
 		goto out;
 	}
 
-	err = igt_kmod_unload_r(kmod, flags);
+	err = igt_kmod_unload_r(kmod);
 	if (err < 0) {
 		igt_debug("Could not remove module %s (%s)\n", mod_name,
 			  strerror(-err));
@@ -580,7 +577,7 @@ static int igt_always_unload_audio_driver(char **who)
 			if (ret)
 				igt_warn("Failed to notify pipewire_pulse\n");
 			kick_snd_hda_intel();
-			ret = igt_kmod_unload(*m, 0);
+			ret = igt_kmod_unload(*m);
 			pipewire_pulse_stop_reserve();
 			if (ret) {
 				igt_warn("Could not unload audio driver %s\n", *m);
@@ -638,7 +635,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 		if (!igt_kmod_is_loaded(*m))
 			continue;
 
-		ret = igt_kmod_unload(*m, 0);
+		ret = igt_kmod_unload(*m);
 		if (ret) {
 			if (who)
 				*who = strdup_realloc(*who, *m);
@@ -648,7 +645,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 	}
 
 	if (igt_kmod_is_loaded(driver)) {
-		ret = igt_kmod_unload(driver, 0);
+		ret = igt_kmod_unload(driver);
 		if (ret) {
 			if (who)
 				*who = strdup_realloc(*who, driver);
@@ -684,10 +681,10 @@ igt_intel_driver_unload(const char *driver)
 	free(who);
 
 	if (igt_kmod_is_loaded("intel-gtt"))
-		igt_kmod_unload("intel-gtt", 0);
+		igt_kmod_unload("intel-gtt");
 
-	igt_kmod_unload("drm_kms_helper", 0);
-	igt_kmod_unload("drm", 0);
+	igt_kmod_unload("drm_kms_helper");
+	igt_kmod_unload("drm");
 
 	if (igt_kmod_is_loaded("driver")) {
 		igt_warn("%s.ko still loaded!\n", driver);
@@ -737,7 +734,7 @@ igt_amdgpu_driver_unload(void)
 	bind_fbcon(false);
 
 	if (igt_kmod_is_loaded("amdgpu")) {
-		if (igt_kmod_unload("amdgpu", 0)) {
+		if (igt_kmod_unload("amdgpu")) {
 			igt_warn("Could not unload amdgpu\n");
 			igt_kmod_list_loaded();
 			igt_lsof("/dev/dri");
@@ -745,8 +742,8 @@ igt_amdgpu_driver_unload(void)
 		}
 	}
 
-	igt_kmod_unload("drm_kms_helper", 0);
-	igt_kmod_unload("drm", 0);
+	igt_kmod_unload("drm_kms_helper");
+	igt_kmod_unload("drm");
 
 	if (igt_kmod_is_loaded("amdgpu")) {
 		igt_warn("amdgpu.ko still loaded!\n");
@@ -1255,7 +1252,7 @@ static bool kunit_get_tests(struct igt_list_head *tests,
 		igt_require_f(r->code == IGT_EXIT_SKIP,
 			      "Unexpected non-SKIP result while listing test cases\n");
 
-	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
+	igt_skip_on(kmod_module_remove_module(tst->kmod, 0));
 
 	return true;
 }
@@ -1538,7 +1535,7 @@ int igt_ktest_begin(struct igt_ktest *tst)
 	if (strcmp(tst->module_name, "i915") == 0)
 		igt_i915_driver_unload();
 
-	err = kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);
+	err = kmod_module_remove_module(tst->kmod, 0);
 	igt_require(err == 0 || err == -ENOENT);
 
 	tst->kmsg = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
@@ -1586,7 +1583,7 @@ int igt_kselftest_execute(struct igt_ktest *tst,
 
 void igt_ktest_end(struct igt_ktest *tst)
 {
-	kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);
+	kmod_module_remove_module(tst->kmod, 0);
 	close(tst->kmsg);
 }
 
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 990e5309d..efb46da12 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -34,7 +34,7 @@ void igt_kmod_list_loaded(void);
 bool igt_kmod_has_param(const char *mod_name, const char *param);
 
 int igt_kmod_load(const char *mod_name, const char *opts);
-int igt_kmod_unload(const char *mod_name, unsigned int flags);
+int igt_kmod_unload(const char *mod_name);
 
 int igt_audio_driver_unload(char **whom);
 
diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index b02e3e005..3e5957683 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -205,7 +205,7 @@ static void unload_or_die(const char *module_name)
 
 	/* should be unloaded, so expect a no-op */
 	for (loop = 0;; loop++) {
-		err = igt_kmod_unload(module_name, 0);
+		err = igt_kmod_unload(module_name);
 		if (err == -ENOENT) /* -ENOENT == unloaded already */
 			err = 0;
 		if (!err || loop >= 10)
@@ -248,7 +248,7 @@ inject_fault(const char *module_name, const char *opt, int fault)
 	igt_debug("Loaded '%s %s', result=%d\n", module_name, buf, fault);
 
 	if (strcmp(module_name, "i915")) /* XXX better ideas! */
-		igt_kmod_unload(module_name, 0);
+		igt_kmod_unload(module_name);
 	else
 		igt_i915_driver_unload();
 
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3fc575634..6858b22e2 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -396,7 +396,7 @@ static void test_content_protection_on_output(igt_output_t *output,
 	}
 
 	if (data.cp_tests & CP_MEI_RELOAD) {
-		igt_assert_f(!igt_kmod_unload("mei_hdcp", 0),
+		igt_assert_f(!igt_kmod_unload("mei_hdcp"),
 			     "mei_hdcp unload failed");
 
 		/* Expected to fail */
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index 6cfb02e82..e36ea3ed3 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -412,7 +412,7 @@ static void test_debugfs_read(int fd)
 
 static int module_unload(void)
 {
-	return igt_kmod_unload("vgem", 0);
+	return igt_kmod_unload("vgem");
 }
 
 static void test_unload(void)
-- 
2.43.0

