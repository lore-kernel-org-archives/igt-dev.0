Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B05C531DC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 18:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4D810E4B8;
	Fri, 23 Aug 2024 18:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCzKSgF4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E261710E861
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 18:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724437400; x=1755973400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yp65OYVKmy2uS6350EZebYfrXIO5nBMNSum8EIngWYI=;
 b=bCzKSgF4gui0MTh6eIJVyONYbQpDGa+07edmsjtvwqY79kuvKdgQvfku
 OW0shUm6LjnWjWyFWO1AhTE6v8aCfZWemaD/y2VgzUanUKtC7gxLbKtgi
 m5LCHVQPQmORClYDW/dloJmU95tUnqny5JDqaXvBQkcJp7OckvqWOt6tC
 CMw5wkRiAsODYsPEAWvs0BC1e659x5QnlAWzJkaZR7xr+N2NWJ2iTlTGb
 SegJSQlyZjGrOYg1Ku+lORBtsBN0kemBFaZ13j3ks0tC04ImstKvRnUIA
 DT/xYChRsW9tP6K8l3YX24LknEwKOJ0TubgmpkA1R85vuo4UfGHKxEooS w==;
X-CSE-ConnectionGUID: rDfGDOsHTGeq4rJ15CUG/A==
X-CSE-MsgGUID: 7v3k2m4fTPuLBmYc2GC2tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34079292"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="34079292"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 11:23:20 -0700
X-CSE-ConnectionGUID: S/6GjqOfTcCixG0DUiJqig==
X-CSE-MsgGUID: xc3GAVI4TyK/qCdsux0KHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="92606117"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.10])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 11:23:16 -0700
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
Subject: [PATCH i-g-t v4 10/17] tests/xe_exec_sip: Introduce invalid
 instruction tests
Date: Fri, 23 Aug 2024 20:22:15 +0200
Message-Id: <20240823182222.305965-11-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823182222.305965-1-christoph.manszewski@intel.com>
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
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

From: Andrzej Hajda <andrzej.hajda@intel.com>

Xe2 and earlier gens are able to handle very limited set of invalid
instructions - only illegal and undefined opcodes, other errors in
instruction can cause undefined behavior.
Illegal/undefined opcode results in:
- setting illegal opcode status bit - cr0.1[28],
- calling SIP if illegal opcode bit is enabled - cr0.1[12].
cr0.1[12] can be enabled directly from the thread or by thread dispatcher
from Interface Descriptor Data provided to COMPUTE_WALKER instruction.

Implemented cases:
- check if SIP is not called when exception is not enabled,
- check if SIP is called when exception is enabled from EU thread,
- check if SIP is called when exception is enabled from COMPUTE_WALKER

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_exec_sip.c | 117 ++++++++++++++++++++++++++++++++++----
 1 file changed, 106 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 5d57d2c78..780f977bc 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -30,9 +30,19 @@
 #define COLOR_C4 0xc4
 
 #define SHADER_CANARY 0x01010101
+#define SIP_CANARY 0x02020202
 
 #define SHADER_HANG 0
-#define SHADER_WRITE 1
+#define SHADER_INV_INSTR_DISABLED 1
+#define SHADER_INV_INSTR_THREAD_ENABLED 2
+#define SHADER_INV_INSTR_WALKER_ENABLED 3
+#define SHADER_WRITE 4
+#define SIP_INV_INSTR 5
+#define SIP_NULL 6
+
+/* Control Register cr0.1 bits for exception handling */
+#define ILLEGAL_OPCODE_ENABLE BIT(12)
+#define ILLEGAL_OPCODE_STATUS BIT(28)
 
 static struct intel_buf *
 create_fill_buf(int fd, int width, int height, uint8_t color)
@@ -56,8 +66,12 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
 static struct gpgpu_shader *get_shader(int fd, const int shadertype)
 {
 	static struct gpgpu_shader *shader;
+	uint32_t bad;
 
 	shader = gpgpu_shader_create(fd);
+	if (shadertype == SHADER_INV_INSTR_WALKER_ENABLED)
+		shader->illegal_opcode_exception_enable = true;
+
 	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
 
 	switch (shadertype) {
@@ -68,19 +82,59 @@ static struct gpgpu_shader *get_shader(int fd, const int shadertype)
 		break;
 	case SHADER_WRITE:
 		break;
+	case SHADER_INV_INSTR_THREAD_ENABLED:
+		gpgpu_shader__set_exception(shader, ILLEGAL_OPCODE_ENABLE);
+		__attribute__ ((fallthrough));
+	case SHADER_INV_INSTR_DISABLED:
+	case SHADER_INV_INSTR_WALKER_ENABLED:
+		bad = (shadertype == SHADER_INV_INSTR_DISABLED) ? ILLEGAL_OPCODE_ENABLE : 0;
+		gpgpu_shader__write_on_exception(shader, 1, 0, ILLEGAL_OPCODE_ENABLE, bad);
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__nop(shader);
+		/* modify second nop, set only opcode bits[6:0] */
+		shader->instr[shader->size/4 - 1][0] = 0x7f;
+		/* SIP should clear exception bit */
+		bad = ILLEGAL_OPCODE_STATUS;
+		gpgpu_shader__write_on_exception(shader, 2, 0, ILLEGAL_OPCODE_STATUS, bad);
+		break;
 	}
 
 	gpgpu_shader__eot(shader);
 	return shader;
 }
 
