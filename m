Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC68C02183
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 07:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9CD10E4E4;
	Wed, 15 Jan 2025 07:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBcbYXCf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6E810E4E4
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 07:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736925437; x=1768461437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=spMjvJrj1AseVcFpodehUm/G3YKrOUnJySNlWmaiAVI=;
 b=nBcbYXCfFC/cemGIZ1IOSj2vrSVvVNdQzh2crER+GgGgRpPgaVKcyg7C
 aqwRcIzrYGmsRvOIBNYCWnZrrAuX8I2vVVkPl2Df2cfNy+5QFxojyyi/h
 S/bUvpizQMPlEGYJd6vqn5fnuO1oWPfqprawLrMtKajREqx8nEIbgvblD
 k41sBEU1efL2dffiFlykZRyic+LRrSzmM2Ycm7lvWPteU1X1lhw2U09hH
 sg9E9iMKae3bmwKsqkGBnHOKzSnrIHhThOEFfug1Q1UgewbcOwMaV8dEK
 90rngOsKIs/WBUpSHsJOOVDtSjTadBX+M2XOyGUE8Xqz0jqTwilNDHxJn w==;
X-CSE-ConnectionGUID: /F44XvFxQgWwD9BrNmW94g==
X-CSE-MsgGUID: b/e4bYujRluifVxgFGaRbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40927898"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="40927898"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 23:17:17 -0800
X-CSE-ConnectionGUID: D/EMUe2iRlixp2cz4kQodg==
X-CSE-MsgGUID: Mo30rAM2TB6TOP84pIt5Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="110008250"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 23:17:13 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH 4/4] HAX: DO NOT MERGE
Date: Wed, 15 Jan 2025 13:02:43 +0530
Message-Id: <20250115073243.2002014-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115073243.2002014-1-kunal1.joshi@intel.com>
References: <20250115073243.2002014-1-kunal1.joshi@intel.com>
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

HAX patch do not merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 14 ++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..b4b74db85 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,20 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+
+igt@kms_feature_discovery@uhbr-sst
+igt@kms_feature_discovery@uhbr-mst
+igt@kms_feature_discovery@non-uhbr-sst
+igt@kms_feature_discovery@non-uhbr-mst
+igt@kms_joiner@basic-big-joiner
+igt@kms_joiner@basic-ultra-joiner
+igt@kms_joiner@invalid-modeset-big-joiner
+igt@kms_joiner@invalid-modeset-ultra-joiner
+igt@kms_joiner@basic-force-big-joiner
+igt@kms_joiner@invalid-modeset-force-big-joiner
+igt@kms_joiner@basic-force-ultra-joiner
+igt@kms_joiner@invalid-modeset-force-ultra-joiner
+igt@kms_dp_linktrain_fallback@dp-fallback
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 0234d3e72..9bb6f79d4 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,20 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_feature_discovery@uhbr-sst
+igt@kms_feature_discovery@uhbr-mst
+igt@kms_feature_discovery@non-uhbr-sst
+igt@kms_feature_discovery@non-uhbr-mst
+igt@kms_joiner@basic-big-joiner
+igt@kms_joiner@basic-ultra-joiner
+igt@kms_joiner@invalid-modeset-big-joiner
+igt@kms_joiner@invalid-modeset-ultra-joiner
+igt@kms_joiner@basic-force-big-joiner
+igt@kms_joiner@invalid-modeset-force-big-joiner
+igt@kms_joiner@basic-force-ultra-joiner
+igt@kms_joiner@invalid-modeset-force-ultra-joiner
+igt@kms_dp_linktrain_fallback@dp-fallback
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.25.1

