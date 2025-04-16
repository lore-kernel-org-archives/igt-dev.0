Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E42CC369C4
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 10:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D365310E8C6;
	Wed, 16 Apr 2025 10:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OISMk/8y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4C310E8C6
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744799265; x=1776335265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/VkXowmub4pn02BnfWx1minWMSJvMAhxzakidKV0xq4=;
 b=OISMk/8y9LyhMiyr1rqaOE+yPz7+43XEEW+dwQZWanyU7KSXth3BavlO
 b6a7M/sz5loXhxfLCXSIqoB0m4NjAv+qW1VMAKWP8L7CwayB/vVmgpwlW
 Qx/nWW0IZ05DrLtnhAFD1oKhqpaNAiboFr4CO6NsaAANpYpTvfcwBBIAM
 ABQnPm1zXy+pMvEbJg/D4sfEoJtUawQkYqwn3DYaDq0TKVD2weJCHfqDp
 V2ZNCYSw250r9iSHV6VpQ+4XONycqpuTa84iftOL2l/yxZaWiKO2cNaP/
 il5sCEfiFyi0jxeFMJzJn9CvjrRsX0ppSeKQi75sTX3LEMzoOc+omJYno w==;
X-CSE-ConnectionGUID: 8A9H+4SYQcijLxA6EaD9sQ==
X-CSE-MsgGUID: nhIbMBafRUKQKJHz57FD6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46229319"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46229319"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:27:45 -0700
X-CSE-ConnectionGUID: h1L9hRs6TEyur7hdx8Ytmw==
X-CSE-MsgGUID: WaH52xIPRSmFrO2V0d8Q4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="131334173"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:27:43 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, jari.tahvanainen@intel.com,
 aditya.chauhan@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/test_config: Add GPU excluded platform
 definition for LNL/BMG
Date: Wed, 16 Apr 2025 15:58:06 +0530
Message-ID: <20250416102806.1362020-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416102806.1362020-1-karthik.b.s@intel.com>
References: <20250416102806.1362020-1-karthik.b.s@intel.com>
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

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
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
index 4556025f7..446d59a95 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -71,8 +71,16 @@
         },
         "GPU excluded platform": {
             "_properties_": {
-                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a hole)."
-            }
+                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a hole).",
+		"update-from-file": {
+		    "include-type": "regex-ignorecase",
+		    "include": [
+			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
+			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
+			{ "all": "../intel-ci/xe.blocklist.txt" }
+		    ]
+		}
+	    }
         },
         "GPU requirement": {
             "_properties_": {
-- 
2.43.0

