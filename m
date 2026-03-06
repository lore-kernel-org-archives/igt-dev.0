Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE0CF01814
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 09:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0508310ECB5;
	Fri,  6 Mar 2026 09:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEKZSFYL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C2010ECB5
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772788496; x=1804324496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cy+rSs+X/wuaR/wmYzosSfokstk4tSYuDm4aZMYZmG4=;
 b=DEKZSFYLjdH2oVPuWT7iojnCz15dPRvFciO+ZA4l/BA8imLXsTIEFa3u
 vXC39tSBcTBZq1Smp/sajsWk6/9zLOz2iYioYrqwzyePh5uwZhsimxEkS
 Zp2WVD8OB0EX+WGTkCl+7B55v/oM24g6IDp0hqdcIRYRPtHUvt3c5ystj
 9+dml98p0nXCcg9HiBZb2yTPBDlmBfK6pz4ikT0d4bu4ATgjw5je9tWQ4
 Fv6hF6dk2PRekl/gWZDA9aawrCVZ7Z8XZite3w1QxqqbDeveAiKuaKMD2
 RIeIkki/MWq2kjWgrvVf2udNUkzc6MRKJGHgNqyZpJ4II/H84CWoCzGxp w==;
X-CSE-ConnectionGUID: at0f+Tj6Tp+YHm6q8GseRg==
X-CSE-MsgGUID: 5Rh/OG6ITOOZOz2owPdmQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="96508790"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="96508790"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 01:14:56 -0800
X-CSE-ConnectionGUID: GICYUTL2R7i9AlJsP2RlIg==
X-CSE-MsgGUID: HdA9/Mk7QPybPwWTZc1Rfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218198639"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 01:14:54 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t v7 5/6] tests/xe_compute: Use appropriate feature in
 compute-square tests
Date: Fri,  6 Mar 2026 10:14:36 +0100
Message-ID: <20260306091430.1234990-13-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306091430.1234990-8-zbigniew.kempczynski@intel.com>
References: <20260306091430.1234990-8-zbigniew.kempczynski@intel.com>
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

