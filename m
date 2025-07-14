Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660C9C83F17
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 16:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBEF10E4E0;
	Mon, 14 Jul 2025 16:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGDJXSDe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DD010E4DE
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752510299; x=1784046299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5S7nSbVVtc1XMS1KAIHaiC7ik5hSWW10SJsZj6lmvCo=;
 b=EGDJXSDeJdxY29WnVuQvlQhWHf9xlD/IOum2hLH7iZC7MYMkE89squRs
 /ycjSWIR/bUC4+DAHI73lMeCycn7+LfPUDrxWoHzBYU8HH4QXhyOX6Ox+
 1vB2dHn15LMLtWpIGIl9PjT76bZ6mHA2ZLrXlCYUNQtbIsjthbVCFCqoA
 MzVGUMa4wPqGrqmRXhonN/UisLTzn9cXpc/v07HQovYyElfp0x73Kr8ft
 6IdVmSf+oo12Wq4TWwfmVaydALttiUm+nq0c+5tvCGMWoUkZzcGIm/Ly8
 +ezxCAiIh0rhoL2iX0AJqlbiEPqHh9laBCMl+dkW/kX+w2drZtkrGh+oD Q==;
X-CSE-ConnectionGUID: 59xUmiEbRsS80fKTxAT6ew==
X-CSE-MsgGUID: 1QkhVV3MTXSJnRxLoAwH2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54564338"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54564338"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:24:59 -0700
X-CSE-ConnectionGUID: znRX/sv9Q1+ovGVDWkG/SQ==
X-CSE-MsgGUID: 6xrqXF27Q3qoS0KN1+vHBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161522541"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:24:57 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v6 4/5] intel-ci: rename i915 testlists
Date: Mon, 14 Jul 2025 18:24:34 +0200
Message-ID: <20250714162435.112599-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714162435.112599-1-kamil.konieczny@linux.intel.com>
References: <20250714162435.112599-1-kamil.konieczny@linux.intel.com>
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

Add 'i915.' prefix to i915 testlists.

v4: use 'i915.' prefix for all, fast-feedback and
  chamelium-only (Swati)

Suggested-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel-ci/README                                       | 6 +++---
 ...chamelium-only.testlist => i915.chamelium-only.testlist} | 0
 ....testlist => i915.fast-feedback-chamelium-only.testlist} | 0
 .../{fast-feedback.testlist => i915.fast-feedback.testlist} | 0
 tests/intel-ci/meson.build                                  | 6 +++---
 tests/intel/i915_test_config.json                           | 2 +-
 tests/intel/kms_test_config.json                            | 6 +++---
 7 files changed, 10 insertions(+), 10 deletions(-)
 rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (100%)
 rename tests/intel-ci/{fast-feedback-chamelium-only.testlist => i915.fast-feedback-chamelium-only.testlist} (100%)
 rename tests/intel-ci/{fast-feedback.testlist => i915.fast-feedback.testlist} (100%)

diff --git a/tests/intel-ci/README b/tests/intel-ci/README
index 5ef2ee2d1..102cdb1fa 100644
--- a/tests/intel-ci/README
+++ b/tests/intel-ci/README
@@ -17,9 +17,9 @@ Changing the test lists should only happen with approval from the CI
 people. If you make a new test that should be tested by CI regularly,
 ask a maintainer (see MAINTAINERS).
 
-======================
-fast-feedback.testlist
-======================
+===========================
+i915.fast-feedback.testlist
+===========================
 
 Fast-feedback contains tests that roughly tests a wide coverage of
 features in a short time. If the tests in fast-feedback report no
diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
similarity index 100%
rename from tests/intel-ci/chamelium-only.testlist
rename to tests/intel-ci/i915.chamelium-only.testlist
diff --git a/tests/intel-ci/fast-feedback-chamelium-only.testlist b/tests/intel-ci/i915.fast-feedback-chamelium-only.testlist
similarity index 100%
rename from tests/intel-ci/fast-feedback-chamelium-only.testlist
rename to tests/intel-ci/i915.fast-feedback-chamelium-only.testlist
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
similarity index 100%
rename from tests/intel-ci/fast-feedback.testlist
rename to tests/intel-ci/i915.fast-feedback.testlist
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 1588d5197..7efcef4be 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -6,9 +6,9 @@ intelci_files = [
   'blacklist-pre-merge.txt',
   'i915.blocklist.txt',
   'i915.blocklist-pre-merge.txt',
-  'chamelium-only.testlist',
-  'fast-feedback.testlist',
-  'fast-feedback-chamelium-only.testlist',
+  'i915.chamelium-only.testlist',
+  'i915.fast-feedback.testlist',
+  'i915.fast-feedback-chamelium-only.testlist',
   'meta.testlist',
   'xe.blocklist.txt',
   'xe.bmg.core.blocklist.txt',
diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index da871f493..7cfcad532 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -25,7 +25,7 @@
                     "exclude-type": "regex-ignorecase",
                     "append-value-if-not-excluded": "i915 FULL",
                     "include": [
-                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
+                        { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" }
                     ],
                     "exclude": [
                         { "all": "../intel-ci/i915.blocklist.txt" }
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index fc8766279..362298e0d 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -13,9 +13,9 @@
                     "append-value-if-not-excluded": "Xe FULL, i915 FULL",
                     "exclude-type": "regex-ignorecase",
                     "include": [
-                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
-                        { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
-                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
+                        { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
+                        { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
+                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
 
                         { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
                         { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
-- 
2.50.1