-static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, const int shadertype,
+static struct gpgpu_shader *get_sip(int fd, const int siptype, unsigned int y_offset)
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
+	case SIP_INV_INSTR:
+		gpgpu_shader__write_on_exception(sip, 1, y_offset, ILLEGAL_OPCODE_STATUS, 0);
+		break;
+	}
+
+	gpgpu_shader__end_system_routine(sip, false);
+	return sip;
+}
+
+static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, const int shadertype, const int siptype,
 			     unsigned int threads, unsigned int width, unsigned int height)
 {
 	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
+	struct gpgpu_shader *sip = get_sip(fd, siptype, height / 2);
 	struct gpgpu_shader *shader = get_shader(fd, shadertype);
 
-	gpgpu_shader_exec(ibb, buf, 1, threads, shader, NULL, 0, 0);
+	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
+
+	if (sip)
+		gpgpu_shader_destroy(sip);
+
 	gpgpu_shader_destroy(shader);
 	return buf->handle;
 }
@@ -96,10 +150,10 @@ static void check_fill_buf(uint8_t *ptr, const int width, const int x,
 }
 
 static void check_buf(int fd, uint32_t handle, int width, int height,
-		      uint8_t poison_c)
+		      int shadertype, int siptype, uint8_t poison_c)
 {
 	unsigned int sz = ALIGN(width * height, 4096);
-	int thread_count = 0;
+	int thread_count = 0, sip_count = 0;
 	uint32_t *ptr;
 	int i, j;
 
@@ -117,7 +171,27 @@ static void check_buf(int fd, uint32_t handle, int width, int height,
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
+	if (shadertype == SHADER_INV_INSTR_DISABLED)
+		igt_assert(!sip_count);
+	else if (siptype == SIP_INV_INSTR && shadertype != SHADER_INV_INSTR_DISABLED)
+		igt_assert_f(thread_count == sip_count,
+			     "Thread and SIP count mismatch, %d != %d\n",
+			     thread_count, sip_count);
+	else
+		igt_assert(sip_count == 0);
 
 	munmap(ptr, sz);
 }
@@ -141,8 +215,20 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  *
  * SUBTEST: sanity-after-timeout
  * Description: check basic shader execution after job timeout
+ *
+ * SUBTEST: invalidinstr-disabled
+ * Description: Verify that we don't enter SIP after running into an invalid
+ *		instruction when exception is not enabled.
+ *
+ * SUBTEST: invalidinstr-thread-enabled
+ * Description: Verify that we enter SIP after running into an invalid instruction
+ *              when exception is enabled from thread.
+ *
+ * SUBTEST: invalidinstr-walker-enabled
+ * Description: Verify that we enter SIP after running into an invalid instruction
+ *              when exception is enabled from COMPUTE_WALKER.
  */
-static void test_sip(int shader, struct drm_xe_engine_class_instance *eci, uint32_t flags)
+static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *eci, uint32_t flags)
 {
 	unsigned int threads = 512;
 	unsigned int height = max_t(threads, HEIGHT, threads * 2);
@@ -169,12 +255,12 @@ static void test_sip(int shader, struct drm_xe_engine_class_instance *eci, uint3
 	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
 
 	igt_nsec_elapsed(&ts);
-	handle = gpgpu_shader(fd, ibb, shader, threads, width, height);
+	handle = gpgpu_shader(fd, ibb, shader, sip, threads, width, height);
 
 	intel_bb_sync(ibb);
 	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
 
-	check_buf(fd, handle, width, height, COLOR_C4);
+	check_buf(fd, handle, width, height, shader, sip, COLOR_C4);
 
 	gem_close(fd, handle);
 	intel_bb_destroy(ibb);
@@ -202,17 +288,26 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 
 	test_render_and_compute("sanity", fd, eci)
-		test_sip(SHADER_WRITE, eci, 0);
+		test_sip(SHADER_WRITE, SIP_NULL, eci, 0);
 
 	test_render_and_compute("sanity-after-timeout", fd, eci) {
-		test_sip(SHADER_HANG, eci, 0);
+		test_sip(SHADER_HANG, SIP_NULL, eci, 0);
 
 		xe_for_each_engine(fd, eci)
 			if (eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
 			    eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
-				test_sip(SHADER_WRITE, eci, 0);
+				test_sip(SHADER_WRITE, SIP_NULL, eci, 0);
 	}
 
+	test_render_and_compute("invalidinstr-disabled", fd, eci)
+		test_sip(SHADER_INV_INSTR_DISABLED, SIP_INV_INSTR, eci, 0);
+
+	test_render_and_compute("invalidinstr-thread-enabled", fd, eci)
+		test_sip(SHADER_INV_INSTR_THREAD_ENABLED, SIP_INV_INSTR, eci, 0);
+
+	test_render_and_compute("invalidinstr-walker-enabled", fd, eci)
+		test_sip(SHADER_INV_INSTR_WALKER_ENABLED, SIP_INV_INSTR, eci, 0);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1

