Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB2FCF58E5
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 13:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5B110E830;
	Wed, 25 Sep 2024 13:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRn1sQcL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CA310E830
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 13:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727271017; x=1758807017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jCi/KEZdj9jDPinyAtzwFIqYW6tOgctsSnmSPcpJD5A=;
 b=aRn1sQcLgxpLtn29rF9Wn2vXpLk8H0F6O7+ho7bk4ZuNtNdsoMuJm6Nx
 ESXzxzjCwXo+udM4bWSsx3WhEaFeF0H7Td6TpvYjz2PmMOOLUtuO8DODf
 baifCrZyKP1dg6LZqX/1TTshHngk0TL9SWpOnhzNduYaEzGnnV0sBNfWm
 uK3S0kveV0MNrCj7Opcb1/ko+VXyFVVQ1lS6WS6RIltc4QeoblPoa/ZnD
 LK8bhhjkcAgeUoRzAVcMSKmSh+dgJZWgruCioOK9xpJyNGvNUakIrSRsV
 avaLUYu4ZUGP1tEcd4xjjjZKVEj/Z0r7LzdTLDa4RBxQXEIjL0p8HBs5k Q==;
X-CSE-ConnectionGUID: 4wwP6DpcQ7i/++RJwHLFAQ==
X-CSE-MsgGUID: SHvQ3xWVQSW474ee2+FMHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36991730"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="36991730"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 06:30:17 -0700
X-CSE-ConnectionGUID: PUyTpjj7Sv+hUTLEH+qMag==
X-CSE-MsgGUID: cMyo+57KQqy4qQcxExZM6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71665487"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 06:30:15 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_exec_sip: Write on invalidinstr
Date: Wed, 25 Sep 2024 15:30:03 +0200
Message-Id: <20240925133003.41959-3-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925133003.41959-1-christoph.manszewski@intel.com>
References: <20240925133003.41959-1-christoph.manszewski@intel.com>
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

Currently we use 'gpgpu_shader__write_on_exception' only in a negative
way which causes the write not happening in the default (passing) case.
Change one of the usages to positive, to ensure the expected value has
been written.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_exec_sip.c | 80 ++++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index ed27d9c32..2294468c2 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -27,10 +27,12 @@
 #define WIDTH 64
 #define HEIGHT 64
 
-#define COLOR_C4 0xc4
+#define COLOR_C4 0xc4c4c4c4
 
 #define SHADER_CANARY 0x01010101
