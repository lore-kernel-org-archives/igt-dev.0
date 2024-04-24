Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2879CC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 08:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACEE1138DB;
	Wed, 24 Apr 2024 08:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFMY/Y1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67C71138DB
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 08:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713945963; x=1745481963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ro0OLdbiAZBJ6FzLKP1CPp8SHLKgD6UIj+Tt+8FNxZk=;
 b=NFMY/Y1m/ED3mxIMuaYr8S6jCHvzG58eQALbP4xqqO3yf07dZj/zy86O
 iE2l+yGXodGZt4xzGPkyTEqOPnbkfkLad+KnUike16evxGZbL6y4ismMM
 NpInjuci0vsgiqTbCOq2Q+DSLuFI1azx+hkW19M+LY3+e71p9Cu2KryL1
 rkFrWBvNhEWJez/f9ag9ZwjOQ7STZnaKWjrailKQMzKiKocgbX2u+/6GX
 I62sh6UZteAJXy3SUajZ1W2L0ILSd943gowzXxglNWZuOYo4CCPriDIX0
 510XUaSdhpWPrCT4w6ils1OojqC997Cpr3JRKS/yi/ZtF4Fty1buCZv9I w==;
X-CSE-ConnectionGUID: ygHlw4DBQnW8y/FCyy+UOg==
X-CSE-MsgGUID: laf4DxVARciOlEioOO+45Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9727167"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9727167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:06:03 -0700
X-CSE-ConnectionGUID: K1xPbHmoSk6wSRtX/iWoSA==
X-CSE-MsgGUID: xLQEO+gnRayO92JaNvcZGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="29096852"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:06:01 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v3 2/3] tests/intel: Put "Run type" highest in KMS
 documentation hierarchy
Date: Wed, 24 Apr 2024 08:05:32 +0000
Message-Id: <20240424080533.3611723-3-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424080533.3611723-1-katarzyna.piecielska@intel.com>
References: <20240424080533.3611723-1-katarzyna.piecielska@intel.com>
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

Let's put "Run type" at highest place in KMS documentation hierarchy. It
will be reflected in html generated documentation.

v2: move only required fields under 'Run type'

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/kms_test_config.json | 56 ++++++++++++++++----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index f3f6bfad6..7c37c831b 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -6,39 +6,39 @@
     "exclude_files": [ "../chamelium/kms_chamelium_helper.c", "../kms_color_helper.c",
                        "kms_dsc_helper.c" ],
     "fields": {
-        "Category": {
+        "Run type": {
             "_properties_": {
-                "description": "Contains the major group for the tested functionality 'Display'"
-            },
-            "Mega feature": {
-                "_properties_": {
-                    "description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
-                },
-                "Functionality": {
-                    "_properties_": {
-                        "description": "Groups tests on buckets containg more detailed functionality"
-                    }
-                }
-            },
-            "Run type": {
-                "_properties_": {
-                    "description": "Defines what category of testlist it belongs",
-                    "update-from-file": {
-                        "append-value-if-not-excluded": "Xe FULL, i915 FULL",
-                        "exclude-type": "regex-ignorecase",
-                        "include": [
-                            { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
-                            { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
-                            { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
+                "description": "Defines what category of testlist it belongs",
+                "update-from-file": {
+                    "append-value-if-not-excluded": "Xe FULL, i915 FULL",
+                    "exclude-type": "regex-ignorecase",
+                    "include": [
+                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
+                        { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
+                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
 
-                            { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
-                            { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
-                        ],
-                        "exclude": [
-                            { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/blacklist.txt" },
+                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
+                        { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
+                    ],
+                    "exclude": [
+                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/blacklist.txt" },
                             { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
                         ]
                     }
+                },
+            "Category": {
+                "_properties_": {
+                    "description": "Contains the major group for the tested functionality 'Display'"
+                },
+                "Mega feature": {
+                    "_properties_": {
+                        "description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
+                    },
+                    "Functionality": {
+                        "_properties_": {
+                            "description": "Groups tests on buckets containg more detailed functionality"
+                        }
+                    }
                 }
             }
         },
-- 
2.34.1

