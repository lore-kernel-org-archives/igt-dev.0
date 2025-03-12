Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522FFC35FF1
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 09:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5696A10E0A6;
	Wed, 12 Mar 2025 09:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fO17/jTk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C25D10E05F
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741771299; x=1773307299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5+JLwgGKB/utrIihFqwfYV5Bt5q7SUst3l57LaYOXK8=;
 b=fO17/jTk6qAKXsSSkBmVtE3BnM0hHDQzdgyPRiwp/WgxL5aQVWbAqjpK
 2AO8Js2Fk6pctlVJ6VmSr+6N7fq4dNW383eN1oqrK8DMherTZewwxvHQv
 dBpuboBKRhMNv9f289woHq8TWPI3LPjQc6r7z2HEHPSER0b+ToWC7uO6b
 l/Qe+LlPTEM/6vw86/giDl44Xg8X5ibph/AEBfY99d75ANorw0tyWRyEh
 13TamF2Xsol8U1hY0PgKtYm3TuxXJcFUFEYi6mr4n+P+NJ5mncc28laio
 7wPX+6XkC6mzmCwF8VC0Thbocz8iBpMYexJIOOgqe9onUQ4ovUTnOE9lD g==;
X-CSE-ConnectionGUID: 1QMlIN8pTSSDPRoCUlPgJg==
X-CSE-MsgGUID: pX61sfWtSGmHrT48+UuC1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42564866"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="42564866"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:21:35 -0700
X-CSE-ConnectionGUID: kakUheYuSBOgCtPu30MJdw==
X-CSE-MsgGUID: +H2TJXtLR2qS0PD5DGonjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125643819"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:21:34 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_test_config: Add mandatory fields
Date: Wed, 12 Mar 2025 14:56:54 +0530
Message-Id: <20250312092654.567154-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250312092654.567154-1-swati2.sharma@intel.com>
References: <20250312092654.567154-1-swati2.sharma@intel.com>
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

To maintain consistency across all KMS test documentation, lets
make few fields mandatory.
Let's follow the following pattern

	/**
	  * TEST: <test name>
	  * Category: Display
	  * Description: <test description>
	  * Driver requirement: <i915/xe/i915, xe>
	  * Mega feature: <mega feature name>
	  *
	  * SUBTEST: <subtest name>
	  * Description: <subtest description>
	 */
TODO: Upstream documentation for mega feature

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_test_config.json | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index e11c7f4fe..aeb16a94b 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -28,10 +28,12 @@
             },
             "Category": {
                 "_properties_": {
+		    "mandatory": true,
                     "description": "Contains the major group for the tested functionality 'Display'"
                 },
                 "Mega feature": {
                     "_properties_": {
+			"mandatory": true,
                         "description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
                     },
                     "Functionality": {
@@ -44,6 +46,7 @@
         },
         "Driver requirement": {
             "_properties_": {
+		"mandatory": true,
                 "description": "Describes any Driver specific requrirement, like i915/xe."
             }
         },
@@ -59,6 +62,7 @@
 	},
         "Description": {
             "_properties_": {
+		"mandatory": true,
                 "description": "Provides a description for the test/subtest."
             }
         }
-- 
2.25.1

