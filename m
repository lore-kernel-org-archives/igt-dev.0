Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDC1C8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 09:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EF710E330;
	Mon,  7 Jul 2025 09:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGLb5zpP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7284810E330
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751881322; x=1783417322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MGDxPsrURrLWOJX9RebOnNZTiZC2y4yxz2Ye42hN640=;
 b=QGLb5zpP2LBiDoz3CAcB4Z4I9SUvxuCQSM8duwc64YemfuZpcsu+nKew
 obfxupIWEjERnSYBwVT6HpBCiVdxE0rO4sEN9Fmhwlxy/46ztzQbBMO3u
 +mtK1yt+k98wKNCXhwLGszI9VdMYQ4VqpT0CvS9EzTZjL7v6zc8Fl2iys
 nCvSsc+WcOy81y2IvYhyblBOc5BT5Djbmz/02mz6YoVvIOA/AntYea7W3
 OgXYR2lBOZkhTMEQ6XypLhqHr/ibWjhvzMu4ojsQztjdzKO483Cdkip4B
 8eV2Z6OCxgf2IjZ2E9ZxVlppvFRsGsGqxWwrb6rsTyQbZaM4ODO4SWVWa A==;
X-CSE-ConnectionGUID: 5io+opBhSee0QLAHn2q8eQ==
X-CSE-MsgGUID: SgF9nvPyTUid1uxPJ9YBXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65550863"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="65550863"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:42:02 -0700
X-CSE-ConnectionGUID: QtyM8FgFQiaKS334y08tJw==
X-CSE-MsgGUID: SIPBeAuhRaqAkZFVdlnNnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="155297689"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:42:01 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 4/5] intel-ci: rename i915 testlists
Date: Mon,  7 Jul 2025 11:41:17 +0200
Message-ID: <20250707094118.84046-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707094118.84046-1-kamil.konieczny@linux.intel.com>
References: <20250707094118.84046-1-kamil.konieczny@linux.intel.com>
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

Follow Xe nameing and add i915 prefix to its testlists. In
fast-feedback use 'i915-' and in normal testlist 'i915.'.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/README                                       | 6 +++---
 ....testlist => i915-fast-feedback-chamelium-only.testlist} | 0
 .../{fast-feedback.testlist => i915-fast-feedback.testlist} | 0
 ...chamelium-only.testlist => i915.chamelium-only.testlist} | 0
 tests/intel-ci/meson.build                                  | 6 +++---
 tests/intel/i915_test_config.json                           | 2 +-
 tests/intel/kms_test_config.json                            | 6 +++---
 7 files changed, 10 insertions(+), 10 deletions(-)
 rename tests/intel-ci/{fast-feedback-chamelium-only.testlist => i915-fast-feedback-chamelium-only.testlist} (100%)
 rename tests/intel-ci/{fast-feedback.testlist => i915-fast-feedback.testlist} (100%)
 rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (100%)

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
diff --git a/tests/intel-ci/fast-feedback-chamelium-only.testlist b/tests/intel-ci/i915-fast-feedback-chamelium-only.testlist
similarity index 100%
rename from tests/intel-ci/fast-feedback-chamelium-only.testlist
rename to tests/intel-ci/i915-fast-feedback-chamelium-only.testlist
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/i915-fast-feedback.testlist
similarity index 100%
rename from tests/intel-ci/fast-feedback.testlist
rename to tests/intel-ci/i915-fast-feedback.testlist
diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
similarity index 100%
rename from tests/intel-ci/chamelium-only.testlist
rename to tests/intel-ci/i915.chamelium-only.testlist
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index d18170402..17d3102bd 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -4,9 +4,9 @@ intelci_files = [
   'README',
   'i915.blocklist.txt',
   'i915.blocklist-pre-merge.txt',
-  'chamelium-only.testlist',
-  'fast-feedback.testlist',
-  'fast-feedback-chamelium-only.testlist',
+  'i915.chamelium-only.testlist',
+  'i915-fast-feedback.testlist',
+  'i915-fast-feedback-chamelium-only.testlist',
   'meta.testlist',
   'xe.blocklist.txt',
   'xe.bmg.core.blocklist.txt',
diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index da871f493..1a75d52e5 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -25,7 +25,7 @@
                     "exclude-type": "regex-ignorecase",
                     "append-value-if-not-excluded": "i915 FULL",
                     "include": [
-                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
+                        { "i915 BAT": "../intel-ci/i915-fast-feedback.testlist" }
                     ],
                     "exclude": [
                         { "all": "../intel-ci/i915.blocklist.txt" }
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index fc8766279..886870783 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -13,9 +13,9 @@
                     "append-value-if-not-excluded": "Xe FULL, i915 FULL",
                     "exclude-type": "regex-ignorecase",
                     "include": [
-                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
-                        { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
-                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
+                        { "i915 BAT": "../intel-ci/i915-fast-feedback.testlist" },
+                        { "i915 BAT chamelium": "../intel-ci/i915-fast-feedback-chamelium-only.testlist" },
+                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
 
                         { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
                         { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
-- 
2.49.0

