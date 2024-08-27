Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39CFC54736
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDA010E222;
	Tue, 27 Aug 2024 05:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITeiRWji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6814E10E249
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737922; x=1756273922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UUYhD/3ewRTr4tJ8CgtT/4NT8cy2szB2JufB9ihl24M=;
 b=ITeiRWjinZasb43+w/+e4chBK9PPrtu3xQdvJTvXDjCqEN0MLUrMWQKm
 5gBe1Radmrn+GQ28Zib2C5o1OU7j11arHkXx+oKE83H5rUh+wSY5FOEHz
 qZwZYNKlPjfogK4i7SSF51WfWnwDugzmGzozz7tg/IuhdCZcy9/dEPJgf
 wzzo72nHhqhWcS25LEGeLSMkyud9Br7f7ykh4eGpLLJT8gHHgg0da1lWU
 rRwfInFo8nG9spmgw509EktpZ22p1jjgGDhzIGg0ubtHrjrkhoG5P1C9j
 1xxw4G/0XFliqthJFb4Un1bww8+ZCC76LE+bNIuwBTAoiydUhxsKHVXdB A==;
X-CSE-ConnectionGUID: 1C8rcE/WRF2T7BL/0lzLyg==
X-CSE-MsgGUID: hEkyAtn3RzmLg7dquh+OAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23355596"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23355596"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:01 -0700
X-CSE-ConnectionGUID: sGx8LOUmT1Sn8RSFAcbbKw==
X-CSE-MsgGUID: bWixoJbMQIuZ+VAcAvQZBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62800408"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 08/10] tests/intel/xe_drm_fdinfo: Remove unused flags
Date: Mon, 26 Aug 2024 22:51:27 -0700
Message-ID: <20240827055129.1671873-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827055129.1671873-1-lucas.demarchi@intel.com>
References: <20240827055129.1671873-1-lucas.demarchi@intel.com>
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
index f7a359540..62a31abd5 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -537,7 +537,7 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 }
 
 static void
-busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
+busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
@@ -546,20 +546,20 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int fl
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
@@ -593,8 +593,7 @@ single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
 }
 
 static void
-most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
-		    unsigned int flags)
+most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
@@ -604,32 +603,31 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
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
@@ -638,7 +636,7 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
 }
 
 static void
-all_busy_check_all(int fd, unsigned int flags)
+all_busy_check_all(int fd)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
@@ -648,31 +646,28 @@ all_busy_check_all(int fd, unsigned int flags)
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
@@ -714,14 +709,14 @@ igt_main
 
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

