Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E2FC5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 08:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E3310F1DB;
	Fri, 31 Jul 2026 08:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+VHU5JB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78ED310F1DB
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785486704; x=1817022704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z6zrb4y6EX2LtiRPkoH7FgjZjt02fk5j1ZT2u6S3OyY=;
 b=O+VHU5JBfCLYzljTs1y6/92lo9QkkdJeZU+LnYxmdcmHTcPZoCL52OXY
 U69HwUT/1tEVjyz8HYeo3+NJNwH28wBT7ybryn85CkLOU1/pKpuIkyLbh
 nUxxuJaTOlzwE/7Nq0WyBdOUlWAPfyUocZFDWG9oXVaDHDn2siuNVY6Tp
 O5BwQMaCcrqhoXuH3rmL4+C1KecjkKboJhmlcRlMret/aM3ReJpOg029N
 hTeR2wiuYd2fZ/tJhaA+669wlxhq2G3J3cW0A4EVXn9mWumIWeh8gLTYI
 xRphY96SrcOTSJ4+fSKRGtQCrv8VHjXccale5HAlt1ENiH2IX1PgRPx5y g==;
X-CSE-ConnectionGUID: JVi2cBxaTQ+PHtvrNyxElg==
X-CSE-MsgGUID: rWP/2dbVT3O0lNk7kiGlSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86229108"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="86229108"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 01:31:44 -0700
X-CSE-ConnectionGUID: 1aJaEXKBTUukEUfQApsJPQ==
X-CSE-MsgGUID: /RHmv9fIT2y2/WZGBuRgPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="257852892"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.8])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 01:31:43 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t] lib/gpgpu_fill: Implement gpgpu_fill for XE3 which uses
 ugm intead of tgm
Date: Fri, 31 Jul 2026 10:31:28 +0200
Message-ID: <20260731083127.168212-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.54.0
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Use ugm shared function (untyped 2d block store) instead of tgm
(typed 2d block store) on XE3 platforms.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/gpgpu_fill.c                   | 38 ++++++++++++++++++++++++++----
 lib/gpgpu_fill.c.gen.iga64_codes.c | 20 +++++++++++++++-
 lib/gpu_cmds.c                     |  2 +-
 3 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
index 2c47169d2c..93a474e67a 100644
--- a/lib/gpgpu_fill.c
+++ b/lib/gpgpu_fill.c
@@ -282,9 +282,10 @@ __gen9_gpgpu_fillfunc(int i915,
 	intel_bb_destroy(ibb);
 }
 
-static struct gpgpu_shader *__xehp_gpgpu_kernel(int i915)
+static struct gpgpu_shader *__xehp_gpgpu_kernel(int i915, struct intel_buf *buf)
 {
 	struct gpgpu_shader *kernel = gpgpu_shader_create(i915);
+	uint64_t offset = xe_canonical_va(i915, buf->addr.offset);
 
 	emit_iga64_code(kernel, gpgpu_fill, R"(
 // fill up r1 with target colour
@@ -313,7 +314,7 @@ mov (1|M0)		r4.4<1>:ud	r0.5<0;1,0>:ud
 //	[18:14]		MessageType: 0xA (media block write)
 //	[7:0]		BTI: 0
 send.dc1 (16|M0)	null	r4	src1_null	0x0	0x40A8000
-#else
+#elif GFX_VER < 3000
 // load block offsets into message header payload
 mov (2|M0)		r4.5<1>:ud	r2.0<2;2,1>:ud
 // load block width
@@ -327,8 +328,37 @@ mov (1|M0)		 r4.14<1>:w	0xF:w
 //	[19:17]		Caching: 0  (use state settings for both L1 and L3)
 //	[5:0]		Opcode: 0x07  (store_block2d)
 send.tgm (16|M0)	null	r4	null	0x0	0x64000007
+#else
+// load A64 base surface state offset into address payload
+mov (1|M0)		r4.0<1>:ud	ARG(0):ud
+mov (1|M0)		r4.1<1>:ud	ARG(1):ud
+// load surface width
+mov (1|M0)		r4.2<1>:ud	ARG(2):ud
+// load surface height
+mov (1|M0)		r4.3<1>:ud	ARG(3):ud
+// load surface pitch
+mov (1|M0)		r4.4<1>:ud	ARG(4):ud
+// load block offsets
+mov (2|M0)		r4.5<1>:ud	r2.0<2;2,1>:ud
+// load block width
+mov (1|M0)		r4.14<1>:w	0xF:w
+// Untyped 2D block store
+// Message Descriptor
+//	bspec:63981
+//	0x2020007:
+//	[30:29]		AddrType: 0 (Flat)
+//	[28:25]		Mlen: 1 address register written
+//	[24:20]		Rlen: 0 registers read back
+//	[19:17]		Caching: 1  (L1 uncached, L3 uncached)
+//	[15]		DataOrder: 0  non-transposed
+//	[11:9]		DataSize: 0  (8b per data element)
+//	[5:0]		Opcode: 0x07  (store_block2d)
+send.ugm (1|M0)		null	r4	r5:1	0x0	0x2020007
 #endif
-	)");
+	)", offset & 0xffffffff, offset >> 32,
+	intel_buf_width(buf) * buf->bpp/8 - 1, intel_buf_height(buf) - 1,
+	buf->surface[0].stride - 1);
+
 	gpgpu_shader__eot(kernel);
 	return kernel;
 }
