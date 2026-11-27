Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230CF606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Syp8Ofag
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2C9112A02;
	Fri, 27 Nov 2026 10:27:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39C41129E7
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 10:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795775095; x=1827311095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=29biMDsUIjJmE9tAsc7EZGpW29V8tN+PWeXu77yrVtU=;
 b=Syp8OfagP6Ii8k1NbQM5xZIRU0fpOq6wbhmyJA4P/JvPFPGhtGieqGrL
 mpKVPatpZ8VUXU2jXzNaDRDFnROyHWgn+wYyEJhO0vS8q4vCo6FZTwJKD
 aMZggk8PXCoNvdLev5gUSfZPWop4bnHMGTpEtWNJkrPpmgPEr7N9FK0PP
 dSAhCGaEZX2lP37vyg8c2r1lPlNKDapC95FxXe1fUi7dhDh9vfJ83AyXT
 tIcWvDth5qyfpjNO7oy8JkgmJdQmCWh+LTc5O2Gg8JRIxnz90uyoGAAXr
 RApbp9o3id48ponGiEVPqwide67HYqRuY9swU32NPWtr5rSp7RjEe7XtI Q==;
X-CSE-ConnectionGUID: wE63yDQOSSKVvbi1soxT9g==
X-CSE-MsgGUID: hQ5s2AfUQgasRPZddhQ7NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4587272"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4587272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 02:24:55 -0800
X-CSE-ConnectionGUID: i6/lhgv9QX2tZb8hITPI2Q==
X-CSE-MsgGUID: Q44C8rp9RMOxa80rjxJE2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12884208"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 02:24:53 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com, sk.anirban@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t 1/2] tests/intel/xe_configfs: Avoid leaking configfs
 device groups
Date: Fri, 27 Nov 2026 15:54:40 +0530
Message-ID: <20261127102438.2249575-5-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127102438.2249575-4-soham.purkait@intel.com>
References: <20261127102438.2249575-4-soham.purkait@intel.com>
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
test-created groups and fds in the configfs tests.

v1:
 - Split the patch. (Anirban)
 - Rectify function description. (Anirban)
 - Remove blank line. (Anirban)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/igt_configfs.c        |  6 ++-
 tests/intel/xe_configfs.c | 87 +++++++++++++++++++++------------------
 2 files changed, 51 insertions(+), 42 deletions(-)

diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
index 7bbeca746..0783127dc 100644
--- a/lib/igt_configfs.c
+++ b/lib/igt_configfs.c
@@ -92,7 +92,8 @@ int igt_configfs_open(const char *name)
  * igt_configfs_create_device_group: create or reuse a device's configfs group
  * @configfs_fd: configfs directory fd
  * @name: name of the device group
- * @preexisting: set to true when @name already existed
+ * @preexisting: optional, may be NULL. If non-NULL, set to true when @name
+ * already existed, false otherwise
  *
  * Creates the configfs group @name under @configfs_fd. If the group already
  * exists, it is opened and reused instead.
@@ -106,6 +107,9 @@ int igt_configfs_create_device_group(int configfs_fd, const char *name,
 	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
 	int device_fd;
 
+	if (preexisting)
+		*preexisting = false;
+
 	device_fd = igt_fs_create_dir(configfs_fd, name, mode);
 	if (device_fd == -EEXIST) {
 		if (preexisting)
diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 161262a1a..3ebd8fc07 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -26,7 +26,8 @@
 static char bus_addr[NAME_MAX];
 static struct pci_device *pci_dev;
 static char *snd_driver;
-
+static int configfs_fd = -1;
+static int configfs_group_fd = -1;
 static bool configfs_group_preexisting;
 
 static bool check_registers(const uint32_t reg[], const uint32_t val[],
@@ -54,18 +55,36 @@ out:
 	return ret;
 }
 
-static void restore(int sig)
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
 {
-	int configfs_fd;
+	close_configfs_group();
+	configfs_group_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
+							     &configfs_group_preexisting);
 
+	return configfs_group_fd;
+}
+
+static void restore(int sig)
+{
 	igt_audio_driver_unload(&snd_driver);
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
@@ -378,7 +397,7 @@ static void set_bus_addr(int fd)
 
 int igt_main()
 {
-	int fd, configfs_fd, configfs_device_fd;
+	int fd, configfs_device_fd;
 	bool is_vf_device;
 	bool has_survivability;
 	const char *engine = NULL;
@@ -414,81 +433,67 @@ int igt_main()
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
-- 
2.43.0

