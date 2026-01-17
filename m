Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432D2C98306
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 00:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB81E10E264;
	Sat, 17 Jan 2026 00:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIKfSJ2Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924F810E264
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 00:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768608355; x=1800144355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AGSi6oDNBtI4/M8TMnWqP/poj87xlMJHVzoOAuXXbt8=;
 b=IIKfSJ2QTuR0Lvj+tguvjSRL3+x7DtXBWRHpKiHGA/DeonaPU4UsDxab
 9LyoHH9RU8RPyh2up+8sPVBQPy5cg6FjkSsflbVfMtQeSvn33ZzC12aTu
 APIiERCVYj3e60JI0hXuGYUjkBXZv4Gxf9A6XxfnEBlSIZ+hW/Iqh3gLm
 kEXooyA8N4gjc1D1MviMp4kbh6AAPAZukYEK3H3wEkR9lp4XVGtOkI1/L
 OMtZiNBYFTwplnPw+8dOr9Ipeu9H9vfyyLKftWAue42jPUYUd3KxdV4qF
 /FbM3fpd5n6VA4PADkPcVDlhPZ2yFxzVKb/K71ZDF2K2fVMOxdb3aoMib g==;
X-CSE-ConnectionGUID: Kd12GX28S9ak3MhHX16xpg==
X-CSE-MsgGUID: BfXL1Y/MRe2IU8pS7GBOOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73556384"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="73556384"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 16:05:55 -0800
X-CSE-ConnectionGUID: epVrDUDVQpaRigK4Mrsi5w==
X-CSE-MsgGUID: rFcaVjB3QZOyMFsywKbkog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="210237890"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.54.82])
 by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 16:05:53 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 1/5] lib/xe/xe_legacy: Drop duplicate BATCH_DW_COUNT comment
Date: Sat, 17 Jan 2026 00:04:52 +0000
Message-Id: <20260117000456.26207-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260117000456.26207-1-shuicheng.lin@intel.com>
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <20260117000456.26207-1-shuicheng.lin@intel.com>
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

Remove a redundant copy of the batch buffer dword-count comment.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 lib/xe/xe_legacy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 084445305..d4f060f76 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -22,7 +22,6 @@
 #define CAT_ERROR			(0x1 << 5)
 #define CLOSE_EXEC_QUEUES		(0x1 << 2)
 #define CLOSE_FD			(0x1 << 1)
-/* Batch buffer element count, in number of dwords(u32) */
 #define GT_RESET			(0x1 << 0)
 #define MAX_N_EXECQUEUES		16
 
-- 
2.34.1

