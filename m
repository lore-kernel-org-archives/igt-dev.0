Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6DCC3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF21610E5E5;
	Tue, 13 May 2025 18:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rd5tS1YJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF56110E5E5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162732; x=1778698732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IJFl1kSe8dZ4Vx6+BMweD0zzT50ErwfQmLFkfS5AmoY=;
 b=Rd5tS1YJL0KMTM1AqQcCbjdl9EcYaEnjEJ+16AjLdjS5PWXOYXmUu/hf
 CibR8YdD3NoC3c9b7EClvQkVKA9EIE7YyCTjwkDGDXzAZMqeXpeb2W2qF
 Xpwl3TMPnI2ZkSCQ6/r4I0s9I5MN6jQ2q1DcNUtSrmSbZm1QudRCUYf3r
 2yNVPWDQm3qvF7gjODl7G/Sf06Ym09pu6nK341sPBqbT0/OCEACBond+l
 GO69hoIMY4+yivNGS6xj/hw2U+lb2Kl6qkNhW2rJ32OqF56i+ZDoq/md5
 mtbX8w08PgPFmY8GTemGgH5SSlWZPkIxFOP0cnPJPE0bHzmcbYK5kez5N w==;
X-CSE-ConnectionGUID: fS9eRqjkRomKH+AJG+sEag==
X-CSE-MsgGUID: L1nk99VqRhqooY5S1fKVhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60428155"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="60428155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:52 -0700
X-CSE-ConnectionGUID: q261VCqdT1W0AsRL+ANhww==
X-CSE-MsgGUID: 5+s9OerhQAaHOS38jFPA4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137840977"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:51 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 09/15] lib/intel_blt: use struct instead of inline coding
Date: Tue, 13 May 2025 20:58:04 +0200
Message-ID: <20250513185811.897232-10-zbigniew.kempczynski@intel.com>
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

Structs with bitfields offers better control to avoid setting
unnecessary bits and get unexpected behavior.

Add struct for mem-copy and replace current byte copy implementation
to byte/page adding iterator for insert couple of mem-copy instructions
if user passed objects which width is greater than limit.

On the first glance order of assigning fields might be weird, but
this will be used in consecutive patch which extends copy from linear
to matrix.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_blt.c | 171 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 144 insertions(+), 27 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 04549ab42e..265f5ed50f 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1798,6 +1798,73 @@ int blt_fast_copy(int fd,
 	return ret;
 }
 
