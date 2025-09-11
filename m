Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A508CAC58E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 15:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D193810E0EF;
	Thu, 11 Sep 2025 15:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPwF4yH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D25710E0EF
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757606024; x=1789142024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lKa+p3zL0Nj7HUjHSpAI1t3++BnMx6ZTs0vYfCUi/54=;
 b=PPwF4yH1ZTfdOw44+Mw7hTF+4inPA8ZWi4nlVXMFmVACGccrQDZDKmvP
 mso/9hm2HYcmwoXCSseYAbOswPXlCxv4YqGITaSYJbWJ1hkfNn4qgoBZ+
 z8ll+Y3lA1P4aeYpA22EfTzOb58nOISPIngWClZEylLp+Mo9qCA6ZBFra
 f22fz2gAx3jl2GfULimmHHPsHm0zz2deLqW26FoR5LQAxxFN5vuo8jRYg
 BxKxwWwAOU3LUjaBxhxG6018WJXJMaLSW1nNnwxuMlxUkaoywevNK8izq
 rW4S0xvpzxpALuYPVan+IprVBVPLfV+QDZxn8aI8eq5h8XSqZCmj82SxE g==;
X-CSE-ConnectionGUID: RdNVV812RbC9Z5BJDbkyrg==
X-CSE-MsgGUID: q771GGxqSt21WDFLphzwtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70631700"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="70631700"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:53:43 -0700
X-CSE-ConnectionGUID: z0lHSK4eTDqVPVElP3gaFw==
X-CSE-MsgGUID: 8R5bi2DgQ7mm1KV+pgC96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="173293810"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 08:53:41 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_configfs: Skip survivability-mode
 subtest on VF
Date: Thu, 11 Sep 2025 15:44:11 +0000
Message-Id: <20250911154411.1372973-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Survivability mode is not supported in VF mode.
Skip subtest survivability-mode when ran with driver in VF mode.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_configfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 086f99ba5..27426b52a 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -9,6 +9,7 @@
 #include "igt_device.h"
 #include "igt_fs.h"
 #include "igt_kmod.h"
+#include "igt_sriov_device.h"
 #include "igt_sysfs.h"
 #include "xe/xe_query.h"
 
@@ -146,10 +147,12 @@ igt_main
 {
 	int fd, configfs_fd, configfs_device_fd;
 	uint32_t devid;
+	bool is_vf_device;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		devid = intel_get_drm_devid(fd);
+		is_vf_device = intel_is_vf_device(fd);
 		set_bus_addr(fd);
 		drm_close_driver(fd);
 
@@ -162,6 +165,7 @@ igt_main
 	igt_describe("Validate survivability mode");
 	igt_subtest("survivability-mode") {
 		igt_require(IS_BATTLEMAGE(devid));
+		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
 		test_survivability_mode(configfs_device_fd);
 	}
 
-- 
2.34.1

