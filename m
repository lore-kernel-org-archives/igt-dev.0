Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C837D5E141
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 06:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E332110E26E;
	Fri,  8 Nov 2024 06:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlCIkHqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4278410E26E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 06:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731048446; x=1762584446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=POBKVFym1CRxix6hKSIcnD6+lxykygervqJEEowZokA=;
 b=OlCIkHqjnveOKbXxvsZ61637b2cd7JvJvP5XgKnAu4VHPH5gO69JIMA7
 +OmmbmFUy5jZosxM/dKREU3lbGsYfdFcghx8SFHsoAoB2duvEAX/pwRtL
 J63yOaLZhD9Y1dwQFosge5d5i3LoBzdcgjbSuQ+MjZZQ/miTliqDfrp96
 DmyJRQx6G1r8FYX8vewtnLKdhfa+oZCV7Ffv6rGQRQLr/bwbAnyL97lMK
 PeoW2NULdjiiSk2+M862aWFIgMRPc7Go3H36BOQMiivsdxLnpYtgUU4Ag
 e3sV1vNLhijhFDW6wCBORL3mkofltxR8u/OcFvQ0S7Orf3b6aqRjRy4Dc g==;
X-CSE-ConnectionGUID: NKcB0cD0T1OaCfE5LiJomA==
X-CSE-MsgGUID: czz8WSZ8QzqRbKRLm5lg4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34613019"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34613019"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 22:47:26 -0800
X-CSE-ConnectionGUID: Brrcw5+lRGe6SMnayfkEJA==
X-CSE-MsgGUID: CL1Ms6uHQNinduSK0/HXBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="86230954"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.236])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 22:47:23 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/3] lib/intel_blt: Handle multiple ctrl-surf-copy blits
 on big surface
Date: Fri,  8 Nov 2024 07:47:10 +0100
Message-Id: <20241108064712.252927-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108064712.252927-1-zbigniew.kempczynski@intel.com>
References: <20241108064712.252927-1-zbigniew.kempczynski@intel.com>
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

Copying ccs data for bigger surfaces requires couple of blits. This is
caused by the limitation of 10-bit size (for Xe and Xe2+) of the
ctrl-surf-copy operation. To handle bigger than 64MiB surfaces on Xe
and 4MiB on Xe2+ we need to divide blits to fit in mentioned 10-bit
size.

Change introduces looping around big surface to produce batch with
couple of ctrl-surf-copy blits.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_blt.c | 121 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 86 insertions(+), 35 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 1b0f279177..b2fb3151e0 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1115,7 +1115,13 @@ int blt_block_copy(int fd,
 	return ret;
 }
 
-static uint16_t __ccs_size(int fd, const struct blt_ctrl_surf_copy_data *surf)
+/*
+ * Function calculates CCS bytes used for the surface. Size field in
+ * ctrl-surf-copy command struct is for Xe and Xe2 10-bit length, so caller
+ * has to divide ccs copy of bigger surfaces to couple of separate commands.
+ * This function returns total size of ccs data used for the surface.
+ */
+static uint32_t __ccs_size(int fd, const struct blt_ctrl_surf_copy_data *surf)
 {
 	uint32_t src_size, dst_size;
 	uint16_t ccsratio = CCS_RATIO(fd);
@@ -1286,8 +1292,8 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *bb;
-	uint16_t num_ccs_blocks = (ip_ver >= IP_VER(20, 0)) ?
-				(xe_get_default_alignment(fd) / CCS_RATIO(fd)) : CCS_RATIO(fd);
+	uint32_t ccs_per_page, max_blocks, src_step, dst_step;
+	int32_t left_blocks;
 
 	igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
 	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
@@ -1299,51 +1305,108 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 					  alignment, surf->dst.pat_index);
 	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size, alignment);
 
