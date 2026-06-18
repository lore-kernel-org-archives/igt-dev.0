Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C2FCD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 14:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB13F10F153;
	Thu, 18 Jun 2026 14:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAB/hRh1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FCD10F153
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781792646; x=1813328646;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a8+rrkaJiv+G/8/oY03+sm/veDxeOg4Q85uZCVSJcd8=;
 b=hAB/hRh1FgCxeTC7yaMqDLp2eFzq712LnC1/TKihVARGdYVysCE5BK0m
 4gESlFjfcfoPRdDRIr/1xDfqU7c7R2X7XpHRpv8LRUPh1gR7rPI6tukXl
 gk2DrLu2JOY8MQnJ+sTfLe2I8ghoF1vrdzVhS//biUAt4IRWHihqYhiFP
 26wj4P7vvOk1R/CY0RZpHDJ0+ySl1BuvpONsjJ1lX3BVNtUB4bvrarNy/
 RchSoke9pZOsPeqS1a3MxqCOilO+PUsl72XtYsVKt8dTVA9uXSD8CxWWb
 wfuWVI8FW/m9+pcOIndtdN+RPlMvd0cnGr34e8ohKWMy5zwSoVpvFBuvI A==;
X-CSE-ConnectionGUID: 3WACfRJdQymhmRSEFYs5Iw==
X-CSE-MsgGUID: mwdjW8NOSsGZBpUW8az7Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86305969"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86305969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 07:24:05 -0700
X-CSE-ConnectionGUID: IPVzksn7R6ixN1SNsi25oA==
X-CSE-MsgGUID: JYhJ/qH0Q5aME+ELwrpX6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="246006599"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by fmviesa008.fm.intel.com with ESMTP; 18 Jun 2026 07:24:04 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org,
	riana.tauro@intel.com
Subject: [PATCH i-g-t] tests/intel: Enable survivability tests on discrete
 platforms >= BMG
Date: Thu, 18 Jun 2026 19:54:02 +0530
Message-ID: <20260618142403.18705-1-himanshu.girotra@intel.com>
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

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/xe_configfs.c      | 4 +++-
 tests/intel/xe_survivability.c | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index e7c797eb7..3ae5d7ee4 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -379,6 +379,7 @@ int igt_main()
 	int fd, configfs_fd, configfs_device_fd;
 	uint32_t devid;
 	bool is_vf_device;
+	bool is_dgfx;
 	const char *engine = NULL;
 
 	igt_fixture() {
@@ -387,6 +388,7 @@ int igt_main()
 		fd = drm_open_driver(DRIVER_XE);
 		devid = intel_get_drm_devid(fd);
 		is_vf_device = intel_is_vf_device(fd);
+		is_dgfx = xe_has_vram(fd);
 		set_bus_addr(fd);
 
 		xe_for_each_engine(fd, hwe) {
@@ -410,7 +412,7 @@ int igt_main()
 
 	igt_describe("Validate survivability mode");
 	igt_subtest("survivability-mode") {
-		igt_require(IS_BATTLEMAGE(devid));
+		igt_require(is_dgfx && intel_graphics_ver(devid) >= IP_VER(20, 1));
 		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		test_survivability_mode(configfs_device_fd);
diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index d5d7e048c..65814edc6 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -217,7 +217,8 @@ int igt_main()
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
-		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
+		igt_require(xe_has_vram(fd) &&
+			    intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(20, 1));
 		vf_device = intel_is_vf_device(fd);
 		igt_require_f(!vf_device, "survivability mode not supported in VF\n");
 		pci_xe = igt_device_get_pci_device(fd);
-- 
2.50.1

