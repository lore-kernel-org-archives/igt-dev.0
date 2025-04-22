Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B29DC369D7
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 06:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6DB10E507;
	Tue, 22 Apr 2025 06:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyuwqXTg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F08410E507
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 06:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745303800; x=1776839800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JZkdLsE1bU/Wq9TqpZI6DMrcYHbHmpBFWrxR2VGrUUo=;
 b=CyuwqXTgLqBh6ExMV+WDoqhUsxYOJZZikA0bZdSPZGUF+8MG3xotTu8A
 X1EpJE48gotzO0SCmzMxnW8CMSxDTXBSbwiUk1+hsqK7fP1I2rXBRQGmL
 5MGnceCm+4IyDcMzQa9lm5HQNa8bjVJFg2w7bMK2ETohFQY31eBSSQqRw
 WIPdbEB52MoZqPFegAtZsKmsLvSJrjHytVu04BC6WRr23Al5q9JGSWJpN
 rdqL13vcDbPO/jppgPy8MRAgIldQaoMTbVAqH/Ci/Ibb15TbBym650+r/
 FFdoo2A4F1nF+SjkBY3gAAlNOMNAIabR/4Q3lhdixBQ541p0RjVUUxN4b A==;
X-CSE-ConnectionGUID: EZqxcM9iSpSvzGy4C8uVfQ==
X-CSE-MsgGUID: 23xqYuejTwO3iVOQJdARXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46978647"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="46978647"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 23:36:40 -0700
X-CSE-ConnectionGUID: 3U1XXzFcTda42nxytcTGGQ==
X-CSE-MsgGUID: eD6b0zGMSO+TEZJNCkN2Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="137012852"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 23:36:38 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,2/2] HAX: Add rc6-idle tests to fast feedback list
Date: Tue, 22 Apr 2025 12:01:35 +0530
Message-Id: <20250422063135.2502377-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422063135.2502377-1-sk.anirban@intel.com>
References: <20250422063135.2502377-1-sk.anirban@intel.com>
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
index 82395e7ea..c34caed55 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -48,6 +48,7 @@ igt@gem_tiled_fence_blits@basic
 igt@gem_tiled_pread_basic
 igt@gem_wait@busy@all-engines
 igt@gem_wait@wait@all-engines
+igt@i915_pm_rc6_residency@rc6-idle
 igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
-- 
2.34.1

