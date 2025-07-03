Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191A4C77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 09:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB3510E1BC;
	Thu,  3 Jul 2025 09:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcZe3AI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF88210E1BC
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 09:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751535092; x=1783071092;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tCXFw5p8Aax6OcKCYKEvE+dkhliCyyWKsk7iTryEuHQ=;
 b=GcZe3AI3unUdMRENNp5KsrCg0SOTk9M7BXVC3/pp4pVjDAdIp+dOpU2h
 2oqzsfkTvJEnycAGeTX3YpTeL8c6Xe07oPV1MDGwi4QY1Gd9olDKEnOfm
 cG7nh70J0Z88CKf4EoMGYwEeX8recr4UohAbS6U3sQsh3xl3/rAMDOXg6
 fILDsYv1Si6+K6b7jjuhTpgY3N9xPJhyDdOvI+xVvbcVe/Tp2b5geUfh8
 ILm1BhLFaXuFpE5rrUezFKrq8HbAdDZ4eYbDkVoMGbtRECM012Qc8LaUJ
 oVdaY05kc3+WPSgFah9CpDSomZoSsnJ4FAPLyzrM69X4k9dcM69aHKtKe Q==;
X-CSE-ConnectionGUID: k+h6NnptTDGJa/40ab8kdQ==
X-CSE-MsgGUID: hiD37r5qRPazPbj7bORzUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65308328"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="65308328"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 02:31:31 -0700
X-CSE-ConnectionGUID: 7M97ZZDZTo2iEiQwdIDw9A==
X-CSE-MsgGUID: T+2bmsccQZ2Ukqj/O0wAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="155065801"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 02:31:30 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, jari.tahvanainen@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/intel/test_config: Add GPU excluded platform
 definition for i915
Date: Thu,  3 Jul 2025 15:01:32 +0530
Message-ID: <20250703093133.896448-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

With config definitions added, the blocklists for i915 can be used to
generate platform testlists.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
---
 tests/intel/i915_test_config.json | 8 +++++++-
 tests/intel/kms_test_config.json  | 3 ++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index 04bf1fa68..7437dda1b 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -83,7 +83,13 @@
         },
         "GPU excluded platform": {
             "_properties_": {
-                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole)."
+                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a hole).",
+                "update-from-file": {
+                    "include-type": "regex-ignorecase",
+                    "include": [
+                        { "all": "../intel-ci/blacklist.txt" }
+                    ]
+                }
             }
         },
         "GPU requirement": {
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 65d6eb07d..0b6fc36e8 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -60,7 +60,8 @@
 		    "include": [
 			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
 			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
-			{ "all": "../intel-ci/xe.blocklist.txt" }
+			{ "LNL, BMG": "../intel-ci/xe.blocklist.txt" },
+			{ "ADLP, ADLS, DG2, MTL": "../intel-ci/blacklist.txt" }
 		    ]
 		}
 	    }
-- 
2.43.0

