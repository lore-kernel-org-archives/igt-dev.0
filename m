Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF05C83F27
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 12:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB7710E676;
	Tue, 22 Jul 2025 12:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TThtgj3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5080110E676
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 12:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753187979; x=1784723979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KpbzIXVGQg0UnuN5oAfQFCZ59PtUkoONH9Rr5x0FbRM=;
 b=TThtgj3YaPMbzymWRzPtrkUpOLPmChs9NCRcUw6y1wDAebQp2Rzkv9O+
 W8SYgjy+FTxzZiU4Cm7VMuZRpXi98XOyHNbURMv1uNXTC8N6UMCmE6j+4
 X1oApyjHxmPxvu91rs85rdQki50FK/jPVVaNw2ByEsu43p3BLtejprq2P
 dchf+PhffgpmjozTvP8Q5wvjzHukRLvyAWn8PsvZmQwmkEkqp+7F8RRGp
 yHvzsAzv69HokX/DFgQTn9Kl6kfD4poUpCV/c/0iyzj9P1VBlAVAq+71y
 /xCGNY1udtd7CAifYwOx/4N5ZQlbrg0Ap0C1jTLZEBUy91k1ImnUmuXMo g==;
X-CSE-ConnectionGUID: D+TsZ/I1SOidxpTE813z9Q==
X-CSE-MsgGUID: dP6c4w4rSBmqFfj8JvDEOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55377524"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55377524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:39:39 -0700
X-CSE-ConnectionGUID: XdIdeHvETLK41P7GVcB9wA==
X-CSE-MsgGUID: VCISweElQYCdPNfjp8e2Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="158448291"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.252])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:39:38 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/2] intel-ci: Block VKMS for xe runs
Date: Tue, 22 Jul 2025 14:39:20 +0200
Message-ID: <20250722123920.78238-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722123920.78238-1-kamil.konieczny@linux.intel.com>
References: <20250722123920.78238-1-kamil.konieczny@linux.intel.com>
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

These are non-Intel tests so block them from running.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index a21c8a3d3..2176764cf 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -11,6 +11,7 @@ igt@v3d.*
 igt@vc4.*
 igt@vgem_.*
 igt@.*virtgpu.*
+igt@vkms.*
 igt@vmwgfx.*
 ##################################################################
 # Exclude all i915 tests
-- 
2.50.1

