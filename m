Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8941FCDB470
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 06:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375F610E049;
	Wed, 24 Jun 2026 06:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJVz75i8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5481510E049
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 06:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782283287; x=1813819287;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=at6bUx9vA/t4gTrRpBECZfEzx8lHFDWJ+H1xjfHgDHI=;
 b=aJVz75i8bzuS87rJW4izVL28j+lAB6oDQY5sw+IW9+90iJz0VznM0inM
 +Q0YIyQ3uayJ32hFZ2D8fLqW+zXFYYiqBx0kH3bJpklNueMaEjnQIrHN4
 5PWWNb13dp7pEO7liPF9bQMihO95nBj8v3t8Q8O1BCJULmAEs9Efye/NR
 oyr2Gx1v5UbmhKLQ08WcPtQUL4bFbqG5c2PLnPMY+yRQnlxotooStRDum
 EBm7F6pVRkJKZI7WF7EXHUih7aX73FOhZzNlKvj43wReuD0y1VTMUVNF5
 kMUwkDhMsUmtXqAGaievdRSilOru5IPl73aADPdfKy8b9kt/3Ko/yGSkQ A==;
X-CSE-ConnectionGUID: 5+rKKulARwCa23Ev321ktQ==
X-CSE-MsgGUID: vhcXrnqbT4Ku1z8bwrfOcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86940109"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86940109"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 23:41:27 -0700
X-CSE-ConnectionGUID: aS/XAg4ERAKxdIJzuooXdQ==
X-CSE-MsgGUID: kNBiSrjiRmK/OTqlBiFH5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="279908823"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 23:41:24 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] tests/intel/xe_pat: Fix semaphore_wait instruction
Date: Wed, 24 Jun 2026 12:17:52 +0530
Message-ID: <20260624064751.2271122-2-balasubramani.vivekanandan@intel.com>
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

Length of the instruction was set incorrectly and one of the operands
was not updated. Fixed it.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 tests/intel/xe_pat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index dc682b1acb..38341ec28d 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1698,10 +1698,11 @@ static void __false_sharing(int fd, const struct fs_pat_entry *fs_entry)
 
 	/* Unblock after cpu started to spin */
 	batch[i++] = MI_SEMAPHORE_WAIT_CMD | MI_SEMAPHORE_POLL |
-		     MI_SEMAPHORE_SAD_NEQ_SDD | (4 - 2);
+		     MI_SEMAPHORE_SAD_NEQ_SDD | 3;
 	batch[i++] = 0;
 	batch[i++] = addr + CPUDW_INC;
 	batch[i++] = addr >> 32;
+	batch[i++] = 0;
 
 	loop_addr = i;
 	batch[i++] = MI_STORE_DWORD_IMM_GEN4;
-- 
2.43.0

