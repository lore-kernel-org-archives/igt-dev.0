Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC646C55160
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 11:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D7E10EED3;
	Thu, 30 Jul 2026 11:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hpt10od0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B4A10EED3
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785411103; x=1816947103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bpCj5ztTA3M0yMEU6Mx4SfX+jCGAqXrBciIORMOb8o0=;
 b=Hpt10od0EmI3hw/3tnz2f5dP4GE/+3DQjBGkUGccih0hxdUOiMy1ASwW
 r7ZvZhuScVQ/VhwXc7Gqp6bY1VK4/tkTe6MCdm4XYzeHg/5rXHJINnoPX
 Ix04p2dzZjadVGYmwkRWtxtgED29iVVihR5+WTKvtwfmV2STJZx93kc7d
 G1v5tj7HIrT9BS4tE/h4KY7Xk3Qv43XapJBSijeZqI/JHFFzmHU5Eoj4x
 zLK9BB7k5o4uzxAfbW4ddHXxLavhXreFeLMNjQGnE6winIX7blNwKBR6l
 EPvqR31qxKx3aNQi1KghAstpJa8jyOkBKznvy+NdHtVdAQHhDJODm5pHm Q==;
X-CSE-ConnectionGUID: aLo9VI8jQW+/pH5+Mb9XcA==
X-CSE-MsgGUID: 9FcWjhnyQ7W1r1IjjtT4tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103565697"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="103565697"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:31:42 -0700
X-CSE-ConnectionGUID: R473z4kJQ4uIgU3s9LVnEA==
X-CSE-MsgGUID: FfBWrmvSQP2Yr2INBOUw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="256353611"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 04:31:41 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_feature_discovery: Fix subtest documentation
Date: Thu, 30 Jul 2026 17:10:41 +0530
Message-Id: <20260730114041.4084117-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Fix VRR and DSC mega features documentation.

Fixes: 2609f72fc ("tests/kms_feature_discovery: add HDR, VRR and DSC discovery")
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_feature_discovery.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 97bb25360..d18272b97 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -70,11 +70,11 @@
  *
  * SUBTEST: vrr
  * Description: Make sure that we have at least one VRR-capable panel.
- * Mega feature: VRR
+ * Mega feature: Adaptive Sync
  *
  * SUBTEST: dsc
  * Description: Make sure that we have at least one DSC-capable sink.
- * Mega feature: DSC
+ * Mega feature: VDSC
  *
  * arg[1].values: 1, 2, 3, 4
  */
-- 
2.25.1

