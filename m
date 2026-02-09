Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B88E81BAF
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 12:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D6810E3D6;
	Mon,  9 Feb 2026 12:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKEtA+Hx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EDC10E3D6
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 12:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770641173; x=1802177173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vtd6V+s/+hJ232a3nf34UQ4txCxNBmC9EFTvHttaZ8o=;
 b=ZKEtA+Hx1FiYezseLZO15KPRbWKdAsPiSSGCONq9O/RKl3THX0gm6BC3
 7AYUfYcQSEdEf741miIVcHH714O6SDqNzT2cXqqLNSxzK9Ds+iBzmmXzP
 XkvCz1kVmmQjRfj69gHdpaia1mnnyG57CYYeZXCmY7KUaCK6u8UahWgSs
 LgUC1pcBPQC5qEcVPjyqR89Bve5jtMAk/W2Y8ypnZi4Gj4pbEvMPTcbkW
 U3A/j1b0V3y+zPjEdVgg5r7R6FkIapC5Ukx8TcnU4+XVjFYeP0AgKZNkp
 3xEQxpQvscgGIIthyLq8GaLC1t07V/6qeH/xN2Ia/tI0qmJYD3/CsOiiB Q==;
X-CSE-ConnectionGUID: mySfIl0MRoqZSZNY2sOMdQ==
X-CSE-MsgGUID: 6FYUK3qdRfmfk5MCcTy1ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="94395817"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="94395817"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 04:46:13 -0800
X-CSE-ConnectionGUID: UFk3yO8qQJaru5ermAqR0A==
X-CSE-MsgGUID: ucM9MDHZQlGRUxkh9NWxrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="211194617"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa010.fm.intel.com with ESMTP; 09 Feb 2026 04:46:11 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Cc: michal.wajdeczko@intel.com,
	Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] tests/intel/xe_configfs: Reset configfs group after each
 subtest
Date: Mon,  9 Feb 2026 18:48:54 +0530
Message-ID: <20260209131853.145876-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

The xe_configfs test uses a shared configfs group across all subtests.
When subtests modify configfs attributes without resetting them, the
modified values persist and affect subsequent subtests. For example,
ctx-restore-mid-bb reports register value mismatches due to stale
batch buffer data from previous subtests.

Fix by removing the configfs device directory after each subtest and
letting the next subtest recreate it to get default values as
hardcoded in the driver.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6204
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
Hi Kamil,
Thank you for the review, I used helper function
in v3 version.

v2->v3: Use helper function (Kamil)
v1->v2:
  Instead of manually resetting each attribute,
  it's cleaner to remove and recreate the configfs group after
  each subtests. (Michal)

 tests/intel/xe_configfs.c | 45 +++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index d2dfd2e87..59c9359f5 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -346,6 +346,12 @@ static int create_device_configfs_group(int configfs_fd)
 	return configfs_device_fd;
 }
 
+static void close_configfs_group(int configfs_fd, int configfs_device_fd)
+{
+	close(configfs_device_fd);
+	igt_fs_remove_dir(configfs_fd, bus_addr);
+}
+
 int igt_main()
 {
 	int fd, configfs_fd, configfs_device_fd;
@@ -361,7 +367,6 @@ int igt_main()
 
 		configfs_fd = igt_configfs_open("xe");
 		igt_require(configfs_fd != -1);
-		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		igt_install_exit_handler(restore);
 	}
 
@@ -369,39 +374,61 @@ int igt_main()
 	igt_subtest("survivability-mode") {
 		igt_require(IS_BATTLEMAGE(devid));
 		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_survivability_mode(configfs_device_fd);
+		close_configfs_group(configfs_fd, configfs_device_fd);
 	}
 
 	igt_describe("Validate engines_allowed with invalid options");
-	igt_subtest("engines-allowed-invalid")
+	igt_subtest("engines-allowed-invalid") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_engines_allowed_invalid(configfs_device_fd);
+		close_configfs_group(configfs_fd, configfs_device_fd);
+	}
 
 	igt_describe("Validate engines_allowed");
-	igt_subtest("engines-allowed")
+	igt_subtest("engines-allowed") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_engines_allowed(configfs_device_fd);
+		close_configfs_group(configfs_fd, configfs_device_fd);
+	}
 
 	igt_describe("Validate gt_types_allowed");
-	igt_subtest("gt-types-allowed")
+	igt_subtest("gt-types-allowed") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_gt_types_allowed(configfs_device_fd);
+		close_configfs_group(configfs_fd, configfs_device_fd);
+	}
 
 	igt_describe("Validate ctx_restore_post_bb with invalid options");
-	igt_subtest("ctx-restore-post-bb-invalid")
+	igt_subtest("ctx-restore-post-bb-invalid") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore_invalid(configfs_device_fd, "post");
+		close_configfs_group(configfs_fd, configfs_device_fd);
+	}
 
 	igt_describe("Validate ctx_restore_post_bb");
-	igt_subtest("ctx-restore-post-bb")
+	igt_subtest("ctx-restore-post-bb") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore(configfs_device_fd, "post");
+		close_configfs_group(configfs_fd, configfs_device_fd);
+	}
 
 	igt_describe("Validate ctx_restore_mid_bb with invalid options");
-	igt_subtest("ctx-restore-mid-bb-invalid")
+	igt_subtest("ctx-restore-mid-bb-invalid") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore_invalid(configfs_device_fd, "mid");
+		close_configfs_group(configfs_fd, configfs_device_fd);
+	}
 
 	igt_describe("Validate ctx_restore_mid_bb");
-	igt_subtest("ctx-restore-mid-bb")
+	igt_subtest("ctx-restore-mid-bb") {
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_ctx_restore(configfs_device_fd, "mid");
+		close_configfs_group(configfs_fd, configfs_device_fd);
+	}
 
 	igt_fixture() {
-		close(configfs_device_fd);
 		close(configfs_fd);
 	}
 }
-- 
2.50.1

