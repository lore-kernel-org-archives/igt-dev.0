Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A041C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77EA10E3B9;
	Tue, 27 Aug 2024 16:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHzTYkiU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73D310E3B1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724777697; x=1756313697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gZPoxqxK82Ye7BgTb2/Y7XxnNcoEE87xSe6TBl6F6wM=;
 b=kHzTYkiUCWpXcaHIILHovLj1kyo7b3hqop1EDwWP8VAZOax+mGESPzD/
 zE51bPEvfW0exwDAmSCJtT/SwPkL+WN3xhUkNce+vQMNTm56icPNMW6am
 lvYjp4xl04uXnByL/yBjwzeKuvcBzTHydlXC4pTM0L2nvt3geTQuUq3BL
 Q5fk/JEpdDU/FqB3qxU7dxFP0WNuzy3psl7rmGZ3n4Rh2rRoZuFWTJUDl
 4r6zky7ig3R39e3VFwfpjfFLlp343azF3X9nywhXRPUb05XCnfgl4Z+bS
 /3G99VD/q4PAb8jaSZfwy1kY17F/xjOlAvOpjjdHKC1baIiX2riB9QZyC A==;
X-CSE-ConnectionGUID: PJ8LGa/AQwWEC3SjeZHNYg==
X-CSE-MsgGUID: 8VVi98pxSrSobjMoGz+syQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45787336"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="45787336"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:56 -0700
X-CSE-ConnectionGUID: XHXJyUCXTVijLO/Ca7ZX8Q==
X-CSE-MsgGUID: nmohmSRvTdOZ82R5G9Lkyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63640432"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 08/10] tests/intel/xe_drm_fdinfo: Remove unused flags
Date: Tue, 27 Aug 2024 09:54:47 -0700
Message-ID: <20240827165449.1706784-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827165449.1706784-1-lucas.demarchi@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
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

single() is the only test function that is used by multiple kinds of
tests and controlled by flags. The others simply pass the same flags
every time. Simplify the tests by removing the bogus checks.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 81 +++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 43 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 46c96dbe0..23edeea40 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -538,7 +538,7 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 }
 
 static void
-busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
+busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
@@ -547,20 +547,20 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int fl
 	int class;
 
 	vm = xe_vm_create(fd, 0, 0);
-	if (flags & TEST_BUSY) {
-		ctx = spin_ctx_init(fd, hwe, vm);
-		spin_sync_start(fd, ctx);
-	}
+
+	ctx = spin_ctx_init(fd, hwe, vm);
+	spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	if (flags & TEST_TRAILING_IDLE)
-		spin_sync_end(fd, ctx);
+	spin_sync_end(fd, ctx);
 	read_engine_cycles(fd, pceu2);
 
-	xe_for_each_engine_class(class)
-		check_results(pceu1, pceu2, class,
-			      hwe->engine_class == class ? flags : 0);
+	xe_for_each_engine_class(class) {
+		bool idle = hwe->engine_class != class;
+
+		check_results(pceu1, pceu2, class, idle ? 0 : TEST_BUSY);
+	}
 
 	spin_sync_end(fd, ctx);
 	spin_ctx_destroy(fd, ctx);
@@ -594,8 +594,7 @@ single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
 }
 
 static void
-most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
-		    unsigned int flags)
+most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
@@ -605,32 +604,31 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	int class;
 
 	vm = xe_vm_create(fd, 0, 0);
-	if (flags & TEST_BUSY) {
-		/* spin on one hwe per class except the target class hwes */
-		xe_for_each_engine(fd, _hwe) {
-			int _class = _hwe->engine_class;
 
-			if (_class == hwe->engine_class || ctx[_class])
-				continue;
+	/* spin on one hwe per class except the target class hwes */
+	xe_for_each_engine(fd, _hwe) {
+		int _class = _hwe->engine_class;
 
-			ctx[_class] = spin_ctx_init(fd, _hwe, vm);
-			spin_sync_start(fd, ctx[_class]);
-		}
+		if (_class == hwe->engine_class || ctx[_class])
+			continue;
+
+		ctx[_class] = spin_ctx_init(fd, _hwe, vm);
+		spin_sync_start(fd, ctx[_class]);
 	}
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	if (flags & TEST_TRAILING_IDLE)
-		xe_for_each_engine_class(class)
-			spin_sync_end(fd, ctx[class]);
+	xe_for_each_engine_class(class)
+		spin_sync_end(fd, ctx[class]);
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
+		bool idle = hwe->engine_class == class;
+
 		if (!ctx[class])
 			continue;
 
-		check_results(pceu1, pceu2, class,
-			      hwe->engine_class == class ? 0 : flags);
+		check_results(pceu1, pceu2, class, idle ? 0 : TEST_BUSY);
 		spin_sync_end(fd, ctx[class]);
 		spin_ctx_destroy(fd, ctx[class]);
 	}
@@ -639,7 +637,7 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
 }
 
 static void
-all_busy_check_all(int fd, unsigned int flags)
+all_busy_check_all(int fd)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
@@ -649,31 +647,28 @@ all_busy_check_all(int fd, unsigned int flags)
 	int class;
 
 	vm = xe_vm_create(fd, 0, 0);
-	if (flags & TEST_BUSY) {
-		/* spin on one hwe per class */
-		xe_for_each_engine(fd, hwe) {
-			class = hwe->engine_class;
 
-			if (ctx[class])
-				continue;
+	/* spin on one hwe per class */
+	xe_for_each_engine(fd, hwe) {
+		class = hwe->engine_class;
+		if (ctx[class])
+			continue;
 
-			ctx[class] = spin_ctx_init(fd, hwe, vm);
-			spin_sync_start(fd, ctx[class]);
-		}
+		ctx[class] = spin_ctx_init(fd, hwe, vm);
+		spin_sync_start(fd, ctx[class]);
 	}
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	if (flags & TEST_TRAILING_IDLE)
-		xe_for_each_engine_class(class)
-			spin_sync_end(fd, ctx[class]);
+	xe_for_each_engine_class(class)
+		spin_sync_end(fd, ctx[class]);
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
 		if (!ctx[class])
 			continue;
 
-		check_results(pceu1, pceu2, class, flags);
+		check_results(pceu1, pceu2, class, TEST_BUSY);
 		spin_sync_end(fd, ctx[class]);
 		spin_ctx_destroy(fd, ctx[class]);
 	}
@@ -715,14 +710,14 @@ igt_main
 
 	igt_subtest("drm-busy-idle-check-all")
 		xe_for_each_engine(xe, hwe)
-			busy_check_all(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
+			busy_check_all(xe, hwe);
 
 	igt_subtest("drm-most-busy-idle-check-all")
 		xe_for_each_engine(xe, hwe)
-			most_busy_check_all(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
+			most_busy_check_all(xe, hwe);
 
 	igt_subtest("drm-all-busy-idle-check-all")
-		all_busy_check_all(xe, TEST_BUSY | TEST_TRAILING_IDLE);
+		all_busy_check_all(xe);
 
 	igt_subtest("drm-busy-exec-queue-destroy-idle")
 		xe_for_each_engine(xe, hwe)
-- 
2.43.0

