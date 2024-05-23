Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20883C25B7D
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 15:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966F510EF62;
	Thu, 23 May 2024 15:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJ68GjVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2D310EEF9
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 15:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716477477; x=1748013477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1iCey8i02Ia6x0E4cCdEpSm2C+ylWMLNhbJdt0rYn2w=;
 b=IJ68GjVKFucFHniA+xyDDt8aPUmYD6oxuCQcENhTAu/ZXq3LjSH+Y4/O
 InSg1ykM/VJSdkKWhtTmrkTEf2kSnJF5xYGMhTxPzcbuUy7n0p7d5Vmzp
 iH0Fl8/Be60Ok8yJ8U9Brs4FyxCclDPR7ldIVOZjWNiVuzhOF2RXm5G4c
 l9AmhDOgn6yM0+i5y9UQMubAdtN+g/CNNMVwl4WNAqjTZyD4UzUdhJLve
 7ob+csBPU+d8WL9iCqfuuKrPgQzQA9ZeyjadMmkVObPnI9CNAA0tkzDhU
 GeohqpJxIWiWKpjrUkRSoQzA/hLSYEmSytg9X/NAVun7PX2ZMy6y5awfh A==;
X-CSE-ConnectionGUID: RKhOAH/uRfqpmICWWX2N+A==
X-CSE-MsgGUID: 0T7432TaQQmeIeP5pOGx+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="35316753"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="35316753"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:17:56 -0700
X-CSE-ConnectionGUID: U3YskLxaSMKn3stjMq+pIA==
X-CSE-MsgGUID: XgaBmo2JSK2nFM0HcwACpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="33712151"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:17:53 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/intel: Make Mega feature field mandatory
 in test documentation
Date: Thu, 23 May 2024 15:17:28 +0000
Message-Id: <20240523151729.877971-3-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523151729.877971-1-katarzyna.piecielska@intel.com>
References: <20240523151729.877971-1-katarzyna.piecielska@intel.com>
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

Once we have Mega feature in place for Core tests, let's make it
mandatory, so every new test has full needed documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/i915_test_config.json | 1 +
 tests/intel/xe_test_config.json   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index 3b3afb2fd..1a1c1aafa 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -43,6 +43,7 @@
                 },
                 "Mega feature": {
                     "_properties_": {
+                        "mandatory": true,
                         "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
                     },
                     "Sub-category": {
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 89c6c7ef6..4556025f7 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -31,6 +31,7 @@
                 },
                 "Mega feature": {
                     "_properties_": {
+                        "mandatory": true,
                         "description": "Contains the mega feature for end to end use case, e. g. the 'sellable' feature."
                     },
                     "Sub-category": {
-- 
2.34.1

