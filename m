Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8AEFEA82F
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 08:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A65510E81A;
	Wed, 25 Mar 2026 08:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCxDVg01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E9C10E81A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 08:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774426724; x=1805962724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=55pvfh8zmtV0AgS72GKpUDnfRP8nS0dm5uQHnp/flV4=;
 b=OCxDVg01UVZaeEEEWEsreqRcOAD6wTrMf0k2MNwQFHrB+98VgXHZux3o
 vT6u9EQOFP4IdR3da05LAbeIHd+6UIx9+5V7+3sQSLI3DvLuLCrUEPJJ0
 2Dzco1jr3IGVSGOZ3ubh0nZVoBSrL8AfY6eJT69SfCmi6N1W/JcSh1AH1
 5FQnP3yiP2RD6W9EorUNHxahnw5INkK1GS0n9N+IuTQm0PShpuJyNUWVJ
 UIAsUjkWot5j3sBZSwJmscOFMBzdTsrhIqtPXLswRpFb/E2/DbO7+7dNM
 4u0SOOrgSsQxshCEgAey5ybThwp7fv8At2kbvhD0jJOCMtP70DmRNj03t A==;
X-CSE-ConnectionGUID: 1CDG6NP2T9qobBhzTv4MEg==
X-CSE-MsgGUID: ynt4dvQhRz2jyEtFoXxKsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78056833"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="78056833"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 01:18:44 -0700
X-CSE-ConnectionGUID: IfyfNju1RjWY0UneQXJqPw==
X-CSE-MsgGUID: 3tpha0OQRdacHSwt2ldBsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="247641145"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 01:18:43 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_explicit_fence: Separate feature tag block
 from test description
Date: Wed, 25 Mar 2026 14:09:47 +0530
Message-ID: <20260325083947.765016-1-sowmiya.s@intel.com>
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

Split the comment into two blocks: one for the
feature tags and one for the long-form explanation
of the test. This improves readability and ensures
documentation generators treat the sections separately.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_explicit_fence.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
index a7d127c93..400fef939 100644
--- a/tests/kms_explicit_fence.c
+++ b/tests/kms_explicit_fence.c
@@ -9,7 +9,9 @@
  * Description: Test explicit fencing with multiple planes and mixed fence states
  * Driver requirement: i915, xe
  * Mega feature: General Display Features
- *
+ */
+
+/**
  * This test validates correct handling of explicit fences when multiple planes
  * are updated in a single atomic commit with different fence states. This is
  * critical for catching fence synchronization bugs where the driver might:
-- 
2.43.0

