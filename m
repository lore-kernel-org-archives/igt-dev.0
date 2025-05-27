Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939F1C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 10:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D5A10E437;
	Tue, 27 May 2025 10:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+KMfBnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83F010E437
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748340647; x=1779876647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vmsNZZnwWyqMlA++O3tgyft7UrnLGV/DyOGBR295cLY=;
 b=A+KMfBnr/re8Ute+kLnwURYWu26G2EhLuk//KGFL1pgn2c3CbHTb7qX3
 AeNZl3p+gYu9IPh8eOD4U3cfSKAFa0B3h8BDhmK4cpdLdSKyNftAeNuNw
 6KJtfLJNeRLsS7n1fLb7NeHVDUUpbP6tXIq/fmhZrVUyvNysZwo83EAcf
 o6UXTH73+gZWKFKJQF+DE+9sm1V9BYYWCemq1smzXrbxhUJrHO7YuAO3H
 x/fn8edYqPKyktsCCfdTMzUPiqRZHPD3exczsGyX9au214VY7RGoj/ciN
 wioezhJt8yAnNgcgv/ZNWGtM4qmqBzrCm6KV+oP741Y2bYtRN89OXZdO3 g==;
X-CSE-ConnectionGUID: XfljQpjpS72uJreDb8XvlA==
X-CSE-MsgGUID: DrcWavqGRV+CJDnyn9wGgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67741854"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="67741854"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 03:10:46 -0700
X-CSE-ConnectionGUID: tA48hEm1S7yFZZEUa24C7g==
X-CSE-MsgGUID: mehIck5uQvu5BT4sumF10A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="142667517"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 03:10:44 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pmu: Add a test to validate engine
 activity after starting load
Date: Tue, 27 May 2025 16:04:33 +0530
Message-ID: <20250527103433.910475-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250527103433.910475-1-riana.tauro@intel.com>
References: <20250527103433.910475-1-riana.tauro@intel.com>
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

Add a test to validate engine activity by opening PMU after
starting load

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 47 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 5a526004f..d1561bc7f 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -46,6 +46,9 @@
  * SUBTEST: engine-activity-suspend
  * Description: Test to validate engine activity on all engines before and after s2idle
  *
+ * SUBTEST: engine-activity-after-load-start
+ * Description: Validates engine activity when PMU is opened after load started
+ *
  * SUBTEST: engine-activity-most-load
  * Description: Test to validate engine activity by running workload on all engines except one
  *
@@ -569,6 +572,46 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
 		assert_within_epsilon(busy_percent, exec_quantum_ratio, tolerance);
 }
 
+static void engine_activity_load_start(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t ahnd, config, engine_active_ticks, engine_total_ticks, before[2], after[2];
+	struct xe_cork *cork = NULL;
+	uint32_t vm;
+	int pmu_fd[2];
+
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
+	xe_cork_sync_start(fd, cork);
+
+	config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
+	pmu_fd[0] = open_group(fd, config, -1);
+
+	config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
+
+	pmu_read_multi(pmu_fd[0], 2, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	pmu_read_multi(pmu_fd[0], 2, after);
+	end_cork(fd, cork);
+
+	engine_active_ticks = after[0] - before[0];
+	engine_total_ticks = after[1] - before[1];
+
+	igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[0], before[0],
+		  engine_active_ticks);
+	igt_debug("Engine total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
+		  engine_total_ticks);
+
+	xe_cork_destroy(fd, cork);
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+	close(pmu_fd[0]);
+	close(pmu_fd[1]);
+
+	assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+}
+
 static void test_gt_c6_idle(int xe, unsigned int gt)
 {
 	int pmu_fd;
@@ -842,6 +885,10 @@ igt_main
 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
 	}
 
+	igt_describe("Validate engine activity when PMU is opened after load");
+	test_each_engine("engine-activity-after-load-start", fd, eci)
+		engine_activity_load_start(fd, eci);
+
 	igt_subtest_group {
 		int render_fd;
 
-- 
2.47.1

