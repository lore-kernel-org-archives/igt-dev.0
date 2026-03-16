Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247A1EFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 07:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC7010E49D;
	Mon, 16 Mar 2026 07:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AS2/+jbP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5AF10E497
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773647950; x=1805183950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uqb2IQv+xej20RCLriaIOo3GX5XexuTs1EPgv5Q1WQ8=;
 b=AS2/+jbPWcy4QF1DBqapxirNJ68CQZDTnlMIFJUXpmmx4BqWL6qQ0EVz
 mCTlNqeD5Mi9J8SWH0WwOg9hfo4CoxeAKglqHi8gIiKfsjxgeaHPaUAYo
 gC/VyS5YZqHw/nnlW0jCy0c6r9VpbniSAsueTBXRvf1snYqGmjK5JA34O
 K6FaefPSqVuGGMrOsRkXPISA66y5YJW4yfkZKgn1g3VLfMj//TUugg0hd
 i719lddJz37kwn2HQfUqQwKKhs/+9yIJmry1FaGLW/iO8zAy8G8+BKh6X
 yqwlMME3V4RvV2Cb/3I6PeZBwd9hUymJg8yFEqfQmZ1WgoVd1oU5ND/Gl Q==;
X-CSE-ConnectionGUID: y1C+K2GnSbS+V5LXCTo2tA==
X-CSE-MsgGUID: sZEiNMSOSbuS5UVTbeoSyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74541981"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74541981"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:59:10 -0700
X-CSE-ConnectionGUID: VODtBHqOTwaauTWqF03ecg==
X-CSE-MsgGUID: R2UZ5mHoSkO2I+FLjCmHOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226826043"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:59:09 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com, kamil.konieczny@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v3 2/5] intel: Add Xe FULL chamelium run type to
 kms_test_config
Date: Mon, 16 Mar 2026 13:26:08 +0530
Message-ID: <20260316075611.3333142-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260316075611.3333142-1-mohammed.bilal@intel.com>
References: <20260316075611.3333142-1-mohammed.bilal@intel.com>
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

Add Xe FULL chamelium include mapping pointing to the shared
chamelium-only.testlist and update exclude labels to apply
xe.blocklist.txt to the new run type. Also rename i915 chamelium
to i915 FULL chamelium for consistency.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
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

