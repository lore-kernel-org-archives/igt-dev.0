Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B684606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 06:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SFUrYO0T
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E5C10E510;
	Thu, 12 Nov 2026 06:14:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1900F10E510
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794464018; x=1826000018;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Nd6iTbJxWaz/EE7XI8TkxxLx47I79/ZMEJhreow9A8=;
 b=SFUrYO0TvBTr6LiNprWbZ6KYwCinLzqR7nAp0iganpdx+STKh98skrHu
 8QY/WeaUBaAPz+fiZHpcdwJAu6L6MVbUPIu11kBNSOc0cYcWJjCEenJa5
 7Wc3zRLLuT9gF5oYEG/ovOVp1y5XLlSNACkXa4Xo+HEepEmJ7z8f+XVkG
 unm8CNzIwB1+9KVFaQXNYJmY37OJEcGKoEtjYEnZEKQZfNxcXpdKz0T7p
 3yHJDHXk6UFYtjnQRNaFxOFIbtyBEVtx9vBTBlKNavdJnxEQ+gm/oQDa+
 JAlgpSlz3do+XRSqR4wUxV7qe9CJd6QRg2e2VnW3WuJU14jB1s0XtZ9F6 w==;
X-CSE-ConnectionGUID: GzMfRzx7TTKlKnfNXnzNYg==
X-CSE-MsgGUID: bGhSblcWT8iBxeOszv4tZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3269925"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3269925"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:13:38 -0800
X-CSE-ConnectionGUID: 1arSV7UfQsuZwMOHbuOaMw==
X-CSE-MsgGUID: Mkj0ECn6RUag12YbE/yWCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8669300"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 22:13:35 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com, sk.anirban@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_configfs: Avoid leaking configfs device
 groups
Date: Thu, 12 Nov 2026 11:43:25 +0530
Message-ID: <20261112061324.906135-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reuse pre-existing groups without removing them, and clean up
test-created groups and fds in the configfs and survivability tests.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/igt_configfs.c             |  3 ++
 tests/intel/xe_configfs.c      | 86 ++++++++++++++++++----------------
 tests/intel/xe_survivability.c | 37 ++++++++++-----
 3 files changed, 74 insertions(+), 52 deletions(-)

diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
index 7bbeca746..ef0ba3ba5 100644
--- a/lib/igt_configfs.c
+++ b/lib/igt_configfs.c
@@ -106,6 +106,9 @@ int igt_configfs_create_device_group(int configfs_fd, const char *name,
 	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
 	int device_fd;
 
+	if (preexisting)
+		*preexisting = false;
+
 	device_fd = igt_fs_create_dir(configfs_fd, name, mode);
 	if (device_fd == -EEXIST) {
 		if (preexisting)
diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 68daed690..534eb239d 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -25,7 +25,8 @@
 
 static char bus_addr[NAME_MAX];
 static struct pci_device *pci_dev;
-
+static int configfs_fd = -1;
+static int configfs_group_fd = -1;
 static bool configfs_group_preexisting;
 
 static bool check_registers(const uint32_t reg[], const uint32_t val[],
@@ -53,18 +54,37 @@ out:
 	return ret;
 }
 
+static void close_configfs_group(void)
+{
+	if (configfs_group_fd < 0)
+		return;
+
+	igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_group_fd,
+					configfs_group_preexisting);
+	configfs_group_fd = -1;
+	configfs_group_preexisting = false;
+}
+
+static int create_configfs_group(void)
+{
+	close_configfs_group();
+	configfs_group_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
+							     &configfs_group_preexisting);
+
+	return configfs_group_fd;
+}
+
 static void restore(int sig)
 {
-	int configfs_fd;
 
 	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", bus_addr);
 
-	/* Drop all custom configfs settings from subtests */
-	configfs_fd = igt_configfs_open("xe");
-	if (configfs_fd >= 0 && !configfs_group_preexisting)
-		igt_fs_remove_dir(configfs_fd, bus_addr);
-	close(configfs_fd);
+	close_configfs_group();
+	if (configfs_fd >= 0) {
+		close(configfs_fd);
+		configfs_fd = -1;
+	}
 
 	/* Bind again a clean driver with no custom settings */
 	igt_kmod_bind("xe", bus_addr);
@@ -373,7 +393,7 @@ static void set_bus_addr(int fd)
 
 int igt_main()
 {
-	int fd, configfs_fd, configfs_device_fd;
+	int fd, configfs_device_fd;
 	bool is_vf_device;
 	bool has_survivability;
 	const char *engine = NULL;
@@ -409,81 +429,67 @@ int igt_main()
 	igt_subtest("survivability-mode") {
 		igt_require(has_survivability);
 		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
-		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
-								      &configfs_group_preexisting);
+		configfs_device_fd = create_configfs_group();
 		test_survivability_mode(configfs_device_fd);
-		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
-						configfs_group_preexisting);
+		close_configfs_group();
 	}
 
 	igt_describe("Validate engines_allowed with invalid options");
 	igt_subtest("engines-allowed-invalid") {
-		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
-								      &configfs_group_preexisting);
+		configfs_device_fd = create_configfs_group();
 		test_engines_allowed_invalid(configfs_device_fd);