+struct xe_mem_copy_data {
+	struct {
+		uint32_t length:			BITRANGE(0, 7);
+		uint32_t compression_format:	BITRANGE(8, 12);
+		uint32_t compression_enable:	BITRANGE(13, 13);
+		uint32_t rsvd0:			BITRANGE(14, 14);
+		uint32_t dst_compressible:	BITRANGE(15, 15);
+		uint32_t src_compressible:	BITRANGE(16, 16);
+		uint32_t copy_type:		BITRANGE(17, 18);
+		uint32_t mode:			BITRANGE(19, 19);
+		uint32_t rsvd1:			BITRANGE(20, 21);
+		uint32_t opcode:			BITRANGE(22, 28);
+		uint32_t client:			BITRANGE(29, 31);
+	} dw00;
+
+	struct {
+		union {
+			struct {
+				uint32_t width:			BITRANGE(0, 17);
+				uint32_t rsvd0:			BITRANGE(18, 31);
+			} byte_copy;
+			struct {
+				uint32_t width:			BITRANGE(0, 23);
+				uint32_t rsvd0:			BITRANGE(24, 31);
+			} page_copy;
+			uint32_t val;
+		};
+	} dw01;
+
+	struct {
+		uint32_t height:			BITRANGE(0, 17);
+		uint32_t rsvd0:			BITRANGE(18, 31);
+	} dw02;
+
+	struct {
+		uint32_t src_pitch:		BITRANGE(0, 17);
+		uint32_t rsvd0:			BITRANGE(18, 31);
+	} dw03;
+
+	struct {
+		uint32_t dst_pitch:		BITRANGE(0, 17);
+		uint32_t rsvd0:			BITRANGE(18, 31);
+	} dw04;
+
+	struct {
+		uint32_t src_address_lo;
+	} dw05;
+
+	struct {
+		uint32_t src_address_hi;
+	} dw06;
+
+	struct {
+		uint32_t dst_address_lo;
+	} dw07;
+
+	struct {
+		uint32_t dst_address_hi;
+	} dw08;
+
+	struct {
+		uint32_t dst_mocs:		BITRANGE(0, 6);
+		uint32_t rsvd0:			BITRANGE(7, 24);
+		uint32_t src_mocs:		BITRANGE(25, 31);
+	} dw09;
+};
+
 /**
  * blt_mem_copy_init:
  * @fd: drm fd
@@ -1820,41 +1887,91 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
 	mem->copy_type = copy_type;
 }
 
-static void emit_blt_mem_copy(int fd, uint64_t ahnd,
-			      const struct blt_mem_copy_data *mem,
-			      bool emit_bbe)
+static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
+				  const struct blt_mem_copy_data *mem,
+				  uint64_t bb_pos, bool emit_bbe)
 {
-	uint64_t dst_offset, src_offset;
-	int i;
-	uint32_t *batch;
-	uint32_t optype;
+	struct xe_mem_copy_data data = {};
+	uint64_t dst_offset, src_offset, shift;
+	uint32_t height, width_max, remain;
+	uint32_t bbe = MI_BATCH_BUFFER_END;
+	uint32_t *bb;
+
+	if (mem->mode == MODE_BYTE) {
+		data.dw01.byte_copy.width = -1;
+		width_max = data.dw01.byte_copy.width + 1;
+		shift = width_max;
+	} else {
+		data.dw01.page_copy.width = -1;
+		width_max = data.dw01.page_copy.width + 1;
+		shift = width_max << 8;
+	}
 
 	src_offset = get_offset_pat_index(ahnd, mem->src.handle, mem->src.size,
 					  0, mem->src.pat_index);
 	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
 					  0, mem->dst.pat_index);
 
-	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
-	optype = mem->copy_type == TYPE_MATRIX ? 1 << 17 : 0;
-
-	i = 0;
-	batch[i++] = MEM_COPY_CMD | optype;
-	batch[i++] = mem->src.width - 1;
-	batch[i++] = mem->src.height - 1;
-	batch[i++] = mem->src.pitch - 1;
-	batch[i++] = mem->dst.pitch - 1;
-	batch[i++] = src_offset;
-	batch[i++] = src_offset << 32;
-	batch[i++] = dst_offset;
-	batch[i++] = dst_offset << 32;
-	batch[i++] = mem->src.mocs_index << XE2_MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
-
-	if (emit_bbe)
-		batch[i++] = MI_BATCH_BUFFER_END;
-
-	munmap(batch, mem->bb.size);
+	bb = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
+
+	height = mem->dst.height;
+
+	data.dw00.client = 0x2;
+	data.dw00.opcode = 0x5a;
+	data.dw00.length = 8;
+	data.dw00.mode = mem->mode;
+	data.dw00.copy_type = mem->copy_type;
+
+	data.dw02.height = height - 1;
+	data.dw05.src_address_lo = src_offset;
+	data.dw06.src_address_hi = src_offset >> 32;
+	data.dw07.dst_address_lo = dst_offset;
+	data.dw08.dst_address_hi = dst_offset >> 32;
+	data.dw09.src_mocs = mem->src.mocs_index;
+	data.dw09.dst_mocs = mem->dst.mocs_index;
+
+	remain = mem->src.width;
+
+	/* Truncate pitches to match operation bits */
+	if (mem->src.pitch > width_max)
+		data.dw03.src_pitch = width_max - 1;
+	else
+		data.dw03.src_pitch = mem->src.pitch;
+
+	if (mem->dst.pitch > width_max)
+		data.dw04.dst_pitch = width_max - 1;
+	else
+		data.dw04.dst_pitch = mem->dst.pitch;
+
+	while (remain) {
+		data.dw01.val = min_t(uint32_t, width_max, remain) - 1;
+
+		igt_assert(bb_pos + sizeof(data) < mem->bb.size);
+		memcpy(bb + bb_pos, &data, sizeof(data));
+		bb_pos += sizeof(data);
+
+		remain -= remain > width_max ? width_max : remain;
+		src_offset += shift;
+		dst_offset += shift;
+
+		data.dw05.src_address_lo = src_offset;
+		data.dw06.src_address_hi = src_offset >> 32;
+		data.dw07.dst_address_lo = dst_offset;
+		data.dw08.dst_address_hi = dst_offset >> 32;
+	}
+
+	if (emit_bbe) {
+		igt_assert(bb_pos + sizeof(uint32_t) < mem->bb.size);
+		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
+		bb_pos += sizeof(uint32_t);
+	}
+
+	munmap(bb, mem->bb.size);
+
+	return bb_pos;
 }
 
+
 /**
  * blt_mem_copy:
  * @fd: drm fd
@@ -1884,7 +2001,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 					  0, mem->dst.pat_index);
 	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, 0);
 
-	emit_blt_mem_copy(fd, ahnd, mem, true);
+	emit_blt_mem_copy(fd, ahnd, mem, 0, true);
 
 	if (mem->driver == INTEL_DRIVER_XE) {
 		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
-- 
2.43.0

