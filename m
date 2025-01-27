Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFD1C0218F
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 06:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BA910E494;
	Mon, 27 Jan 2025 06:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ar4Tqqmz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FEE10E2EE
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 06:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737958414; x=1769494414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+sf8agUNdOGwjXjuXNhE/rMtAznEWRRIzdQTqUvWXDo=;
 b=ar4Tqqmz1zizV0bwhySWBZp3TqRTtkdyxFiAkYBf02jcp0FJJB5ajguy
 KkZ3+qibNxevCJ4ZxECsSK85rwiGdNICIGzHjXbrHRKt97C84KbIhQ6Es
 TOdmr0vDciZ3dP4dBh6UKADh0lzYTcsQx+R5ZuuiWlOD1Rc5EZYVvhBc3
 laNHBRxJJfbzw89gCr8xhgRPtFkz8svs5w1/XiJZgbDiHaIY++zDcvUUS
 1AQrMT/AjxtGcn21wQB+54W5wf70ui517GqIudc775ScyrZlq/jokTfZ7
 ZtHhQvGI3J7YmFOCDGxYya5D+OkQm1qdymqHtVaMGIfsNHY/LOVAs7LPq g==;
X-CSE-ConnectionGUID: yrS35RfvSwqO5LkQMchb+g==
X-CSE-MsgGUID: LOPFsg3wSlupiV2XOSDQOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="60875519"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="60875519"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 22:13:34 -0800
X-CSE-ConnectionGUID: 5pFcSsBwTzWX69Y1cRecaA==
X-CSE-MsgGUID: WBrU/frdQGuMoSmqis0LYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="108142138"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 22:13:32 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/3] HAX: Do not merge
Date: Mon, 27 Jan 2025 11:59:04 +0530
Message-Id: <20250127062904.3420225-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250127062904.3420225-1-kunal1.joshi@intel.com>
References: <20250127062904.3420225-1-kunal1.joshi@intel.com>
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

Don't merge, just for CI testing
---
 tests/intel-ci/fast-feedback.testlist    | 3 ++-
 tests/intel-ci/xe-fast-feedback.testlist | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..668fb3888 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,7 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_dp_linktrain_fallback@dsc-fallback
+igt@kms_dp_linktrain_fallback@dp-fallbck
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 0234d3e72..28f8b5015 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,7 @@
 # Should be the first test
 igt@xe_module_load@load
-
+igt@kms_dp_linktrain_fallback@dsc-fallback
+igt@kms_dp_linktrain_fallback@dp-fallback
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.25.1

