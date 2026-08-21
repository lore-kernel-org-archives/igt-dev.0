Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A0EC5DF8C
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 19:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9FB10F454;
	Fri, 21 Aug 2026 19:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6Aw8CI9";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BCE10F408
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 19:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787340247; x=1818876247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PChRB6ltIxVvqh2V+uVWGiacQCVG8rRw1SOiifoDcN0=;
 b=C6Aw8CI9ALszz0IERcM+3yFSxPJI8VecD4XDoWFWjrCJMJdIfC02E2ik
 o2SnkVY/kVMfNom83cyYKpqS3spIdyMhx0zLmVg2eTwl3QiTQMgsOiFJV
 FSuPU7A0tz0E6cuqgdxvUXUMrZmbNu78vbeqS4eolNKyda6XNgH/XhiHU
 emh7cjVnjeb8ohgvrmBeOBNCsmjgmq4bIwTya+HBvv7KUkYp1BFL/GEdq
 2WrxDxnPFkrvTlSocGbDnvEjbwC7b2H5sjFlVYre3mFYsx/Wzhrg3V16t
 7Fy4IeDr52F4kqblAw6o0EaZc0HH8g2g9ul4gTtKhV6BVnRqUT7Feh83J g==;
X-CSE-ConnectionGUID: OGpt/tGxTw+gluvmfiM8kQ==
X-CSE-MsgGUID: G4tRo5V3SCGPcMxd3plZ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="110682215"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="110682215"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 12:23:35 -0700
X-CSE-ConnectionGUID: XmHlYJaIRkCJD/clafH1bQ==
X-CSE-MsgGUID: L8XFghD9QfypRSSCN4RjPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="289963502"
Received: from dut4475arls.fm.intel.com ([10.105.10.69])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 12:23:34 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_configfs: Use the new debug configfs
 group
Date: Fri, 21 Aug 2026 19:23:32 +0000
Message-ID: <20260821192332.19060-5-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821192332.19060-4-stuart.summers@intel.com>
References: <20260821192332.19060-4-stuart.summers@intel.com>
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

The xe driver moved its debug oriented configfs attributes
(ctx_restore_*_bb, engines_allowed, gt_types_allowed and
survivability_mode) into a "debug" subgroup of the device group. Open
that subgroup and use it for those attributes.

The subgroup only exists when the driver is built with
CONFIG_DRM_XE_DEBUG, so skip the subtests when it is missing rather
than failing on every attribute access.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-5
---
 tests/intel/xe_configfs.c | 131 +++++++++++++++++++++++++-------------
 1 file changed, 88 insertions(+), 43 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 450c0a119..c537e5d69 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -68,11 +68,26 @@ static void restore(int sig)
 	igt_kmod_bind("xe", bus_addr);
 }
 
-static void set_survivability_mode(int configfs_device_fd, bool value)
+/*
+ * Debug oriented attributes live in the "debug" subgroup of the device
+ * group. The subgroup is only created when the driver is built with
+ * CONFIG_DRM_XE_DEBUG, so skip if it's not there.
+ */
+static int open_debug_group(int configfs_device_fd)
+{
+	int fd = openat(configfs_device_fd, "debug", O_RDONLY | O_DIRECTORY);
+
+	igt_require_f(fd >= 0,
+		      "configfs debug group not available, is CONFIG_DRM_XE_DEBUG enabled?\n");
+
+	return fd;
+}
+
+static void set_survivability_mode(int configfs_debug_fd, bool value)
 {
 	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", bus_addr);
-	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
+	igt_sysfs_set_boolean(configfs_debug_fd, "survivability_mode", value);
 	igt_kmod_bind("xe", bus_addr);
 }
 
@@ -80,13 +95,13 @@ static void set_survivability_mode(int configfs_device_fd, bool value)
  * SUBTEST: survivability-mode
  * Description: Validate survivability mode by setting configfs
  */
