Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8384C3ABD8
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFEE10E5DD;
	Tue, 13 May 2025 18:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmnadkD9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B91E10E5DB
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747161841; x=1778697841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JZkdLsE1bU/Wq9TqpZI6DMrcYHbHmpBFWrxR2VGrUUo=;
 b=bmnadkD9JcLHVd2q8QaJ0X31P+8EhDt3jNxOpu3UHgDDRVKWjPn+BvT0
 /BdubhEGVxVrnfh7UJTiP3Nn5/4ty7a3Zc5Z6Iv8Zj0EII+uFRVK0F5cr
 igFwpZVoM7NfnuJJ/Ob2LwNUJpVL4VajAt+nZt+fefZ/+w+UccB3kuxhc
 01V2fPRujPqtvvV5yHopSWLJHF/1ZbCmBfoU6XlxQqukNHI07tRsv9UmG
 AuQ6/Ne5e+0zqWOzAXBy8CAZw5wDvTG3Fpd4z8dOxk1yRCVwfIGtc0meN
 DB0gxa9ir56tqc/1HFLcNR0+hD5PFT210L+WR8AoRPi1UoLZ7NqEHRbyl g==;
X-CSE-ConnectionGUID: zhipdjCMR72bej7/X6q55w==
X-CSE-MsgGUID: 551KRk7RQFC2mc92/J1pLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="36655576"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="36655576"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:44:01 -0700
X-CSE-ConnectionGUID: V819kBOlR3iAvEFyQAYAsw==
X-CSE-MsgGUID: sVuxH9xVSPGB7FCIoXBCTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137836068"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:43:59 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t v6 2/2] HAX: Add rc6-idle tests to fast feedback list
Date: Wed, 14 May 2025 00:07:26 +0530
Message-Id: <20250513183726.2118105-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513183726.2118105-1-sk.anirban@intel.com>
References: <20250513183726.2118105-1-sk.anirban@intel.com>
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

