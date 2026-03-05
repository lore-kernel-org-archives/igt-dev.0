Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80732EEF323
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 08:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDB710EB95;
	Thu,  5 Mar 2026 08:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxAB9HN6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1503110EB95
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772700112; x=1804236112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MVbPnZBAb7QTkoL1iWzQoDlQjjSOWXl4uOCzw7Myo5s=;
 b=BxAB9HN6l+3/QYCuoA8532XwdGxpO8wCRHFJQNqji1f7cQlEvjfCLO1Q
 2sBLY+MKc2om1iHATfLj/ZZTdEFfpr5rjjohm+tt6i4lULMbPkJxTph2P
 H+SRo1hFa4nAiLItp28weG6ax788RPe4ZGH7s5d7oFUPEzL7QP7Qeaj6d
 F5Et7KmXyOjXSacwlaZiEr3pAx3u3bzKfiL16ODc/f4fs0SIifWlKP2/8
 YKtMZH5oeCVFDEcrC3LKvwzWJAP4YWIWJ08ovPXYlPhTk0C9HIDQ5sx6W
 j5noQY3xp1AFwhJybJUV3lFtxm/hKiQbe6Wxia3EIXvHYKW7ozKOsOQou Q==;
X-CSE-ConnectionGUID: LAHxDi8iQIeeTZKY+zoAfA==
X-CSE-MsgGUID: S7WC3+LWTNGAExelO94giw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77624269"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="77624269"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:41:52 -0800
X-CSE-ConnectionGUID: BwvX5HlaTHyZOioJWXc/6A==
X-CSE-MsgGUID: v3MAmr2NQema/08urSvyKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="214673611"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:41:50 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kamil.konieczny@intel.com, ryszard.knop@intel.com,
 karol.krol@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v5 2/6] intel-ci: Rename chamelium-only testlist to i915
 specific
Date: Thu,  5 Mar 2026 14:09:02 +0530
Message-ID: <20260305083906.3098168-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260305083906.3098168-1-mohammed.bilal@intel.com>
References: <20260305083906.3098168-1-mohammed.bilal@intel.com>
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

Rename chamelium-only.testlist to i915.chamelium-only.testlist.

v3:
-Use move-fix-add approach (Kamil)

v4:
-Restructure move-fix-add approach (Kamil)
-Rename run-type labels(Swati)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 .../{chamelium-only.testlist => i915.chamelium-only.testlist} | 0
 tests/intel-ci/meson.build                                    | 2 +-
 tests/intel/kms_test_config.json                              | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (100%)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
similarity index 100%
rename from tests/intel-ci/chamelium-only.testlist
rename to tests/intel-ci/i915.chamelium-only.testlist
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index cf0023c63..1a13dd52a 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -2,7 +2,7 @@
 
 intelci_files = [
   'README',
-  'chamelium-only.testlist',
+  'i915.chamelium-only.testlist',
   'fast-feedback.testlist',
   'fast-feedback-chamelium-only.testlist',
   'i915.blocklist.txt',
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 61a70a9bb..4ed6e5405 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -15,13 +15,13 @@
                     "include": [
                         { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
                         { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
-                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
+                        { "i915 FULL chamelium": "../intel-ci/i915.chamelium-only.testlist" },
 
                         { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
                         { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
                     ],
                     "exclude": [
-                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
+                        { "i915 BAT, i915 BAT chamelium, i915 FULL chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
                             { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
                     ]
                 }
-- 
2.48.1

