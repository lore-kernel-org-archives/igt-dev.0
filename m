Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC8A1067045
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFB910E02C;
	Thu, 12 Mar 2026 15:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMyeBNmj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE7310EA53
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773329136; x=1804865136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uqb2IQv+xej20RCLriaIOo3GX5XexuTs1EPgv5Q1WQ8=;
 b=fMyeBNmjsgjZ/dHosZ/NjLo3pPvySoBsdz/CBYmQZ70qwbVBhspT3JgA
 4wMqfQ4ctsZXM/ZyitHQJvGSDOrlo/yHx+hkzLNTqZ6vmpp2nY+S3aig/
 iU6SjREUjROt/6myWtoIPZAR3YhFwNabB7AZL8ptBb2Dhig6Vcln7DXKd
 b1YZ/oVcVWNKyllvMdSlAV7EB/7rcO/g4IPTtoo4LfIs3Y3N6x6c4fidi
 x4H2Zm0mLlyBAPIUk09AtAfeEN8VLTf6vKUVlfxV6TGp7DeGxMbQCQi39
 YdB4mNwxz4UM7eAqEDBZ//E0XUufLqs78grkSw+qVzKwbAb1c7Xht7lFV Q==;
X-CSE-ConnectionGUID: qymKmWhJRsqQb+tLQ7dZzQ==
X-CSE-MsgGUID: fBB/Zq+/SH+WfVGYfyecBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85902417"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85902417"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:36 -0700
X-CSE-ConnectionGUID: 62+tKTc0Q12xpWObEvufcg==
X-CSE-MsgGUID: zg8cpcGJS/ad1KneEh72xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225297259"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:34 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v2 2/5] intel: Add Xe FULL chamelium run type to
 kms_test_config
Date: Thu, 12 Mar 2026 20:52:30 +0530
Message-ID: <20260312152233.3280893-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260312152233.3280893-1-mohammed.bilal@intel.com>
References: <20260312152233.3280893-1-mohammed.bilal@intel.com>
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

