Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A471C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 09:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94C2113278;
	Tue, 23 Apr 2024 09:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icUT0USO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A9B113277
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 09:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713866047; x=1745402047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fcERp4l8XTvZqbW8GOpqqj4Tjno1a5o18Bpg9yeelMY=;
 b=icUT0USOrh1C0dKYKkYWCu3kPgGARtMEHUcqLZyUit6u5B97SFP/Hgqy
 6MeuYTlWADnEFqY5j0I+oAqzyHhGMr8a9dnmSsBchmmdgJDKoVcMJy7YJ
 /eIKCxRq/Aix3xTJfIElz9nsRAttGXLwRbxWebw6Quo+OqwHD1xQgleYA
 iwg45IivVLpzkKprqFOYYKAY/ohkUN1o+gjC45xG7sDg9rID6VRMy2QPK
 uh/Sf0Y5rVwzKQQ29C95MoBGZb0OiRgablXdE6NW3tdylapi0tdjGHd9g
 Dvv13eVZWxZ+dQt106BYVXXDmsan5aSxHpxtio2drxB4VCS9RQk0NymZa g==;
X-CSE-ConnectionGUID: qdiqphseRAymYGZxWr5G3A==
X-CSE-MsgGUID: HNZyFEDyQ1eRRMoieJeJDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9306083"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9306083"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:54:07 -0700
X-CSE-ConnectionGUID: ubyRx0J5SlWtrQY8XoTrmA==
X-CSE-MsgGUID: LFsTepSrT3K2UlWhokbNGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24322557"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 02:54:05 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/intel: Put "Run type" highest in Xe
 documentation hierarchy
Date: Tue, 23 Apr 2024 09:53:42 +0000
Message-Id: <20240423095344.3518545-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423095344.3518545-1-katarzyna.piecielska@intel.com>
References: <20240423095344.3518545-1-katarzyna.piecielska@intel.com>
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

Let's put "Run type" at highest place in Xe documentation hierarchy. It
will be reflected in html generated documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/xe_test_config.json | 66 ++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 22b43ffac..f88883414 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -4,51 +4,51 @@
     "drivers": [ "xe" ],
     "files": [ "xe_*.c", "../core_hotunplug.c", "../sriov_basic.c", "intel_hwmon.c" ],
     "fields": {
-        "Category": {
+        "Run type": {
             "_properties_": {
                 "mandatory": true,
-                "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
+                "description": "Defines what category of testlist it belongs",
+                "default-testlist": "FULL",
+                "update-from-file": {
+                    "exclude-type": "regex-ignorecase",
+                    "append-value-if-not-excluded": "Xe FULL",
+                    "include": [
+                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
+                    ],
+                    "exclude": [
+                        { "Xe BAT, Xe FULL": "../intel-ci/xe.blocklist.txt" }
+                    ]
+                },
+                "order": [
+                    "boot",
+                    "__all__",
+                    "kunit"
+                ]
             },
-            "Mega feature": {
+            "Category": {
                 "_properties_": {
-                    "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
+                    "mandatory": true,
+                    "description": "Contains the major group for the tested functionality, being hardware, software or firmware"
                 },
-                "Sub-category": {
+                "Mega feature": {
                     "_properties_": {
-                        "mandatory": true,
-                        "description": "Contains the the technical feature/functionality"
+                        "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
                     },
-                    "Functionality": {
+                    "Sub-category": {
                         "_properties_": {
                             "mandatory": true,
-                            "description": "Groups page table tests on buckets containg more detailed functionality"
+                            "description": "Contains the technical feature/functionality"
                         },
-                        "Feature": {
+                        "Functionality": {
                             "_properties_": {
-                                "description": "Describes the lowest level feature bucket"
-                            }
-                        }
-                    },
-                    "Run type": {
-                        "_properties_": {
-                            "mandatory": true,
-                            "description": "Defines what category of testlist it belongs",
-                            "default-testlist": "FULL",
-                            "update-from-file": {
-                                "exclude-type": "regex-ignorecase",
-                                "append-value-if-not-excluded": "Xe FULL",
-                                "include": [
-                                    { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" }
-                                ],
-                                "exclude": [
-                                    { "Xe BAT, Xe FULL": "../intel-ci/xe.blocklist.txt" }
-                                ]
+                                "mandatory": true,
+                                "description": "Groups page table tests on buckets containg more detailed functionality"
                             },
-                            "order": [
-                                "boot",
-                                "__all__",
-                                "kunit"
-                            ]
+                            "Feature": {
+                                "_properties_": {
+                                    "description": "Describes the lowest level feature bucket"
+                                }
+                            }
                         }
                     }
                 }
-- 
2.34.1

