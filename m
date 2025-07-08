Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E96C83F0A
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 12:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0007110E60D;
	Tue,  8 Jul 2025 12:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QlW8fSKK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FB710E610
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751977272; x=1783513272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LarJk3Joma0qNDo1JKINPLyM7M8YG1zCnQ/L5Yy9aBI=;
 b=QlW8fSKKHzaylw0sS1Mx/hQD6XMa1W4L2oVwDeeHx0RQNHpQKme5QuIW
 shmrdmPpcpcsPXoDeCR3KzOYKpYsuolJ7RqirL07IsnQ3+HPzHuvs5TYh
 FBsoGczjwRJ5ctKvviwWYDxHoMMU2LDx1nEXOEXLGELIa6VeXVsW+iipp
 YzAzMNyeSmlFWp8FOsIQ6k07i3MeGlPAl4x4yfvc08T3YDpSTxMhoYv2b
 L/FaXmIbrL02WkqVwQyLjsBrtgSQFAshJK2RA+V+1omAHv2ZoR1cSuS0T
 mf7+jbCQrD1ntbxdVVryQiY3i50lRwQCQtKZCee16nKNo+Ofn+p9czwhO g==;
X-CSE-ConnectionGUID: 4RHOL2NvRhu8ihXxDh/hXw==
X-CSE-MsgGUID: 5ITKZCUvRiCgJpQ2G40UtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54101351"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="54101351"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 05:21:12 -0700
X-CSE-ConnectionGUID: V+nNRAfkTKqXibuStbCoBg==
X-CSE-MsgGUID: coGyir8VQbyKfO89Qrb7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="192664867"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 05:21:12 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_copy : Add check for memset and memcpy
 tests.
Date: Tue,  8 Jul 2025 12:20:56 +0000
Message-Id: <20250708122056.1698837-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708122056.1698837-1-sobin.thomas@intel.com>
References: <20250708122056.1698837-1-sobin.thomas@intel.com>
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

Added the check for platforms (graphics_ver < 20) like PVC for memcpy
and memset for some tests with extended parameters.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_copy_basic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 5a050b82c..f7ac507de 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -261,6 +261,7 @@ const char *help_str =
 igt_main_args("b", NULL, help_str, opt_handler, NULL)
 {
 	int fd;
+	uint16_t dev_id;
 	struct igt_collection *set, *regions;
 	uint32_t region;
 	struct rect linear[] = { { 0, 0xfd, 1, MODE_BYTE },
@@ -274,6 +275,7 @@ igt_main_args("b", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		dev_id = intel_get_drm_devid(fd);
 		xe_device_get(fd);
 		set = xe_get_memory_region_set(fd,
 					       DRM_XE_MEM_REGION_CLASS_SYSMEM,
@@ -293,6 +295,7 @@ igt_main_args("b", NULL, help_str, opt_handler, NULL)
 	for (int i = 0; i < ARRAY_SIZE(page); i++) {
 		igt_subtest_f("mem-page-copy-%u", page[i].width) {
 			igt_require(blt_has_mem_copy(fd));
+			igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
 			for_each_variation_r(regions, 1, set) {
 				region = igt_collection_get_value(regions, 0);
 				copy_test(fd, &page[i], MEM_COPY, region);
@@ -312,6 +315,13 @@ igt_main_args("b", NULL, help_str, opt_handler, NULL)
 
 	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
 		igt_subtest_f("mem-set-linear-0x%x", linear[i].width) {
+			/* Skip mem-set-linear test for 0x8fffe as
+			 * hardware with graphics_ver <=20 support
+			 * till 17 bits.
+			 */
+			if ((linear[i].width == 0x8fffe) &&
+				   (intel_get_device_info(dev_id)->graphics_ver <= 20))
+				igt_skip("Skipping large buffer test on PVC platform");
 			igt_require(blt_has_mem_set(fd));
 			for_each_variation_r(regions, 1, set) {
 				region = igt_collection_get_value(regions, 0);
-- 
2.34.1

