Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79614C3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C27910E50E;
	Tue, 30 Jul 2024 11:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNHBammr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252E510E50E
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340116; x=1753876116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y3gDzwTWK8EXsqGZJGmGXQlMP/RXmMBf5NKJop6j7Jg=;
 b=WNHBammrNPfa2166qElDUBbO6fKrBYEXzSlQI22DUsZGULEfweiPyogM
 xoATZFaSg/Qu7IcIZsli+YKcFKf1Ul9eJmbcns/aK5KI6GdQ1Z0aftjYU
 vRlYBSpj1ZG3NWC7BatXLBIylo+aJtXxKFuOgv2QPZL/nAQItSC4ChbsA
 YlwFZvOpmTT4fvQ90d7/Pr195bH5v+KlOEh33zIb+lGmjIQX4rsnuRAH6
 LxH2UflQhH3GVhtppEqss1PVvYldo3F4Wdc21+0Dpsv0/FcLZBhRpVJPZ
 6DwPO7IE4TwPuLS5fkG5JrA0PSAXbZElZ+jz9NPrXGvcsCoFusFJVOaiN A==;
X-CSE-ConnectionGUID: myTw3xOCSe2+SXjVQc6gcA==
X-CSE-MsgGUID: TcIZL5kiSSS8YMIgaCuwzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937382"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937382"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:35 -0700
X-CSE-ConnectionGUID: iAWhEBfJSsGhj3LW9iNJIg==
X-CSE-MsgGUID: NEPJpuRVROejgdU3xHpLLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217123"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:32 -0700
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
Subject: [PATCH i-g-t v2 38/66] tests/xe_exec_sip: Port tests for shaders and
 sip
Date: Tue, 30 Jul 2024 13:44:55 +0200
Message-Id: <20240730114523.334156-39-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

SIP is a System Instruction Pointer, which the hardware will
except/jump into when some defined event occurs, debug mode
is enabled and pipeline setup has included sip program.

Events like illegal instruction or breakpoint hit will jump
into SIP directly. Driver can also except into sip during hang
resolution and SIP can do, for example, eu thread state snapshot
before the hang resolution ends up in a hardware state reset.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_exec_sip.c | 129 ++++++++++++++++++++++++++++++++++----
 1 file changed, 116 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 4b599e7f6..e52889818 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -21,6 +21,7 @@
 #include "gpgpu_shader.h"
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "xe/xe_eudebug.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -30,9 +31,16 @@
 #define COLOR_C4 0xc4
 
 #define SHADER_CANARY 0x01010101
+#define SIP_CANARY 0x02020202
 
 #define NSEC_PER_MSEC (1000 * 1000ull)
 
+#define SHADER_BREAKPOINT 0
+#define SHADER_WRITE 1
+#define SHADER_WAIT 2
+#define SIP_WRITE 3
+#define SIP_NULL 4
+
 static struct intel_buf *
 create_fill_buf(int fd, int width, int height, uint8_t color)
 {
@@ -52,27 +60,78 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
 	return buf;
 }
 
-static struct gpgpu_shader *get_shader(int fd)
+static struct gpgpu_shader *get_shader(int fd, const int shadertype)
 {
 	static struct gpgpu_shader *shader;
 
 	shader = gpgpu_shader_create(fd);
 	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+
+	switch (shadertype) {
+	case SHADER_WAIT:
+		gpgpu_shader__wait(shader);
+		break;
+	case SHADER_WRITE:
+		break;
+	case SHADER_BREAKPOINT:
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__breakpoint(shader);
+		break;
+	}
+
 	gpgpu_shader__eot(shader);
 	return shader;
 }
 
-static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, unsigned int threads,
-			     unsigned int width, unsigned int height)
+static struct gpgpu_shader *get_sip(int fd, const int siptype,
+				    const int shadertype, unsigned int y_offset)
+{
+	static struct gpgpu_shader *sip;
+
+	if (siptype == SIP_NULL)
+		return NULL;
+
+	sip = gpgpu_shader_create(fd);
+	gpgpu_shader__write_dword(sip, SIP_CANARY, y_offset);
+
+	switch (siptype) {
+	case SIP_WRITE:
+		break;
+	/* TODO: Add alternative SIP instructions here */
+	}
+
+	gpgpu_shader__end_system_routine(sip, shadertype == SHADER_BREAKPOINT);
+	return sip;
+}
+
+static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, const int shadertype, const int siptype,
+			     unsigned int threads, unsigned int width, unsigned int height)
 {
 	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
-	struct gpgpu_shader *shader = get_shader(fd);
+	struct gpgpu_shader *sip = get_sip(fd, siptype, shadertype, height / 2);
+	struct gpgpu_shader *shader = get_shader(fd, shadertype);
+
+	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
 
-	gpgpu_shader_exec(ibb, buf, 1, threads, shader, NULL, 0, 0);
+	if (sip)
+		gpgpu_shader_destroy(sip);
 	gpgpu_shader_destroy(shader);
+
 	return buf->handle;
 }
 
