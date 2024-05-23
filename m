Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE11BC25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 09:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6FA10E388;
	Thu, 23 May 2024 09:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmyaOvC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D3D10E388
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716457857; x=1747993857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C+vwslCWxEug7hZp4Xc2FEEHDBG1MfodTBKlo4ix8QI=;
 b=fmyaOvC14UCkUgKwNYYjk8+qpzfdNRLL0HWTNUPGyxQA1WH4aUtCSvga
 vdnl+c7locomuTp+uqzPgbC8K+8xZiInz5CY9mkJxilGc6wWJXI3Zc4Fi
 /1fLuvEDQ0NZ8aDbiHx5j4rABCzvfiloTN1VQ2lNQrLE3hxzUjuugHf6T
 QlB7U6IRpzE4jBe+ulYtNJPSvwDzOoovw0TE4j+9peoHQ92zeYL0RblH/
 9sxEcgZdcGBaOY6aEzHMsgiYRwR+l5C1nN8riaJ3Cx8uccf2T9dVVkPdX
 7bw+0XIz9z521vZQgPTdmu0nn2cRLJ+oULMVsk8ldrnj7P8xinxI1ikHo w==;
X-CSE-ConnectionGUID: bdzAh4w+TCydjuyYnzBQYQ==
X-CSE-MsgGUID: 3yHRHOMcTH67px+EsVkI+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="15711476"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="15711476"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 02:50:56 -0700
X-CSE-ConnectionGUID: WSgStkaRSvmDg6j0qJyPhg==
X-CSE-MsgGUID: X1z9TsDUQIephKbufHJ4jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34148341"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 02:50:56 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/3] HAX patch do not merge
Date: Thu, 23 May 2024 15:32:48 +0530
Message-Id: <20240523100248.230989-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523100248.230989-1-kunal1.joshi@intel.com>
References: <20240523100248.230989-1-kunal1.joshi@intel.com>
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

HAX patch do not merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..10f54d516 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,9 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_bw@linear-tiling-1920x1080p
+igt@kms_bw@linear-tiling-2560x1440p
+igt@kms_bw@linear-tiling-3840x2160p
+igt@kms_bw@linear-tiling-2160x1440p
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1

