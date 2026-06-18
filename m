Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52867CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 16:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16BC10EDF7;
	Thu, 18 Jun 2026 16:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNWFK2ge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067CC10EDF7
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781800969; x=1813336969;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9Q+6zjpmMym8+FizHRwyMeeJqrpBnymSc4EhXka7h3c=;
 b=VNWFK2geV0lwfJky2X4RnIiEBJqSBpSMYOTkDd+c9WF7Tx5BMYeut+8g
 Mmxe9stVuGcKSy9IJ0k5uoCrA6vVc8TtGQQzkAkNfrzvWc8/xNGYJMDcr
 0R+sQMbg2QkFAxyi2uKntO0ruLgVbmX0Jce5Cd0cIgh06eTH2AD+5iUFB
 NRkWjbPH8O3M4y0ZXlcZ7RWB/8ClkLxO/SpcnnRZpbRduQNOuPdrySOEw
 p5NhXZxiMpElqz6ovv6ZLFbE77NdoQLmKaKy+jFxKirYmORmnKVaY02cT
 7va24zdLfj7dzoKb3OPftJU6X1HBBe6p7MqxsNDcFaUKsUVL5Saj73wGu Q==;
X-CSE-ConnectionGUID: bBCj0tXKTqKv97lPIrbiBg==
X-CSE-MsgGUID: 1MFzVaWtTjmDUWeFeHZ3aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="108192272"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="108192272"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 09:42:48 -0700
X-CSE-ConnectionGUID: B2cQzo5lTGSLJqtVQ+Y4WQ==
X-CSE-MsgGUID: maQ4OOkLTFi0GgFrZZglZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="248481335"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa007.jf.intel.com with ESMTP; 18 Jun 2026 09:42:47 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com, jani.nikula@intel.com
Subject: [PATCH v2 i-g-t] tests/intel: Enable survivability tests on discrete
 platforms >= BMG
Date: Thu, 18 Jun 2026 22:12:45 +0530
Message-ID: <20260618164245.20139-1-himanshu.girotra@intel.com>
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

The survivability mode tests in xe_survivability and xe_configfs were
initially developed for Battlemage (BMG) and gated with IS_BATTLEMAGE.
Survivability mode is, however, supported by the KMD on all discrete
platforms from BMG onwards.

Mirror this on the IGT side by replacing the BMG-only check with a
runtime discrete check combined with a graphics version check
of at least BMG (IP_VER(20, 1)).

v2: use is_intel_dgfx() (Jani Nikula)

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/xe_configfs.c      | 5 ++++-
 tests/intel/xe_survivability.c | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index e7c797eb7..9ba8f94ec 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -11,6 +11,7 @@
 #include "igt_kmod.h"
 #include "igt_sriov_device.h"
 #include "igt_sysfs.h"
+#include "intel_common.h"
 #include "xe/xe_query.h"
 
 /**
@@ -379,6 +380,7 @@ int igt_main()
 	int fd, configfs_fd, configfs_device_fd;
 	uint32_t devid;
 	bool is_vf_device;
+	bool is_dgfx;
 	const char *engine = NULL;
 
 	igt_fixture() {
@@ -387,6 +389,7 @@ int igt_main()
 		fd = drm_open_driver(DRIVER_XE);
 		devid = intel_get_drm_devid(fd);
 		is_vf_device = intel_is_vf_device(fd);
+		is_dgfx = is_intel_dgfx(fd);
 		set_bus_addr(fd);
 
 		xe_for_each_engine(fd, hwe) {
@@ -410,7 +413,7 @@ int igt_main()
 
 	igt_describe("Validate survivability mode");
 	igt_subtest("survivability-mode") {
-		igt_require(IS_BATTLEMAGE(devid));
+		igt_require(is_dgfx && intel_graphics_ver(devid) >= IP_VER(20, 1));
 		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_survivability_mode(configfs_device_fd);
diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index d5d7e048c..0b3121a08 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -16,6 +16,7 @@
 #include "igt_sriov_device.h"
 #include "igt_sysfs.h"
 #include "intel_allocator.h"
+#include "intel_common.h"
 #include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -217,7 +218,8 @@ int igt_main()
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
-		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
+		igt_require(is_intel_dgfx(fd) &&
+			    intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(20, 1));
 		vf_device = intel_is_vf_device(fd);
 		igt_require_f(!vf_device, "survivability mode not supported in VF\n");
 		pci_xe = igt_device_get_pci_device(fd);
-- 
2.50.1

