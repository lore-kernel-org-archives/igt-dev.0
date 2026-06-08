Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F61CD8C9D
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 12:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9288D10F2AF;
	Mon,  8 Jun 2026 12:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBfMyt+U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A1910F2AF
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780920568; x=1812456568;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GHfy20q3n4cWEoxrPPSDIQOzj0+QV1uhrwEjiYqsGVI=;
 b=iBfMyt+UI4he+Yr96526zSAk4BwZ5w6I8+qJJxFewqIS+UIMujDN9c+2
 ztJ/vCsyatZ/fvrdhgl08ADfgM6Mt7D5zBr2puUswnqBEJWBNrCWdIW/b
 xmGCU159d2jmC/l+8ro6aHX1cMmrZEe/GhsA3Stlh4B943uv+GPJ1MDi1
 AmwUQGa0MJ7TWyAZ4vi6Sf5Zz1lWQxZHSol/FjGYp+F6KmUrvTPNstkXY
 QPoeuKiR23WXEzQXS93TSbWhIJVfPsPPpBWWdaEz6c6mskiADk4ZwCXpS
 yPOisNAg8Mik4VuOl3i9XvF7So8e8IPuQcO9qEYB7+F1UzLnZr1tpDdOJ w==;
X-CSE-ConnectionGUID: BvaLYycDSXufUX+qfAk8IA==
X-CSE-MsgGUID: ZmosHcupQ8OtSDYnqhBZ1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="107093727"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="107093727"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 05:09:27 -0700
X-CSE-ConnectionGUID: NFwyvNkwQFSv1D4srbFEnw==
X-CSE-MsgGUID: 9pAf+/yjTHGSxYpmLO78Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247400620"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa004.fm.intel.com with ESMTP; 08 Jun 2026 05:09:26 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH v2] tests/intel/xe_configfs: Improve coverage of show/store
 paths
Date: Mon,  8 Jun 2026 17:45:11 +0530
Message-ID: <20260608121511.2218639-1-smitha.balasubramanyam@intel.com>
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

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
Changes since v1:
 - survivability-mode: read survivability_mode back via
   igt_sysfs_get_boolean() to also cover the show path.
 - engines-allowed: read engines_allowed back after each write and
   assert the show path returns a non-NULL string.
 - gt-types-allowed: read gt_types_allowed back after each write and
   require a non-empty readback when the input was non-empty.
 - New subtest psmi-enable-disable: round-trip enable_psmi by writing
   "1" then "0" and reading back each time.
 - New subtest sriov-max-vfs-store-show: write sriov/max_vfs and read
   it back, guarded by PF-capable + no-active-VFs requires.

Apologies for the long delay between v1 and v2.

 tests/intel/xe_configfs.c | 97 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index e7c797eb7..88ca16f7d 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -94,6 +94,10 @@ static void test_survivability_mode(int configfs_device_fd)
 	fd = open(path, O_RDONLY);
 	igt_assert_f(fd >= 0, "Survivability mode not set\n");
 	close(fd);
+
+	/* Confirm the stored value through configfs */
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
+		igt_assert_f(readback, "engines_allowed show returned NULL\n");
+		igt_debug("engines_allowed: wrote '%s' -> read back '%s'\n",
+			 v, readback);
+		free(readback);
 	}
 }
 
