Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8296FC54FB3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 12:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA7910E50A;
	Mon,  2 Jun 2025 12:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibpqmK8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DCD10E509
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 12:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748865807; x=1780401807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T/65tLOIDWMyKSaOFoHaH4CwWCkG6O+w3SCXemh8tZc=;
 b=ibpqmK8Y4Q2Z9g01HmiGTzRGmnZvGZAuQ1FO+hN4YDSouK83oa05AFDZ
 2ELIBvWkvAz6XcrWgDspX5ZZZCnO2gBbyEZn9nuflYLV/zvVmgIKz9buA
 qLoRF0hrQMVEWez0OZ2N5g1jcl05jmjYM+ghia0csD7C/CPCFAxLY2nWy
 amsPVAdPvH7TjTfykNcIBnOPSOULyzQnQAUwabGOwSfjiF8jZP5lx4nPt
 Q/1akiSK8PzUnMTaVcxZiNXrETJMRZMORG9ndQb8Szr7eNXH8Kq3b9z9x
 +8WhwPQxvm/kyXdwh9lhlQS59fdS2yhb24aDPsKwZp+7JYvU1aMS3LJN4 g==;
X-CSE-ConnectionGUID: Nmmr4eU5QmG/XUjYiuCISw==
X-CSE-MsgGUID: hhJ6APlrQyS4qXqbUJuGGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50872686"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="50872686"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 05:03:27 -0700
X-CSE-ConnectionGUID: yvtmZ8CzRlmpZXKsyqDXbg==
X-CSE-MsgGUID: 4SVKwurdQrOWOjtriDMMCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="149360213"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 05:03:15 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v8 2/2] HAX: Add rc6-idle tests to fast feedback list
Date: Mon,  2 Jun 2025 17:33:50 +0530
Message-ID: <20250602120347.62189-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602120347.62189-4-sk.anirban@intel.com>
References: <20250602120347.62189-4-sk.anirban@intel.com>
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

