Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF3FEC1107
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 16:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0249E10E3F5;
	Mon, 23 Feb 2026 16:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwGEU+lB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1533B10E3FF
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771864550; x=1803400550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o/gorsYBcONHqnyScOS/7oWEC6ey4fwOZ1lzy99USU8=;
 b=bwGEU+lB2tNLyY47tmkcVLUA2UjVdDeCflALk4aT+1ux4jpdZO2G4rzs
 eZ9jGJUwwlPn9PDFURTR1FQ1sEZy3pqrqxTR70DOGhQhJYJanwPIcu3th
 x9gk8QW+JWHLm+tx83Kac7qXIqkoOmsrkB0AXf4A+l/j8DICK8RN6xIwN
 76MOuhlHd9h4eT+oM+3xTn6wKp/aaaJa3uLC5W+t86ZbS25LmgjpcIKjx
 TemzFCdHohG49pQyVZcRd8OuvLbiJ3AYydVzZsnLSAnzaAPuLfCTmXdv+
 0wvQLTyWdnjahYnJg9sLH1Yh+XFhPUQ2pssp+r4sxow8+7SZI6WNTKJxw g==;
X-CSE-ConnectionGUID: hUQmwgAfTX2SYuD//P0afw==
X-CSE-MsgGUID: /tlr5gU/Tt2k/11ZRmrxTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75473264"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="75473264"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:35:50 -0800
X-CSE-ConnectionGUID: ZhYpfAIfQF+fmvg5btf/BA==
X-CSE-MsgGUID: wvf1UidTRpSOxFIS6Ut76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="213952052"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.211])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:35:48 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Jan=20Ma=C5=9Blak?= <jan.maslak@intel.com>
Subject: [PATCH i-g-t] lib/rendercopy: Alter pipeline and add shader for Xe3p
Date: Mon, 23 Feb 2026 17:35:45 +0100
Message-ID: <20260223163544.1519449-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Extend rendercopy to support Xe3p platforms like NVL-P. This requires
reassembling xe2 shader and increasing urb size.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Jan Maślak <jan.maslak@intel.com>
---
 lib/i915/shaders/ps/xe3p_render_copy.asm |  8 +++++++
 lib/intel_batchbuffer.c                  |  2 ++
 lib/rendercopy.h                         |  4 ++++
 lib/rendercopy_gen9.c                    | 28 +++++++++++++++++++++---
 4 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 lib/i915/shaders/ps/xe3p_render_copy.asm

diff --git a/lib/i915/shaders/ps/xe3p_render_copy.asm b/lib/i915/shaders/ps/xe3p_render_copy.asm
new file mode 100644
index 0000000000..fea5c5c01e
--- /dev/null
+++ b/lib/i915/shaders/ps/xe3p_render_copy.asm
@@ -0,0 +1,8 @@
+L0:
+(W)     mad (16|M0)              acc0.0<1>:f   r6.0<0;0>:f       r1.0<1;0>:f       r6.6<0>:f
+(W)     mad (16|M0)              r113.0<1>:f   acc0.0<1;0>:f     r1.0<1;0>:f       r6.1<0>:f
+(W)     mad (16|M0)              acc0.0<1>:f   r6.3<0;0>:f       r1.0<1;0>:f       r6.4<0>:f
+(W)     mad (16|M0)              r114.0<1>:f   acc0.0<1;0>:f     r2.0<1;0>:f       r6.5<0>:f
+(W)     send.smpl (16|M0)        r12      r113  null:0  0x0            0x04420001           {F@1,$0} // wr:2+0, rd:4; simd16 sample:u,v,r,ai,mlod using sampler index 0
+(W)     send.rc (16|M0)          null     r12  null:0  0x0            0x08031400           {EOT,$0} // wr:4+0, rd:0; render write  last render target select to bti[0].rti[0]
+L96:
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 3b25a385b7..b095065746 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -669,6 +669,8 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int fd)
 		copy = mtl_render_copyfunc;
 	else if (IS_DG2(devid))
 		copy = gen12p71_render_copyfunc;
+	else if (intel_gen(devid) >= 35)
+		copy = xe3p_render_copyfunc;
 	else if (intel_gen(devid) >= 20)
 		copy = xe2_render_copyfunc;
 	else if (IS_GEN12(devid))
diff --git a/lib/rendercopy.h b/lib/rendercopy.h
index 3733e8a09f..570797c490 100644
--- a/lib/rendercopy.h
+++ b/lib/rendercopy.h
@@ -47,6 +47,10 @@ void xe2_render_copyfunc(struct intel_bb *ibb,
 			 struct intel_buf *src, uint32_t src_x, uint32_t src_y,
 			 uint32_t width, uint32_t height,
 			 struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y);
+void xe3p_render_copyfunc(struct intel_bb *ibb,
+			  struct intel_buf *src, uint32_t src_x, uint32_t src_y,
+			  uint32_t width, uint32_t height,
+			  struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y);
 void gen12_render_copyfunc(struct intel_bb *ibb,
 			   struct intel_buf *src, uint32_t src_x, uint32_t src_y,
 			   uint32_t width, uint32_t height,
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index e6e5b82148..d44988010a 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -146,6 +146,15 @@ static const uint32_t xe2_render_copy[][4] = {
 	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
 };
 
+static const uint32_t xe3p_render_copy[][4] = {
+	{ 0x8010005b, 0x200002a0, 0x02020604, 0x06640104 },
+	{ 0x8010005b, 0x710402a8, 0x02022000, 0x06140104 },
+	{ 0x8010005b, 0x200002a0, 0x02020634, 0x06440104 },
+	{ 0x8010005b, 0x720402a8, 0x02022000, 0x06540204 },
+	{ 0x80122031, 0x0c240000, 0x20027114, 0x00800000 },
+	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
+};
+
 static uint32_t lnl_compression_format(const struct intel_buf *buf)
 {
 	switch (buf->bpp) {
@@ -737,7 +746,7 @@ gen9_emit_state_base_address(struct intel_bb *ibb) {
 static void
 gen7_emit_urb(struct intel_bb *ibb) {
 	/* XXX: Min valid values from mesa */
-	const int vs_entries = 64;
+	const int vs_entries = intel_gen(ibb->devid) >= 35 ? 128 : 64;
 	const int vs_size = 2;
 	const int vs_start = 4;
 
@@ -1395,13 +1404,26 @@ void xe2_render_copyfunc(struct intel_bb *ibb,
 			 struct intel_buf *src, uint32_t src_x, uint32_t src_y,
 			 uint32_t width, uint32_t height,
 			 struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y)
+{
+	_gen9_render_op(ibb, src, src_x, src_y,
+			width, height, dst, dst_x, dst_y,
+			NULL,
+			NULL,
+			xe2_render_copy,
+			sizeof(xe2_render_copy));
+}
+
+void xe3p_render_copyfunc(struct intel_bb *ibb,
+			  struct intel_buf *src, uint32_t src_x, uint32_t src_y,
+			  uint32_t width, uint32_t height,
+			  struct intel_buf *dst, uint32_t dst_x, uint32_t dst_y)
 {
 	_gen9_render_op(ibb, src, src_x, src_y,
 			  width, height, dst, dst_x, dst_y,
 			  NULL,
 			  NULL,
-			  xe2_render_copy,
-			  sizeof(xe2_render_copy));
+			  xe3p_render_copy,
+			  sizeof(xe3p_render_copy));
 }
 
 void mtl_render_copyfunc(struct intel_bb *ibb,
-- 
2.43.0

