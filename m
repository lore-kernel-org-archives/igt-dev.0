Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E5FD58D61
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 16:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA0F10E6A2;
	Mon, 25 Nov 2024 16:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BldUmdng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E0110E6A2
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732550864; x=1764086864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oh+zFG+nSVzxTRQjDoQW+RXo3dW41sezFXpghBsB10M=;
 b=BldUmdng2C2qO/odryZYuZulK92s5ziFqeCQ0WExhneqVoNqn0RFUgsw
 dHbn+K2wumghnvVHWxFMbK9d++ntmJri/itxJBLQb1GgPK9EKv82uThUn
 Mrtkl2NOnASmyynoppN5ap3Riysm1AdjmsDYPcHKZHUmwFQ2mMf9SOHhw
 +EeC0MwTDaLXnjG0tw2txzb3DELmS6b4NPBrshpgfnkPypJSZx13PaPYc
 HBuBm+etvc0cVmbmzELfiQJSY12pVupEwcCIf1XBWEZAx52LgiqqZUoF6
 iWDVuCtMHPujZQdpYEmgYy1yEmMzElPkkFdzC8r8zPcOyWMJI1pOVfb16 g==;
X-CSE-ConnectionGUID: H6ZXwuH0RjCL1kDrgVIkWQ==
X-CSE-MsgGUID: TVUoI/oUSX6NM/tL4ZP1Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32040191"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="32040191"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:07:44 -0800
X-CSE-ConnectionGUID: ZKo822EBTE2OU0aVP1lGoQ==
X-CSE-MsgGUID: cTZuUzFzQUWgADPICxBLbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="95407852"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:07:42 -0800
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,2/2] HAX: Add rc6-idle tests to fast feedback list
Date: Mon, 25 Nov 2024 21:28:57 +0530
Message-Id: <20241125155857.2561292-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125155857.2561292-1-sk.anirban@intel.com>
References: <20241125155857.2561292-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Add pm_rc6_residency-rc6@idle to i915-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..e74b51080 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -53,6 +53,7 @@ igt@gem_wait@busy@all-engines
 igt@gem_wait@wait@all-engines
 igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
+igt@i915_pm_rc6_residency@rc6-idle
 igt@i915_hangman@error-state-basic
 igt@i915_pciid
 igt@kms_addfb_basic@addfb25-4-tiled
-- 
2.34.1

