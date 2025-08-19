Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D34CA0EF7
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 20:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE9F10E679;
	Tue, 19 Aug 2025 20:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DC7Mh+I2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2F510E672
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 20:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755636069; x=1787172069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tyT6hLPN3NxDYT1NnzVzUQ0Ais7rAqw+kRtV/mhNy74=;
 b=DC7Mh+I286a+9SKr+LvDe2C3tRDSIzV5tZ/OGbYZyozJQ9cPS7Mlw1DQ
 UuuB9KiVnc9Z77nZvUj24hQL3G8h0ClHGcRqf36tsPd7Vn5iTt5t/g2DM
 fyo5+/ZE5dWm2fiaTqd5axV4JM2ee6y2U3IIBs9p08I/BRovhhfvzNYgX
 rhgzdJUyubrXV4rTFiyUTXtmLzgmAGE1DwXwllNCCaWykt6Mu2AjFZpWR
 aPIpwXK4tO96F5Oqxs9Ax3aDlb/cMGMAaX5PF2oBCwiKv+PJUpi1NQM7a
 n5jRFSfDX55PttHADiHLKMOetkNGzDxNdZIEDoFHJJKJ+C8TLU4TJYBMc w==;
X-CSE-ConnectionGUID: wW8TqdNvTBOMy/7Vl6P70g==
X-CSE-MsgGUID: c5FeLpRVSla9/tGefBcbkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57846805"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57846805"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:41:08 -0700
X-CSE-ConnectionGUID: Inhxm5D7Q/+/tFx4Dx6Csg==
X-CSE-MsgGUID: Odt2aNJFTU+wbaHtjRNHtA==
X-ExtLoop1: 1
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 13:41:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/xe_configfs: Install exit handler once
Date: Tue, 19 Aug 2025 13:40:42 -0700
Message-ID: <20250819-configfs-unbind-v1-3-8359e66e3241@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
References: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

All the subtests need to restore the device to a working condition.
Call igt_install_exit_handler() only once, after creating the custom
settings.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 1510f25f0..8b2b8e3c4 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -26,7 +26,6 @@ static char bus_addr[NAME_MAX];
 
 static void restore(int sig)
 {
-	/* Restore after survivability mode */
 	igt_kmod_unbind("xe", bus_addr);
 	igt_kmod_bind("xe", bus_addr);
 }
@@ -147,26 +146,22 @@ igt_main
 		configfs_fd = igt_configfs_open("xe");
 		igt_require(configfs_fd != -1);
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		igt_install_exit_handler(restore);
 	}
 
 	igt_describe("Validate survivability mode");
 	igt_subtest("survivability-mode") {
 		igt_require(IS_BATTLEMAGE(devid));
-		igt_install_exit_handler(restore);
 		test_survivability_mode(configfs_device_fd);
 	}
 
 	igt_describe("Validate engines_allowed with invalid options");
-	igt_subtest("engines-allowed-invalid") {
-		igt_install_exit_handler(restore);
+	igt_subtest("engines-allowed-invalid")
 		test_engines_allowed_invalid(configfs_device_fd);
-	}
 
 	igt_describe("Validate engines_allowed");
-	igt_subtest("engines-allowed") {
-		igt_install_exit_handler(restore);
+	igt_subtest("engines-allowed")
 		test_engines_allowed(configfs_device_fd);
-	}
 
 	igt_fixture {
 		igt_fs_remove_dir(configfs_fd, bus_addr);

-- 
2.50.1

