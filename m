Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B7AC83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 15:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B161A10E696;
	Tue,  8 Jul 2025 15:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnoORShf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C167E10E696
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751988512; x=1783524512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GKxH5byt2BK1WjTFdXAJ9ID0zbCqHReDJatzSxVO4p4=;
 b=ZnoORShfob7Evqxw9CRZPiJWm1vJAr2cO6ubuQPN3hpgEfKPcL6F2sCj
 SZfhrYnIn2A7TOaCfy67FzfwcASIs5aDrPIPp0Tj5i9E7MsUALdTaYwGj
 md/OaHm6BB8gDo9mtON717NvsQDk9Nv5M0jbPQloz3yO4Fi0yQt0C4pUY
 igebs+Hti2r4vLjqrnYx+KUR27NnFGtrlv57jfbCInigGf5x3Y9l2ONhE
 eb1gVz1BuPYQKlR6CwOz7griwm9kI4i4sqkpL705WzzbT17cUdATlgY8D
 +ogFVMuY67Bjnt8YVSCt+tF0iZObfHtXGxzGDDJpl2xFYatQ6JMR0W2QH w==;
X-CSE-ConnectionGUID: FBPNHkbjRRW+bO/hj6K1CQ==
X-CSE-MsgGUID: u/q5lTLpRjujwtBEVXArsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53947180"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="53947180"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:28:32 -0700
X-CSE-ConnectionGUID: TdpRZmCFSbuSE/w5Z3VrkQ==
X-CSE-MsgGUID: 2RSTBjQ/Qt6eXjY9lU0eOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="154937692"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:28:31 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v4 4/5] intel-ci: rename i915 testlists
Date: Tue,  8 Jul 2025 17:28:07 +0200
Message-ID: <20250708152808.59977-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
References: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
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

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
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
index d18170402..3d436dc08 100644
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
2.49.0