-#define SIP_CANARY 0x02020202
+#define SHADER_CANARY2 0x02020202
+#define SIP_CANARY 0x03030303
+#define SIP_CANARY2 0x04040404
 
 enum shader_type {
 	SHADER_HANG,
@@ -71,7 +73,7 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
 static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
 {
 	static struct gpgpu_shader *shader;
-	uint32_t bad;
+	uint32_t expected_cr0_bit;
 
 	shader = gpgpu_shader_create(fd);
 	if (shader_type == SHADER_INV_INSTR_WALKER_ENABLED)
@@ -92,15 +94,17 @@ static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
 		__attribute__ ((fallthrough));
 	case SHADER_INV_INSTR_DISABLED:
 	case SHADER_INV_INSTR_WALKER_ENABLED:
-		bad = (shader_type == SHADER_INV_INSTR_DISABLED) ? ILLEGAL_OPCODE_ENABLE : 0;
-		gpgpu_shader__write_on_exception(shader, 1, 0, 0, ILLEGAL_OPCODE_ENABLE, bad);
+		expected_cr0_bit = shader_type == SHADER_INV_INSTR_DISABLED ?
+				   0 : ILLEGAL_OPCODE_ENABLE;
+		gpgpu_shader__write_on_exception(shader, SHADER_CANARY2, 1, 0,
+						 ILLEGAL_OPCODE_ENABLE, expected_cr0_bit);
 		gpgpu_shader__nop(shader);
 		gpgpu_shader__nop(shader);
 		/* modify second nop, set only opcode bits[6:0] */
 		shader->instr[gpgpu_shader_last_instr(shader)][0] = 0x7f;
-		/* SIP should clear exception bit */
-		bad = ILLEGAL_OPCODE_STATUS;
-		gpgpu_shader__write_on_exception(shader, 2, 0, 0, ILLEGAL_OPCODE_STATUS, bad);
+		/* SIP should clear exception bit, negative check */
+		gpgpu_shader__write_on_exception(shader, SHADER_CANARY2, 0, 0,
+						 ILLEGAL_OPCODE_STATUS, ILLEGAL_OPCODE_STATUS);
 		break;
 	}
 
@@ -120,7 +124,8 @@ static struct gpgpu_shader *get_sip(int fd, enum sip_type sip_type, unsigned int
 
 	switch (sip_type) {
 	case SIP_INV_INSTR:
-		gpgpu_shader__write_on_exception(sip, 1, 0, y_offset, ILLEGAL_OPCODE_STATUS, 0);
+		gpgpu_shader__write_on_exception(sip, SIP_CANARY2, 0, y_offset,
+						 ILLEGAL_OPCODE_STATUS, 0);
 		break;
 	default:
 		break;
@@ -135,7 +140,7 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
 			     enum sip_type sip_type, unsigned int threads, unsigned int width,
 			     unsigned int height)
 {
-	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
+	struct intel_buf *buf = create_fill_buf(fd, width, height, (uint8_t)COLOR_C4);
 	struct gpgpu_shader *sip = get_sip(fd, sip_type, height / 2);
 	struct gpgpu_shader *shader = get_shader(fd, shader_type);
 
@@ -148,59 +153,72 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
 	return buf->handle;
 }
 
-static void check_fill_buf(uint8_t *ptr, const int width, const int x,
-			   const int y, const uint8_t color)
+static void check_fill_buf(uint32_t *ptr, const int dword_width, const int x, const int y,
+			   const uint32_t color)
 {
-	const uint8_t val = ptr[y * width + x];
+	const uint32_t val = ptr[y * dword_width + x];
 
 	igt_assert_f(val == color,
-		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
+		     "Expected 0x%08x, found 0x%08x at (%d,%d)\n",
 		     color, val, x, y);
 }
 
-static void check_buf(int fd, uint32_t handle, int width, int height,
-		      enum shader_type shader_type, enum sip_type sip_type, uint8_t poison_c)
+static void check_buf(int fd, uint32_t handle, int width, int height, int thread_count_expected,
+		      enum shader_type shader_type, enum sip_type sip_type, uint32_t poison_c)
 {
+	int thread_count = 0, sip_count = 0, invalidinstr_count = 0;
 	unsigned int sz = ALIGN(width * height, 4096);
-	int thread_count = 0, sip_count = 0;
+	const uint32_t dword_width = width / 4;
 	uint32_t *ptr;
 	int i, j;
 
 	ptr = xe_bo_mmap_ext(fd, handle, sz, PROT_READ);
 
-	for (i = 0, j = 0; j < height / 2; ++j) {
-		if (ptr[j * width / 4] == SHADER_CANARY) {
+	for (i = 1, j = 0; j < height / 2; ++j) {
+		if (ptr[j * dword_width] == SHADER_CANARY)
 			++thread_count;
-			i = 4;
+		else
+			check_fill_buf(ptr, dword_width, 0, j, poison_c);
+
+		if (ptr[j * dword_width + 1] == SHADER_CANARY2) {
+			++invalidinstr_count;
+			++i;
 		}
 
-		for (; i < width; i++)
-			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
+		for (; i < dword_width; i++)
+			check_fill_buf(ptr, dword_width, i, j, poison_c);
 
-		i = 0;
+		i = 1;
 	}
 
 	for (i = 0, j = height / 2; j < height; ++j) {
-		if (ptr[j * width / 4] == SIP_CANARY) {
+		if (ptr[j * dword_width] == SIP_CANARY) {
 			++sip_count;
 			i = 4;
 		}
 
-		for (; i < width; i++)
-			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
+		for (; i < dword_width; i++)
+			check_fill_buf(ptr, dword_width, i, j, poison_c);
 
 		i = 0;
 	}
 
 	igt_assert(thread_count);
-	if (shader_type == SHADER_INV_INSTR_DISABLED)
-		igt_assert(!sip_count);
-	else if (sip_type == SIP_INV_INSTR && shader_type != SHADER_INV_INSTR_DISABLED)
+
+	if (shader_type >= SHADER_INV_INSTR_DISABLED &&
+	    shader_type <= SHADER_INV_INSTR_WALKER_ENABLED)
+		igt_assert_f(thread_count == invalidinstr_count,
+			     "Thread and invalid instruction count mismatch, %d != %d\n",
+			     thread_count, invalidinstr_count);
+	else
+		igt_assert_eq(invalidinstr_count, 0);
+
+	if (sip_type == SIP_INV_INSTR && shader_type != SHADER_INV_INSTR_DISABLED)
 		igt_assert_f(thread_count == sip_count,
 			     "Thread and SIP count mismatch, %d != %d\n",
 			     thread_count, sip_count);
 	else
-		igt_assert(sip_count == 0);
+		igt_assert_eq(sip_count, 0);
 
 	munmap(ptr, sz);
 }
@@ -270,7 +288,7 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
 	intel_bb_sync(ibb);
 	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
 
-	check_buf(fd, handle, width, height, shader_type, sip_type, COLOR_C4);
+	check_buf(fd, handle, width, height, threads, shader_type, sip_type, COLOR_C4);
 
 	gem_close(fd, handle);
 	intel_bb_destroy(ibb);
-- 
2.34.1

