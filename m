Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EC6CAC5AE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 12:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B99910E375;
	Fri, 26 Sep 2025 12:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kq86GSC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753E510E375
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758889727; x=1790425727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+39IpysMYwEpHdIqEIrmhXg4g5dYV0sVpsqwUVBTP88=;
 b=kq86GSC8xcoK7JT5PxyPSl0LbDEm04vLOH48XvJ/vVJyVqf9XwVn7U30
 7kzuf+x2UyjKLnGfc3KCpqOhmP0bh6oHu4OVd6QnEXTJGSRb1w1coXMym
 Xt54AY8S2hjKBYtwQjczxy6bJV4KKmB7cJZ9MFQq2JLU14QmVNUDwPB/E
 bnqkxjpfIp69BFKpsT9Uu+1JJoL9C9ILPH8BQcMrXbAl6v3tabQlkBjPJ
 Jq3uNoO4UnTBYcRFBQcLzlEGq0mBoUAjzs9bN4UY1kpvsLDQPN2U5R0lT
 w2F53N4D0p8arIJQwkdSQcZXCGDjJs9UL17WciEte8vLJMqnOJfuF8EBu Q==;
X-CSE-ConnectionGUID: 2UdI3J8LRACFUeJAlqXV7w==
X-CSE-MsgGUID: 2xk2vzIoQTuqPG/Nc6KRZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="86664140"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="86664140"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 05:28:47 -0700
X-CSE-ConnectionGUID: NuANe/+cRdCt2v3kHl14Gw==
X-CSE-MsgGUID: ZlcLs0l9Tbujk/8NunVgiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="214734348"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 05:28:45 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2] lib/intel_blt: Fix MEM_COPY instruction for xe2+ platforms
Date: Fri, 26 Sep 2025 18:00:59 +0530
Message-Id: <20250926123059.2173950-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
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

There is a difference in the MEM_COPY instruction structure starting
with xe2 based platforms. Fixed it.

Bspec: 57561
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 126 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 93 insertions(+), 33 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 71ed891c3..7f7f5485e 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1800,17 +1800,32 @@ int blt_fast_copy(int fd,
 
 struct xe_mem_copy_data {
 	struct {
-		uint32_t length:			BITRANGE(0, 7);
-		uint32_t compression_format:	BITRANGE(8, 12);
-		uint32_t compression_enable:	BITRANGE(13, 13);
-		uint32_t rsvd0:			BITRANGE(14, 14);
-		uint32_t dst_compressible:	BITRANGE(15, 15);
-		uint32_t src_compressible:	BITRANGE(16, 16);
-		uint32_t copy_type:		BITRANGE(17, 18);
-		uint32_t mode:			BITRANGE(19, 19);
-		uint32_t rsvd1:			BITRANGE(20, 21);
-		uint32_t opcode:			BITRANGE(22, 28);
-		uint32_t client:			BITRANGE(29, 31);
+		union {
+			struct {
+				uint32_t length:		BITRANGE(0, 7);
+				uint32_t rsvd0:			BITRANGE(8, 8);
+				uint32_t compression_format:	BITRANGE(9, 12);
+				uint32_t rsvd1:			BITRANGE(13, 16);
+				uint32_t copy_type:		BITRANGE(17, 18);
+				uint32_t mode:			BITRANGE(19, 19);
+				uint32_t rsvd2:			BITRANGE(20, 21);
+				uint32_t opcode:		BITRANGE(22, 28);
+				uint32_t client:		BITRANGE(29, 31);
+			} xe2;
+			struct {
+				uint32_t length:		BITRANGE(0, 7);
+				uint32_t compression_format:	BITRANGE(8, 12);
+				uint32_t compression_enable:	BITRANGE(13, 13);
+				uint32_t rsvd0:			BITRANGE(14, 14);
+				uint32_t dst_compressible:	BITRANGE(15, 15);
+				uint32_t src_compressible:	BITRANGE(16, 16);
+				uint32_t copy_type:		BITRANGE(17, 18);
+				uint32_t mode:			BITRANGE(19, 19);
+				uint32_t rsvd1:			BITRANGE(20, 21);
+				uint32_t opcode:		BITRANGE(22, 28);
+				uint32_t client:		BITRANGE(29, 31);
+			} gen12;
+		};
 	} dw00;
 
 	struct {
@@ -1859,9 +1874,22 @@ struct xe_mem_copy_data {
 	} dw08;
 
 	struct {
-		uint32_t dst_mocs:		BITRANGE(0, 6);
-		uint32_t rsvd0:			BITRANGE(7, 24);
-		uint32_t src_mocs:		BITRANGE(25, 31);
+		union {
+			struct {
+				uint32_t dst_encrypt:		BITRANGE(0, 0);
+				uint32_t rsvd0:			BITRANGE(1, 2);
+				uint32_t dst_mocs:		BITRANGE(3, 6);
+				uint32_t rsvd1:			BITRANGE(7, 24);
+				uint32_t src_encrypt:		BITRANGE(25, 25);
+				uint32_t rsvd2:			BITRANGE(26, 27);
+				uint32_t src_mocs:		BITRANGE(28, 31);
+			} xe2;
+			struct {
+				uint32_t dst_mocs:		BITRANGE(0, 6);
+				uint32_t rsvd0:			BITRANGE(7, 24);
+				uint32_t src_mocs:		BITRANGE(25, 31);
+			} gen12;
+		};
 	} dw09;
 };
 
@@ -1887,18 +1915,32 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
 	mem->copy_type = copy_type;
 }
 
-static void dump_bb_mem_copy_cmd(struct xe_mem_copy_data *data)
+static void dump_bb_mem_copy_cmd(int fd, struct xe_mem_copy_data *data)
 {
 	uint32_t *cmd = (uint32_t *) data;
+	uint32_t devid = intel_get_drm_devid(fd);
 
 	igt_info("BB details:\n");
-	igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
-		 "[copy type: %d, mode: %d]\n",
-		 cmd[0], data->dw00.client, data->dw00.opcode, data->dw00.length,
-		 data->dw00.copy_type, data->dw00.mode);
-	igt_info(" dw01: [%08x] width: %u\n", cmd[1],
-		 data->dw00.mode == MODE_BYTE ? data->dw01.byte_copy.width :
-						data->dw01.page_copy.width);
+
+	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
+			 "[copy type: %d, mode: %d]\n",
+			 cmd[0], data->dw00.xe2.client, data->dw00.xe2.opcode,
+			 data->dw00.xe2.length, data->dw00.xe2.copy_type,
+			 data->dw00.xe2.mode);
+		igt_info(" dw01: [%08x] width: %u\n", cmd[1],
+			 data->dw00.xe2.mode == MODE_BYTE ? data->dw01.byte_copy.width :
+							data->dw01.page_copy.width);
+	} else {
+		igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, length: %d> "
+			 "[copy type: %d, mode: %d]\n",
+			 cmd[0], data->dw00.gen12.client,
+			 data->dw00.gen12.opcode, data->dw00.gen12.length,
+			 data->dw00.gen12.copy_type, data->dw00.gen12.mode);
+		igt_info(" dw01: [%08x] width: %u\n", cmd[1],
+			 data->dw00.gen12.mode == MODE_BYTE ? data->dw01.byte_copy.width :
+							data->dw01.page_copy.width);
+	}
 	igt_info(" dw02: [%08x] height: %u\n", cmd[2], data->dw02.height);
 	igt_info(" dw03: [%08x] src pitch: %u\n", cmd[3], data->dw03.src_pitch);
 	igt_info(" dw04: [%08x] dst pitch: %u\n", cmd[4], data->dw04.dst_pitch);
