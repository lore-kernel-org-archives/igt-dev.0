Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C50C3ABBE
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 05:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE1310E367;
	Thu,  8 May 2025 05:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ozj6WbRI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C92910E32E
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 05:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746682024; x=1778218024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=maGPl+yFQdWNqxPxP1bIWjJfnnOnX6+c2n+3ty+tmA0=;
 b=Ozj6WbRIzkVq0a0CRJ9bRHfjU8bYwxxMNAPMhZKKzY9O4cOmJsY7oB/2
 ZUAFsUX0bHT7xxeNwfcOsKSQXAzHh+NDovdWpcVF1+1OXpl1IWmn2ihjC
 0fXNE1egN5RD7Tme77zmfjwGRNKod7LH1se7XYOkREtpNyu6J3ANCv5nk
 dXZCi5SGygjqdp7rKicIZPa7OoQcKeMlDdxSiEmfyt7jaGGEvzByKblYu
 ogkj16EW2hg1RF2VuKpeLUF8a2+fqhZFXavjcPIKtr2vT1CnJFBVCnl7a
 Ua6Gc8nvghU9ZQsjpVZxFeq4F0fLCDbljxC/HfzPdeAe/3oWqutURWta8 Q==;
X-CSE-ConnectionGUID: B6e7rV3YSVe65CoMdiy8oQ==
X-CSE-MsgGUID: Tk2QNGmPRxu8wFnukg+5Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59798135"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="59798135"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:27:04 -0700
X-CSE-ConnectionGUID: 23MHdfXrS3eNF/FryjSEIA==
X-CSE-MsgGUID: GBaVg2t3Q3KU61P6Iw06xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="167124057"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:27:01 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 5/5] test/intel/xe_pmu: Add tests to validate engine
 activity by loading most engines
Date: Thu,  8 May 2025 11:20:06 +0530
Message-ID: <20250508055006.734259-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508055006.734259-1-riana.tauro@intel.com>
References: <20250508055006.734259-1-riana.tauro@intel.com>
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

Add a test to validate engine activity by running load on all
engines except one.

Also add a trailing idle test.

v2: use allocator

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 73 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 2df460b07..31f41986b 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -40,6 +40,13 @@
  * Description: Test to validate engine activity by running workload on all engines
  *		simultaneously and trailing idle
  *
+ * SUBTEST: engine-activity-most-load
+ * Description: Test to validate engine activity by running workload on all engines except one
+ *
+ * SUBTEST: engine-activity-most-load-idle
+ * Description: Test to validate engine activity by running workload and trailing idle on all engines
+ * 		except one
+ *
  * SUBTEST: all-fn-engine-activity-load
  * Description: Test to validate engine activity by running load on all functions simultaneously
  *
@@ -327,6 +334,64 @@ static void engine_activity_load_single(int fd, int num_engines,
 	log_all_engines(num_engines, busy_idx, TEST_IDLE, before, after);
 }
 
+static void engine_activity_load_most(int fd, int num_engines, struct drm_xe_engine_class_instance *eci,
+				      unsigned int flags)
+{
+	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
+	struct drm_xe_engine_class_instance *eci_;
+	struct xe_cork *cork[num_engines];
+	int pmu_fd[num_engines * 2];
+	int idx = 0, idle_idx = 0, engine_idx = 0;
+	uint32_t vm;
+
+	pmu_fd[0] = -1;
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+	xe_for_each_engine(fd, eci_) {
+		engine_idx = idx >> 1;
+
+		if (eci_->engine_class == eci->engine_class &&
+		    eci_->engine_instance == eci->engine_instance) {
+			idle_idx = engine_idx;
+			cork[engine_idx] = NULL;
+		} else {
+			cork[engine_idx] = xe_cork_create_opts(fd, eci_, vm, 1, 1, .ahnd = ahnd);
+			xe_cork_sync_start(fd, cork[engine_idx]);
+		}
+
+		config = get_event_config(eci_->gt_id, eci_, "engine-active-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+
+		config = get_event_config(eci_->gt_id, eci_, "engine-total-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+	}
+
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	if (flags & TEST_TRAILING_IDLE) {
+		for (idx = 0; idx < num_engines; idx++)
+			check_and_end_cork(fd, cork[engine_idx]);
+	}
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
+
+	for (idx = 0; idx < num_engines * 2; idx += 2) {
+		engine_idx = idx >> 1;
+
+		if (flags & TEST_LOAD)
+			check_and_end_cork(fd, cork[engine_idx]);
+		if (cork[engine_idx])
+			xe_cork_destroy(fd, cork[engine_idx]);
+		close(pmu_fd[idx]);
+		close(pmu_fd[idx + 1]);
+	}
+
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+
+	log_all_engines(num_engines, idle_idx, TEST_LOAD, before, after);
+}
+
 static void engine_activity_load_all(int fd, int num_engines, unsigned int flags)
 {
 	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
@@ -742,6 +807,14 @@ igt_main
 	test_each_engine("engine-activity-single-load-idle", fd, eci)
 		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
 
+	igt_describe("Validate engine activity when all except one engine is loaded");
+	test_each_engine("engine-activity-most-load", fd, eci)
+		engine_activity_load_most(fd, num_engines, eci, TEST_LOAD);
+
+	igt_describe("Validate engine activity when all except one engine is loaded and trailing idle");
+	test_each_engine("engine-activity-most-load-idle", fd, eci)
+		engine_activity_load_most(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
+
 	igt_describe("Validate engine activity by loading all engines simultaenously");
 	igt_subtest("engine-activity-all-load")
 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
-- 
2.47.1

