Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA81EC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BB910E518;
	Tue, 30 Jul 2024 11:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwLm3ryX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4EC10E513
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340129; x=1753876129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qf2D2/maxiUDo9KSxNUo6XGVoTPyDYy+kb/K6cZTT1o=;
 b=MwLm3ryXQjAH005OjBJ8yMX2quFECT9RysWWNdBoi9vdY/lP+2qP1peu
 gVlEPJ1DWDQPLMIwWWPFtuwo+yoHGy55Y99jGpOR/tastHlb+cjLpfMzS
 uniOxzd6yp5JICpReI3Dvw6CTTvMo9ebeqGolXIaIiYvmtwEkwKkiQhpo
 kcOm8VA5Tmh4IUaBLB/Lam4/RQ2HN/6cmpe6C7LSU4tEbC5Zh72pcXApB
 VrNcqdkuR5XedfWvS6RISuTa1zLI6vRm0UNimbWYIuQA1+pXoZKOWJZuA
 h6GKFLSgxZ5bc/uXAwppC+IKcesk8xz4B39Psxt1c/3f4at1SiLlOfUtr Q==;
X-CSE-ConnectionGUID: B72ilUYoSAqHnuQOraEO0w==
X-CSE-MsgGUID: 3y9MChyMSC6Lzj286BYFZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937422"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937422"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:49 -0700
X-CSE-ConnectionGUID: ymWGwalgRaKsF5njAWi9HA==
X-CSE-MsgGUID: 8zkZ6lKRRqmkN0x0K3RosA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217232"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:44 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 42/66] tests/xe_exec_sip: Add
 breakpoint-writesip-twice test
Date: Tue, 30 Jul 2024 13:44:59 +0200
Message-Id: <20240730114523.334156-43-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Add breakpoint-writesip-twice test that checks twice if
we enter SIP after hitting breakpoint in shader.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
---
 tests/intel/xe_exec_sip.c | 40 ++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 832c26bac..7b4305576 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -42,6 +42,8 @@
 #define SIP_NULL 4
 #define SIP_WAIT 5
 
+#define F_SUBMIT_TWICE	(1 << 0)
+
 static struct intel_buf *
 create_fill_buf(int fd, int width, int height, uint8_t color)
 {
@@ -259,11 +261,14 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  * SUBTEST: breakpoint-writesip
  * Description: Test that we enter SIP after hitting breakpoint in shader.
  *
+ * SUBTEST: breakpoint-writesip-twice
+ * Description: Test twice that we enter SIP after hitting breakpoint in shader.
+ *
  * SUBTEST: breakpoint-waitsip
  * Description: Test that we reset after seeing the attention without the debugger.
  *
  */
-static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *eci)
+static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *eci, uint32_t flags)
 {
 	unsigned int threads = 512;
 	unsigned int height = max_t(threads, HEIGHT, threads * 2);
@@ -274,6 +279,7 @@ static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *e
 		.value = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE,
 	};
 	struct timespec ts = { };
+	int done = 0;
 	uint32_t exec_queue_id, handle, vm_id;
 	struct intel_bb *ibb;
 	uint64_t timeout;
@@ -284,7 +290,6 @@ static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *e
 	fd = drm_open_driver(DRIVER_XE);
 	xe_device_get(fd);
 
-
 	vm_id = xe_vm_create(fd, 0, 0);
 
 	/* Get timeout for job, and add 4s to ensure timeout processes in subtest. */
@@ -295,19 +300,21 @@ static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *e
 	exec_queue_id = xe_exec_queue_create(fd, vm_id, eci,
 					     xe_eudebug_debugger_available(fd) ?
 					     to_user_pointer(&ext) : 0);
-	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
+	do {
+		ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
 
-	igt_nsec_elapsed(&ts);
-	handle = gpgpu_shader(fd, ibb, shader, sip, threads, width, height);
+		igt_nsec_elapsed(&ts);
+		handle = gpgpu_shader(fd, ibb, shader, sip, threads, width, height);
 
-	intel_bb_sync(ibb);
-	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
+		intel_bb_sync(ibb);
+		igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
 
-	dispatched = check_buf(fd, handle, width, height, sip, COLOR_C4);
-	check_usercoredump(fd, sip, dispatched);
+		dispatched = check_buf(fd, handle, width, height, sip, COLOR_C4);
+		check_usercoredump(fd, sip, dispatched);
 
-	gem_close(fd, handle);
-	intel_bb_destroy(ibb);
+		gem_close(fd, handle);
+		intel_bb_destroy(ibb);
+	} while (!done++ && (flags & F_SUBMIT_TWICE));
 
 	xe_exec_queue_destroy(fd, exec_queue_id);
 	xe_vm_destroy(fd, vm_id);
@@ -333,7 +340,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 
 	test_render_and_compute("sanity", fd, eci)
-		test_sip(SHADER_WRITE, SIP_NULL, eci);
+		test_sip(SHADER_WRITE, SIP_NULL, eci, 0);
 
 	/* Debugger disabled (TD_CTL not set) */
 	igt_subtest_group {
@@ -343,7 +350,7 @@ igt_main
 		}
 
 		test_render_and_compute("wait-writesip-nodebug", fd, eci)
-			test_sip(SHADER_WAIT, SIP_WRITE, eci);
+			test_sip(SHADER_WAIT, SIP_WRITE, eci, 0);
 
 		igt_fixture
 			xe_eudebug_enable(fd, was_enabled);
@@ -356,10 +363,13 @@ igt_main
 		}
 
 		test_render_and_compute("breakpoint-writesip", fd, eci)
-			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci);
+			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, 0);
+
+		test_render_and_compute("breakpoint-writesip-twice", fd, eci)
+			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, F_SUBMIT_TWICE);
 
 		test_render_and_compute("breakpoint-waitsip", fd, eci)
-			test_sip(SHADER_BREAKPOINT, SIP_WAIT, eci);
+			test_sip(SHADER_BREAKPOINT, SIP_WAIT, eci, 0);
 
 		igt_fixture
 			xe_eudebug_enable(fd, was_enabled);
-- 
2.34.1

