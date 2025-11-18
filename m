Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8270CCD19A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 09:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4888010E34F;
	Tue, 18 Nov 2025 09:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPiBNJfc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1C310E34F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763457102; x=1794993102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JO/MxDbgGYl0wR20tnPo7JEUpWOdj+Q3ZvLcSrAmTT8=;
 b=KPiBNJfcRuTKdGkLqlWj1BJnGraD9GxuhGuEakjDcon4HhEAd8+BWbhq
 gRlZZzWpXfJnDP9WmWGPIrBm53wKd1HIcuInTkRPNvwT+DhrSbHQdcT5l
 gM2uPDh3mNQEpbuEBSnz1Xuki6gGqlITpnv1XdjiDPftdQrjMRzIAPJM/
 ACOxnwCVnFe9a+9zzhXBtariLzXytG7ENOuuZMR5wxoGrWJTUs7LS2UOx
 GOLDNKfMZUGoYf600o/OK0A4NwB9rZ/zMq1dgZAu+oQp5/kWjzgx11njk
 6A32L+dUGCR7hSDgOgW9Xng6tQcM32e5Px38AP0NLfQktl1taCSqskPHL w==;
X-CSE-ConnectionGUID: v4ReOBvTTZWEJSKItdsUrQ==
X-CSE-MsgGUID: YrA+8eHoSISzLfKuibz2HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65630685"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65630685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:11:41 -0800
X-CSE-ConnectionGUID: kh164rl7S6i10bh7IX/lnQ==
X-CSE-MsgGUID: Yz5ckQGLRFusiV6DOEwWHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="194815233"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:11:40 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH i-g-t] lib/intel_blt: fix pointer arithmetic in ctrl-surf-copy
 and mem-copy
Date: Tue, 18 Nov 2025 10:11:37 +0100
Message-ID: <20251118091136.734019-2-zbigniew.kempczynski@intel.com>
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

Using uint32_t pointer in bb causes leaving gaps and incorrect
size checking. Fix this by changing to byte pointer type.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 lib/intel_blt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 82e6186bf6..2b59cc7e90 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1290,9 +1290,9 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 	size_t data_sz;
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
-	uint32_t *bb;
 	uint32_t ccs_per_page, max_blocks, src_step, dst_step;
 	int32_t left_blocks;
+	uint8_t *bb;
 
 	igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
 	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
@@ -1408,9 +1408,9 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 	}
 
 	if (emit_bbe) {
-		igt_assert(bb_pos + sizeof(uint32_t) < surf->bb.size);
+		igt_assert(bb_pos + sizeof(bbe) < surf->bb.size);
 		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
-		bb_pos += sizeof(uint32_t);
+		bb_pos += sizeof(bbe);
 	}
 
 	munmap(bb, surf->bb.size);
@@ -2025,8 +2025,8 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 	uint64_t dst_offset, src_offset, shift;
 	uint32_t width, height, width_max, height_max, remain;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
-	uint32_t *bb;
 	uint32_t devid = intel_get_drm_devid(fd);
+	uint8_t *bb;
 
 	if (mem->mode == MODE_BYTE) {
 		data.dw01.byte_copy.width = -1;
@@ -2137,9 +2137,9 @@ static uint64_t emit_blt_mem_copy(int fd, uint64_t ahnd,
 	}
 
 	if (emit_bbe) {
-		igt_assert(bb_pos + sizeof(uint32_t) < mem->bb.size);
+		igt_assert(bb_pos + sizeof(bbe) < mem->bb.size);
 		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
-		bb_pos += sizeof(uint32_t);
+		bb_pos += sizeof(bbe);
 	}
 
 	munmap(bb, mem->bb.size);
-- 
2.43.0

