Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DAECCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179B110E0B1;
	Mon, 10 Nov 2025 13:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qc+vYnKq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D2610E0B1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762783055; x=1794319055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QW9Ohlr2wRHi0rE74LG3CTfw39yxtNvE6C6otodaZao=;
 b=Qc+vYnKqK9SveRykzRkV08mBfsynzuUni2ljSBaqwfMtQBmPmGvpeVta
 E8UBMRpkQ4zLg9F9XW9NXW/e7S55cp63s7tzK+RDimgKC0GB2gh4Ncr4R
 q38Mhy/VgwYNh2ixVfZl82KuHYPWt0/ak7FYYLIHql68kXPwrQBgxllMc
 DSn5HiJygtVaJ72MoyvZ8LyLvm3aH9OP/lkVos+X+QISNFVzUy5PcZsdl
 aHa3040ZhFRYlx1tzMG6r06jsAr5WsO7DtVLXPljv4eH5RY/BJHRd/OQA
 Im5B18sudk6K+O8Q/oHJltctth3fAR0U4WJNEv8pU2uDjwz2tm/G5AqLe Q==;
X-CSE-ConnectionGUID: 2VpyIQ+lQfWtelH5kkXZSQ==
X-CSE-MsgGUID: +nnFQECWT5aj0M+rO/IYOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64740030"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="64740030"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 05:57:35 -0800
X-CSE-ConnectionGUID: fMAGRHgxS7aSdg38wRZdxA==
X-CSE-MsgGUID: ULUrVtGaTxueGumL4azptA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188422943"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 05:57:34 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 1/2] lib/intel_blt: BB index should be incremented in dwords
Date: Mon, 10 Nov 2025 19:28:06 +0530
Message-ID: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
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

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 lib/intel_blt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 7f7f5485e..9a0bcb96b 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1714,7 +1714,7 @@ uint64_t emit_blt_fast_copy(int fd,
 
 	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
 	memcpy(bb + bb_pos, &data, sizeof(data));
-	bb_pos += sizeof(data);
+	bb_pos += DIV_ROUND_UP(sizeof(data), sizeof(*bb));
 
 	if (emit_bbe) {
 		igt_assert(bb_pos + sizeof(uint32_t) < blt->bb.size);
-- 
2.43.0