+static bool has_debugger(int fd)
+{
+	struct drm_xe_eudebug_connect param = { .pid = getpid() };
+	int debugfd;
+
+	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
+	if (debugfd >= 0)
+		close(debugfd);
+
+	return debugfd >= 0;
+}
+
 static void check_fill_buf(uint8_t *ptr, const int width, const int x,
 			   const int y, const uint8_t color)
 {
@@ -84,10 +143,10 @@ static void check_fill_buf(uint8_t *ptr, const int width, const int x,
 }
 
 static void check_buf(int fd, uint32_t handle, int width, int height,
-		      uint8_t poison_c)
+		      int siptype, uint8_t poison_c)
 {
 	unsigned int sz = ALIGN(width * height, 4096);
-	int thread_count = 0;
+	int thread_count = 0, sip_count = 0;
 	uint32_t *ptr;
 	int i, j;
 
@@ -105,7 +164,25 @@ static void check_buf(int fd, uint32_t handle, int width, int height,
 		i = 0;
 	}
 
+	for (i = 0, j = height / 2; j < height; ++j) {
+		if (ptr[j * width / 4] == SIP_CANARY) {
+			++sip_count;
+			i = 4;
+		}
+
+		for (; i < width; i++)
+			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
+
+		i = 0;
+	}
+
 	igt_assert(thread_count);
+	if (siptype != SIP_NULL && has_debugger(fd))
+		igt_assert_f(thread_count == sip_count,
+			     "Thread and SIP count mismatch, %d != %d\n",
+			     thread_count, sip_count);
+	else
+		igt_assert(sip_count == 0);
 
 	munmap(ptr, sz);
 }
@@ -128,16 +205,22 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  * Description: check basic shader with write operation
  * Run type: BAT
  *
+ * SUBTEST: wait-writesip-nodebug
+ * Description: verify that we don't enter SIP after wait with debugging disabled.
+ *
+ * SUBTEST: breakpoint-writesip
+ * Description: Test that we enter SIP after hitting breakpoint in shader.
+ *
  */
-static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
+static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *eci)
 {
 	unsigned int threads = 512;
 	unsigned int height = max_t(threads, HEIGHT, threads * 2);
-	uint32_t exec_queue_id, handle, vm_id;
 	unsigned int width = WIDTH;
 	struct timespec ts = { };
-	uint64_t timeout;
+	uint32_t exec_queue_id, handle, vm_id;
 	struct intel_bb *ibb;
+	uint64_t timeout;
 	int fd;
 
 	igt_debug("Using %s\n", xe_engine_class_string(eci->engine_class));
@@ -156,12 +239,12 @@ static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
 	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
 
 	igt_nsec_elapsed(&ts);
-	handle = gpgpu_shader(fd, ibb, threads, width, height);
+	handle = gpgpu_shader(fd, ibb, shader, sip, threads, width, height);
 
 	intel_bb_sync(ibb);
 	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
 
-	check_buf(fd, handle, width, height, COLOR_C4);
+	check_buf(fd, handle, width, height, sip, COLOR_C4);
 
 	gem_close(fd, handle);
 	intel_bb_destroy(ibb);
@@ -189,7 +272,27 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 
 	test_render_and_compute("sanity", fd, eci)
-		test_sip(eci, 0);
+		test_sip(SHADER_WRITE, SIP_NULL, eci);
+
+	/* Debugger disabled (TD_CTL not set) */
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(!has_debugger(fd));
+		}
+
+		test_render_and_compute("wait-writesip-nodebug", fd, eci)
+			test_sip(SHADER_WAIT, SIP_WRITE, eci);
+	}
+
+	/* Debugger enabled (TD_CTL set) */
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(has_debugger(fd));
+		}
+
+		test_render_and_compute("breakpoint-writesip", fd, eci)
+			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci);
+	}
 
 	igt_fixture
 		drm_close_driver(fd);
-- 
2.34.1

