Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EABC87FD2
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 19:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E2810E656;
	Thu, 29 Aug 2024 19:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+SRhO9q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10FE10E656
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724958254; x=1756494254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fz3Qp1UJrAu1AW7k7aKWywKlO6cVVeBzInJMxOOVZok=;
 b=i+SRhO9q9ZSpU07SSFtbCk3qZxeE5fbHngyGYmq3t4x0EceNXH2vAtHd
 OnZNQhaGN/xm5O0VGJ0huF+lyX/MG9yaDN9OL5frbh+ss05Hwy1Rp/K2c
 +P5ArnVR4p3oYWr36rMcEOOrVqnud8tCcUDESeHeu0Tmj/336jZXRb1Gy
 aFXYn1KUKA+raA+kW9KYFdmAlgFQPGV5zoxh7buB9zdGGF8D4IjfHF61e
 6Ky9+JyLTw0klRDLfgYW8Torc0hKi16XW9H+FzVOwgcHdHch9ZzaB/MxO
 RMK9E9u+vCugxDJI4461MYqJacQrD6TZU2NAsXqg2gfI34G/CcFa7uRCE Q==;
X-CSE-ConnectionGUID: bp3AgQ6FQXKe9jZ4ib9Fsw==
X-CSE-MsgGUID: asRamfEWRIy84ks8Gd9EQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26473924"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="26473924"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 12:03:53 -0700
X-CSE-ConnectionGUID: orIbvbBYRGC7Ar8ri2UJRA==
X-CSE-MsgGUID: h0ji+OyWSpW4OAGgNFOl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="63365400"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 12:03:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [CI i-g-t 3/3] tests/intel/xe_drm_fdinfo: Use enum with expected load
Date: Thu, 29 Aug 2024 12:03:41 -0700
Message-ID: <20240829190341.1943839-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829190341.1943839-1-lucas.demarchi@intel.com>
References: <20240829190341.1943839-1-lucas.demarchi@intel.com>
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

Do not let the execution flag dictate the result check, but rather be
explicit what's being checked: idle or full load.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 45 +++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 23edeea40..d45e45c6b 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -68,6 +68,11 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 #define TEST_TRAILING_IDLE	(1 << 1)
 #define TEST_ISOLATION		(1 << 2)
 
+enum expected_load {
+	EXPECTED_LOAD_IDLE,
+	EXPECTED_LOAD_FULL,
+};
+
 struct pceu_cycles {
 	uint64_t cycles;
 	uint64_t total_cycles;
@@ -471,7 +476,7 @@ spin_ctx_destroy(int fd, struct spin_ctx *ctx)
 
 static void
 check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
-	      int class, unsigned int flags)
+	      int class, enum expected_load expected_load)
 {
 	double percent;
 	u64 den, num;
@@ -487,11 +492,18 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 
 	igt_debug("%s: percent: %f\n", engine_map[class], percent);
 
-	if (flags & TEST_BUSY) {
+	switch (expected_load) {
+	case EXPECTED_LOAD_IDLE:
+		igt_assert_eq(num, 0);
+		break;
+	case EXPECTED_LOAD_FULL:
+		/*
+		 * We are still relying on CPU sleep time and there could be
+		 * some imprecision when calculating the load. Use a 5% margin.
+		 */
 		igt_assert_lt_double(95.0, percent);
 		igt_assert_lt_double(percent, 105.0);
-	} else {
-		igt_assert_eq(num, 0);
+		break;
 	}
 }
 
@@ -501,6 +513,7 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct spin_ctx *ctx = NULL;
+	enum expected_load expected_load;
 	uint32_t vm;
 	int new_fd;
 
@@ -525,10 +538,16 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 	if (flags & TEST_ISOLATION)
 		read_engine_cycles(new_fd, pceu2[1]);
 
-	check_results(pceu1[0], pceu2[0], hwe->engine_class, flags);
+	expected_load = flags & TEST_BUSY ?
+	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
+	check_results(pceu1[0], pceu2[0], hwe->engine_class, expected_load);
 
 	if (flags & TEST_ISOLATION) {
-		check_results(pceu1[1], pceu2[1], hwe->engine_class, 0);
+		/*
+		 * Load from one client shouldn't spill on another,
+		 * so check for idle
+		 */
+		check_results(pceu1[1], pceu2[1], hwe->engine_class, EXPECTED_LOAD_IDLE);
 		close(new_fd);
 	}
 
@@ -557,9 +576,10 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
-		bool idle = hwe->engine_class != class;
+		enum expected_load expected_load = hwe->engine_class != class ?
+			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
 
-		check_results(pceu1, pceu2, class, idle ? 0 : TEST_BUSY);
+		check_results(pceu1, pceu2, class, expected_load);
 	}
 
 	spin_sync_end(fd, ctx);
@@ -590,7 +610,7 @@ single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
 
 	xe_vm_destroy(fd, vm);
 
-	check_results(pceu1, pceu2, hwe->engine_class, TEST_BUSY);
+	check_results(pceu1, pceu2, hwe->engine_class, EXPECTED_LOAD_FULL);
 }
 
 static void
@@ -623,12 +643,13 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
-		bool idle = hwe->engine_class == class;
+		enum expected_load expected_load = hwe->engine_class == class ?
+			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
 
 		if (!ctx[class])
 			continue;
 
-		check_results(pceu1, pceu2, class, idle ? 0 : TEST_BUSY);
+		check_results(pceu1, pceu2, class, expected_load);
 		spin_sync_end(fd, ctx[class]);
 		spin_ctx_destroy(fd, ctx[class]);
 	}
@@ -668,7 +689,7 @@ all_busy_check_all(int fd)
 		if (!ctx[class])
 			continue;
 
-		check_results(pceu1, pceu2, class, TEST_BUSY);
+		check_results(pceu1, pceu2, class, EXPECTED_LOAD_FULL);
 		spin_sync_end(fd, ctx[class]);
 		spin_ctx_destroy(fd, ctx[class]);
 	}
-- 
2.43.0

