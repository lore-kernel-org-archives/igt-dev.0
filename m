Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2AFC54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A511135F9;
	Fri,  8 Mar 2024 08:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3RZutWS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06F211360F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887090; x=1741423090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tz8WzUO1OCKr65DGKs7Leg2gFRhgNjj8by2j6hJlrTw=;
 b=H3RZutWSZozb1SSzTRqn0jZQ/fjn/a+k1X/ei8geqeaKxGkYamhKnwkj
 M+EgQlf/WHocPkZe3URrg3Y0bfuIMm/C+7pkEJMOaD91IoyGJL0iVmwGN
 /UySJw+ZDxG5qPM/SVrLYf4R65uA3Kx3nFTSqklHDzL9pUh8sO39uicCy
 2hofSFs9crPCM/JhSlrZDufrQ4+JGMXTleaIXVvD3ojNh2s0xVwbt2kaI
 otIDZAhEa89wkwcdmiq6QRToR4UKRL8tUpAGheMxuMK68i8F0NFwzFgfX
 yMgMvevmlInfCSsiWb7kfO3VP3ayyRPBVjI6bAtx5YmuRtJ2426sedyCa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="27071917"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="27071917"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10447130"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:38:08 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v2 05/25] tests/intel: Let's introduce Workarounds
 subcategory
Date: Fri,  8 Mar 2024 08:36:37 +0000
Message-Id: <20240308083657.1092049-6-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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

There is gem_workaround test that deserves it's own subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_workarounds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index d83c0a1db..43146f4b9 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -36,8 +36,8 @@
  * TEST: gem workarounds
  * Category: Infrastructure
  * Feature: workarounds
- * Functionality: workarounds
- * Sub-category: Context
+ * Functionality: context
+ * Sub-category: Workarounds
  * Test category: GEM_Legacy
  * Run type: FULL
  *
-- 
2.34.1

