Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B23C9830D
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 00:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D614310E26B;
	Sat, 17 Jan 2026 00:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ay/oDQZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF3810E26A
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 00:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768608357; x=1800144357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1JrMUUwDheFFhWAEgj4BRWp5x19gBuX5cQaKzgiMMnQ=;
 b=ay/oDQZ5CJI8IrT5yOUQUOnXkNjCNGAeJFDOBrrQgnInwJMwRRbP67Tx
 rdzsnCIrc6UC6NZ2ee1l6VAEP7qkCLZWPHwD3vRXXR+c8kxpMfgeB+S2m
 8iN1eqTXexl+/qgOSVRIXo2VSDoY3he4s0LBL/owcXFYH9GeLo7pegskf
 ZFDmFvb8kf2KnGxHYm/uayTlses6TVXnlAlIDf+Xy336xnN2Ej3IA47hq
 n6fTl+g8kjxv5zSM3eV+bM94CCS5xM/9cfO00M5N+Ao+TVAqd7i87vB5/
 5O0mCR1mqLQALoyq3ex9+6t5Ku/FBRQBu3baH0pHHms0XxGJ2McyJfQPZ Q==;
X-CSE-ConnectionGUID: u+u7m7DRRQyAokvL0zD9tA==
X-CSE-MsgGUID: rab6dvCLQPKt0fcuDWKu/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73556387"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="73556387"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 16:05:57 -0800
X-CSE-ConnectionGUID: dcfTsTiyTPWAHFLpgPQ9aQ==
X-CSE-MsgGUID: kuNH1OG9SkyNxlJrDVfOqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="210237903"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.54.82])
 by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 16:05:56 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 3/5] lib/xe/xe_legacy: Assert fd when CLOSE_FD is set
Date: Sat, 17 Jan 2026 00:04:54 +0000
Message-Id: <20260117000456.26207-4-shuicheng.lin@intel.com>
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

When CLOSE_FD is requested, xe_legacy_test_mode() expects to open its own
fd. Assert fd is -1 to avoid leaking an already-open descriptor.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 lib/xe/xe_legacy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 17d0839be..6c0ed56c9 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -73,8 +73,10 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & COMPRESSION)
 		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
 
-	if (flags & CLOSE_FD)
+	if (flags & CLOSE_FD) {
+		igt_assert_eq(fd, -1);
 		fd = drm_open_driver(DRIVER_XE);
+	}
 
 #define THREE_SEC	(3 * 1000000000ull)
 	if (flags & LONG_SPIN)
-- 
2.34.1

