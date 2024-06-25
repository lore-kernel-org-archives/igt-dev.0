Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2272EC30653
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 09:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA59F10E05E;
	Tue, 25 Jun 2024 09:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNOeC1na";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183FB10E05E
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719307134; x=1750843134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OvaGcnE7jmxUsJ5QJ66IpoHr/bGz5mBxfqAue5t2ZJ0=;
 b=JNOeC1naC7bgfwgCg1euvFa6fgCqMfeQgj4d7SmnZh1//9HHo7Vabmh+
 9dSNJtZAxewOdzVK1KVMSWM439YgSfEV36z8Dp+eI7KVEADEDqtwjSWFx
 NU2zeiNjdV0niSdYbPxtMJ/3/xErKDdi/VlEJ+LeosjgfP2h126851M2K
 t8bH26Kr8vzN+72VyL6NMEoKHhd8wb5MifDX5s4sTrGCgtJ8NTEMrUHw/
 3umKVvPgmzCjAP02jo7lFh5QF1YvJPO9afgWpwNG0hWAdeMznUAXL3gKT
 q0mdv/OLLjfuH5nf61BPhV3JAX+M/Z1hqTPTL/nZJ7mnP9UskOyqIBil7 w==;
X-CSE-ConnectionGUID: gTfmXYKtTZKOHLztcRB1zA==
X-CSE-MsgGUID: FtVsMIerSHa5UFjtG3QLXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16067439"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16067439"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 02:18:53 -0700
X-CSE-ConnectionGUID: Fu/xBnapQXOtPcUvuj5RUw==
X-CSE-MsgGUID: Nluk5D0xSROgmrDxWghYWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="48757092"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 02:18:52 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] lib/intel_blt: Fix printing mocs on Xe2+
Date: Tue, 25 Jun 2024 11:18:47 +0200
Message-Id: <20240625091847.134707-1-zbigniew.kempczynski@intel.com>
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

Due to different bit meanings dumping mocs indices displays incorrect
values for Xe2+. Fix this and print those indices according to platform.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_blt.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 20c42eec14..a21df1e8cf 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -847,9 +847,18 @@ static void fill_data_ext(struct gen12_block_copy_data_ext *dext,
 	dext->dw21.src_array_index = ext->src.array_index;
 }
 
-static void dump_bb_cmd(struct gen12_block_copy_data *data)
+static void dump_bb_cmd(struct gen12_block_copy_data *data, unsigned int ip_ver)
 {
 	uint32_t *cmd = (uint32_t *) data;
+	int src_mocs_idx, dst_mocs_idx;
+
+	if (ip_ver >= IP_VER(20, 0)) {
+		src_mocs_idx = data->dw08_xe2.src_mocs_index;
+		dst_mocs_idx = data->dw01_xe2.dst_mocs_index;
+	} else {
+		src_mocs_idx = data->dw08.src_mocs_index;
+		dst_mocs_idx = data->dw01.dst_mocs_index;
+	}
 
 	igt_info("details:\n");
 	igt_info(" dw00: [%08x] <client: 0x%x, opcode: 0x%x, color depth: %d, "
@@ -860,7 +869,7 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
 	igt_info(" dw01: [%08x] dst <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
 		 "tiling: %d, ctrl surf type: %d>\n",
 		 cmd[1], data->dw01.dst_pitch, data->dw01.dst_aux_mode,
-		 data->dw01.dst_mocs_index, data->dw01.dst_compression,
+		 dst_mocs_idx, data->dw01.dst_compression,
 		 data->dw01.dst_tiling, data->dw01.dst_ctrl_surface_type);
 	igt_info(" dw02: [%08x] dst geom <x1: %d, y1: %d>\n",
 		 cmd[2], data->dw02.dst_x1, data->dw02.dst_y1);
@@ -878,7 +887,7 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
 	igt_info(" dw08: [%08x] src <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
 		 "tiling: %d, ctrl surf type: %d>\n",
 		 cmd[8], data->dw08.src_pitch, data->dw08.src_aux_mode,
-		 data->dw08.src_mocs_index, data->dw08.src_compression,
+		 src_mocs_idx, data->dw08.src_compression,
 		 data->dw08.src_tiling, data->dw08.src_ctrl_surface_type);
 	igt_info(" dw09: [%08x] src offset lo (0x%x)\n",
 		 cmd[9], data->dw09.src_address_lo);
@@ -1034,7 +1043,7 @@ uint64_t emit_blt_block_copy(int fd,
 			 ", bb offset: %" PRIx64 "\n",
 			 src_offset, dst_offset, bb_offset);
 
-		dump_bb_cmd(&data);
+		dump_bb_cmd(&data, ip_ver);
 		if (ext)
 			dump_bb_ext(&dext);
 	}
-- 
2.34.1

