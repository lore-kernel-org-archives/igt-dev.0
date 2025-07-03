Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A49C77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 09:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C0610E199;
	Thu,  3 Jul 2025 09:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSlAFwvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A771E10E199
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 09:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751535670; x=1783071670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dQ9QrGyAkO+Jt6C/VscQMdgT73HNVisoVW8eGbtGlok=;
 b=kSlAFwvBBntOImvVUY7m+yYhaPsf4sIxx88FR4iJ1Xa58mBU2cNvbvv6
 fu4PwOvtFWC60eNAkqlXqJqsKJZZosiZLPi2IyMbEetJyKFiKSF+k5Un9
 Dt3PzQUJ08rF94Z8z3zrNj9uiCbgaD3L5MsQkYzWlru8ch4X2yMewMeyY
 Ww6hQ+nEZJ9Vyys+MtbniHB/HaLYzACyGlWXP8EW189I18D9qxAeV+SsZ
 F16UJ1EYKKi1FqSJWdQqASM5Fu3ORrUKH8MaeIrQRLIW5Yd2cI2rkH+vK
 N/8p4ABvcyaMT+/cov6K7HB/loyO2fP6s38OHaFXGrzRBFGLordybz/jU Q==;
X-CSE-ConnectionGUID: CYmeROocSMS2z8IGG9HC4A==
X-CSE-MsgGUID: FHwrl/41T2yEiGgkOmkZ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64451596"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="64451596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 02:41:10 -0700
X-CSE-ConnectionGUID: VzW+nTyIQMSMNLviXH/xyA==
X-CSE-MsgGUID: DMiOf/bqQHeDnhwhOjdfww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154399238"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 02:41:08 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, jari.tahvanainen@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/test_config: Add GPU excluded platform
 definition for i915
Date: Thu,  3 Jul 2025 15:11:11 +0530
Message-ID: <20250703094111.896703-1-karthik.b.s@intel.com>
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

v2: Fix Typo.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
---
 tests/intel/i915_test_config.json | 8 +++++++-
 tests/intel/kms_test_config.json  | 3 ++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index 04bf1fa68..e53f9400b 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -83,7 +83,13 @@
         },
         "GPU excluded platform": {
             "_properties_": {
-                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole)."
+                "description": "Provides a list of GPUs not capable of running the subtest (or the test as a whole).",
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

