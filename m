Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820F2E77188
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 13:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309FC10E289;
	Tue, 31 Dec 2024 13:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htyeXUrf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080F410E67C
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735653589; x=1767189589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=spMjvJrj1AseVcFpodehUm/G3YKrOUnJySNlWmaiAVI=;
 b=htyeXUrfqH1NExDURqk5fV0SF7SXEWNelED3FytUHlZqpc6QJemKpg3x
 Fs7PxsPwXpWxdSQjovG3iGy7oD5BT2DSxake1W6BQaAiDUUxxLHwntktl
 AQ2h8oJEoxgxSSWENzAhdtMX4kDWVgpBWdE3x3DP+B3hOLpa2SirShOoO
 FnP4XYODu4VCWTvr906nI1yrB50mDtBjSwR8gKzKkzGaKpu1y3EGzXSnE
 kogbM/Yo3gE9MIh/K/GD2GJIAZGwHPmYnUukBNUL4vUp7Ma1IX6QAeBo8
 9ZX3kYqWC1zA5mABDY1bJ1J597qR0FyWgO/FXHbs0i0LyuDGB+T/UCMmC g==;
X-CSE-ConnectionGUID: q57EuUY4SxyEBjMEi4OGMg==
X-CSE-MsgGUID: U8UXzVMdQDaoylBbJWekwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36047321"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="36047321"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 05:59:49 -0800
X-CSE-ConnectionGUID: MvHf2pItQRGhWdin9sp98Q==
X-CSE-MsgGUID: T0xSOPDEQ2GF6CgL5V4FEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="100820144"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 05:59:47 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 4/4] HAX: DO NOT MERGE
Date: Tue, 31 Dec 2024 19:45:18 +0530
Message-Id: <20241231141518.765212-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231141518.765212-1-kunal1.joshi@intel.com>
References: <20241231141518.765212-1-kunal1.joshi@intel.com>
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

