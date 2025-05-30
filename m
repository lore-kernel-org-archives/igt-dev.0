Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D40C54F30
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 06:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A453A10E792;
	Fri, 30 May 2025 06:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXvo09IU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E93810E7D3
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 06:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748587308; x=1780123308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mtZ7TNMteEx0ctWc2UFrGe7ZFrExd6Db74JQwyjlWHo=;
 b=NXvo09IU+KV6HAWhPb9KMHp5AWwEEdAfl4efx5QcYQjGlCPIa5YmGvuU
 bp8v5SpKqfxScNV85Ns99UnOFyyrGOgiW60iZKIKg/Fp4+Ffvp0gh9ddl
 rg8QxHmBDZVo7FQWvYcqrxDE8ASJBKzskBzMWdseyBy7+sUqfvfXZR2xU
 z9D2bvFSY/Z5syVrjgaYZHfn0XQ62PBrpVMrTjayHU26LH/Q3mjFcTdBL
 u91hFIg2clrkeYLwG0zelrC6ZeZsLRtAdrhJYzN1kQTXnizR6H36u8D17
 qzCHcnN79joDsSio+g6OlRXsAgk/58LxIS2yoCC3nooOkrqLG4mDo5mzB w==;
X-CSE-ConnectionGUID: G5pkWajxRN+jD5QirFXsQQ==
X-CSE-MsgGUID: yRZI9TPHS56RminFHYup+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68095477"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="68095477"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:45 -0700
X-CSE-ConnectionGUID: xVMK+gPhT8OTlU/9NJY2PQ==
X-CSE-MsgGUID: XUqevv9jTkudptNIcvmaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="144130984"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:42 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 09/11] lib/intel_blt: add support for matrix mem-copy
Date: Fri, 30 May 2025 08:40:48 +0200
Message-ID: <20250530064050.1560398-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
References: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
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

Linear copy in intel_blt supports passing large buffers (which
requires to be spread over couple mem-copies). For matrix this is
a little bit more complicated but width and height which are
18-bit values gives copy of 64 GiB object. Testing bigger
would be an overkill so keeping within geometry limitation
without additional code complication is reasonable choice.

Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 69 +++++++++++++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 22 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 265f5ed50f..77a03aff4e 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1893,17 +1893,18 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 {
 	struct xe_mem_copy_data data = {};
 	uint64_t dst_offset, src_offset, shift;
-	uint32_t height, width_max, remain;
+	uint32_t width, height, width_max, height_max, remain;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *bb;
 
 	if (mem->mode == MODE_BYTE) {
 		data.dw01.byte_copy.width = -1;
-		width_max = data.dw01.byte_copy.width + 1;
+		height_max = width_max = data.dw01.byte_copy.width + 1;
 		shift = width_max;
 	} else {
 		data.dw01.page_copy.width = -1;
 		width_max = data.dw01.page_copy.width + 1;
+		height_max = 1;
 		shift = width_max << 8;
 	}
 
@@ -1914,6 +1915,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 
 	bb = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
 
+	width = mem->src.width;
 	height = mem->dst.height;
 
 	data.dw00.client = 0x2;
@@ -1930,34 +1932,57 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 	data.dw09.src_mocs = mem->src.mocs_index;
 	data.dw09.dst_mocs = mem->dst.mocs_index;
 
-	remain = mem->src.width;
+	/* For matrix we don't iterate */
+	if (mem->copy_type == TYPE_MATRIX) {
+		if (width > width_max) {
+			width = width_max;
+			igt_warn("src width is bigger than max width [%u > %u => %u], truncating it\n",
+				 mem->src.width, width_max, width);
+		}
 
-	/* Truncate pitches to match operation bits */
-	if (mem->src.pitch > width_max)
-		data.dw03.src_pitch = width_max - 1;
-	else
-		data.dw03.src_pitch = mem->src.pitch;
+		if (height > height_max) {
+			height = height_max;
+			igt_warn("src height is bigger than max height [%u > %u => %u], truncating it\n",
+				 mem->src.height, height_max, height);
+		}
 
-	if (mem->dst.pitch > width_max)
-		data.dw04.dst_pitch = width_max - 1;
-	else
-		data.dw04.dst_pitch = mem->dst.pitch;
-
-	while (remain) {
-		data.dw01.val = min_t(uint32_t, width_max, remain) - 1;
+		data.dw01.byte_copy.width = width - 1;
+		data.dw03.src_pitch = mem->src.pitch - 1;
+		data.dw04.dst_pitch = mem->dst.pitch - 1;
 
 		igt_assert(bb_pos + sizeof(data) < mem->bb.size);
 		memcpy(bb + bb_pos, &data, sizeof(data));
 		bb_pos += sizeof(data);
+	} else {
+		remain = mem->src.width;
 
-		remain -= remain > width_max ? width_max : remain;
-		src_offset += shift;
-		dst_offset += shift;
+		/* Truncate pitches to match operation bits */
+		if (mem->src.pitch > width_max)
+			data.dw03.src_pitch = width_max - 1;
+		else
+			data.dw03.src_pitch = mem->src.pitch;
 
-		data.dw05.src_address_lo = src_offset;
-		data.dw06.src_address_hi = src_offset >> 32;
-		data.dw07.dst_address_lo = dst_offset;
-		data.dw08.dst_address_hi = dst_offset >> 32;
+		if (mem->dst.pitch > width_max)
+			data.dw04.dst_pitch = width_max - 1;
+		else
+			data.dw04.dst_pitch = mem->dst.pitch;
+
+		while (remain) {
+			data.dw01.val = min_t(uint32_t, width_max, remain) - 1;
+
+			igt_assert(bb_pos + sizeof(data) < mem->bb.size);
+			memcpy(bb + bb_pos, &data, sizeof(data));
+			bb_pos += sizeof(data);
+
+			remain -= remain > width_max ? width_max : remain;
+			src_offset += shift;
+			dst_offset += shift;
+
+			data.dw05.src_address_lo = src_offset;
+			data.dw06.src_address_hi = src_offset >> 32;
+			data.dw07.dst_address_lo = dst_offset;
+			data.dw08.dst_address_hi = dst_offset >> 32;
+		}
 	}
 
 	if (emit_bbe) {
-- 
2.43.0

