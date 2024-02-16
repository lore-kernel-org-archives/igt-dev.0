Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928E3C48260
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 15:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C30910E279;
	Fri, 16 Feb 2024 15:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnjwaG2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990B110E279
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708098741; x=1739634741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HF7UDu8RQH+nCI3lJPGus/zDWAeYkhKoOq8Z3JWfZh8=;
 b=fnjwaG2B0p9H/ZPQ55KhbnymIGCg2NfKBTgp9Vni6K6XokJZKSigEbDd
 ejHK0miLBqtGaCP4mUDJGWqILPpPGQYOV9D3Hiq33Yh2nmYF3vcBHvhcn
 XZiRqSJ3dzKcncL7RE3zVIC91mPxS+kCT/pnms+tOm6cKHZLFeukJe5Lq
 Xmi+3pMcxUAA/zxlTv/j3ZpUOCeuUg67LdBCnP0jtARCJTcfYa/h4n9Rd
 kIftRwg/X3JfiZeoo0Py3HrkFQExDrgzTQA5rva4Mov/uNbC2MtPcnHDm
 vWoYJLpQNlCkrEywZAVyLuT3pRMAEIxG/sKzlk0T2Tyt3VFzry5lWbrmJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2342846"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2342846"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 07:52:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="3838301"
Received: from unknown (HELO localhost) ([10.246.20.26])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 07:52:17 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1] tests/intel/i915_test_config: align JSON
 documentation with xe
Date: Fri, 16 Feb 2024 16:52:07 +0100
Message-ID: <20240216155207.67429-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

From: Jari Tahvanainen <jari.tahvanainen@intel.com>

Restructure i915 JSON to align with Xe.

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/i915_test_config.json | 45 ++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index ad59677f8..b09f4244e 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -16,33 +16,52 @@
     "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c",
                        "xe_*" ],
     "fields": {
-	"Mega feature": {
+        "Category": {
+            "_properties_": {
+                "mandatory": true,
+                "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
+            },
+            "Mega feature": {
                 "_properties_": {
                     "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
                 },
-                "Category": {
-                "_properties_": {
-                    "description": "Contains the major group for the tested functionality"
-                },
-
                 "Sub-category": {
                     "_properties_": {
-                        "description": "Contains the minor group of the functionality"
+                        "mandatory": true,
+                        "description": "Contains the technical feature/functionality"
                     },
                     "Functionality": {
                         "_properties_": {
-                            "description": "Describes the functionality to be tested"
+                            "mandatory": true,
+                            "description": "Groups page table tests on buckets containg more detailed functionality"
                         },
                         "Feature": {
                             "_properties_": {
                                 "description": "Describes the lowest level feature bucket"
-                            },
-                            "Run type": {
-                                "_properties_": {
-                                    "description": "Defines what category of testlist it belongs"
-                                }
                             }
                         }
+                    },
+                    "Run type": {
+                        "_properties_": {
+                            "mandatory": true,
+                            "description": "Defines what category of testlist it belongs",
+                            "default-testlist": "FULL",
+                            "update-from-file": {
+                                "exclude-type": "regex-ignorecase",
+                                "append-value-if-not-excluded": "i915 FULL",
+                                "include": [
+                                    { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
+                                ],
+                                "exclude": [
+                                    { "i915 BAT, 915 FULL": "../intel-ci/blacklist.txt" }
+                                ]
+                            },
+                            "order": [
+                                "boot",
+                                "__all__",
+                                "kunit"
+                            ]
+                        }
                     }
                 }
             }
-- 
2.42.0

