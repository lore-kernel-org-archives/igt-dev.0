Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D09EC43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 10:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4215410E052;
	Tue, 14 Jul 2026 10:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWOxpvch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5E410E052
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784025836; x=1815561836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pk8eL/yrQQi1vcW3H4ktsMVugApn0Cf7b9XDJ+3BI98=;
 b=ZWOxpvchGudCnW9jyrqT+xUhs4rCUz/FuyR6RcjlDdLcpr5uFK5YHB8+
 KM2m/NcOESoD3pK/5YoxHZUKDo1XygVs7oinblEbk3X1aGoTuxl+GceLh
 ZozRpurDOoz6xl4kIgWYO0OYta213IXAeC1f8Mwt9SvucaCWjOdcBa70D
 RZaY65hmpFpvDApGkFauTjqFGlgjnmEk5DD+mSUQHf3F7dO94E0ASUAcP
 tGSLg6ZlWKkuv9f/rPB1huPsu5i1PlNty7cOtMXCnp6FxF54Rxg+5u5t/
 lghThNIrA1132ko+RL/jBguHVsQBOl1KkNHi215T0Znkl6ZiRaHDefVpT Q==;
X-CSE-ConnectionGUID: fWtbnox6RIe6a/dbdrn2qw==
X-CSE-MsgGUID: OyLnsCYORMy2EAcouz152g==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88323077"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="88323077"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:43:56 -0700
X-CSE-ConnectionGUID: TGjQwclkRjmmjil9vItYMw==
X-CSE-MsgGUID: ltyC98foRp+agtmzVLy56w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="255875051"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:43:54 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t] benchmarks/gem_wsim: skip -V verify on non-BATCH steps
Date: Tue, 14 Jul 2026 12:43:49 +0200
Message-ID: <20260714104349.1214243-1-marcin.bernatowicz@linux.intel.com>
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

Only BATCH steps have completion sync state.
Avoid syncobj_wait on control steps.

Fixes: 0b67d14c9df4 ("benchmarks/gem_wsim: Verify Xe spinner batch completion")
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 benchmarks/gem_wsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index bebb59f28..8be44d0c8 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2669,7 +2669,7 @@ static void do_xe_exec(struct workload *wrk, struct w_step *w)
 
 static void xe_w_step_sync_and_verify(struct w_step *w)
 {
-	if (!is_xe && w->type != BATCH)
+	if (!is_xe || w->type != BATCH)
 		return;
 
 	w_step_sync(w);
-- 
2.43.0

