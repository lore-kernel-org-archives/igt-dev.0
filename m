Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21A7C5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 06:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D79910E6FF;
	Thu, 29 May 2025 06:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mG3xIxv2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2359110E6FF
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 06:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748500212; x=1780036212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8OFc7e3ag4epqlokiQ7Bp5D97GoQBmc1dCUf9Dq8cO0=;
 b=mG3xIxv2bJ5a1wVLc/dfoBRlYWnpp10Me8yTjPScmG11+E7OQeHFuTIU
 urPe0ZoRT7yoWFN0fHsrc6RDdBT2YQ/lyIYSSuMUejdJegsb297IJi0gC
 C4hUcX7XqD4kqMjFWuoEdDhqW4XutPQDS6LYVXfol2plBRUnuhMWVj9tT
 7t8GbyDc0hVOo7zouWqlCb6a00kzrT7tJP/A4wemVt47HVQkpdCsnCvjt
 yciF0B0PFiI+mUZvM6oUP0JtgFJx7vDSF1P4OiOKH+qgqf1EzMlHlhI+q
 RgnX3ERemh7VRIldR5nItjDWsydXdeRGSc8REeFwX6fvPS9CUXH5Fm5RU A==;
X-CSE-ConnectionGUID: KZZE88eASY2vWjNh0OW7aw==
X-CSE-MsgGUID: wN2UUdHPTnyvlXfu2ORIYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54210931"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="54210931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:30:12 -0700
X-CSE-ConnectionGUID: +5EEburuR1CuclesCuccxg==
X-CSE-MsgGUID: jcn+S9w8QbuRjoLM3m3ofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="174347335"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 23:30:09 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v2 3/4] tests/intel/xe_pmu: Add a test to validate
 engine activity after starting load
Date: Thu, 29 May 2025 12:23:58 +0530
Message-ID: <20250529065359.915117-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250529065359.915117-1-riana.tauro@intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
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
index 198470365..21b294167 100644
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