@@ -422,7 +452,7 @@ void xehp_gpgpu_fillfunc(int i915,
 
 	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
 
-	kernel = __xehp_gpgpu_kernel(i915);
+	kernel = __xehp_gpgpu_kernel(i915, buf);
 	xehp_fill_interface_descriptor(ibb, buf, kernel->instr,
 				       kernel->size * 4, &idd);
 	gpgpu_shader_destroy(kernel);
diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
index f15a9a23ab..19905659e9 100644
--- a/lib/gpgpu_fill.c.gen.iga64_codes.c
+++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 23974a9fa727a81b32058bbaa8d3ebbc
+#define MD5_SUM_IGA64_ASMS 50a6ea7d435db3bab74c742ce25265c0
 
 struct iga64_template const iga64_code_xe3p_gpgpu_fill[] = {
 	{ .gfx_ver = 3500, .size = 144, .code = (const uint32_t []) {
@@ -50,6 +50,24 @@ struct iga64_template const iga64_code_xe3p_gpgpu_fill[] = {
 };
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
+	{ .gfx_ver = 3000, .size = 64, .code = (const uint32_t []) {
+		0x00080061, 0x01050000, 0x00000104, 0x00000000,
+		0x00000069, 0x02058220, 0x02000014, 0x00000004,
+		0x00000061, 0x02150220, 0x00000064, 0x00000000,
+		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
+		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
+		0x00000061, 0x04054220, 0x00000000, 0xc0ded000,
+		0x00000061, 0x04154220, 0x00000000, 0xc0ded001,
+		0x00000061, 0x04254220, 0x00000000, 0xc0ded002,
+		0x00000061, 0x04354220, 0x00000000, 0xc0ded003,
+		0x00000061, 0x04454220, 0x00000000, 0xc0ded004,
+		0x00041f61, 0x04550220, 0x00220205, 0x00000000,
+		0x00000061, 0x04754550, 0x00000000, 0x000f000f,
+		0x00032031, 0x00000000, 0xf00e040c, 0x0080050c,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
 	{ .gfx_ver = 2000, .size = 44, .code = (const uint32_t []) {
 		0x00080061, 0x01050000, 0x00000104, 0x00000000,
 		0x00000069, 0x02058220, 0x02000014, 0x00000004,
diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 9dad73b6df..7a72166a0e 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -1021,7 +1021,7 @@ xehp_emit_cfe_state(struct intel_bb *ibb, uint32_t threads)
 
 #define _LEGACY_MODE (1 << 6)
 	/* number of threads & urb entries */
-	intel_bb_out(ibb, (max_t(threads, threads, 64) - 1) << 16 | (dfeud ? _LEGACY_MODE : 0));
+	intel_bb_out(ibb, (max_t(threads, threads, 128) - 1) << 16 | (dfeud ? _LEGACY_MODE : 0));
 
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
-- 
2.54.0

