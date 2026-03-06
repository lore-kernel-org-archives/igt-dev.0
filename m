Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F1EF01804
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 07:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A830D10E3A2;
	Fri,  6 Mar 2026 07:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ly+s4/yv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD56110E3A2
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 07:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772783904; x=1804319904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cy+rSs+X/wuaR/wmYzosSfokstk4tSYuDm4aZMYZmG4=;
 b=Ly+s4/yvkrX0UfR7JW1tHfDnRtMsQiMu8Uve0S5a2trbuV06k2gtOJBV
 cCj70JO2m9rLxcxxBSgE0gBKRa+tbecwqyw24nodEIfWmFoQjPN/wpu/j
 pnwaS8CfQpyCJhKW4XfbClxXdbU5lfTjWmfEFXe79pDU45eF82R5QrPYG
 RzXTa4suv7hEvrpyi7LBWBwLcnkgX3Dun9b1wtmCrm9KPWQ04cCWsw2ds
 cY+3/UM+ibsPOQhg0pZ4w26TAAifFnrYeMLIupAfrGxl2feayDTbQanXy
 GEpJbcB0KeXfpa2XGWuDNVFkEci7bxqovrlG+8Z/Ii6i4XNU9c/Ql9kA4 w==;
X-CSE-ConnectionGUID: RLlP8J5rRxC0DP6MVLHvTQ==
X-CSE-MsgGUID: qyf3TFvwTHysg2ZliuMS0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84521448"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="84521448"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:24 -0800
X-CSE-ConnectionGUID: EJK1kmsWQBmh6txcGvHrMQ==
X-CSE-MsgGUID: hnZ5t+gORkG8XPM+APz6ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="219071519"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:23 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t v6 5/6] tests/xe_compute: Use appropriate feature in
 compute-square tests
Date: Fri,  6 Mar 2026 08:58:05 +0100
Message-ID: <20260306075759.1153032-13-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
References: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
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

Test is doing compute-square calculation so pick 'Compute' instead
of 'WMTP' is better choice.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_compute.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index e5367b4c10..2a4e428699 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -495,8 +495,8 @@ test_eu_busy(uint64_t duration_sec)
 
 /**
  * SUBTEST: compute-square
- * Mega feature: WMTP
- * Sub-category: wmtp tests
+ * Mega feature: Compute
+ * Sub-category: compute tests
  * Functionality: OpenCL kernel
  * GPU requirement: TGL, PVC, LNL, PTL
  * Description:
-- 
2.43.0

