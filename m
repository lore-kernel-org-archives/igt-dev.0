Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF7BC71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 06:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D3710E505;
	Tue, 17 Jun 2025 06:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAHNDbrU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD41210E505
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 06:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750142727; x=1781678727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T/65tLOIDWMyKSaOFoHaH4CwWCkG6O+w3SCXemh8tZc=;
 b=eAHNDbrUQmI8DW0ZyktsnQ0fj+mIVg2q2vFe/LnRIbf7wJuoNLm75AFc
 0chLTkgw9LCwm2no8J3OO43cqpKGvxSwZVk9ynx1rMcl+VyTKmn5/2Jbt
 ooCBM+VYJuB4bvB4HzdupJO1QQ6X3NaTcElPZM3NO3FAlMnb25c8SVBkL
 KqeyXEmSTlD5shg9fyaxJE6bhG7HzpXxCeHD+6Gp1iAvmwzUQRhFa7EnK
 +t3FGq8a9cFnEPVoOP5uGzcV8c+xsV+uUhXMFohYgdUhtNdJrFjdSIGMh
 1dF0fjHCtOAOMW9SmQoFkzHn+Bt6wgSf1HyD5Xaxfk/KFtCwmbgD5qoa8 w==;
X-CSE-ConnectionGUID: H5pImIXWTN2639UwxpPi+w==
X-CSE-MsgGUID: Craj52TLRJeh2qObiI9Z6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63335541"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="63335541"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 23:45:27 -0700
X-CSE-ConnectionGUID: wU6f8AZYR7u7yKtyCAISEA==
X-CSE-MsgGUID: T3P/xdDHSXKjqd3fl4nyvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="149578115"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 23:45:25 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v9 1/3] HAX: Add rc6-idle tests to fast feedback list
Date: Tue, 17 Jun 2025 12:14:58 +0530
Message-ID: <20250617064456.3041238-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617064456.3041238-5-sk.anirban@intel.com>
References: <20250617064456.3041238-5-sk.anirban@intel.com>
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
2.43.0

