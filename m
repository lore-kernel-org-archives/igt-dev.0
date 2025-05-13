Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11488C3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C232B10E5EA;
	Tue, 13 May 2025 18:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gg23snsv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0984210E5EA
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162758; x=1778698758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oVzf5C0C5THui36dwi1+JIjFODZuK3Yea1wYJQ9n/TU=;
 b=gg23snsvSuN92tvtxq12VpJbeUAzehSoQpLY7WY2zAhdBtVltg4agXGs
 CPvMSPXvT0M9Mi7Z6kiI3GXha5iDJ+VvcEPumS45XQ1JTP6fiHnNF1Mtb
 zNPMK7rE+rYCOjflTCb3MnI/wSGNhX6ILxuhUDsH9udJi69xpS3yhQxlw
 iXixglDTh1iyQhb0rN60ui9nykyyBwQT9WPYrJUYflVElTFQSlbrJBQjT
 wmjqSEJVZ+voAMaYCWqvkhVroRpmG/fm9H6qxVBXKOJIrl3WLAH6ajtRi
 JAtqmcP5USpe2MdAUoRP1UCvV4KkR/z6FdVlBUaKeo3B+Z0b37PqMSYt5 Q==;
X-CSE-ConnectionGUID: 56fTvFBiQQW6iT7b18s+hA==
X-CSE-MsgGUID: J7wSgyaNTP6n6LccNE3DqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60428194"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="60428194"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:59:13 -0700
X-CSE-ConnectionGUID: hJmz41hdR/ugORnZ1W75wQ==
X-CSE-MsgGUID: 4KSdRcjBSga6/wf4yo7LYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137841064"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:59:07 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 13/15] lib/intel_blt: add support for matrix mem-copy
Date: Tue, 13 May 2025 20:58:08 +0200
Message-ID: <20250513185811.897232-14-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
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
a little bit more complicated so I left simple case in which
pitch/width/height must be within mem-copy command limits -
18-bit width * 18-bit height gives 64GiB object so testing
copying bigger buffer would be an overkill.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
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

