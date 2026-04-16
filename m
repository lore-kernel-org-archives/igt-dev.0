Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C857EF8A145
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350AD10E84D;
	Thu, 16 Apr 2026 09:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHcCvHcu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3318210E84B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776330309; x=1807866309;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yCn5pn2+tROkc7tZ+NEWx98UhyU50PDnqQIHX/O5z2A=;
 b=PHcCvHcu7ByksmLbfEyxK3q6HCd5I2OHbgy0yYDK0PMBmxsKmAY3L94R
 z1wrkAli8aJixbb6QGDiIMZsSTxLTyDCCLaklD7Tcg7l1chOW1JW288TL
 an3DO+Z+8b2TEtWUgjI468yA1Zj3GV3dhFzdmfoWMRKKhUM9o+UUMLSsy
 946R+lr/1YJagBHKMIjLav8VdjmNpXvoCc1oZ1UheFgagMrTrIrY24xq9
 bydO0E1+EG3tMAlfH5Wavr8MX6FLGirRUPsJvZV0A1PEqAkkH5MjJ6O4z
 TrW9TBOCUt7hW0XeWjlpD3+m9dq2qMzykuj3/r8zWU6m9EW/GRu5iHHVp g==;
X-CSE-ConnectionGUID: K61nYjQ2QOOI+vircViuGw==
X-CSE-MsgGUID: 84n69PhASQ2apLPlFJ225A==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="99971868"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="99971868"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:05:09 -0700
X-CSE-ConnectionGUID: 0qWWBLJHS3emBhquvTihLQ==
X-CSE-MsgGUID: 7Im83eHrQ+aJLanZTGUR2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="230925786"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa007.jf.intel.com with ESMTP; 16 Apr 2026 02:05:10 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel: Trigger configfs attr callbacks
Date: Thu, 16 Apr 2026 14:37:55 +0530
Message-ID: <20260416090755.1025223-1-smitha.balasubramanyam@intel.com>
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

Coverage improvement achieved by adding new subtests
for show and store functionality of enable_psmi and sriov_max_vfs
Enhanced existing subtests like survivability_mode, gt_types_allowed,
engines_allowed, to cover show and store functions.

Add a test vector with a partially invalid second command in the
ctx_restore_*_bb invalid-case suite to ensure a malformed multi-line
BB is rejected and the stored BB remains empty (rollback).

Replaced the hardcoded "ctx_restore_post_bb" write with the computed
file name ("ctx_restore_%s_bb") in test_ctx_restore_invalid so the
invalid-case tests work for both "post" and "mid" variants.

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_configfs.c | 102 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 755524e7c..bde52e6ef 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -85,6 +85,13 @@ static void test_survivability_mode(int configfs_device_fd)
 	char path[PATH_MAX];
 	int fd;
 
+	/* Buffer for reading attribute values */
+	char buf[256];
+
+	/* survivability_mode_show */
+	igt_assert(igt_sysfs_read(configfs_device_fd, "survivability_mode",
+				buf, sizeof(buf) - 1));
+
 	/* Enable survivability mode */
 	set_survivability_mode(configfs_device_fd, true);
 
@@ -138,6 +145,13 @@ static void test_engines_allowed(int configfs_device_fd)
 		"rcs000",
 	};
 
+	/* Buffer for reading attribute values */
+	char buf[256];
+
+	/* engines_allowed_show */
+	igt_assert(igt_sysfs_read(configfs_device_fd, "engines_allowed",
+				buf, sizeof(buf) - 1));
+
 	/*
 	 * These only test if engine parsing is correct, so just make sure
 	 * there's no device bound
@@ -166,8 +180,25 @@ static void test_gt_types_allowed(int configfs_device_fd)
 	};
 
 	static const char *invalid_values[] = {
-                "check",
-        };
+		"check",
+	};
+
+	/* Buffer for reading attribute values */
+	char buf[256];
+
+	/* gt_types_allowed_show */
+	igt_assert(igt_sysfs_read(configfs_device_fd, "gt_types_allowed",
+				buf, sizeof(buf) - 1));
+
+	/* gt_types_allowed_store
+	 * Store may succeed or fail depending on platform/device state.
+	 * Accept success (errno == 0) or expected policy failures.
+	 */
+	errno = 0;
+	igt_sysfs_set(configfs_device_fd, "gt_types_allowed", "0");
+	igt_assert_f(errno == 0 || errno == EBUSY || errno == EINVAL,
+			"Unexpected errno from gt_types_allowed store: %d\n", errno);
+
 
 	/*
 	 * These only test if gt type parsing is correct, so just make sure
@@ -225,12 +256,16 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 		{ .test = "invalid-engine-instance",
 		  .in = "rcs0 reg 4F100 DEADBEEF",
 		},
+		{ .test = "invalid-second-command",
+			.in = "rcs cmd 11000001 4F100 DEADBEEF\n"
+				"rcs cmd 11000001 4F10G DEADBEEF",
+		},
 	};
 	char buf[4096] = { };
 	char file[64] = { };
 
 	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
-	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
+	igt_sysfs_set(configfs_device_fd, file, "");
 
 	/*
 	 * These only test if command parsing is correct,
@@ -335,6 +370,53 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
 	}
 }
 
+/**
+ * SUBTEST: psmi_store_show
+ * Description: Validate PSMI Store and Show functionality
+ */
+static void test_psmi_store_show(int configfs_device_fd)
+{
+	/* Buffer for reading attribute values */
+	char buf[256];
+
+	/* enable_psmi_show */
+	igt_assert(igt_sysfs_read(configfs_device_fd, "enable_psmi",
+				buf, sizeof(buf) - 1));
+
+	/* enable_psmi_store
+	 * Enabling PSMI on an active device is expected to fail with EBUSY.
+	 */
+	errno = 0;
+	igt_sysfs_set(configfs_device_fd, "enable_psmi", "1");
+	igt_assert_f(errno == EBUSY,
+			"Expected EBUSY from enable_psmi_store, got %d\n", errno);
+
+}
+
+/**
+ * SUBTEST: sriov_max_vfs_store_show
+ * Description: Validate SRIOV Max VFs store and show functionality
+ */
+static void test_sriov_max_vfs_store_show(int configfs_device_fd)
+{
+	/* Buffer for reading attribute values */
+	char buf[256];
+
+	/* sriov_max_vfs_show */
+	igt_assert(igt_sysfs_read(configfs_device_fd, "sriov/max_vfs",
+				buf, sizeof(buf) - 1));
+
+	/* sriov_max_vfs_store
+	 * Changing max_vfs usually fails once device is active.
+	 * Accept expected policy failures while exercising store path.
+	 */
+	errno = 0;
+	igt_sysfs_set(configfs_device_fd, "sriov/max_vfs", "1");
+	igt_assert_f(errno == EBUSY,
+			"Expected EBUSY from sriov_max_vfs_store, got %d\n", errno);
+
+}
+
 static void set_bus_addr(int fd)
 {
 	pci_dev = igt_device_get_pci_device(fd);
@@ -439,6 +521,20 @@ int igt_main()
 		close_configfs_group(configfs_fd, configfs_device_fd);
 	}
 
+	igt_describe("Validate PSMI Store and Show functionality");
+	igt_subtest("psmi_store_show") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		test_psmi_store_show(configfs_device_fd);
+		close_configfs_group(configfs_fd, configfs_device_fd);
+	}
+
+	igt_describe("Validate SRIOV Max Vfs Store and Show functionality");
+	igt_subtest("sriov_max_vfs_store_show") {
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

