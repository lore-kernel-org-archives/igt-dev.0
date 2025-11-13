Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A11CD6E6C
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 14:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD3810E81E;
	Thu, 13 Nov 2025 14:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0VpolSB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981FF10E81E
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 14:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763042993; x=1794578993;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T1mFIKIGfaoEqTqiryqpJktsHFspvv95XirKbbevH88=;
 b=B0VpolSB4YRSKvpNBQcMqfh+5d1ka2qFAfhi0wR0Z+TsLQs3+rcpPjF3
 OzOHBrH223yN3YtHqalM67BQttPGnxAgIuN+7lseNVoSBESngWrmmIiGa
 wE/u3cND+cYg7Iuq908tKF3uHtDJmyhJwRKKW9wKqO5t0kkGPUbaOVsbP
 ftFy1Oj1IhuPzIYFD+cKzzS0ghYf1upHWPSBxOQHziIGhDTeYpUS5BSnq
 /PqiNut9UPPXLQnXlEJ1fOufi5NycRAubVoMcWBESWwkTBoRn0GuZ0mXM
 OTeVz4OGL/Iy/D9hICAr2E6QjUpV0tU+gPwpewsdREW0nW5/5B1mIa9e8 w==;
X-CSE-ConnectionGUID: 0mh+WyaZQTCCUyG+sKgOKg==
X-CSE-MsgGUID: wocZI0cRQgKQ22p4wOP7VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="68986855"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="68986855"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:09:53 -0800
X-CSE-ConnectionGUID: HXN+oF4nQyGoHIUrTqZlaA==
X-CSE-MsgGUID: qQuM1yBQQ/mJuSn1c0WDCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="188776547"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:09:51 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH v3 1/2] lib/intel_blt: Fix adding byte offset to bb_pos
Date: Thu, 13 Nov 2025 19:40:28 +0530
Message-ID: <20251113141027.3803274-3-balasubramani.vivekanandan@intel.com>
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

Argument bb_pos is dword offset but it is incremented using byte offset.
Fix it by converting the bb_pos to byte offset and use it for indexing
the BB pointer.
Convert back to dword offset before returning the offset.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---

v2:
  - Same fix done at few places in the function (Ashutosh)
v3:
  - Convert bb pointer from uint32_t* to uint8_t* (Ashutosh, Zbigniew)

---
 lib/intel_blt.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 7f7f5485e..b4daf4b8e 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1655,7 +1655,8 @@ uint64_t emit_blt_fast_copy(int fd,
 	struct gen12_fast_copy_data data = {};
 	uint64_t dst_offset, src_offset, bb_offset;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
-	uint32_t *bb;
+	uint8_t *bb;
+	uint64_t offset = bb_pos * sizeof(uint32_t);
 
 	data.dw00.client = 0x2;
 	data.dw00.opcode = 0x42;
@@ -1712,14 +1713,14 @@ uint64_t emit_blt_fast_copy(int fd,
 
 	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
 
-	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
-	memcpy(bb + bb_pos, &data, sizeof(data));
-	bb_pos += sizeof(data);
+	igt_assert(offset + sizeof(data) < blt->bb.size);
+	memcpy(bb + offset, &data, sizeof(data));
+	offset += sizeof(data);
 
 	if (emit_bbe) {
-		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
-		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
-		bb_pos += sizeof(uint32_t);
+		igt_assert(offset + sizeof(bbe) < blt->bb.size);
+		memcpy(bb + offset, &bbe, sizeof(bbe));
+		offset += sizeof(bbe);
 	}
 
 	if (blt->print_bb) {
@@ -1732,7 +1733,8 @@ uint64_t emit_blt_fast_copy(int fd,
 
 	munmap(bb, blt->bb.size);
 
-	return bb_pos;
+	/* Should return the DWORD offset */
+	return DIV_ROUND_UP(offset, sizeof(uint32_t));
 }
 
 /**
-- 
2.43.0