+	bb = bo_map(fd, surf->bb.handle, surf->bb.size, surf->driver);
+
+	/*
+	 * Copying in/out CCS data is limited by bitfield size_of_ctrl_copy size
+	 * what means operation on bigger surface needs to be handled on couple
+	 * of ctrl-surf-copy commands.
+	 *
+	 * Instead of hardcoding maximum number of blocks copied in single
+	 * command we may calculate it from bitfield size (Xe and Xe2 differs
+	 * in bitfield location [and in future platforms potentially size]).
+	 */
 	if (ip_ver >= IP_VER(20, 0)) {
+		ccs_per_page = SZ_4K / CCS_RATIO(fd);
+
 		data.xe2.dw00.client = 0x2;
 		data.xe2.dw00.opcode = 0x48;
 		data.xe2.dw00.src_access_type = surf->src.access_type;
 		data.xe2.dw00.dst_access_type = surf->dst.access_type;
-
-		/* Ensure dst has size capable to keep src ccs aux */
-		data.xe2.dw00.size_of_ctrl_copy = __ccs_size(fd, surf) / num_ccs_blocks - 1;
 		data.xe2.dw00.length = 0x3;
 
-		data.xe2.dw01.src_address_lo = src_offset;
-		data.xe2.dw02.src_address_hi = src_offset >> 32;
+		data.xe2.dw00.size_of_ctrl_copy = -1;
+		max_blocks = data.xe2.dw00.size_of_ctrl_copy + 1;
+
+		/*
+		 * For Xe2+ each size_of_ctrl_copy increment covers 4K page size
+		 * of surface, which in turn is covered by 8B of CCS data.
+		 */
+		src_step = surf->src.access_type == DIRECT_ACCESS ? ccs_per_page : SZ_4K;
+		src_step *= max_blocks;
+		dst_step = surf->dst.access_type == DIRECT_ACCESS ? ccs_per_page : SZ_4K;
+		dst_step *= max_blocks;
+
 		data.xe2.dw02.src_mocs_index = surf->src.mocs_index;
-
-		data.xe2.dw03.dst_address_lo = dst_offset;
-		data.xe2.dw04.dst_address_hi = dst_offset >> 32;
 		data.xe2.dw04.dst_mocs_index = surf->dst.mocs_index;
 
 		data_sz = sizeof(data.xe2);
 	} else {
+		ccs_per_page = SZ_64K / CCS_RATIO(fd);
+
 		data.gen12.dw00.client = 0x2;
 		data.gen12.dw00.opcode = 0x48;
 		data.gen12.dw00.src_access_type = surf->src.access_type;
 		data.gen12.dw00.dst_access_type = surf->dst.access_type;
-
-		/* Ensure dst has size capable to keep src ccs aux */
-		data.gen12.dw00.size_of_ctrl_copy = __ccs_size(fd, surf) / num_ccs_blocks - 1;
 		data.gen12.dw00.length = 0x3;
 
-		data.gen12.dw01.src_address_lo = src_offset;
-		data.gen12.dw02.src_address_hi = src_offset >> 32;
+		data.gen12.dw00.size_of_ctrl_copy = -1;
+		max_blocks = data.gen12.dw00.size_of_ctrl_copy + 1;
+
+		/*
+		 * For Xe each size_of_ctrl_copy increment covers 64K page size
+		 * of surface, which in turn is covered by 256B of CCS data.
+		 */
+		src_step = surf->src.access_type == DIRECT_ACCESS ? ccs_per_page : SZ_64K;
+		src_step *= max_blocks;
+		dst_step = surf->dst.access_type == DIRECT_ACCESS ? ccs_per_page : SZ_64K;
+		dst_step *= max_blocks;
+
 		data.gen12.dw02.src_mocs_index = surf->src.mocs_index;
-
-		data.gen12.dw03.dst_address_lo = dst_offset;
-		data.gen12.dw04.dst_address_hi = dst_offset >> 32;
 		data.gen12.dw04.dst_mocs_index = surf->dst.mocs_index;
 
 		data_sz = sizeof(data.gen12);
 	}
 
-	bb = bo_map(fd, surf->bb.handle, surf->bb.size, surf->driver);
+	left_blocks = __ccs_size(fd, surf) / ccs_per_page;
 
-	igt_assert(bb_pos + data_sz < surf->bb.size);
-	memcpy(bb + bb_pos, &data, data_sz);
-	bb_pos += data_sz;
+	while (left_blocks > 0) {
+		int32_t nblocks = min_t(int32_t, left_blocks, max_blocks);
+
+		if (ip_ver >= IP_VER(20, 0)) {
+			data.xe2.dw00.size_of_ctrl_copy = nblocks - 1;
+			data.xe2.dw01.src_address_lo = src_offset;
+			data.xe2.dw02.src_address_hi = src_offset >> 32;
+			data.xe2.dw03.dst_address_lo = dst_offset;
+			data.xe2.dw04.dst_address_hi = dst_offset >> 32;
+		} else {
+			data.gen12.dw00.size_of_ctrl_copy = nblocks - 1;
+			data.gen12.dw01.src_address_lo = src_offset;
+			data.gen12.dw02.src_address_hi = src_offset >> 32;
+			data.gen12.dw03.dst_address_lo = dst_offset;
+			data.gen12.dw04.dst_address_hi = dst_offset >> 32;
+		}
+
+		left_blocks -= max_blocks;
+		dst_offset += dst_step;
+		src_offset += src_step;
+
+		igt_assert(bb_pos + data_sz < surf->bb.size);
+		memcpy(bb + bb_pos, &data, data_sz);
+		bb_pos += data_sz;
+
+		if (surf->print_bb) {
+			igt_info("[CTRL SURF]:\n");
+			igt_info("src offset: 0x%" PRIx64 ", dst offset: 0x%" PRIx64
+				 ", bb offset: 0x%" PRIx64 ", copy nblocks: 0x%x\n",
+				 src_offset, dst_offset, bb_offset, nblocks);
+
+			if (ip_ver >= IP_VER(20, 0))
+				xe2_dump_bb_surf_ctrl_cmd(&data.xe2);
+			else
+				dump_bb_surf_ctrl_cmd(&data.gen12);
+		}
+	}
 
 	if (emit_bbe) {
 		igt_assert(bb_pos + sizeof(uint32_t) < surf->bb.size);
@@ -1351,18 +1414,6 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 		bb_pos += sizeof(uint32_t);
 	}
 
-	if (surf->print_bb) {
-		igt_info("[CTRL SURF]:\n");
-		igt_info("src offset: %" PRIx64 ", dst offset: %" PRIx64
-			 ", bb offset: %" PRIx64 "\n",
-			 src_offset, dst_offset, bb_offset);
-
-		if (ip_ver >= IP_VER(20, 0))
-			xe2_dump_bb_surf_ctrl_cmd(&data.xe2);
-		else
-			dump_bb_surf_ctrl_cmd(&data.gen12);
-	}
-
 	munmap(bb, surf->bb.size);
 
 	return bb_pos;
-- 
2.34.1

