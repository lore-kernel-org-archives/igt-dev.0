Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637DFC61DB2
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 12:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DD310E537;
	Tue, 10 Jun 2025 12:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrny6r8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F6F10E534
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749558405; x=1781094405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T/65tLOIDWMyKSaOFoHaH4CwWCkG6O+w3SCXemh8tZc=;
 b=nrny6r8NjnzzvVHdE+U3thUQXo90zi3lVsAbHCLWjA3ZRFzt9tBSKo3t
 Vgv/NDWOcmCVr8hxMfWy+8fqvy+RgQX1UO3LvkqBjUJsEjnLRHIaenlM2
 LtSrwOT7ICQCxeHq8syLrJAxyucia08Pm9lnSgB6fQlxGZcPQqIjpYphi
 ijDkM8HTEQHpibyQEhnrXcWTto0Csxdqabpr4ecV2BeYpMbbcAPHGiclS
 ESkh03FhrElzooivrWiCAlPkdDKurop94dFq8b4hZAJtZfqQtT7szOUS9
 UWnQPzbvea4JuFc/Ez/36tjVZsqIlrFXPDyhh26CnvQLwAgwd/gk8n6rH g==;
X-CSE-ConnectionGUID: fILvq64oSaOEpRXsHzksYg==
X-CSE-MsgGUID: ccCmNdNySfyRxgkVNowvPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51749120"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51749120"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 05:26:45 -0700
X-CSE-ConnectionGUID: JwtJV+n4QWScc92MDBi1Aw==
X-CSE-MsgGUID: 7ZDpor8kRwqKwfhXO4BN1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="184003235"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 05:26:44 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v9 1/3] HAX: Add rc6-idle tests to fast feedback list
Date: Tue, 10 Jun 2025 17:56:47 +0530
Message-ID: <20250610122645.2088257-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610122645.2088257-5-sk.anirban@intel.com>
References: <20250610122645.2088257-5-sk.anirban@intel.com>
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

