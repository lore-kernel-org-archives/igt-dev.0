Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA27C52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C76810E1C7;
	Tue, 27 Aug 2024 05:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atLAOM5r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A39810E1C7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737922; x=1756273922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7e8ZS8ppsQ9a2zINcvAQwb1w0E4Mstq6wQBh1dPnroY=;
 b=atLAOM5r/hmyZdTGMV+0TgL+R8n2uwgOtWnHDB572ucslNViCO49dh/5
 qFD48cLhM1OuhbH1fSWA8kp/9FOdmPwTNNBJh2rRdH8qrfz/tSgzvkQfW
 SSWsdEaItUteF14AP10SpeWaaMcmX4yy04s+DgyRMJzHGYp6eiRqs2gZ9
 xpGdAhGyCVJXGb6CV102Ru4bgOuEjwT/+qLTN9DHXIPksBAps7lTG1DWp
 72lE9k4cnp+uJtbZrwH6UMKPcTSc3qCbfq1BHog+h1x/d/Mbr8P+5pVHH
 ZgdniEDQp0Qr2SgLLRtuDOYm+oPfnKrfCjxAcCTJ/DDHfMGXgzpAkgPgq A==;
X-CSE-ConnectionGUID: CEVqLxl3TjyxCgIFKO+fDg==
X-CSE-MsgGUID: 31V4CVM8TyqktYYiKzjb2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23355597"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23355597"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:01 -0700
X-CSE-ConnectionGUID: AN9kYrSCQ7W105UCOV0+fA==
X-CSE-MsgGUID: tkciraIBQLmZsPNJm1wW4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62800411"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 09/10] tests/intel/xe_drm_fdinfo: Use enum with
 expected load
Date: Mon, 26 Aug 2024 22:51:28 -0700
Message-ID: <20240827055129.1671873-10-lucas.demarchi@intel.com>
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

Do not let the execution flag dictate the result check, but rather be
explicit what's being checked: idle or full load.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 47 +++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 62a31abd5..9b3441b2a 100644
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
 
@@ -485,12 +490,19 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 
 	igt_debug("%s: percent: %f\n", engine_map[class], percent);
 
-	if (flags & TEST_BUSY) {
-		igt_assert_lt_double(95.0, percent);
-		igt_assert_lt_double(percent, 105.0);
-	} else {
+	switch (expected_load) {
+	case EXPECTED_LOAD_IDLE:
 		igt_assert(!s2[class].cycles);
 		igt_assert(!s1[class].cycles);
+		break;
+	case EXPECTED_LOAD_FULL:
+		/*
+		 * We are still relying on CPU sleep time and there could be
+		 * some imprecision when calculating the load. Use a 5% margin.
+		 */
+		igt_assert_lt_double(95.0, percent);
+		igt_assert_lt_double(percent, 105.0);
+		break;
 	}
 }
 
@@ -500,6 +512,7 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct spin_ctx *ctx = NULL;
+	enum expected_load expected_load;
 	uint32_t vm;
 	int new_fd;
 
@@ -524,10 +537,16 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
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
 
@@ -556,9 +575,10 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
-		bool idle = hwe->engine_class != class;
+		enum expected_load expected_load = hwe->engine_class != class ?
+			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
 
-		check_results(pceu1, pceu2, class, idle ? 0 : TEST_BUSY);
+		check_results(pceu1, pceu2, class, expected_load);
 	}
 
 	spin_sync_end(fd, ctx);
@@ -589,7 +609,7 @@ single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
 
 	xe_vm_destroy(fd, vm);
 
-	check_results(pceu1, pceu2, hwe->engine_class, TEST_BUSY);
+	check_results(pceu1, pceu2, hwe->engine_class, EXPECTED_LOAD_FULL);
 }
 
 static void
@@ -622,12 +642,13 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe)
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
@@ -667,7 +688,7 @@ all_busy_check_all(int fd)
 		if (!ctx[class])
 			continue;
 
-		check_results(pceu1, pceu2, class, TEST_BUSY);
+		check_results(pceu1, pceu2, class, EXPECTED_LOAD_FULL);
 		spin_sync_end(fd, ctx[class]);
 		spin_ctx_destroy(fd, ctx[class]);
 	}
-- 
2.43.0

