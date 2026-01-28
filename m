Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CB5D46BE1
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 17:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C42810E751;
	Wed, 28 Jan 2026 17:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E64tLjoj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715F410E750
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 17:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769621672; x=1801157672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TegAHFuHWPU2gl4qjH9iRo7eaZpEaQIofHZc659nbe4=;
 b=E64tLjoj2DtQS6xupZz7LqOZRHoOHdaSKd5a5sCqfje+lWrfIOpzh0ZE
 zNw3+ZvlPrEIKl8ZlKLf2FPH5XBWSpuarq/i2IqZWn+55dDKJS7WGnWMZ
 pFiOdrE0cNexTd6fAzAs4MEzzZ3pJYYVviJISw2qQ9Z9ypLxmtv7EOF0t
 VqK83iHDusXyKFMqbpD4PaPbDtXOKG0sKm+QeUN3XLuKaQ4tve25mwjVV
 801zYBdSW/QpNNChpWJtu7K9jqGhQIZJTa8L6f5zCF6eVwMokagg1n1XQ
 pyLkXEIRsoXWTFNMQbRxqzGNwBXT02b0gtHQTZV3KpYVhmufr63u3/+iY g==;
X-CSE-ConnectionGUID: yPU4NCoBQ1u+7CJL9xRrLQ==
X-CSE-MsgGUID: zjxuvBpWTzSEX+dj/21TMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82213450"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82213450"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:32 -0800
X-CSE-ConnectionGUID: OJA3CQ+/S527r/yt2qhRGw==
X-CSE-MsgGUID: CIFtQkHtQ4yCdCl3Ssq6MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245927190"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:31 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/5] tests/intel/xe_exec_system_allocator: Allow looping
 in compute
Date: Wed, 28 Jan 2026 18:29:07 +0100
Message-ID: <20260128173412.1319610-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128173412.1319610-1-francois.dugast@intel.com>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
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

The default behavior remains unchanged but the user can decide to
stress the system by setting this environment variable:
IGT_SVM_COMPUTE_LOOPS. For example:

    IGT_SVM_COMPUTE_LOOPS=10 xe_exec_system_allocator --r eu-fault-2m-once-device

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 36 ++++++++++++++++----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 23a429f24..c5193f81e 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2202,7 +2202,7 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
  * @range-device-host:				touch the whole buffer, from the device then from the host
  */
 static void
-test_compute(int fd, size_t size, unsigned int flags)
+test_compute(int fd, size_t size, unsigned int flags, int loops)
 {
 	struct drm_xe_sync sync = {
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -2227,19 +2227,22 @@ test_compute(int fd, size_t size, unsigned int flags)
 	bind_system_allocator(&sync, 1);
 	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 
-	compute_input = aligned_alloc(size, size);
-	igt_assert(compute_input);
-
 	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
 	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
-	env.input_addr = to_user_pointer(compute_input);
 	env.vm = vm;
 
-	memset(compute_input, (rand() & 0xff), size);
+	for (int i = 0; i < loops; i++) {
+		compute_input = aligned_alloc(size, size);
+		igt_assert(compute_input);
+		env.input_addr = to_user_pointer(compute_input);
+
+		memset(compute_input, (rand() & 0xff), size);
 
-	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
+		run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
+
+		free(compute_input);
+	}
 
-	free(compute_input);
 	unbind_system_allocator();
 	xe_vm_destroy(fd, vm);
 }
@@ -2250,6 +2253,13 @@ struct section {
 	uint8_t (*fn)(int pat);
 };
 
+static int getenv_int(const char *var, int def_val)
+{
+	char *env = getenv(var);
+
+	return env ? atoi(env) : def_val;
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -2420,7 +2430,7 @@ int igt_main()
 		{ NULL },
 	};
 
-	int fd;
+	int fd, svm_compute_loops = getenv_int("IGT_SVM_COMPUTE_LOOPS", 1);
 
 	igt_fixture() {
 		struct xe_device *xe;
@@ -2637,15 +2647,15 @@ int igt_main()
 	}
 
 	igt_subtest("compute")
-		test_compute(fd, SZ_2M, 0);
+		test_compute(fd, SZ_2M, 0, svm_compute_loops);
 
 	for (const struct section *s = csections; s->name; s++) {
 		igt_subtest_f("eu-fault-4k-%s", s->name)
-			test_compute(fd, SZ_4K, s->flags);
+			test_compute(fd, SZ_4K, s->flags, svm_compute_loops);
 		igt_subtest_f("eu-fault-64k-%s", s->name)
-			test_compute(fd, SZ_64K, s->flags);
+			test_compute(fd, SZ_64K, s->flags, svm_compute_loops);
 		igt_subtest_f("eu-fault-2m-%s", s->name)
-			test_compute(fd, SZ_2M, s->flags);
+			test_compute(fd, SZ_2M, s->flags, svm_compute_loops);
 	}
 
 	igt_fixture() {
-- 
2.43.0

