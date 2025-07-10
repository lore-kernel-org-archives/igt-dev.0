Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344A9C83F1D
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 12:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF89F10E8CF;
	Thu, 10 Jul 2025 12:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iz8c8OZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7592410E8CF
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752152357; x=1783688357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w35aZ+aLMPy8RP38GomMerm3JhXiPFV6TG2MNmggelU=;
 b=iz8c8OZciWqy/wPsKBTUNBEVgbmE9+vKEIcRcW/+02sKQap6ppz2FGkS
 GzGXzWN7gDLcozWIxmHkaE5ErkDxSwjzNUPXHH/AW8u2YJFy4V5XQ6uwi
 KI/cXK4yyGmXbPa1zixvx6+/1z9MjUChQbeMXacau8HidQlZbaa/g6hqf
 YGalmClBIvnOjS8W8E1emwBdWQAt9NAJ6g80tyPVi8JZ8aNg1oE/BKyc/
 yHPjlAKGdbJze74Rnvdb/doFQKHeD2jDT4j8s0iNhpgThn3z51IOzY3OV
 NNLK5NEdK6Pc0WRUTFedE4UaxATEbHsjmhHrnpk5uZQqSgq+1kNc8scUy Q==;
X-CSE-ConnectionGUID: TRn/9nHaTEe4Nn0AsWP5Ag==
X-CSE-MsgGUID: /UlE+ODqT8WBrPUspFOLfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54559296"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54559296"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 05:59:17 -0700
X-CSE-ConnectionGUID: 8tnHHtE0SGOw+Ut8xjuIJA==
X-CSE-MsgGUID: PFUqjKR5Si6oGZhVoXogdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="193284558"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 05:59:17 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v3 i-g-t 1/1] tests/intel/xe_copy : Add memset/memcpy
Date: Thu, 10 Jul 2025 12:58:52 +0000
Message-Id: <20250710125852.1742211-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710125852.1742211-1-sobin.thomas@intel.com>
References: <20250710125852.1742211-1-sobin.thomas@intel.com>
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

Added the check for platforms (graphics_ver < 20) like PVC for xe
memcpy and memset for some tests (like xe-memset-linear) with
extended parameters.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_copy_basic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 5a050b82c..2996a496b 100644
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
+			/* Skip mem-set-linear test for values greater than
+			 * 0x3FFFF. As hardware with graphics_ver<20 support
+			 * till 0x3FFFF.
+			 */
+			if ((linear[i].width > 0x3ffff) &&
+				   (intel_get_device_info(dev_id)->graphics_ver < 20))
+				igt_skip("Skipping: width exceeds 18-bit limit on gfx_ver < 20.");
 			igt_require(blt_has_mem_set(fd));
 			for_each_variation_r(regions, 1, set) {
 				region = igt_collection_get_value(regions, 0);
-- 
2.34.1

