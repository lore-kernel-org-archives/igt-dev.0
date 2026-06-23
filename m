Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7DBCD98F2
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 11:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0682410EA9A;
	Tue, 23 Jun 2026 11:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j//2uu6r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A8310EA9A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782213333; x=1813749333;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=otQDI2cs4CC28LNPUpr7VT6jZ0rRfxHGDoBpq01bG6I=;
 b=j//2uu6rjd7qK83W4Xa+8e400Ehn9jKWfrOmlPGwtjB7th8iJphfR8DF
 fz4w3XK2BG55y8vY5ZsGrxKShkIsNodArLhD+/VXoD3sORyqrrwxM62Pc
 kweQPw9N/uc56RAkyzOIQQ3JsKT9gJ2G9BO6/moJ0qFBXkgLJmwfcA85A
 4e0uGYjHlePw/EklpdQd7+jjpVCT1fgkQ1parbGN+AKBE5mScFzRsKbPz
 TI65Kob/PQoPfwk8aqgpU0I+3ytRgbsXeBAg+TxyuxA+xmYCIUeb5cU+f
 Ej/avQMWtFlRRIEJDtWjTK2GZaePiKCA+nYtLT1uJbDjuzEA9Zj4WY6JR g==;
X-CSE-ConnectionGUID: wi0d/YhCQMKgPkGmTyN34A==
X-CSE-MsgGUID: Ko5qaAUJRYyUnFzSEUqkww==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="85507705"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="85507705"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 04:04:05 -0700
X-CSE-ConnectionGUID: 8u83WMOUSRKznt+P6qhFDA==
X-CSE-MsgGUID: G1a0FMTKS6idXjDXCP2jqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="273542629"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa001.fm.intel.com with ESMTP; 23 Jun 2026 04:04:05 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v4] tests/intel/xe_configfs: Improve coverage of show/store
 paths
Date: Tue, 23 Jun 2026 16:28:55 +0530
Message-ID: <20260623105855.171040-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416090755.1025223-1-smitha.balasubramanyam@intel.com>
References: <20260416090755.1025223-1-smitha.balasubramanyam@intel.com>
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

Add two new subtests that exercise both the store and show paths of
the enable_psmi and sriov/max_vfs configfs attributes:

  - psmi-enable-disable
  - sriov-max-vfs-store-show

Each writes a value with the driver unbound and reads it back to
confirm the stored value is reported correctly.

Also enhance the existing subtests to additionally cover the show
path of their respective attributes:

  - survivability-mode: read survivability_mode back after enabling
    it, confirming the configfs value reflects what was stored.
  - engines-allowed: read engines_allowed back after each write.
  - gt-types-allowed: read gt_types_allowed back after each write,
    requiring a non-empty readback when the input was non-empty.

Changes since v3:
 Fixed the rebase issue

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_configfs.c | 103 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 450c0a119..0f3e3ef27 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -94,6 +94,10 @@ static void test_survivability_mode(int configfs_device_fd)
 	fd = open(path, O_RDONLY);
 	igt_assert_f(fd >= 0, "Survivability mode not set\n");
 	close(fd);
+
+	/* Verify survivability_mode was applied and persists in configfs */
+	igt_assert_f(igt_sysfs_get_boolean(configfs_device_fd, "survivability_mode"),
+		     "survivability_mode read back false after enabling\n");
 }
 
 /**
@@ -147,9 +151,16 @@ static void test_engines_allowed(int configfs_device_fd)
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
 		const char *v = values[i];
+		char *readback;
 
 		igt_debug("Writing '%s' to engines_allowed\n", v);
 		igt_assert(igt_sysfs_set(configfs_device_fd, "engines_allowed", v));
+
+		readback = igt_sysfs_get(configfs_device_fd, "engines_allowed");
+		igt_assert_f(readback, "Failed to read engines_allowed after writing '%s'\n", v);
+		igt_debug("engines_allowed: wrote '%s' -> read back '%s'\n",
+			  v, readback);
+		free(readback);
 	}
 }
 
@@ -178,9 +189,23 @@ static void test_gt_types_allowed(int configfs_device_fd)
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
 		const char *v = values[i];
+		char *readback;
 
 		igt_debug("Writing '%s' to gt_types_allowed\n", v);
 		igt_assert(igt_sysfs_set(configfs_device_fd, "gt_types_allowed", v));
+
+		/*
+		 * Read the gt_types_allowed attr back. Writing "" clears
+		 * the typemask, so allow an empty readback only when the
+		 * input was empty.
+		 */
+		readback = igt_sysfs_get(configfs_device_fd, "gt_types_allowed");
+		igt_assert_f(readback,
+			     "Failed to read gt_types_allowed after writing '%s'\n", v);
+		igt_assert_f(*v == '\0' || *readback != '\0',
+			     "gt_types_allowed read back empty after writing non-empty '%s'\n", v);
+		igt_debug("gt_types_allowed read back: '%s'\n", readback);
+		free(readback);
 	}
 
 	for (size_t i = 0; i < ARRAY_SIZE(invalid_values); i++) {
@@ -350,6 +375,54 @@ static void test_ctx_restore(int configfs_device_fd, const char *type,
 	}
 }
 
