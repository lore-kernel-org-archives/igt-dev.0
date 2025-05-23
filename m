Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF81C3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 08:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDD210E7A9;
	Fri, 23 May 2025 08:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zx+F7pho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D739010E7B2
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747987329; x=1779523329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9guvHGooifBxCg+ylmACQXXgO0WUkC05QAWXJIRjWJ8=;
 b=Zx+F7phoKSk47IHHN0SjoidY52ZiidSG96FoN7dj5dOyjB0v49vasOHo
 bs2l9ffXdLTqv59I9zxmMV0RyYctt5EcEQYiZBXrF9OA58HeCWlZvO4FX
 O/QkqJDVLu/M90hsn36NBFuRV2bK7C++0O4+zVgFeQUq0Ad+BZjd8BC3q
 s+evV5Vnyp/65dOio0LJLnhZvm699sN+pn7wRvvUFfoeiG26w62Y/qSi1
 J3vGXvCzp+RytnfN9F9kS6PupXS2/QIbAHQ3MhhPgzDo2eO8ty4vCnfU7
 vdxmvCXfNh/ABhYZyRku7WCq/PBlU/3uqT6jAXGPG9uVuN7Becur2NXeF g==;
X-CSE-ConnectionGUID: dbCYj3H0S6ONXvkq/EcZVA==
X-CSE-MsgGUID: 4FewxJvoSlykQurvERn9mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50182156"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="50182156"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:02:09 -0700
X-CSE-ConnectionGUID: 3/nt2MFyRJeQ4sRkOpTf7Q==
X-CSE-MsgGUID: hSi87R+fQdKxdQANPjZwTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="141532257"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.56])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:02:08 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 09/11] lib/intel_blt: add support for matrix mem-copy
Date: Fri, 23 May 2025 10:01:24 +0200
Message-ID: <20250523080126.75295-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
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

Cc: Francois Dugast <francois.dugast@intel.com>
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

