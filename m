Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDBDC8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 16:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9307E10E4E0;
	Mon,  7 Jul 2025 16:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auEAM21+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAC410E4E0
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751905444; x=1783441444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MGDxPsrURrLWOJX9RebOnNZTiZC2y4yxz2Ye42hN640=;
 b=auEAM21+MMmH8iKu7ouUYbAbgmaBJQyZU/26kdEOt6aEvr887OJqY8Sv
 J2azgNlAqokDQUhRVCCnE/k4yQR6fUPa7Ykeu1HGcSgaDfFQ3+Nhn4fAi
 iH5tzJPpwFo1IySk75FyiMSIfiTfTCImPUt1g483JqK3wPr45ZPDEd21Z
 aqzeo8p68myhTFQ17hs+3cqmAB2NdlBiatF9sZJBslHvIWdbxmbH0m6+f
 ZEu759++jwMzhHXwIM0pZdOiEheCUgnBqAj2lETt2XM4VoDsY5ixR6aKA
 t6ApM6kMJhBz5po0wTxTNHpVvd0vMQkOi55UIjdj4tz1cHiWy8kHHwDkS w==;
X-CSE-ConnectionGUID: /GtS6xPQRtKwx5fpX04RAA==
X-CSE-MsgGUID: amqjvl0GRs6fLHk3ndWEsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76680647"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="76680647"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:24:04 -0700
X-CSE-ConnectionGUID: RSMOG75YRgK9aV+LXsNfTw==
X-CSE-MsgGUID: ikx15++PRp68/b147c3q1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="178916163"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.98])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:24:03 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 4/5] intel-ci: rename i915 testlists
Date: Mon,  7 Jul 2025 18:23:39 +0200
Message-ID: <20250707162340.258267-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707162340.258267-1-kamil.konieczny@linux.intel.com>
References: <20250707162340.258267-1-kamil.konieczny@linux.intel.com>
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

