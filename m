Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E468C98306
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 00:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98FF10E26F;
	Sat, 17 Jan 2026 00:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUhMnaHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8164410E26F
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 00:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768608359; x=1800144359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tbjL10TNE0kqQKg7u1C5Xf/yv6B35Df/KFf7xf/WxtI=;
 b=KUhMnaHGvSHM5UOTaPsrKheDBBYfwbW4GSfR1IHaH6urZ0EQ21BRq7cq
 UBscDEOZVv3LgKz8kG0k4SXZMT37jKqbsw9VkhrjGzfXkaoUzHT0vfsB0
 2GHtPXJBie7T0zScCTYV3Fr/sZkFL1ouavQcTcRnVk9gUpgVTevFDbfOR
 IuGa4xHugXwg9R/wlbNJwyXoTp+2s4TQK7RANp8fgzisARASfrmhCC8aA
 323udYGHdRvCgJnHkLX7y0cyM6LE/PTFYFsGk7UYTj1NajekO9ziuLTCj
 frZ+wG7o9qHEUfERVrJDItPnfDjuO3JVAnGCD95ZP3Zm9Bx6l9G405KS6 w==;
X-CSE-ConnectionGUID: 2KZTNsCiRh6QALfD1JWlSQ==
X-CSE-MsgGUID: Cs5k94gcQCaStxHrR4ZIyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73556390"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="73556390"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 16:05:59 -0800
X-CSE-ConnectionGUID: kyZ4qr+QQIyEt2dgo3PgvA==
X-CSE-MsgGUID: ZtD7bxu7T+G31enUJ4Alzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="210237920"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.54.82])
 by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 16:05:58 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 5/5] lib/xe/xe_legacy: Simplify base_addr in reuse loop
Date: Sat, 17 Jan 2026 00:04:56 +0000
Message-Id: <20260117000456.26207-6-shuicheng.lin@intel.com>
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

The extra_execs loop starts at n_execs, so i is never zero.
Always use addr as base_addr.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 lib/xe/xe_legacy.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 95246ea92..dcd7e2075 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -190,8 +190,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	for (i = n_execs; i < n_execs + extra_execs; i++) {
-		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
-			? (addr + bo_size * 128) : addr;
+		u64 base_addr = addr;
 		u64 batch_offset = (char *)&data[i].batch - (char *)data;
 		u64 batch_addr = base_addr + batch_offset;
 		u64 sdi_offset = (char *)&data[i].data - (char *)data;
-- 
2.34.1