-static void test_survivability_mode(int configfs_device_fd)
+static void test_survivability_mode(int configfs_debug_fd)
 {
 	char path[PATH_MAX];
 	int fd;
 
 	/* Enable survivability mode */
-	set_survivability_mode(configfs_device_fd, true);
+	set_survivability_mode(configfs_debug_fd, true);
 
 	/* check presence of survivability mode sysfs */
 	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
@@ -100,7 +115,7 @@ static void test_survivability_mode(int configfs_device_fd)
  * SUBTEST: engines-allowed-invalid
  * Description: Validate engines_allowed attribute for invalid values
  */
-static void test_engines_allowed_invalid(int configfs_device_fd)
+static void test_engines_allowed_invalid(int configfs_debug_fd)
 {
 	static const char *values[] = {
 		"xcs0",
@@ -122,7 +137,7 @@ static void test_engines_allowed_invalid(int configfs_device_fd)
 		const char *v = values[i];
 
 		igt_debug("Writing '%s' to engines_allowed\n", v);
-		igt_assert(!igt_sysfs_set(configfs_device_fd, "engines_allowed", v));
+		igt_assert(!igt_sysfs_set(configfs_debug_fd, "engines_allowed", v));
 	}
 }
 
@@ -130,7 +145,7 @@ static void test_engines_allowed_invalid(int configfs_device_fd)
  * SUBTEST: engines-allowed
  * Description: Validate engines_allowed attribute
  */
-static void test_engines_allowed(int configfs_device_fd)
+static void test_engines_allowed(int configfs_debug_fd)
 {
 	static const char *values[] = {
 		"rcs0", "rcs*", "rcs0,bcs0", "bcs0,rcs0",
@@ -149,7 +164,7 @@ static void test_engines_allowed(int configfs_device_fd)
 		const char *v = values[i];
 
 		igt_debug("Writing '%s' to engines_allowed\n", v);
-		igt_assert(igt_sysfs_set(configfs_device_fd, "engines_allowed", v));
+		igt_assert(igt_sysfs_set(configfs_debug_fd, "engines_allowed", v));
 	}
 }
 
@@ -157,7 +172,7 @@ static void test_engines_allowed(int configfs_device_fd)
  * SUBTEST: gt-types-allowed
  * Description: Validate gt_types_allowed attribute
  */
-static void test_gt_types_allowed(int configfs_device_fd)
+static void test_gt_types_allowed(int configfs_debug_fd)
 {
 	static const char *values[] = {
 		"primary,media", "primary", "media", "",
@@ -180,14 +195,14 @@ static void test_gt_types_allowed(int configfs_device_fd)
 		const char *v = values[i];
 
 		igt_debug("Writing '%s' to gt_types_allowed\n", v);
-		igt_assert(igt_sysfs_set(configfs_device_fd, "gt_types_allowed", v));
+		igt_assert(igt_sysfs_set(configfs_debug_fd, "gt_types_allowed", v));
 	}
 
 	for (size_t i = 0; i < ARRAY_SIZE(invalid_values); i++) {
 		const char *v = invalid_values[i];
 
 		igt_debug("Writing '%s' to gt_types_allowed\n", v);
-		igt_assert(!igt_sysfs_set(configfs_device_fd, "gt_types_allowed", v));
+		igt_assert(!igt_sysfs_set(configfs_debug_fd, "gt_types_allowed", v));
 	}
 }
 
@@ -198,7 +213,7 @@ static void test_gt_types_allowed(int configfs_device_fd)
  * SUBTEST: ctx-restore-mid-bb-invalid
  * Description: Validate ctx_restore_mid_bb attribute for invalid values
  */
-static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
+static void test_ctx_restore_invalid(int configfs_debug_fd, const char *type)
 {
 	static const struct value {
 		const char *test;
@@ -234,7 +249,7 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 	char file[64] = { };
 
 	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
-	igt_sysfs_set(configfs_device_fd, file, "");
+	igt_sysfs_set(configfs_debug_fd, file, "");
 
 	/*
 	 * These only test if command parsing is correct,
@@ -248,8 +263,8 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 
 		igt_info("Test %s\n", v->test);
 		igt_debug("bb '%s'\n", v->in);
-		igt_assert(!igt_sysfs_set(configfs_device_fd, file, v->in));
-		igt_assert(igt_sysfs_read(configfs_device_fd, file, buf,
+		igt_assert(!igt_sysfs_set(configfs_debug_fd, file, v->in));
+		igt_assert(igt_sysfs_read(configfs_debug_fd, file, buf,
 					  sizeof(buf) - 1));
 		if (strcmp(buf, "")) {
 			igt_debug("Expecting empty bb, but found '%s'\n", buf);
@@ -265,7 +280,7 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
  * SUBTEST: ctx-restore-mid-bb
  * Description: Validate ctx_restore_mid_bb attribute
  */
-static void test_ctx_restore(int configfs_device_fd, const char *type,
+static void test_ctx_restore(int configfs_debug_fd, const char *type,
 			     const char *engine)
 {
 	static const struct value {
@@ -336,9 +351,9 @@ static void test_ctx_restore(int configfs_device_fd, const char *type,
 
 		igt_info("Test %s\n", v->test);
 		igt_debug("bb '%s'\n", in);
-		igt_assert(igt_sysfs_set(configfs_device_fd, file, in));
+		igt_assert(igt_sysfs_set(configfs_debug_fd, file, in));
 
-		igt_assert(igt_sysfs_read(configfs_device_fd, file, buf,
+		igt_assert(igt_sysfs_read(configfs_debug_fd, file, buf,
 					  sizeof(buf) - 1));
 		if (strcmp(out, buf)) {
 			igt_debug("Expecting '%s' but found '%s'\n", out, buf);
@@ -368,15 +383,29 @@ static int create_device_configfs_group(int configfs_fd)
 	return configfs_device_fd;
 }
 
+static void create_debug_configfs_group(int configfs_fd, int *configfs_device_fd,
+					int *configfs_debug_fd)
+{
+	*configfs_device_fd = create_device_configfs_group(configfs_fd);
+	*configfs_debug_fd = open_debug_group(*configfs_device_fd);
+}
+
 static void close_configfs_group(int configfs_fd, int configfs_device_fd)
 {
 	close(configfs_device_fd);
 	igt_fs_remove_dir(configfs_fd, bus_addr);
 }
 
+static void close_debug_configfs_group(int configfs_fd, int configfs_device_fd,
+				       int configfs_debug_fd)
+{
+	close(configfs_debug_fd);
+	close_configfs_group(configfs_fd, configfs_device_fd);
+}
+
 int igt_main()
 {
-	int fd, configfs_fd, configfs_device_fd;
+	int fd, configfs_fd, configfs_device_fd, configfs_debug_fd;
 	bool is_vf_device;
 	bool has_survivability;
 	const char *engine = NULL;
@@ -412,62 +441,78 @@ int igt_main()
 	igt_subtest("survivability-mode") {
 		igt_require(has_survivability);
 		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
-		test_survivability_mode(configfs_device_fd);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_survivability_mode(configfs_debug_fd);
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
 	}
 
 	igt_describe("Validate engines_allowed with invalid options");
 	igt_subtest("engines-allowed-invalid") {
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
-		test_engines_allowed_invalid(configfs_device_fd);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_engines_allowed_invalid(configfs_debug_fd);
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
 	}
 
 	igt_describe("Validate engines_allowed");
 	igt_subtest("engines-allowed") {
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
-		test_engines_allowed(configfs_device_fd);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_engines_allowed(configfs_debug_fd);
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
 	}
 
 	igt_describe("Validate gt_types_allowed");
 	igt_subtest("gt-types-allowed") {
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
-		test_gt_types_allowed(configfs_device_fd);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_gt_types_allowed(configfs_debug_fd);
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
 	}
 
 	igt_describe("Validate ctx_restore_post_bb with invalid options");
 	igt_subtest("ctx-restore-post-bb-invalid") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
-		test_ctx_restore_invalid(configfs_device_fd, "post");
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_ctx_restore_invalid(configfs_debug_fd, "post");
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
 	}
 
 	igt_describe("Validate ctx_restore_post_bb");
 	igt_subtest("ctx-restore-post-bb") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
-		test_ctx_restore(configfs_device_fd, "post", engine);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_ctx_restore(configfs_debug_fd, "post", engine);
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
 	}
 
 	igt_describe("Validate ctx_restore_mid_bb with invalid options");
 	igt_subtest("ctx-restore-mid-bb-invalid") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
-		test_ctx_restore_invalid(configfs_device_fd, "mid");
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_ctx_restore_invalid(configfs_debug_fd, "mid");
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
 	}
 
 	igt_describe("Validate ctx_restore_mid_bb");
 	igt_subtest("ctx-restore-mid-bb") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
-		test_ctx_restore(configfs_device_fd, "mid", engine);
-		close_configfs_group(configfs_fd, configfs_device_fd);
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_ctx_restore(configfs_debug_fd, "mid", engine);
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
 	}
 
 	igt_fixture() {
-- 
2.43.0

