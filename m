Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D02C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2D510E516;
	Tue, 30 Jul 2024 11:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVO9mgen";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B20C10E516
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340153; x=1753876153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XBeKceU0u5FsO0z/4o8OJEaantxIUyX7CCD34fOgsJs=;
 b=eVO9mgensENev9dsQ4P8qWip3C6KCHacYYiXt5E7nq0fEpF7954KX7mp
 9qagSqSIDXqjRbCxdbXVIo6C5H7lT3bqD7/Egt23m59eNGHa/5KMECzj3
 pUgEO8J+lN6MtUcs8UA9ifHB3XJtioQmiZD6UFnLHlVscyt2Pa+oI9xP2
 qjrD5YmZRh8mHHlen1zon/NrKBtpuyk7Wxl0+1VFpyJTFCjkvhg8xEUXY
 bVHE4FLA3ArFJXgtJUGNAAhKrfEylBw2ETFfElP1O/PQ/f3/gB8fTLxO3
 OLRy9A+5fcVAg3h/uDaPlU+Y/XZj5Pnk0BblCcWj8LqmlWYFhKGxwIpfk g==;
X-CSE-ConnectionGUID: UxFs++2nSHuzC+RxBMb/kQ==
X-CSE-MsgGUID: tuFcdnfUT6CypvGVsVam6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937483"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937483"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:13 -0700
X-CSE-ConnectionGUID: NAs15MrlSwOxCzG60/g8Gg==
X-CSE-MsgGUID: 7nOpt/jwR+2JV7b3L1vPtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217431"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:09 -0700
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
Subject: [PATCH i-g-t v2 50/66] tests/xe_exec_sip: Rework invalid instruction
 tests
Date: Tue, 30 Jul 2024 13:45:07 +0200
Message-Id: <20240730114523.334156-51-christoph.manszewski@intel.com>
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

From: Andrzej Hajda <andrzej.hajda@intel.com>

The tests depended on undefined behavior of GPU. Invalid instruction
provided by the test has 29th bit set, which on Xe2 causes SIP call without
providing any exception reason and AIP address, unless eudebug is enabled,
in such case breakpoint exception is signalled.

Xe2 and earlier gens are able to handle very limited set of invalid
instructions - only illegal and undefined opcodes, other errors in
instruction can cause undefined behavior.
Illegal/undefined opcode results in:
- setting illegal opcode status bit - cr0.1[28],
- calling SIP if illegal opcode bit is enabled - cr0.1[12].
cr0.1[12] can be enabled directly from the thread or by thread dispatcher
from Interface Descriptor Data provided to COMPUTE_WALKER instruction.

Re-worked tests works similar way to OOB tests:
- check if SIP is not called when exception is not enabled,
- check if SIP is called when exception is enabled from EU thread,
- check if SIP is called when exception is enabled from COMPUTE_WALKER.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_exec_sip.c | 70 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index 35d65bcc4..0db0dc4b8 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -38,14 +38,22 @@
 #define SHADER_BREAKPOINT 0
 #define SHADER_WRITE 1
 #define SHADER_WAIT 2
-#define SHADER_HANG 3
-#define SIP_WRITE 4
-#define SIP_NULL 5
-#define SIP_WAIT 6
-#define SIP_HEAVY 7
+#define SHADER_INV_INSTR_DISABLED 3
+#define SHADER_INV_INSTR_THREAD_ENABLED 4
+#define SHADER_INV_INSTR_WALKER_ENABLED 5
+#define SHADER_HANG 6
+#define SIP_WRITE 7
+#define SIP_NULL 8
+#define SIP_WAIT 9
+#define SIP_HEAVY 10
+#define SIP_INV_INSTR 11
 
 #define F_SUBMIT_TWICE	(1 << 0)
 
