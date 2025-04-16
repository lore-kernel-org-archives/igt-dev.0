Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94D2C369C2
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 13:20:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E5410E913;
	Wed, 16 Apr 2025 13:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjMFbR7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400BC10E928
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 13:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744809645; x=1776345645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sxqy1XXoHWPWBRFPi9AMYrxOQ5xppmITrip6s9YbeeM=;
 b=fjMFbR7PA97rPN4E9rKKwqKjK8ag3Ncp3ghCBBUfakaOxDfxI2OaT3kU
 b3YMqNSsJp5jYDb5ZbWJ1ttsIJEGKD5ov4mGdwlhswzMOr6Btgha6M/7z
 BkG4NAl1YYvgrffoQSuP9PyUVEaRk2QNBDWWCVtxHMaHEdN0o+1mX0uhI
 7mLr4VGIWCtFz3PVWewIqS1UA1SYY0tCCbxTPVTkzo0EaFIvJV59KD52K
 k7O65MbP7d8imdkFNl+qP52N3cRwJOaFIha27UEyRatkJLSUPsP5WLQaV
 VER6Zs15njNBm0sEGB9Gno+2g36EdoB5bqgPPZizitT8dLps/t5Bw7X6N Q==;
X-CSE-ConnectionGUID: EX8dkdQNQ86m57vRTUKeUQ==
X-CSE-MsgGUID: 7Cc8QCYoRh2LIs11E1ZqKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57348822"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="57348822"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 06:20:45 -0700
X-CSE-ConnectionGUID: LTEQoK7bT1O3rGkF3NK+nQ==
X-CSE-MsgGUID: joUzO+plR4OGVu37SZQOmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130787987"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 06:20:43 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, jari.tahvanainen@intel.com,
 aditya.chauhan@intel.com, Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/test_config: Add GPU excluded
 platform definition for LNL/BMG
Date: Wed, 16 Apr 2025 18:51:28 +0530
Message-ID: <20250416132129.1363764-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416132129.1363764-1-karthik.b.s@intel.com>
References: <20250416132129.1363764-1-karthik.b.s@intel.com>
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

With config definitions added, the blocklists for LNL and BMG platform on xe
can be used used to generate platform testlists.

v2: Fix Typo.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/kms_test_config.json | 10 +++++++++-
 tests/intel/xe_test_config.json  | 12 ++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index e11c7f4fe..65d6eb07d 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -54,7 +54,15 @@
         },
 	"GPU excluded platform": {
 	    "_properties_": {
-		"description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole)."
+		"description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole).",
+		"update-from-file": {
+		    "include-type": "regex-ignorecase",
+		    "include": [
+			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
+			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
+			{ "all": "../intel-ci/xe.blocklist.txt" }
+		    ]
+		}
 	    }
 	},
         "Description": {
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 4556025f7..eb0a7d905 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -71,8 +71,16 @@
         },
         "GPU excluded platform": {
             "_properties_": {
-                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a hole)."
-            }
+                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole).",
+		"update-from-file": {
+		    "include-type": "regex-ignorecase",
+		    "include": [
+			{ "LNL": "../intel-ci/xe.lnl.core.blocklist.txt" },
+			{ "BMG": "../intel-ci/xe.bmg.core.blocklist.txt" },
+			{ "all": "../intel-ci/xe.blocklist.txt" }
+		    ]
+		}
+	    }
         },
         "GPU requirement": {
             "_properties_": {
-- 
2.43.0

