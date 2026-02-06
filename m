Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539AEEE6B69
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 22:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07ECB10E94D;
	Fri,  6 Feb 2026 22:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pp9imuMk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A46410E94D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 22:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770417691; x=1801953691;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IazeJ9msthIpjc0Z1YcMLyi5E5zV2xxqDuvyZSubzCw=;
 b=Pp9imuMkEoXfm1wNYDELfw0opf4fLVfDZNdNm/htPreMYHDOJLn+JAFB
 wqDTjsM8WKWQQYhKA4YAycPkr/leOCtHFbyS2pQtlZUiI31N5iwaEChM8
 6UEl+OEbkIzD8yoZ+8Kchn7fRrlpc9dk2R+48F+tnBdDXSM8VHqC7Zwwf
 vR6X/r3IjLjGpfqO6n+8pG34u5cdCFRl2kbPD9psuUjYAz2Pud8vl9Mvs
 hPOxvTER17wxXICZQxoHc3vgGnpULzIntWXkRry+aKOgJ59Wq/HolpzR2
 JkSQuJUP137KhHPJdl1/kCgLeLWVjdfjPHb+KGXBDZxpBrWjpVlJn5b5j g==;
X-CSE-ConnectionGUID: bi4opurETnKZagBXBd5kdQ==
X-CSE-MsgGUID: 3yC/TROVQhuuDOrEB6kwzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71350686"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="71350686"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 14:41:27 -0800
X-CSE-ConnectionGUID: 8y38/ZZMR8W4UufOVLgLAQ==
X-CSE-MsgGUID: rIIac6pSTVKLz1KP7nbQ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="241382880"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP; 06 Feb 2026 14:41:25 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1] xe/igt_kmod_unbind: release audio before unbinding xe
Date: Fri,  6 Feb 2026 23:41:06 +0100
Message-ID: <20260206224106.3845768-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Audio driver should be unloaded before unbinding/unloading xe.
Otherwise audio has no chance to release the refcount:

<7> [485.586766] xe 0000:03:00.0: [drm:drm_client_release] fbdev
<3> [485.587690] xe 0000:03:00.0: [drm] *ERROR* audio power refcount 1 after unbind

When audio is not properly released, further testing leads to warnings,
timeouts, etc. Release audio before xe is unbound.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7169
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 lib/igt_kmod.c                   | 1 +
 tests/intel/xe_configfs.c        | 7 +++++++
 tests/intel/xe_fault_injection.c | 3 +++
 tests/intel/xe_survivability.c   | 2 ++
 4 files changed, 13 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d1d7a3840..82c005ff7 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -716,6 +716,7 @@ igt_intel_driver_unload(const char *driver)
 
 int igt_xe_driver_unload(void)
 {
+	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", NULL);
 
 	igt_kmod_unload("xe");
diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index d2dfd2e87..9f32e2fc1 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -55,6 +55,7 @@ static void restore(int sig)
 {
 	int configfs_fd;
 
+	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", bus_addr);
 
 	/* Drop all custom configfs settings from subtests */
@@ -69,6 +70,7 @@ static void restore(int sig)
 
 static void set_survivability_mode(int configfs_device_fd, bool value)
 {
+	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", bus_addr);
 	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
 	igt_kmod_bind("xe", bus_addr);
@@ -113,6 +115,7 @@ static void test_engines_allowed_invalid(int configfs_device_fd)
 	 * These only test if engine parsing is correct, so just make sure
 	 * there's no device bound
 	 */
+	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -139,6 +142,7 @@ static void test_engines_allowed(int configfs_device_fd)
 	 * These only test if engine parsing is correct, so just make sure
 	 * there's no device bound
 	 */
+	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -169,6 +173,7 @@ static void test_gt_types_allowed(int configfs_device_fd)
 	 * These only test if gt type parsing is correct, so just make sure
 	 * there's no device bound
 	 */
+	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -231,6 +236,7 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 	 * These only test if command parsing is correct,
 	 * so just make sure there's no device bound
 	 */
+	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -310,6 +316,7 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
 		const struct value *v = &values[i];
 
+		igt_audio_driver_unload(NULL);
 		igt_kmod_unbind("xe", bus_addr);
 
 		igt_info("Test %s\n", v->test);
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index f3bfc4b40..65add71a1 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -309,6 +309,7 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
 		fault_params->times = MAX_INJECTIONS_PER_ITER;
 		setup_injection_fault(fault_params);
 		inject_fault_probe(fd, pci_slot, function_name);
+		igt_audio_driver_unload(NULL);
 		igt_kmod_unbind("xe", pci_slot);
 
 		/*
@@ -662,6 +663,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 			oa_add_config_fail(fd, sysfs, devid, pci_slot, s->name);
 
 	igt_fixture() {
+		igt_audio_driver_unload(NULL);
 		igt_kmod_unbind("xe", pci_slot);
 	}
 
@@ -673,6 +675,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 			err = inject_fault_probe(fd, pci_slot, s->name);
 
 			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
+			igt_audio_driver_unload(NULL);
 			igt_kmod_unbind("xe", pci_slot);
 		}
 
diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 552414903..e842a76ec 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -150,6 +150,7 @@ static void restore(int sig)
 {
 	int configfs_fd;
 
+	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", bus_addr);
 
 	configfs_fd = igt_configfs_open("xe");
@@ -162,6 +163,7 @@ static void restore(int sig)
 
 static void set_survivability_mode(int configfs_device_fd, bool value)
 {
+	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", bus_addr);
 	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
 	igt_kmod_bind("xe", bus_addr);
-- 
2.45.2

