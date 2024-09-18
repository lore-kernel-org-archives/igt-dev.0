Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74980CCD1A4
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E73A10E585;
	Wed, 18 Sep 2024 11:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aiTlC22i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC0B10E585
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726659069; x=1758195069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+IvSw8acyBoHRLx8KFJB3/8tV2sVqpTd7+5qnKvtCaE=;
 b=aiTlC22iXYJoSgzc8OkC8tlz+mjerVxq9BA3dfY9n0vsTWCmZboIaeTX
 /YKxUaZipVfHjix+1K/Ct5X/BbJr2FESNaQ20Z0Xw6Lyg4Ebb18i4hQEf
 kz17StZdmMBebyK8UZqLnoscJ+0p6NebtrFz6/Ayhp2aW5eYwCXuwSp3U
 NlHwpdVxLfiCJTzZUqfO0LUo0staeBtFO5w8daiKXYpslbpnIFVna8xdB
 zHBXqSEcrC64JXb6gi2QI9iFPtdkEmzUzbDzOY2q379GAVORkmPwbQfkd
 /5URo+XeQSTvqGDemd4KOskRI0iChmx/IEut/14c7kg086zikeorjDSiU A==;
X-CSE-ConnectionGUID: 7C5oKehPSPaoALce5fE4qA==
X-CSE-MsgGUID: YhqlsrtjTiq3k8uKTNbKxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="28470093"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="28470093"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:31:08 -0700
X-CSE-ConnectionGUID: nrE5cIiDRuG4gXhE46Gjyw==
X-CSE-MsgGUID: 5Kwp7a/aSpCyjvfJqRli5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="106972629"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.218])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:31:03 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v7 08/16] tests/xe_exec_sip: Introduce invalid
 instruction tests
Date: Wed, 18 Sep 2024 13:30:09 +0200
Message-Id: <20240918113017.144687-9-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918113017.144687-1-christoph.manszewski@intel.com>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
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
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_exec_sip.c | 124 ++++++++++++++++++++++++++++++++++----
 1 file changed, 113 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 564c899f8..ee4787d61 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -30,12 +30,25 @@
 #define COLOR_C4 0xc4
 
 #define SHADER_CANARY 0x01010101
+#define SIP_CANARY 0x02020202
 
 enum shader_type {
 	SHADER_HANG,
+	SHADER_INV_INSTR_DISABLED,
+	SHADER_INV_INSTR_THREAD_ENABLED,
+	SHADER_INV_INSTR_WALKER_ENABLED,
 	SHADER_WRITE,
 };
 
