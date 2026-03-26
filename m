Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A0A109E54B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 06:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B98710E236;
	Thu, 26 Mar 2026 06:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdP1AB9Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D45F10E1F8
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 06:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774506064; x=1806042064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ulReS/D21NgBvqyRlMCJLNMm48n5ikMWrUMqdgYASSE=;
 b=SdP1AB9YJbP2++w5Tu17SbwRl7bIfy2d0+Jx5WqpyTNpRGupJdZD2hfA
 OSFRwPGyI7yMuFmrZ89QpE8M7bd5a9focc13Gbf1lnn1c31m0geYQdA9x
 E9ewyP+DDAxP3DytvwxKsU4n3dgcRzsoWzp8F1zYeWtg7cyKfwLJ9gr56
 oGeEq5r2yVxCUWT4/SDnzn/BSjfrAIkt9hoK3k7VmdEqrRFsmpWuWYBQj
 R4DGw4oLAHopxHEJ0hF0d2JK10KN14BqP8F5re4eqZEgMjOmgUtrNmpQr
 148m0pXmpvMfoqqbg7hdbLEiQamUplxztLhQJiYgIIsfg1YcP70d1y0re Q==;
X-CSE-ConnectionGUID: KUK45uLmRPKdhFMd9NkaWw==
X-CSE-MsgGUID: ye0G+LpMR8+q87z5fhro7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="98175231"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="98175231"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:21:04 -0700
X-CSE-ConnectionGUID: qlM12lT+RcK4dySlFE22Ww==
X-CSE-MsgGUID: lWHk6HfuQRmeULHRoF4Yfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224935951"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:21:03 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v4 2/4] intel: Add Xe FULL chamelium run type to
 kms_test_config
Date: Thu, 26 Mar 2026 12:11:59 +0530
Message-ID: <20260326064201.783311-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326064201.783311-1-sowmiya.s@intel.com>
References: <20260326064201.783311-1-sowmiya.s@intel.com>
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

From: Mohammed Bilal <mohammed.bilal@intel.com>

Add Xe FULL chamelium include mapping pointing to the shared
chamelium-only.testlist and update exclude labels to apply
xe.blocklist.txt to the new run type. Also rename i915 chamelium
to i915 FULL chamelium for consistency.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_test_config.json | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 61a70a9bb..7eab10b04 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -15,14 +15,15 @@
                     "include": [
                         { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
                         { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
-                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
+                        { "i915 FULL chamelium": "../intel-ci/chamelium-only.testlist" },
 
                         { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
-                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
+                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" },
+                        { "Xe FULL chamelium": "../intel-ci/chamelium-only.testlist" }
                     ],
                     "exclude": [
-                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
-                            { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
+                        { "i915 BAT, i915 BAT chamelium, i915 FULL chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
+                            { "Xe BAT, Xe BAT chamelium, Xe FULL chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
                     ]
                 }
             },
-- 
2.48.1

