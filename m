Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1233BC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 08:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C3911A2CA;
	Thu, 25 Apr 2024 08:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/spJZaR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B204611A2CB
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714035128; x=1745571128;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=MCkpZG+kGYZPN/JkusuaZfPLgnDE32RmMuppNWks1OQ=;
 b=k/spJZaRYXRXJJOgvCgDkOmV6qyGDHyQ0cNsQEUgXWZCoj5s/HFypmeO
 Ey6JheEjpfiaygL+N2Ro3izz7NYSB0zzTKfaVRIgqUeyr1Zs7mgS83zO8
 OgYjm6plCWRwWaJ0BnkjrgGnRrife9PmphtzS0Dz0f2WnV+95ceGgw8mG
 h2chrVzCEklzRC94AnkW1MjgVzneLUJXDMvVvm/HE0RpYy1dfNwcf3QgW
 FQO+ltLF2IjbOnbfeCxhNIUcpGuoyeU/CUPpYYliX9zEnvzOHU1lmrNS2
 7Onul78k3ZKC6L9IOnofNamB9/XPJaJlKTolLYNF0jnq5E6tiVYMBDUn/ g==;
X-CSE-ConnectionGUID: FY2d4PbgRpGPHVao5IeRlA==
X-CSE-MsgGUID: FiWskUO1QySJtuS3eh6UgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9576284"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9576284"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 01:52:07 -0700
X-CSE-ConnectionGUID: F11Kf6EZSLOgPrIdDnmMcQ==
X-CSE-MsgGUID: E9K58z+MRgOTChQb6mRQhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="29486142"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 01:52:07 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 99AC5206D89E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 01:52:06 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rzupo-00000000b1N-2XQZ for igt-dev@lists.freedesktop.org;
 Thu, 25 Apr 2024 10:52:04 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/*.json: remove some uneeded whitespaces
Date: Thu, 25 Apr 2024 10:49:23 +0200
Message-ID: <20240425085203.142195-3-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425085203.142195-1-mauro.chehab@linux.intel.com>
References: <20240425085203.142195-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

To make the file more uniform, remove some extra whitespaces
after a couple of field names at those files.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/i915_test_config.json | 4 ++--
 tests/intel/kms_test_config.json  | 2 +-
 tests/intel/xe_test_config.json   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index f51ae2a55bdd..26e47215248d 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -91,7 +91,7 @@
                 "description": "Describes any GPU-specific requrirement, like requiring multi-tiles."
             }
         },
-        "Depends on" : {
+        "Depends on": {
             "_properties_": {
                 "description": "List other subtests that are required to not be skipped before calling this one."
             }
@@ -101,7 +101,7 @@
                 "description": "Point to known missing features at the test or subtest."
             }
         },
-        "Description" : {
+        "Description": {
             "_properties_": {
                 "description": "Provides a description for the test/subtest."
             }
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 5c8db82dfc73..bca3b250fffb 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -52,7 +52,7 @@
                 "description": "Defines the test category. Usually used at subtest level."
             }
         },
-        "Description" : {
+        "Description": {
             "_properties_": {
                 "description": "Provides a description for the test/subtest."
             }
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index f8888341475a..3775e63fc65e 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -79,7 +79,7 @@
                 "description": "Describes any GPU-specific requrirement, like requiring multi-tiles."
             }
         },
-        "Depends on" : {
+        "Depends on": {
             "_properties_": {
                 "description": "List other subtests that are required to not be skipped before calling this one."
             }
@@ -89,7 +89,7 @@
                 "description": "Point to known missing features at the test or subtest."
             }
         },
-        "Description" : {
+        "Description": {
             "_properties_": {
                 "mandatory": true,
                 "description": "Provides a description for the test/subtest."
-- 
2.44.0

