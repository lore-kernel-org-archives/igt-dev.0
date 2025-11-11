Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795ACCCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 15:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255C110E5A8;
	Tue, 11 Nov 2025 15:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6CxKXqZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C243910E113
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 15:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762874989; x=1794410989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ibwWkcMeMpMx453Hdn9+C+PGWUD7iGG8+9wSE+k0Vp4=;
 b=m6CxKXqZgPYCouItVLqk5YwSZP4EEtUjvbMckCkyFfNi4KVZJ5/ta03A
 z4wxUNJa6mxSB8NaJwr9FHzjQnP3hdbwRHuc2iplET4KCLP0eRlHxd68D
 dSvIf2mm4JfiKleTuT31Zr7UFXbZNxT92sOGS6cw3vEaZtcvx4RXXw39Z
 ia2IU/Yb6rN9vl9I50092mHi4N077H5L5zfVRDKrRzovsTwBpxNPfoMYt
 5k3lMoQc1o7wPZmFcOeER04rmleMxWdjlToNmdCby97OkpAMCEVhDcu5K
 5GIaCvhOqKxx0Nr8TwxzYmCFxUaBKiZRPEQks1TA5DjPrhARklGsUn04G w==;
X-CSE-ConnectionGUID: L8xxjHsBRLCXSl/44YFDBA==
X-CSE-MsgGUID: AQNVCf6rQQ6yGi14NC4y3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64854934"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64854934"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 07:29:49 -0800
X-CSE-ConnectionGUID: 7Axjw/M0T9qHjLxqlSOJkw==
X-CSE-MsgGUID: VPgTBZ4SQ0OQxDkUiWsWqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="212384001"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 07:29:47 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH v2 1/2] lib/intel_blt: BB index should be incremented in dwords
Date: Tue, 11 Nov 2025 21:00:15 +0530
Message-ID: <20251111153014.3681794-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Size in bytes in used to increment the BB index, which is incorrect.
Convert bytes to number of dwords.
Also while checking for remaining size available in a BB, the index
should be multiplied by the dword size.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 lib/intel_blt.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 7f7f5485e..fd7b29ccd 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1629,6 +1629,11 @@ static void dump_bb_fast_cmd(struct gen12_fast_copy_data *data)
 		 cmd[9], data->dw09.src_address_hi);
 }
 
+static inline uint64_t bb_remaining_size(const struct blt_copy_batch *bb,
+					 uint64_t bb_pos) {
+	return bb->size - bb_pos * sizeof(uint32_t);
+}
+
 /**
  * emit_blt_fast_copy:
  * @fd: drm fd
@@ -1712,14 +1717,14 @@ uint64_t emit_blt_fast_copy(int fd,
 
 	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
 
-	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
+	igt_assert(bb_remaining_size(&blt->bb, bb_pos) >= sizeof(data));
 	memcpy(bb + bb_pos, &data, sizeof(data));
-	bb_pos += sizeof(data);
+	bb_pos += DIV_ROUND_UP(sizeof(data), sizeof(*bb));
 
 	if (emit_bbe) {
-		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
+		igt_assert(bb_remaining_size(&blt->bb, bb_pos) >= sizeof(bbe));
 		memcpy(bb + bb_pos, &bbe, sizeof(bbe));
-		bb_pos += sizeof(uint32_t);
+		bb_pos += DIV_ROUND_UP(sizeof(bbe), sizeof(*bb));
 	}
 
 	if (blt->print_bb) {
-- 
2.43.0

