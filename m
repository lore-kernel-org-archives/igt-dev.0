Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE12C36005
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 06:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3356E10E37D;
	Mon, 28 Apr 2025 06:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZUXtK3v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C2E10E382
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 06:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745821196; x=1777357196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vhe/5/Offp1ENYF68NL/tuxXt4PqRH9uHWIHI9xVrGM=;
 b=HZUXtK3vCx3Pu7KhLOGnSYRxzgvMNa3MSxmHT3P/CgmKcBAzMgv6QsbI
 50RYMad4bp+qNYXO+1e484EUNV8jRutMNBOMW/bWGpCarbs8Rt8NQ/qxm
 ncw3q/tTeTuVZyEobcZVZe1REMg/4FvmZL9RLkA89yY+yOpDzqxKo5AC8
 z5usTeuDsKJ4LTt98C2KCQyAmvsxQqaFucDEQcvWKlQuAXPG0+x4qLknS
 A6Wwk7WIBd30JsI4eIP62R/PqcZZxO6TnOE16j5xZbenIYgh104hg3wei
 BXDNLMBBFf1VpqLbECb/WAZU7ZJ5pOtJyfcJ1DtpVo9YNF4ik0zv7VKdZ Q==;
X-CSE-ConnectionGUID: qsO+N67DTB6n9jlV5tgvAQ==
X-CSE-MsgGUID: tkKM8kd7QOir0yiMJkXUkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47284180"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47284180"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:19:56 -0700
X-CSE-ConnectionGUID: +81N5xe0SZW9kMyKyer+cg==
X-CSE-MsgGUID: z5GMUabySV2CgAoQTXXxzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133911125"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 23:19:53 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, jari.tahvanainen@intel.com,
 aditya.chauhan@intel.com, jan.sokolowski@intel.com,
 Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/intel/test_config: Add GPU excluded
 platform definition for LNL/BMG
Date: Mon, 28 Apr 2025 11:49:39 +0530
Message-ID: <20250428061940.86004-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428061940.86004-1-karthik.b.s@intel.com>
References: <20250428061940.86004-1-karthik.b.s@intel.com>
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

v3: Rebase.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
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
index b33485c96..b3393a89e 100644
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

