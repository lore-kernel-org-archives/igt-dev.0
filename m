Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C97BC83F03
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 14:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA77010E857;
	Thu,  3 Jul 2025 14:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKhxUIYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7456B10E862
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 14:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751551334; x=1783087334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e7Jlbpafm3XcZzWiU3mERMNlewDLKaajipQ5NhfTmJ4=;
 b=mKhxUIYFnHD3SlIoNbFIKJUv3OWVMeE5rJmxrgBXUitwt1WP2LIILACY
 mQqh7s0H9KpCG2o3bVNLHUnjN63Fj+3ZuuJ+Dt5juGxTIdmFy2dj3+7Jq
 AyymE+69d5F1CsZADFrMyj7nnriZiZWxIJLLm67OLNrpObJCRqBFL/lv7
 W7j0FNOpAB6Smr+Esa+k/C7B0jvwzCJBUvSi5kELFxOMwdKURaVSyc732
 1/k/jB4P+V4iOgT8vIzXYxX0dMhA5K1oKhnisJ3URBgdsU25lOdBAosGp
 FgOuKPv868Kbvc8tZMsHEojPMc7dpxxOIvOaUTlZf3vxZSmco8nmGn07W A==;
X-CSE-ConnectionGUID: aYdmSUEiT3OuPJBUWdbByA==
X-CSE-MsgGUID: PFSwZBqGTAGooF5ufDLZJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53974714"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53974714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:02:14 -0700
X-CSE-ConnectionGUID: sN5W9Bz/QjWBa5WtA85igQ==
X-CSE-MsgGUID: YBHYtY2MTkeZtdshsPrxXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="154145957"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.120])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:02:14 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/2] intel-ci: rename i915 testlists
Date: Thu,  3 Jul 2025 16:01:58 +0200
Message-ID: <20250703140158.136166-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703140158.136166-1-kamil.konieczny@linux.intel.com>
References: <20250703140158.136166-1-kamil.konieczny@linux.intel.com>
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
index f77a4d46b..007b374c5 100644
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
index c13a5e0d3..d6b5ee21f 100644
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

