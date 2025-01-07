Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6264E7719B
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7350D10E79F;
	Tue,  7 Jan 2025 20:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIq6Ht4d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348AA10E31D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736281686; x=1767817686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CL8uzbEbEU7fEFLnnOmpdyqC1PdG2AZKSmkMt8koi8Q=;
 b=GIq6Ht4drFK7FAbcsZGgRqu32sAoJO3Tj3vyXh5QNpTe95BvT1xfpvmr
 stAA379g4hCqxgoqjWFQWdSk6mvFimF0zib8EkqSTbhD9VuBwsys2IS6p
 vnn5CARgy7PqDWj+ld28CjZw5C82Tso9lrvNCUVbAB2QtTG+d61ymPvTA
 DhWzxJtJUZX7go6bYvCqtXIqsgONC7rQx1nbnmN+o/t5FK4VNQQv5jVeW
 efA01IMBMDxMB3UAWy2hg5ddmnKTgoj8DSku/CI/Rp7IuS+Byt5SaFpYO
 ZC/oMip6Q/iyIyS+3V2+gYgcA8vMxaUTHaQcuYTGL6Fl1p15X54frXbmf g==;
X-CSE-ConnectionGUID: FTSSdd86Q3St8KMD/rF6wQ==
X-CSE-MsgGUID: 6PgtP3DrQ2aReuNTbg+KKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="39309015"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="39309015"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:05 -0800
X-CSE-ConnectionGUID: +EAq/LioTBSsBSRau45s7g==
X-CSE-MsgGUID: 3x7tMgq1R/mHCFouU+KN2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="133725695"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 8/8] tests/intel/xe_drm_fdinfo: Also test target
 class with others-*
Date: Tue,  7 Jan 2025 12:26:15 -0800
Message-ID: <20250107202615.1306306-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250107202615.1306306-1-lucas.demarchi@intel.com>
References: <20250107202615.1306306-1-lucas.demarchi@intel.com>
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

Like is done for others-idle, also check the target class in
others-full-load. Start printing the target class as debug so it's easy
to check what should be compared to 0 versus what should be compared to
full load.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index f9eca25ed..7330b4330 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -423,6 +423,8 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 	uint32_t vm;
 	int new_fd;
 
+	igt_debug("Target class: %s\n", engine_map[hwe->engine_class]);
+
 	if (flags & TEST_ISOLATION)
 		new_fd = drm_reopen_driver(fd);
 
@@ -475,6 +477,8 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
 	uint32_t timestamp;
 	uint32_t vm;
 
+	igt_debug("Target class: %s\n", engine_map[hwe->engine_class]);
+
 	vm = xe_vm_create(fd, 0, 0);
 	cork = xe_cork_create_opts(fd, hwe, vm, 1, 1);
 	xe_cork_sync_start(fd, cork);
@@ -504,6 +508,8 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 	uint32_t vm;
 	int class;
 
+	igt_debug("Target class: %s\n", engine_map[hwe->engine_class]);
+
 	vm = xe_vm_create(fd, 0, 0);
 	cork = xe_cork_create_opts(fd, hwe, vm, 1, 1);
 	xe_cork_sync_start(fd, cork);
@@ -535,6 +541,8 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 	uint32_t vm;
 	int class;
 
+	igt_debug("Target class: %s\n", engine_map[hwe->engine_class]);
+
 	vm = xe_vm_create(fd, 0, 0);
 
 	/* spin on one hwe per class except the target class hwes */
@@ -543,6 +551,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 
 		if (_class == hwe->engine_class || cork[_class])
 			continue;
+
 		cork[_class] = xe_cork_create_opts(fd, _hwe, vm, 1, 1);
 		xe_cork_sync_start(fd, cork[_class]);
 	}
@@ -560,12 +569,12 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 		enum expected_load expected_load = hwe->engine_class == class ?
 			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
 
-		if (!cork[class])
-			continue;
-
-		check_results(pceu1, pceu2, class, 1, cork[class]->spin->timestamp,
+		check_results(pceu1, pceu2, class, 1,
+			      cork[class] ? cork[class]->spin->timestamp : 0,
 			      expected_load);
-		xe_cork_destroy(fd, cork[class]);
+
+		if (cork[class])
+			xe_cork_destroy(fd, cork[class]);
 	}
 
 	xe_vm_destroy(fd, vm);
@@ -649,6 +658,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 	if (num_placements < 2)
 		return;
 
+	igt_debug("Target class: %s\n", engine_map[class]);
+
 	if (parallel) {
 		width = num_placements;
 		num_placements = 1;
-- 
2.47.0

