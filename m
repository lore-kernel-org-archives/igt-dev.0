Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAEFE67A68
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 04:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B122A10E628;
	Tue,  3 Mar 2026 04:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHeXp60+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DA810E628
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 04:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772512739; x=1804048739;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DMiddHXF+VNjPOPHy54wrVu5Mse2pc37vDjAzQ4/I3k=;
 b=aHeXp60+SXpujto+hMjt9JfRCG9+/NmF+ikqnjCY1GCthRmRGaKUxDDg
 Ngv5RmpHlgpwz/KUoskMX1QDgLEIwTf+UB1mz7hpE8HYd1UOBapLFOzh7
 8qJAU8u1WaqBzS1tweguJoG1GL8vnTIZMKygGt8F6o5bs6+iXeetkwkz8
 XN+S3T61kS1q/WSyrt4Qw7n50s4FUTCgEPQ6pCOhXG0ZweV2v+H0lJbps
 XZ4suKQ5nXQK6FLaAN022fHoe9412fcADezEOeLKj4Hti7T1uBzysQEzF
 D7ScrLqP49rwTbxEtjzyN8pK2UfqPLOeo/7pF74kCzEfWEr6E5BSnEDKG Q==;
X-CSE-ConnectionGUID: oHCSE4EiQjqdr/9HDmli2Q==
X-CSE-MsgGUID: DI9Kn5nNQDq578vAtG55Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="96148680"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="96148680"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 20:38:59 -0800
X-CSE-ConnectionGUID: QL4fr2wUQg22Pjo1/8sffg==
X-CSE-MsgGUID: mZQ7f73VQ2O97j579Um8jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="244805091"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa001.fm.intel.com with ESMTP; 02 Mar 2026 20:38:57 -0800
From: priyanka.dandamudi@intel.com
To: zbigniew.kempczynski@intel.com, matthew.auld@intel.com,
 igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 2/5] tests/xe_pat: Handle false-sharing on Xe3
Date: Tue,  3 Mar 2026 10:08:50 +0530
Message-ID: <20260303043853.1656156-3-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303043853.1656156-1-priyanka.dandamudi@intel.com>
References: <20260303043853.1656156-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Add Xe3 settings which differentiates subtest behavior from Xe2.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_pat.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 3a13d11bf..d160dde9d 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1361,6 +1361,18 @@ const struct fs_pat_entry fs_xe2_discrete[] = {
 	{ 5, "cpu-wb-gpu-uc-1way", DRM_XE_GEM_CPU_CACHING_WB, true },
 };
 
+const struct fs_pat_entry fs_xe3[] = {
+	{ 2, "cpu-wb-gpu-l3-2way", DRM_XE_GEM_CPU_CACHING_WB, true },
+	{ 3, "cpu-wc-gpu-uc-non-coh", DRM_XE_GEM_CPU_CACHING_WC, true },
+	{ 5, "cpu-wb-gpu-uc-1way", DRM_XE_GEM_CPU_CACHING_WB, true },
+};
+
+const struct fs_pat_entry fs_xe3p_xpc[] = {
+	{ 2, "cpu-wb-gpu-l3-2way", DRM_XE_GEM_CPU_CACHING_WB, true },
+	{ 3, "cpu-wc-gpu-uc-non-coh", DRM_XE_GEM_CPU_CACHING_WC, true },
+	{ 4, "cpu-wb-gpu-uc-1way", DRM_XE_GEM_CPU_CACHING_WB, true },
+};
+
 #define CPUDW_INC   0x0
 #define GPUDW_WRITE 0x4
 #define GPUDW_READY 0x40
@@ -1495,17 +1507,27 @@ static void __false_sharing(int fd, const struct fs_pat_entry *fs_entry)
 
 static void false_sharing(int fd)
 {
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	uint32_t graphics_ver = intel_get_device_info(dev_id)->graphics_ver;
 	bool is_dgfx = xe_has_vram(fd);
 
 	const struct fs_pat_entry *fs_entries;
 	int num_entries;
 
-	if (is_dgfx) {
-		num_entries = ARRAY_SIZE(fs_xe2_discrete);
-		fs_entries = fs_xe2_discrete;
+	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
+		num_entries = ARRAY_SIZE(fs_xe3p_xpc);
+		fs_entries = fs_xe3p_xpc;
+	} else if (graphics_ver == 20) {
+		if (is_dgfx) {
+			num_entries = ARRAY_SIZE(fs_xe2_discrete);
+			fs_entries = fs_xe2_discrete;
+		} else {
+			num_entries = ARRAY_SIZE(fs_xe2_integrated);
+			fs_entries = fs_xe2_integrated;
+		}
 	} else {
-		num_entries = ARRAY_SIZE(fs_xe2_integrated);
-		fs_entries = fs_xe2_integrated;
+		num_entries = ARRAY_SIZE(fs_xe3);
+		fs_entries = fs_xe3;
 	}
 
 	for (int i = 0; i < num_entries; i++) {
@@ -1601,7 +1623,7 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		display_vs_wb_transient(fd);
 
 	igt_subtest_with_dynamic("false-sharing") {
-		igt_require(intel_get_device_info(dev_id)->graphics_ver == 20);
+		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
 
 		false_sharing(fd);
 	}
-- 
2.43.0

