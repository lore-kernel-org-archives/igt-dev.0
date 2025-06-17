Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A073C71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 22:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA2710E18C;
	Tue, 17 Jun 2025 22:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAIr6mZo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734E210E18C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 22:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750200744; x=1781736744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GWYmHqcEQMIadVMyXkO04iw+ZBV5Xk/ojSEok7nzFEo=;
 b=DAIr6mZoZsYYdigBBt4UV4A3BvUIC9J0a0BBLGtPdZ/UWh3arv+uhHXv
 qmTY7yO3rjAE/0ortBDOMqc++saLHKqtisPkdilkn/8dmt9L/fvt4U9KG
 UZmY9NB1I8NI5U4rJM6H5gRQdH8nGfvVOOc9pe3Yng+qOuimZIQKvLjxg
 81RpViMENnzGlqF4xQcxFj3Ay60wngwkUMC+Z96Pycx/uUMPknA4s8FbL
 s5FvZqk0vMcxqZjaHdnaGww8F25oBZyt5RQVPAYpbMJXsqtm6KNai4EtP
 NlpUVhLNe/tYG6hoPEQLG3z+lTgBiqCbbYM31Ks/OeQQq5Dp66d4zlF+a w==;
X-CSE-ConnectionGUID: bDFVfNb6Q9iPymx/BqZioQ==
X-CSE-MsgGUID: 7KHh03GjQRWshpu6i6040Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52539631"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="52539631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 15:52:23 -0700
X-CSE-ConnectionGUID: Y2LAOP2ERR6eve0b0rq8Bw==
X-CSE-MsgGUID: xPk5I+MvQTqd5PnrgicZ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="154374892"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 15:52:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t] lib/xe_query: Fix doc string for
 xe_device->memory_regions
Date: Tue, 17 Jun 2025 15:52:14 -0700
Message-ID: <20250617225213.43226-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
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

Due to a copy/paste error, the doc string did not match the field it was
documenting.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/xe/xe_query.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index a84a6bfa5..1224a723a 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -36,7 +36,7 @@ struct xe_device {
 	/** @gt_list: gt info */
 	struct drm_xe_query_gt_list *gt_list;
 
-	/** @gt_list: bitmask of all memory regions */
+	/** @memory_regions: bitmask of all memory regions */
 	uint64_t memory_regions;
 
 	/** @engines: hardware engines */
-- 
2.49.0