-		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
-						configfs_group_preexisting);
+		close_configfs_group();
 	}
 
 	igt_describe("Validate engines_allowed");
 	igt_subtest("engines-allowed") {
-		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
-								      &configfs_group_preexisting);
+		configfs_device_fd = create_configfs_group();
 		test_engines_allowed(configfs_device_fd);
-		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
-						configfs_group_preexisting);
+		close_configfs_group();
 	}
 
 	igt_describe("Validate gt_types_allowed");
 	igt_subtest("gt-types-allowed") {
-		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
-								      &configfs_group_preexisting);
+		configfs_device_fd = create_configfs_group();
 		test_gt_types_allowed(configfs_device_fd);
-		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
-						configfs_group_preexisting);
+		close_configfs_group();
 	}
 
 	igt_describe("Validate ctx_restore_post_bb with invalid options");
 	igt_subtest("ctx-restore-post-bb-invalid") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
-								      &configfs_group_preexisting);
+		configfs_device_fd = create_configfs_group();
 		test_ctx_restore_invalid(configfs_device_fd, "post");
-		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
-						configfs_group_preexisting);
+		close_configfs_group();
 	}
 
 	igt_describe("Validate ctx_restore_post_bb");
 	igt_subtest("ctx-restore-post-bb") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
-								      &configfs_group_preexisting);
+		configfs_device_fd = create_configfs_group();
 		test_ctx_restore(configfs_device_fd, "post", engine);
-		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
-						configfs_group_preexisting);
+		close_configfs_group();
 	}
 
 	igt_describe("Validate ctx_restore_mid_bb with invalid options");
 	igt_subtest("ctx-restore-mid-bb-invalid") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
-								      &configfs_group_preexisting);
+		configfs_device_fd = create_configfs_group();
 		test_ctx_restore_invalid(configfs_device_fd, "mid");
-		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
-						configfs_group_preexisting);
+		close_configfs_group();
 	}
 
 	igt_describe("Validate ctx_restore_mid_bb");
 	igt_subtest("ctx-restore-mid-bb") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
-								      &configfs_group_preexisting);
+		configfs_device_fd = create_configfs_group();
 		test_ctx_restore(configfs_device_fd, "mid", engine);
-		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
-						configfs_group_preexisting);
+		close_configfs_group();
 	}
 
 	igt_fixture() {
+		close_configfs_group();
 		close(configfs_fd);
+		configfs_fd = -1;
 	}
 }
diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 015b22051..757ddcc6b 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -39,7 +39,8 @@
  */
 
 static char bus_addr[NAME_MAX];
-
+static int configfs_fd = -1;
+static int active_configfs_device_fd = -1;
 static bool configfs_group_preexisting;
 
 static void ignore_wedged_in_dmesg(void)
@@ -156,17 +157,28 @@ static int find_i2c_adapter(struct pci_device *pci_xe)
 	return i2c_adapter;
 }
 
+static void close_configfs_group(void)
+{
+	if (active_configfs_device_fd < 0)
+		return;
+
+	igt_configfs_close_device_group(configfs_fd, bus_addr, active_configfs_device_fd,
+					configfs_group_preexisting);
+	active_configfs_device_fd = -1;
+	configfs_group_preexisting = false;
+}
+
 static void restore(int sig)
 {
-	int configfs_fd;
 
 	igt_audio_driver_unload(NULL);
 	igt_kmod_unbind("xe", bus_addr);
 
-	configfs_fd = igt_configfs_open("xe");
-	if (configfs_fd >= 0 && !configfs_group_preexisting)
-		igt_fs_remove_dir(configfs_fd, bus_addr);
-	close(configfs_fd);
+	close_configfs_group();
+	if (configfs_fd >= 0) {
+		close(configfs_fd);
+		configfs_fd = -1;
+	}
 
 	igt_kmod_bind("xe", bus_addr);
 }
@@ -210,7 +222,7 @@ static void test_spinner_after_recovery(int fd)
 
 int igt_main()
 {
-	int fd, configfs_fd, configfs_device_fd;
+	int fd;
 	struct pci_device *pci_xe;
 	bool vf_device;
 
@@ -223,14 +235,15 @@ int igt_main()
 		igt_device_get_pci_slot_name(fd, bus_addr);
 		configfs_fd = igt_configfs_open("xe");
 		igt_require(configfs_fd != -1);
-		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
-								      &configfs_group_preexisting);
+		active_configfs_device_fd =
+			igt_configfs_create_device_group(configfs_fd, bus_addr,
+							 &configfs_group_preexisting);
 		igt_install_exit_handler(restore);
 	}
 
 	igt_describe("Validate i2c adapter functionality in survivability mode");
 	igt_subtest("i2c-functionality") {
-		test_i2c_functionality(configfs_device_fd, pci_xe);
+		test_i2c_functionality(active_configfs_device_fd, pci_xe);
 		drm_close_driver(fd);
 		fd = drm_open_driver(DRIVER_XE);
 	}
@@ -261,9 +274,9 @@ int igt_main()
 	}
 
 	igt_fixture() {
-		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
-						configfs_group_preexisting);
+		close_configfs_group();
 		close(configfs_fd);
+		configfs_fd = -1;
 		drm_close_driver(fd);
 	}
 }
-- 
2.43.0