@@ -166,8 +177,8 @@ static void test_gt_types_allowed(int configfs_device_fd)
 	};
 
 	static const char *invalid_values[] = {
-                "check",
-        };
+		"check",
+	};
 
 	/*
 	 * These only test if gt type parsing is correct, so just make sure
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
+			     "gt_types_allowed read failed after writing '%s'\n", v);
+		igt_assert_f(*v == '\0' || *readback != '\0',
+			     "gt_types_allowed read back empty after writing non-empty '%s'\n", v);
+		igt_debug("gt_types_allowed read back: '%s'\n", readback);
+		free(readback);
 	}
 
 	for (size_t i = 0; i < ARRAY_SIZE(invalid_values); i++) {
@@ -350,6 +375,50 @@ static void test_ctx_restore(int configfs_device_fd, const char *type,
 	}
 }
 
+/**
+ * SUBTEST: psmi-enable-disable
+ * Description: Validate enable_psmi attribute by round-tripping enable/disable
+ */
+static void test_psmi_enable_disable(int configfs_device_fd)
+{
+	/* enable_psmi defaults to disabled before any write */
+	igt_assert_f(!igt_sysfs_get_boolean(configfs_device_fd, "enable_psmi"),
+		     "enable_psmi expected to start disabled\n");
+
+	/* Unbind the driver so the attribute becomes writable */
+	igt_audio_driver_unload(NULL);
+	igt_kmod_unbind("xe", bus_addr);
+
+	/* Enable: write "1" and read it back */
+	igt_assert(igt_sysfs_set(configfs_device_fd, "enable_psmi", "1"));
+	igt_assert_f(igt_sysfs_get_boolean(configfs_device_fd, "enable_psmi"),
+		     "enable_psmi read back false after writing 1\n");
+
+	/* Disable: write "0" and read it back */
+	igt_assert(igt_sysfs_set(configfs_device_fd, "enable_psmi", "0"));
+	igt_assert_f(!igt_sysfs_get_boolean(configfs_device_fd, "enable_psmi"),
+		     "enable_psmi read back true after writing 0\n");
+}
+
+/**
+ * SUBTEST: sriov-max-vfs-store-show
+ * Description: Validate SRIOV Max VFs store and show functionality
+ */
+static void test_sriov_max_vfs_store_show(int configfs_device_fd)
+{
+	/* Check presence of the sriov/max_vfs configfs attribute */
+	igt_debug("sriov/max_vfs initial value: %u\n",
+		  igt_sysfs_get_u32(configfs_device_fd, "sriov/max_vfs"));
+
+	/* Unbind the driver so the attribute becomes writable */
+	igt_audio_driver_unload(NULL);
+	igt_kmod_unbind("xe", bus_addr);
+
+	/* Write to sriov/max_vfs and read it back to confirm the value */
+	igt_assert(igt_sysfs_set(configfs_device_fd, "sriov/max_vfs", "1"));
+	igt_assert_eq_u32(igt_sysfs_get_u32(configfs_device_fd, "sriov/max_vfs"), 1);
+}
+
 static void set_bus_addr(int fd)
 {
 	pci_dev = igt_device_get_pci_device(fd);
@@ -378,7 +447,8 @@ int igt_main()
 {
 	int fd, configfs_fd, configfs_device_fd;
 	uint32_t devid;
-	bool is_vf_device;
+	bool is_vf_device, is_pf_device;
+	unsigned int enabled_vfs = 0;
 	const char *engine = NULL;
 
 	igt_fixture() {
@@ -387,6 +457,9 @@ int igt_main()
 		fd = drm_open_driver(DRIVER_XE);
 		devid = intel_get_drm_devid(fd);
 		is_vf_device = intel_is_vf_device(fd);
+		is_pf_device = igt_sriov_is_pf(fd);
+		if (is_pf_device)
+			enabled_vfs = igt_sriov_get_enabled_vfs(fd);
 		set_bus_addr(fd);
 
 		xe_for_each_engine(fd, hwe) {
@@ -470,6 +543,24 @@ int igt_main()
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
+		igt_require_f(is_pf_device, "device is not SR-IOV PF-capable\n");
+		igt_require_f(enabled_vfs == 0,
+			      "VFs already enabled (%u); test requires a clean state\n",
+			      enabled_vfs);
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		test_sriov_max_vfs_store_show(configfs_device_fd);
+		close_configfs_group(configfs_fd, configfs_device_fd);
+	}
+
 	igt_fixture() {
 		close(configfs_fd);
 	}
-- 
2.43.0

