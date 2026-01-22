Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB4EC44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 10:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B260E10E06D;
	Thu, 22 Jan 2026 10:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHJJhLgN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D3210E052
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769079224; x=1800615224;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bvhSAS+YlXR/3XwBUaLCgcEAgm/qC4vI7QsZkqzjlLQ=;
 b=VHJJhLgNaLhWhRvUL6WG8fgNAdRGYa2zKF9tnl7aNy0KQ+8Lb78Scoxe
 Nh5lgNpcTGP9b/+nuzVoD+U1uk5YbcteHEgRmbXkL1qxI0qego24tUL8d
 4NumhzXIJ1fakmXrzKS5KJdXljxNN1jB3aIaZ0GEDbiYi2FNAqQyUppyh
 uqUAHSXLs+oAc0WxDVUvlP5pWWlyBWL4e7JxKAu1QnwlNLbqKmKW6e3OU
 o4UwWstbz04UZejRPzvp7Nqkurke8Ytg/0zXNGAKu+btAujtOGkT91l8P
 bzxGGUA5Du+YH6G+ilPEVeq9LePMNXjAT0TS+65nkhy5bsm/uIGhcfvlQ w==;
X-CSE-ConnectionGUID: PCxlQ63iTeajMJ1LBnwEEg==
X-CSE-MsgGUID: +1Kcy8NkTHmQOWYLLhfaFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57882505"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="57882505"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:53:44 -0800
X-CSE-ConnectionGUID: MHu5bHI0QAiT1KvKUfgeJw==
X-CSE-MsgGUID: K1tv740nTeu323KPQkY7YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206964520"
Received: from prudnick-desk.igk.intel.com ([10.91.34.80])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:53:43 -0800
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH 1/1] tests/xe_eudebug_online: Extract workload start helpers
Date: Thu, 22 Jan 2026 11:56:46 +0100
Message-ID: <20260122105645.3920549-2-piotr.rudnicki@intel.com>
X-Mailer: git-send-email 2.43.0
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

Extract duplicate workload start wait logic into reusable helpers
wait_for_workloads_start() and wait_for_workload_start().

Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
---
 tests/intel/xe_eudebug_online.c | 78 +++++++++++++++------------------
 1 file changed, 36 insertions(+), 42 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index ff6c5ff19..7e885f31f 100644
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
+				count += 1;
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
+	struct online_debug_data *array[1] = { data };
+
+	wait_for_workloads_start(array, 1);
+}
+
 static void eu_attention_debug_trigger(struct xe_eudebug_debugger *d,
 				       struct drm_xe_eudebug_event *e)
 {
@@ -1928,16 +1960,7 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
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
@@ -2014,16 +2037,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
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
@@ -2082,7 +2096,6 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 {
 	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
-	uint32_t val;
 	uint32_t random_command;
 	uint32_t bitmask_size = query_attention_bitmask_size(fd, hwe->gt_id);
 	uint8_t *attention_bitmask = malloc(bitmask_size * sizeof(uint8_t));
@@ -2110,16 +2123,7 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
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
++	wait_for_workload_start(data);
 
 	pthread_mutex_lock(&data->mutex);
 	igt_assert(data->client_handle != -1);
@@ -2237,7 +2241,6 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 	struct drm_xe_eudebug_event *e = NULL;
 	struct online_debug_data *data;
 	struct xe_eudebug_session *s;
-	uint32_t val;
 
 	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
@@ -2260,16 +2263,7 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
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
++	wait_for_workload_start(data);
 
 	pthread_mutex_lock(&data->mutex);
 	igt_assert(data->client_handle != -1);
-- 
2.43.0