+enum sip_type {
+	SIP_INV_INSTR,
+	SIP_NULL,
+};
+
+/* Control Register cr0.1 bits for exception handling */
+#define ILLEGAL_OPCODE_ENABLE BIT(12)
+#define ILLEGAL_OPCODE_STATUS BIT(28)
+
 static struct intel_buf *
 create_fill_buf(int fd, int width, int height, uint8_t color)
 {
@@ -58,8 +71,12 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
 static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
 {
 	static struct gpgpu_shader *shader;
+	uint32_t bad;
 
 	shader = gpgpu_shader_create(fd);
+	if (shader_type == SHADER_INV_INSTR_WALKER_ENABLED)
+		shader->illegal_opcode_exception_enable = true;
+
 	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
 
 	switch (shader_type) {
@@ -70,19 +87,63 @@ static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
 		break;
 	case SHADER_WRITE:
 		break;
+	case SHADER_INV_INSTR_THREAD_ENABLED:
+		gpgpu_shader__set_exception(shader, ILLEGAL_OPCODE_ENABLE);
+		__attribute__ ((fallthrough));
+	case SHADER_INV_INSTR_DISABLED:
+	case SHADER_INV_INSTR_WALKER_ENABLED:
+		bad = (shader_type == SHADER_INV_INSTR_DISABLED) ? ILLEGAL_OPCODE_ENABLE : 0;
+		gpgpu_shader__write_on_exception(shader, 1, 0, ILLEGAL_OPCODE_ENABLE, bad);
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__nop(shader);
+		/* modify second nop, set only opcode bits[6:0] */
+		shader->instr[gpgpu_shader_last_instr(shader)][0] = 0x7f;
+		/* SIP should clear exception bit */
+		bad = ILLEGAL_OPCODE_STATUS;
+		gpgpu_shader__write_on_exception(shader, 2, 0, ILLEGAL_OPCODE_STATUS, bad);
+		break;
 	}
 
 	gpgpu_shader__eot(shader);
 	return shader;
 }
 
+static struct gpgpu_shader *get_sip(int fd, enum sip_type sip_type, unsigned int y_offset)
+{
+	static struct gpgpu_shader *sip;
+
+	if (sip_type == SIP_NULL)
+		return NULL;
+
+	sip = gpgpu_shader_create(fd);
+	gpgpu_shader__write_dword(sip, SIP_CANARY, y_offset);
+
+	switch (sip_type) {
+	case SIP_INV_INSTR:
+		gpgpu_shader__write_on_exception(sip, 1, y_offset, ILLEGAL_OPCODE_STATUS, 0);
+		break;
+	default:
+		break;
+	}
+
+	gpgpu_shader__end_system_routine(sip, false);
+
+	return sip;
+}
+
 static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shader_type,
-			     unsigned int threads, unsigned int width, unsigned int height)
+			     enum sip_type sip_type, unsigned int threads, unsigned int width,
+			     unsigned int height)
 {
 	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
+	struct gpgpu_shader *sip = get_sip(fd, sip_type, height / 2);
 	struct gpgpu_shader *shader = get_shader(fd, shader_type);
 
-	gpgpu_shader_exec(ibb, buf, 1, threads, shader, NULL, 0, 0);
+	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
+
+	if (sip)
+		gpgpu_shader_destroy(sip);
+
 	gpgpu_shader_destroy(shader);
 	return buf->handle;
 }
@@ -98,10 +159,10 @@ static void check_fill_buf(uint8_t *ptr, const int width, const int x,
 }
 
 static void check_buf(int fd, uint32_t handle, int width, int height,
-		      uint8_t poison_c)
+		      enum shader_type shader_type, enum sip_type sip_type, uint8_t poison_c)
 {
 	unsigned int sz = ALIGN(width * height, 4096);
-	int thread_count = 0;
+	int thread_count = 0, sip_count = 0;
 	uint32_t *ptr;
 	int i, j;
 
@@ -119,7 +180,27 @@ static void check_buf(int fd, uint32_t handle, int width, int height,
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
+	if (shader_type == SHADER_INV_INSTR_DISABLED)
+		igt_assert(!sip_count);
+	else if (sip_type == SIP_INV_INSTR && shader_type != SHADER_INV_INSTR_DISABLED)
+		igt_assert_f(thread_count == sip_count,
+			     "Thread and SIP count mismatch, %d != %d\n",
+			     thread_count, sip_count);
+	else
+		igt_assert(sip_count == 0);
 
 	munmap(ptr, sz);
 }
@@ -143,9 +224,21 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
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
-static void test_sip(enum shader_type shader_type, struct drm_xe_engine_class_instance *eci,
-		     uint32_t flags)
+static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
+		     struct drm_xe_engine_class_instance *eci, uint32_t flags)
 {
 	unsigned int threads = 512;
 	unsigned int height = max_t(threads, HEIGHT, threads * 2);
@@ -172,12 +265,12 @@ static void test_sip(enum shader_type shader_type, struct drm_xe_engine_class_in
 	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
 
 	igt_nsec_elapsed(&ts);
-	handle = gpgpu_shader(fd, ibb, shader_type, threads, width, height);
+	handle = gpgpu_shader(fd, ibb, shader_type, sip_type, threads, width, height);
 
 	intel_bb_sync(ibb);
 	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
 
-	check_buf(fd, handle, width, height, COLOR_C4);
+	check_buf(fd, handle, width, height, shader_type, sip_type, COLOR_C4);
 
 	gem_close(fd, handle);
 	intel_bb_destroy(ibb);
@@ -205,17 +298,26 @@ igt_main
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

