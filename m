Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09741C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 12:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F5C10E770;
	Fri,  7 Jun 2024 12:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YkxPliHe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF6510E3B9
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 12:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717764980; x=1749300980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aCKTa04GaqgRBN/zUv0y+qz3gJ0pgaYj/o/ccTWorvM=;
 b=YkxPliHerfDFCM/aQ7YmDnnEHMxJF5cn24mKL4R4VB4P0q4DiZ509vRG
 85JaR4u6O73z5u0kuF4q5Wl/9kZvkdhKBqoZ4HTNH3hR0gLyprMuyZHye
 gJTLiZAX2h+fC6Aod019jRTt1dCvmm9u+czhjS1Efr5ngGtRr51r5NEt1
 8+pcqHuX7bJCjciYze6LBnG5oMknAu+ETFEoBIciiI/CZQpXwjKnObh6h
 310hTAePbGkE8TYed+cjsPbu1WKDnzmpStC/mteSRcNbM//j3oI1ayWrn
 BqVbNF3XHIepDeAmVZJcWR79lsk2gh9GyJfJYrndjfEBViIp7UnsHRMgC A==;
X-CSE-ConnectionGUID: Wcc8EDfMRg+kHMJKHC9LTA==
X-CSE-MsgGUID: 7X+TCMvXT6+LaWNlL6vYEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="37011351"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="37011351"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:56:20 -0700
X-CSE-ConnectionGUID: xNImVlThR8CdDNs022tt+A==
X-CSE-MsgGUID: EAiAYRCJSrijNwdTKcvhEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38768847"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:56:19 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/2] HAX: Test CMRR tests in BAT
Date: Fri,  7 Jun 2024 18:18:40 +0530
Message-ID: <20240607124840.3405928-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240607124840.3405928-1-bhanuprakash.modem@intel.com>
References: <20240607124840.3405928-1-bhanuprakash.modem@intel.com>
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..ffa3b982a 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -129,6 +129,8 @@ igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
 igt@kms_psr@psr-primary-mmap-gtt
 igt@kms_setmode@basic-clone-single-crtc
+igt@kms_vrr@cmrr
+igt@kms_vrr@flipline
 igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index aa98b37e6..a669ab39a 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -65,6 +65,8 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+igt@kms_vrr@cmrr
+igt@kms_vrr@flipline
 igt@xe_compute@compute-square
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
-- 
2.43.2

