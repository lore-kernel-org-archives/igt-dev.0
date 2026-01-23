Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABED8D74EC1
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 12:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5603910EAD8;
	Fri, 23 Jan 2026 12:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyUaY8Si";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531FD10EAD3
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 12:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769172748; x=1800708748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sYqHF+kZUXRqS7hdAepTeCFo33SKbt23FpviT5b4/BI=;
 b=lyUaY8SiENKx/m/9k8w90/vkvkYgMU+1DxseeREsKo5g3WomYoSdMt90
 kLPj1LSYmd1qAUbM43UMowhk/OiykqfV0Pnrg98aYmbDgKoXlBCXDN+sC
 8njujtl2YKwNKgBMI0TY1JvXSSdABW2MHnypvj7fiBdO+GCQThiZk7sri
 VdvtNO0Cv6oJH3QgCgT2Vo+EsjVFA9REhXbri0fOfOtipBrhHqwK60LlZ
 GXPTOgMk2s3RoLwuH7unLfAKl2JNVMsTXVqvofRmcJridsMn0IYCvWUAT
 WZZc9XbIxC4sydOQDAxEkEy8Qpgw3nA48QWTj+ocoZ/XwkqiNE7ORjBS6 g==;
X-CSE-ConnectionGUID: dVIvhdg+TqqZBhWHYTQHyA==
X-CSE-MsgGUID: pw6cV+uDTJCCDdB+HR46wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70400104"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70400104"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 04:52:27 -0800
X-CSE-ConnectionGUID: eZL9HMK2T/2/DYSwurOdVw==
X-CSE-MsgGUID: rEZ87oOISxqE+s2APHDu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="206279515"
Received: from prudnick-desk.igk.intel.com ([10.91.34.80])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 04:52:26 -0800
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: [PATCH i-g-t v3 1/1] tests/xe_eudebug_online: Extract workload start
 helpers
Date: Fri, 23 Jan 2026 13:53:43 +0100
Message-ID: <20260123125342.311645-2-piotr.rudnicki@intel.com>
X-Mailer: git-send-email 2.43.0
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

Extract duplicate workload start wait logic into reusable helpers
wait_for_workloads_start() and wait_for_workload_start().

Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
---
V1 -> V2: Use count++ and implicit array size per review feedback
V2 -> V3: Fix compilation errors

 tests/intel/xe_eudebug_online.c | 80 +++++++++++++++------------------
 1 file changed, 36 insertions(+), 44 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index ff6c5ff19..084bdeb77 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -470,6 +470,38 @@ static void online_debug_data_destroy(struct online_debug_data *data)
 	munmap(data, ALIGN(sizeof(*data), PAGE_SIZE));
 }
 
+static void wait_for_workloads_start(struct online_debug_data **data, int n)
+{
+	int val;
+	int count;
+	int i;
+
+	igt_for_milliseconds(n * STARTUP_TIMEOUT_MS) {
+		count = 0;
+		for (i = 0; i < n; i++) {
+			if (READ_ONCE(data[i]->vm_fd) == -1 ||
+			    READ_ONCE(data[i]->target_size) == 0)
+				continue;
+
+			if (pread(data[i]->vm_fd, &val, sizeof(val),
+				  data[i]->target_offset) == sizeof(val) &&
+			    val != 0)
+				count++;
+		}
+
+		if (count == n)
+			break;
+	}
+	igt_assert_eq(count, n);
+}
+
+static void wait_for_workload_start(struct online_debug_data *data)
+{
+	struct online_debug_data *array[] = { data };
+
+	wait_for_workloads_start(array, 1);
+}
+
 static void eu_attention_debug_trigger(struct xe_eudebug_debugger *d,
 				       struct drm_xe_eudebug_event *e)
 {
@@ -1903,7 +1935,6 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 {
 	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
-	uint32_t val;
 
 	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
 
@@ -1928,16 +1959,7 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	xe_eudebug_debugger_start_worker(s->debugger);
 	xe_eudebug_client_start(s->client);
 
-	/* wait for workload to start */
-	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
-		/* collect needed data from triggers */
-		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
-			continue;
-
-		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
-			if (val != 0)
-				break;
-	}
+	wait_for_workload_start(data);
 
 	pthread_mutex_lock(&data->mutex);
 	igt_assert(data->client_handle != -1);
@@ -1996,7 +2018,6 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	struct xe_eudebug_session *s;
 	struct xe_eudebug_client *debugee;
 	int debugee_flags = SHADER_LOOP | DO_NOT_EXPECT_CANARIES;
-	int val;
 
 	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
@@ -2014,16 +2035,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	xe_eudebug_debugger_start_worker(s->debugger);
 	xe_eudebug_client_start(s->client);
 
-	/* wait for workload to start */
-	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
-		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
-			continue;
-
-		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
-			if (val != 0)
-				break;
-	}
-	igt_assert_f(val != 0, "Workload execution is not yet started\n");
+	wait_for_workload_start(data);
 
 	xe_eudebug_debugger_detach(s->debugger);
 	reset_debugger_log(s->debugger);
@@ -2082,7 +2094,6 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 {
 	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
-	uint32_t val;
 	uint32_t random_command;
 	uint32_t bitmask_size = query_attention_bitmask_size(fd, hwe->gt_id);
 	uint8_t *attention_bitmask = malloc(bitmask_size * sizeof(uint8_t));
@@ -2110,16 +2121,7 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	xe_eudebug_debugger_start_worker(s->debugger);
 	xe_eudebug_client_start(s->client);
 
-	/* wait for workload to start */
-	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
-		/* collect needed data from triggers */
-		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
-			continue;
-
-		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
-			if (val != 0)
-				break;
-	}
+	wait_for_workload_start(data);
 
 	pthread_mutex_lock(&data->mutex);
 	igt_assert(data->client_handle != -1);
@@ -2237,7 +2239,6 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 	struct drm_xe_eudebug_event *e = NULL;
 	struct online_debug_data *data;
 	struct xe_eudebug_session *s;
-	uint32_t val;
 
 	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
@@ -2260,16 +2261,7 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 	xe_eudebug_debugger_start_worker(s->debugger);
 	xe_eudebug_client_start(s->client);
 
-	/* wait for workload to start */
-	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
-		/* collect needed data from triggers */
-		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
-			continue;
-
-		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
-			if (val != 0)
-				break;
-	}
+	wait_for_workload_start(data);
 
 	pthread_mutex_lock(&data->mutex);
 	igt_assert(data->client_handle != -1);
-- 
2.43.0