+/* Control Register cr0.1 bits for exception handling */
+#define ILLEGAL_OPCODE_ENABLE BIT(12)
+#define ILLEGAL_OPCODE_STATUS BIT(28)
+
 static struct intel_buf *
 create_fill_buf(int fd, int width, int height, uint8_t color)
 {
@@ -68,8 +76,12 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
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
@@ -87,6 +99,21 @@ static struct gpgpu_shader *get_shader(int fd, const int shadertype)
 		gpgpu_shader__nop(shader);
 		gpgpu_shader__breakpoint(shader);
 		break;
+	case SHADER_INV_INSTR_THREAD_ENABLED:
+		gpgpu_shader__set_exception(shader, ILLEGAL_OPCODE_ENABLE);
+		/* fall through */
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
@@ -127,6 +154,9 @@ static struct gpgpu_shader *get_sip(int fd, const int siptype,
 
 		gpgpu_shader__wait(sip);
 		break;
+	case SIP_INV_INSTR:
+		gpgpu_shader__write_on_exception(sip, 1, y_offset, ILLEGAL_OPCODE_STATUS, 0);
+		break;
 	}
 
 	gpgpu_shader__end_system_routine(sip, shadertype == SHADER_BREAKPOINT);
@@ -160,7 +190,7 @@ static void check_fill_buf(uint8_t *ptr, const int width, const int x,
 }
 
 static int check_buf(int fd, uint32_t handle, int width, int height,
-		      int siptype, uint8_t poison_c)
+		      int shadertype, int siptype, uint8_t poison_c)
 {
 	unsigned int sz = ALIGN(width * height, 4096);
 	int thread_count = 0, sip_count = 0;
@@ -194,7 +224,10 @@ static int check_buf(int fd, uint32_t handle, int width, int height,
 	}
 
 	igt_assert(thread_count);
-	if (siptype != SIP_NULL && xe_eudebug_debugger_available(fd))
+	if (shadertype == SHADER_INV_INSTR_DISABLED)
+		igt_assert(!sip_count);
+	else if ((siptype != SIP_NULL && xe_eudebug_debugger_available(fd)) ||
+		 (siptype == SIP_INV_INSTR && shadertype != SHADER_INV_INSTR_DISABLED))
 		igt_assert_f(thread_count == sip_count,
 			     "Thread and SIP count mismatch, %d != %d\n",
 			     thread_count, sip_count);
@@ -285,6 +318,18 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  * SUBTEST: wait-writesip-nodebug
  * Description: verify that we don't enter SIP after wait with debugging disabled.
  *
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
+ *
  * SUBTEST: breakpoint-writesip-nodebug
  * Description: verify that we don't enter SIP after hitting breakpoint in shader
  *		when debugging is disabled.
@@ -344,7 +389,7 @@ static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *e
 		intel_bb_sync(ibb);
 		igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
 
-		dispatched = check_buf(fd, handle, width, height, sip, COLOR_C4);
+		dispatched = check_buf(fd, handle, width, height, shader, sip, COLOR_C4);
 		check_usercoredump(fd, sip, dispatched);
 
 		gem_close(fd, handle);
@@ -396,6 +441,15 @@ igt_main
 		test_render_and_compute("wait-writesip-nodebug", fd, eci)
 			test_sip(SHADER_WAIT, SIP_WRITE, eci, 0);
 
+		test_render_and_compute("invalidinstr-disabled", fd, eci)
+			test_sip(SHADER_INV_INSTR_DISABLED, SIP_INV_INSTR, eci, 0);
+
+		test_render_and_compute("invalidinstr-thread-enabled", fd, eci)
+			test_sip(SHADER_INV_INSTR_THREAD_ENABLED, SIP_INV_INSTR, eci, 0);
+
+		test_render_and_compute("invalidinstr-walker-enabled", fd, eci)
+			test_sip(SHADER_INV_INSTR_WALKER_ENABLED, SIP_INV_INSTR, eci, 0);
+
 		test_render_and_compute("breakpoint-writesip-nodebug", fd, eci)
 			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, 0);
 
-- 
2.34.1

