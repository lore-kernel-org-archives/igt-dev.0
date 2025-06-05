Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4477FC5B543
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 20:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E345210EA4D;
	Thu,  5 Jun 2025 20:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+Voliub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F8E10EA4D
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 20:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749154268; x=1780690268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T/65tLOIDWMyKSaOFoHaH4CwWCkG6O+w3SCXemh8tZc=;
 b=c+Voliub90knrQ9Inig2gDd9crFc/Vc842cvospYkHFneFEFvoZ8vD15
 ToejT1YedmVrBQrI96evZd7tm3kcsgk70Ti+w+N18hDrKZEqgnDviJQjf
 U9Ig0mt5b0f9fzLUj72ztrmFnPsWji/z7xSKAfMn73LOa9jKfAWL3+CEy
 25UfxEWxLiuMRggNx8adG1WJy62Rb3lX9ZhpHHzHg7lrZY/ffxCE4gStA
 1CsN/jBvW05rmc2GRKT3HU8oY0/gWEfUAC4i9ySzVppNrfSWZzvnF+cSP
 T3VjH9C//VPFQLSgCkNoyHIHrUbXRymGJS572FiQ4iBbxi96XFqW6C0Vt g==;
X-CSE-ConnectionGUID: Ao//FWTQSr6yp76T7Whm7Q==
X-CSE-MsgGUID: m/7W8C+3SqmD0Z7VMr2Vyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51437441"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="51437441"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:11:08 -0700
X-CSE-ConnectionGUID: SSOTIIIfTcq7qhEzMK0Z+w==
X-CSE-MsgGUID: rTpX2IyxSqOGCQS598sq4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="146582946"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:11:06 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,v9,3/3] HAX: Add rc6-idle tests to fast feedback list
Date: Fri,  6 Jun 2025 01:41:25 +0530
Message-ID: <20250605201121.700118-8-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605201121.700118-5-sk.anirban@intel.com>
References: <20250605201121.700118-5-sk.anirban@intel.com>
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

