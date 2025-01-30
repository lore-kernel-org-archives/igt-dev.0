Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC7EC02190
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DB610E9B3;
	Thu, 30 Jan 2025 17:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAJWLax8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248CA10E385
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738256722; x=1769792722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JlPNiBajyJ9QWjPIvMNFWeh8ZF78+Hg2TB2b3bAWy+c=;
 b=BAJWLax8vlM7/A0h+zetryOXYR3hcsoK9ZDCWDQU7GcwmwTieIMyP8HL
 XKXxk+ym+2NdVphhm/V6UQV3oSnFtYjztVYCmlnS7sGymiv8b9p7QODIU
 90krNPalsCehnJPQQJVNZq1iiJtjS9+VsLoDxfFctrnE+0l7lg219o5Og
 juzDWh63VAkJ+jTAIG5dfKczGXu3wDQkiBoNSVo5F0u8Qt+ocgoSUoqdP
 OVmHy2H5ikp+tW98Wu2f6rp0TnHg7OYssSzZTkXRB5TRVE/IQhLa1N/v1
 qWGMfNH+ybu6/TbeAwApwwdFWXSFgevun8Ikh0LsxCwB513nav92hFVug Q==;
X-CSE-ConnectionGUID: wv0Dou/1QG67Pu1wC7uVAQ==
X-CSE-MsgGUID: 5GRW+lHPQkupCVXF9Mw2GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38953418"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38953418"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:05:22 -0800
X-CSE-ConnectionGUID: UV1PLduLRXC6XqbqWT1y3A==
X-CSE-MsgGUID: jEB73ZBRTvCKLsaK81QXMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109241195"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 09:05:19 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 6/6] HAX: DO NOT MERGE
Date: Thu, 30 Jan 2025 22:50:31 +0530
Message-Id: <20250130172031.4126606-7-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250130172031.4126606-1-jeevan.b@intel.com>
References: <20250130172031.4126606-1-jeevan.b@intel.com>
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

From: Kunal Joshi <kunal1.joshi@intel.com>

HAX patch do not merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 13 +++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..648142834 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,19 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
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

