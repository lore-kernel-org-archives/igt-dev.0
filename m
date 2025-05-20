Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C24CC3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 05:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B28610E143;
	Tue, 20 May 2025 05:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVnFdLvP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E39A10E143
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 05:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747720203; x=1779256203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x5EnC5uckLY6x35zbWOVj+6a+hzBVjUPxg4dxDNarPw=;
 b=JVnFdLvPRn4M7H7SVfYbkanw13ZrccBSXDEZGhXbrkroBN5eTA/V1fV5
 GtcVHO/PfF4VHHTUXA83RfLnHAtFa7bsWMuJKKtb+Zr8QeutZpl1qNxdC
 faMwPaTd6KZUtAZ9qI6ExZp9VJn3EQl3m6ahOq7Jw0Az8Dn37cPnCHsM7
 YO8MoOzv36VPnr2uR44VGZAz4T1UHgt2JhcKCXnp13hZFQBmXhendjkhc
 rqJBFyZwa7T7P0grNf4oBjDCG8CHtWUU3xh+GkcW9R+9WPKiaB3VwquLe
 5v8xZSDNQUJtIjO6RvsuLVPZTscKFgeT9KvAlfzW9v0txSxhAS1NXTMoL Q==;
X-CSE-ConnectionGUID: 9x0Cpf3/SViQPHJPwqatiw==
X-CSE-MsgGUID: 0GbKDqmgTduBPIxvEO/ExQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60293567"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60293567"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 22:50:03 -0700
X-CSE-ConnectionGUID: HfSR6NztQ1mHKIYuQo+FZg==
X-CSE-MsgGUID: lnjLvyEWTdW6JO/C3m+tCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139621502"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 22:50:01 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 5/5] test/intel/xe_pmu: Add tests to validate engine
 activity by loading most engines
Date: Tue, 20 May 2025 11:43:36 +0530
Message-ID: <20250520061336.656057-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520061336.656057-1-riana.tauro@intel.com>
References: <20250520061336.656057-1-riana.tauro@intel.com>
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
v3: use per-engine flags (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_pmu.c | 72 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 545017542..f128dc44c 100644
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
@@ -311,6 +318,63 @@ static void engine_activity_load_single(int fd, int num_engines,
 	check_all_engines(num_engines, flag, before, after);
 }
 
+static void engine_activity_load_most(int fd, int num_engines, struct drm_xe_engine_class_instance *eci,
+				      unsigned int flags)
+{
+	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
+	struct drm_xe_engine_class_instance *eci_;
+	struct xe_cork *cork[num_engines];
+	int pmu_fd[num_engines * 2], flag[num_engines];
+	int idx = 0, engine_idx = 0;
+	uint32_t vm;
+
+	pmu_fd[0] = -1;
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+	xe_for_each_engine(fd, eci_) {
+		engine_idx = idx >> 1;
+		flag[engine_idx] = TEST_LOAD;
+
+		if (eci_->engine_class == eci->engine_class &&
+		    eci_->engine_instance == eci->engine_instance) {
+			flag[engine_idx] = TEST_IDLE;
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
+			end_cork(fd, cork[engine_idx]);
+	}
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
+
+	for (idx = 0; idx < num_engines * 2; idx += 2) {
+		engine_idx = idx >> 1;
+		end_cork(fd, cork[engine_idx]);
+		if (cork[engine_idx])
+			xe_cork_destroy(fd, cork[engine_idx]);
+		close(pmu_fd[idx]);
+		close(pmu_fd[idx + 1]);
+	}
+
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+
+	check_all_engines(num_engines, flag, before, after);
+}
+
 static void engine_activity_load_all(int fd, int num_engines, unsigned int flags)
 {
 	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
@@ -731,6 +795,14 @@ igt_main
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