+/**
+ * SUBTEST: psmi-enable-disable
+ * Description: Validate enable_psmi attribute by round-tripping enable/disable
+ */
+static void test_psmi_enable_disable(int configfs_device_fd)
+{
+	/* Check presence of the enable_psmi configfs attribute */
+	igt_assert(!igt_sysfs_get_boolean(configfs_device_fd, "enable_psmi"));
+
+	/* Unbind the driver so the attribute becomes writable */
+	igt_audio_driver_unload(NULL);
+	igt_kmod_unbind("xe", bus_addr);
+
+	/* Enable: write "1" and read it back */
+	igt_assert(igt_sysfs_set(configfs_device_fd, "enable_psmi", "1"));
+	igt_assert_f(igt_sysfs_get_boolean(configfs_device_fd, "enable_psmi"),
+		     "Failed to read enable_psmi after writing 1\n");
+
+	/* Disable: write "0" and read it back */
+	igt_assert(igt_sysfs_set(configfs_device_fd, "enable_psmi", "0"));
+	igt_assert_f(!igt_sysfs_get_boolean(configfs_device_fd, "enable_psmi"),
+		     "Failed to read enable_psmi after writing 0\n");
+}
+
+/**
+ * SUBTEST: sriov-max-vfs-store-show
+ * Description: Validate SRIOV Max VFs store and show functionality
+ */
+static void test_sriov_max_vfs_store_show(int configfs_device_fd)
+{
+	uint32_t max_vfs = 0;
+	const uint32_t requested_max_vfs = 1;
+
+	/* Unbind the driver so the attribute becomes writable */
+	igt_audio_driver_unload(NULL);
+	igt_kmod_unbind("xe", bus_addr);
+
+	/* Perform sriov/max_vfs store/show operations. */
+	igt_require_f(igt_sysfs_set(configfs_device_fd, "sriov/max_vfs", "1"),
+		      "Failed to write sriov/max_vfs\n");
+	igt_debug("sriov/max_vfs wrote value: %u\n", requested_max_vfs);
+
+	igt_require_f(__igt_sysfs_get_u32(configfs_device_fd, "sriov/max_vfs", &max_vfs),
+		      "Failed to read sriov/max_vfs after writing 1\n");
+	igt_debug("sriov/max_vfs read back value: %u\n", max_vfs);
+	igt_assert_eq_u32(max_vfs, requested_max_vfs);
+}
+
 static void set_bus_addr(int fd)
 {
 	pci_dev = igt_device_get_pci_device(fd);
@@ -377,7 +450,8 @@ static void close_configfs_group(int configfs_fd, int configfs_device_fd)
 int igt_main()
 {
 	int fd, configfs_fd, configfs_device_fd;
-	bool is_vf_device;
+	bool is_vf_device, is_pf_device;
+	unsigned int enabled_vfs = 0;
 	bool has_survivability;
 	const char *engine = NULL;
 
@@ -386,6 +460,9 @@ int igt_main()
 
 		fd = drm_open_driver(DRIVER_XE);
 		is_vf_device = intel_is_vf_device(fd);
+		is_pf_device = igt_sriov_is_pf(fd);
+		if (is_pf_device)
+			enabled_vfs = igt_sriov_get_enabled_vfs(fd);
 		has_survivability = xe_has_survivability(fd);
 		set_bus_addr(fd);
 
@@ -470,6 +547,30 @@ int igt_main()
 		close_configfs_group(configfs_fd, configfs_device_fd);
 	}
 
+	igt_describe("Validate enable_psmi enable/disable round-trip");
+	igt_subtest("psmi-enable-disable") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		test_psmi_enable_disable(configfs_device_fd);
+		close_configfs_group(configfs_fd, configfs_device_fd);
+	}
+
+	igt_describe("Validate SRIOV Max Vfs Store and Show functionality");
+	igt_subtest("sriov-max-vfs-store-show") {
+		if (!is_pf_device)
+			igt_skip("sriov-max-vfs-store-show requires an SR-IOV PF device\n");
+
+		if (enabled_vfs != 0)
+			igt_skip("sriov-max-vfs-store-show requires no enabled VFs (found %u)\n",
+				 enabled_vfs);
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		if (!igt_sysfs_has_attr(configfs_device_fd, "sriov/max_vfs")) {
+			close_configfs_group(configfs_fd, configfs_device_fd);
+			igt_skip("configfs sriov/max_vfs attribute is not available on this platform\n");
+		}
+		test_sriov_max_vfs_store_show(configfs_device_fd);
+		close_configfs_group(configfs_fd, configfs_device_fd);
+	}
+
 	igt_fixture() {
 		close(configfs_fd);
 	}
-- 
2.43.0

