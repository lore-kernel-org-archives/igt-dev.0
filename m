Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BD4F01839
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9B410ED41;
	Fri,  6 Mar 2026 13:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gp6E05nF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2602310ED40
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772803880; x=1804339880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sORGB8C3z7hN66s7MbTsFyVG9WbyVV0ELgVqv6riRLk=;
 b=gp6E05nF7VlRVAJ4Fu6v/hrtavnJkt9z1vNeU8oRgspGNLz3gPGj2eby
 aPky7wk6zz061ZyHRTwyAvUBjh76gqq9fGSn6QWkpy1LMNPqt6aUjy7q8
 oLUJtqjde5aStihTMklvEV09ymFZRaX0Boygzsy6dTgb3h24/QtETPq0B
 jTpicyUTPjP4csGE6eygFolQYZShcwxhi0qhoJFrFXOYRlpVZZ54Ihw2Z
 sGycfWQtKnUgjWwEigmiPqv5CYRsjmichEXbpV1QLdRDZnCQUZFXGWHqc
 OflMPQ35AwDrJ173MUT8OfRtDf4DR82sbi1nAI9J3rsLOcFOeSTAhfmZC g==;
X-CSE-ConnectionGUID: vVa5ORw+TUapFvFkUubHYw==
X-CSE-MsgGUID: AC7y6e1zSN2LAXoKwXk+Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84236848"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="84236848"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:31:19 -0800
X-CSE-ConnectionGUID: OGqKL4LRTN2G2BxWJ57H+Q==
X-CSE-MsgGUID: EZpIPVcoSWGtUf2NgolS8w==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.208])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:31:17 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t,
 v2 2/4] tests/intel/xe_exec_system_allocator: Allow looping in compute
Date: Fri,  6 Mar 2026 14:29:10 +0100
Message-ID: <20260306133059.859625-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306133059.859625-1-francois.dugast@intel.com>
References: <20260306133059.859625-1-francois.dugast@intel.com>
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

The default behavior remains unchanged but the user can decide to
stress the system by setting this environment variable:
IGT_SVM_COMPUTE_LOOPS. For example:

    IGT_SVM_COMPUTE_LOOPS=10 xe_exec_system_allocator --r eu-fault-2m-once-device

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 36 ++++++++++++++++----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 73603a27c..ff85a67dc 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2240,7 +2240,7 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
  * @range-device-host:				touch the whole buffer, from the device then from the host
  */
 static void
-test_compute(int fd, size_t size, unsigned int flags)
+test_compute(int fd, size_t size, unsigned int flags, int loops)
 {
 	struct drm_xe_sync sync = {
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -2265,19 +2265,22 @@ test_compute(int fd, size_t size, unsigned int flags)
 	bind_system_allocator(&sync, 1);
 	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 
-	compute_input = aligned_alloc(size, size);
-	igt_assert(compute_input);
-
 	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
 	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
-	env.input_addr = to_user_pointer(compute_input);
 	env.vm = vm;
 
-	memset(compute_input, rand() % 255 + 1, size);
+	for (int i = 0; i < loops; i++) {
+		compute_input = aligned_alloc(size, size);
+		igt_assert(compute_input);
+		env.input_addr = to_user_pointer(compute_input);
+
+		memset(compute_input, rand() % 255 + 1, size);
 
-	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
+		run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
+
+		free(compute_input);
+	}
 
-	free(compute_input);
 	unbind_system_allocator();
 	xe_vm_destroy(fd, vm);
 }
@@ -2288,6 +2291,13 @@ struct section {
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
@@ -2458,7 +2468,7 @@ int igt_main()
 		{ NULL },
 	};
 
-	int fd;
+	int fd, svm_compute_loops = getenv_int("IGT_SVM_COMPUTE_LOOPS", 1);
 
 	igt_fixture() {
 		struct xe_device *xe;
@@ -2675,15 +2685,15 @@ int igt_main()
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