@@ -1910,8 +1952,15 @@ static void dump_bb_mem_copy_cmd(struct xe_mem_copy_data *data)
 		 cmd[7], data->dw07.dst_address_lo);
 	igt_info(" dw08: [%08x] dst offset hi (0x%x)\n",
 		 cmd[8], data->dw08.dst_address_hi);
-	igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
-		 cmd[8], data->dw09.dst_mocs, data->dw09.src_mocs);
+	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
+			 cmd[9], data->dw09.xe2.dst_mocs,
+			 data->dw09.xe2.src_mocs);
+	} else {
+		igt_info(" dw09: [%08x] mocs <dst: 0x%x, src: 0x%x>\n",
+			 cmd[9], data->dw09.gen12.dst_mocs,
+			 data->dw09.gen12.src_mocs);
+	}
 }
 
 static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
@@ -1923,6 +1972,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 	uint32_t width, height, width_max, height_max, remain;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *bb;
+	uint32_t devid = intel_get_drm_devid(fd);
 
 	if (mem->mode == MODE_BYTE) {
 		data.dw01.byte_copy.width = -1;
@@ -1945,19 +1995,29 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 	width = mem->src.width;
 	height = mem->dst.height;
 
-	data.dw00.client = 0x2;
-	data.dw00.opcode = 0x5a;
-	data.dw00.length = 8;
-	data.dw00.mode = mem->mode;
-	data.dw00.copy_type = mem->copy_type;
+	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
+		data.dw00.xe2.client = 0x2;
+		data.dw00.xe2.opcode = 0x5a;
+		data.dw00.xe2.length = 8;
+		data.dw00.xe2.mode = mem->mode;
+		data.dw00.xe2.copy_type = mem->copy_type;
+		data.dw09.xe2.src_mocs = mem->src.mocs_index;
+		data.dw09.xe2.dst_mocs = mem->dst.mocs_index;
+	} else {
+		data.dw00.gen12.client = 0x2;
+		data.dw00.gen12.opcode = 0x5a;
+		data.dw00.gen12.length = 8;
+		data.dw00.gen12.mode = mem->mode;
+		data.dw00.gen12.copy_type = mem->copy_type;
+		data.dw09.gen12.src_mocs = mem->src.mocs_index;
+		data.dw09.gen12.dst_mocs = mem->dst.mocs_index;
+	}
 
 	data.dw02.height = height - 1;
 	data.dw05.src_address_lo = src_offset;
 	data.dw06.src_address_hi = src_offset >> 32;
 	data.dw07.dst_address_lo = dst_offset;
 	data.dw08.dst_address_hi = dst_offset >> 32;
-	data.dw09.src_mocs = mem->src.mocs_index;
-	data.dw09.dst_mocs = mem->dst.mocs_index;
 
 	/* For matrix we don't iterate */
 	if (mem->copy_type == TYPE_MATRIX) {
@@ -1983,7 +2043,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 
 		if (mem->print_bb) {
 			igt_info("[MEM COPY]\n");
-			dump_bb_mem_copy_cmd(&data);
+			dump_bb_mem_copy_cmd(fd, &data);
 		}
 	} else {
 		remain = mem->src.width;
@@ -2017,7 +2077,7 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 
 			if (mem->print_bb) {
 				igt_info("[MEM COPY]\n");
-				dump_bb_mem_copy_cmd(&data);
+				dump_bb_mem_copy_cmd(fd, &data);
 			}
 		}
 	}
-- 
2.34.1

