Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460F3CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 10:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71A710E323;
	Mon, 17 Nov 2025 10:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvJKMowA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B5510E323
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763374679; x=1794910679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pzDiXsqMtehHAgOWRoZ7+GnklmPBBdYm8JqPrJo545I=;
 b=RvJKMowAfqbQ7e0ul3xiVydKZ5rNbsBpAZRRLYMf1wYKCRF5Ixl5+gdI
 /OfbVXQKtcftQddGJipPRpr//fV5+/JhILtS0xFNtPVxbgBEkD9V/VK6j
 3NVHmjpnPW333wi8IBFBm40vCdSHTgV9g2x4bgMEb6lTO23SYQ4QzCXOA
 PpksAaB23tp6hRPYsYs1YT5nhEjKaTGQGYaqnMtRiCMX61QN9GbKUgEpb
 8oCPhBXVqW6FKTIABR1x+1EqdBua6bhU842/0NOn9lWvhn1Xoz1oeRXzI
 M/B+JPStTpMDqPn7cBVLXAhqQCI5L0q6+FwEzKXMshzIAC9RbVN9hSj1B Q==;
X-CSE-ConnectionGUID: v/lA3V73RauaP8ij+R8fvA==
X-CSE-MsgGUID: +carbdPDSWmLjQD7ITUaTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="64574050"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="64574050"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:17:59 -0800
X-CSE-ConnectionGUID: nAUydTOAR5qZo+McrE1Z2g==
X-CSE-MsgGUID: zw34z/DSQ8uL0KiW2HkH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="221053934"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:17:57 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH v4 1/2] lib/intel_blt: Convert BB pointer to uint8_t* in
 emit_blt_fast_copy
Date: Mon, 17 Nov 2025 15:48:37 +0530
Message-ID: <20251117101836.3892456-3-balasubramani.vivekanandan@intel.com>
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

Argument bb_pos is a byte offset. So the BB pointer should be defined as
uint8_t*. Fix it by changing the BB pointer from uint32_t* to uint8_t*.

Additional minor fix to change use of sizeof(uint32_t) to sizeof(bbe)
while checking for size of BBE instruction.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---

v2:
  - Same fix done at few places in the function (Ashutosh)
v3:
  - Convert bb pointer from uint32_t* to uint8_t* (Ashutosh, Zbigniew)
v4:
  - Return bb byte offset from emit_blt_fast_copy (Zbigniew)

---
 lib/intel_blt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 7f7f5485e..e63341a02 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1655,7 +1655,7 @@ uint64_t emit_blt_fast_copy(int fd,
 	struct gen12_fast_copy_data data = {};
 	uint64_t dst_offset, src_offset, bb_offset;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
-	uint32_t *bb;
+	uint8_t *bb;
 
 	data.dw00.client = 0x2;
 	data.dw00.opcode = 0x42;
@@ -1717,9 +1717,9 @@ uint64_t emit_blt_fast_copy(int fd,
 	bb_pos += sizeof(data);
 
 	if (emit_bbe) {
-		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
+		igt_assert(bb_pos + sizeof(bbe) < blt->bb.size);
 		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
-		bb_pos += sizeof(uint32_t);
+		bb_pos += sizeof(bbe);
 	}
 
 	if (blt->print_bb) {
-- 
2.43.0

