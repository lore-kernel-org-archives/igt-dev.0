Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85BF1067041
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAE410EA3E;
	Thu, 12 Mar 2026 15:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+lq20bX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B707710EA3E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773328311; x=1804864311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uqb2IQv+xej20RCLriaIOo3GX5XexuTs1EPgv5Q1WQ8=;
 b=k+lq20bXLRtJH5e3RxJu2tw3dIcn0WCXmymBdf/ljD1ZxEmw7oRPCm0T
 Xl2ynLszKfyTys47q+ciGP7EYZVLqi60CXEIIJlxoF34PLyDFh+m6IN5H
 Icg6NBzQO5q031X6OB2LiiyQGq33Ezfr3yqhWZgzMfmiXmUQT1ZtBHnJl
 VKRKq/XErcuitZ6cFlqrvYR1D2k1j7qrqH0xnQleUEmxZfDhRBpE5TFjZ
 anF4dXMJczru24rigt/k5WB6lM9RCZs+jLhWbbAVPFGAIa6w3/kJfeWdb
 bqTQ/h7eJvpA2uN+iOxtCUg6blufMWSBAMGF5gGHRq6qj8KDmQE5REuw6 Q==;
X-CSE-ConnectionGUID: cbcLRYTsTdu215Dpek0SZA==
X-CSE-MsgGUID: u3LUFxPYT1CbgIgYMz5NPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="61997651"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="61997651"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:11:51 -0700
X-CSE-ConnectionGUID: EsTbNc0URHykdHrj1NoFPg==
X-CSE-MsgGUID: JbZ/SxanSYOWF1AbITSu+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="258772022"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:11:50 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 2/5] intel: Add Xe FULL chamelium run type to
 kms_test_config
Date: Thu, 12 Mar 2026 20:38:58 +0530
Message-ID: <20260312150901.3272265-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260312150901.3272265-1-mohammed.bilal@intel.com>
References: <20260312150901.3272265-1-mohammed.bilal@intel.com>
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

Add Xe FULL chamelium include mapping pointing to the shared
chamelium-only.testlist and update exclude labels to apply
xe.blocklist.txt to the new run type. Also rename i915 chamelium
to i915 FULL chamelium for consistency.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel/kms_test_config.json | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 61a70a9bb..7eab10b04 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -15,14 +15,15 @@
                     "include": [
                         { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
                         { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
-                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
+                        { "i915 FULL chamelium": "../intel-ci/chamelium-only.testlist" },
 
                         { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
-                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
+                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" },
+                        { "Xe FULL chamelium": "../intel-ci/chamelium-only.testlist" }
                     ],
                     "exclude": [
-                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
-                            { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
+                        { "i915 BAT, i915 BAT chamelium, i915 FULL chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
+                            { "Xe BAT, Xe BAT chamelium, Xe FULL chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
                     ]
                 }
             },
-- 
2.48.1

