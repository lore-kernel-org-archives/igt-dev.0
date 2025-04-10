Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA358C369A2
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 06:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6023E10E76E;
	Thu, 10 Apr 2025 06:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RY1UIDnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FED10E36E
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 06:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744266576; x=1775802576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HEIkAIQz5x1tLQGu2n/FLx4DObTcqnTG2pA9HmeZ7Y0=;
 b=RY1UIDnB+8yRVb1U3cqTmpbg2xNaEPZYHIMOTw5eyaE/CY1OIYbaHObj
 6oucrINu/Dz7sEzlsrnrGICnkf4arr7cEAofdem3NXAWNVTKqa3qpGKAF
 xLD1hCENc9OCmoIauNxiQM8XtZzEiWPoFqAUksI1vcJwC5J28zKARcpV+
 IhxqbZZX12DPF2SztoX/CK/1/XOnoT7LFYp8GmrgJb+8TyK3yW27S7TSH
 P1heTt+MZkdU/wPkTsTl+V7NWrn6Clu9gGBl1xXt9+AEHaeANffq6rTG+
 cg+mdoWzT5iqInfyVch0fDs85P+i7VdWEEQ5qJ/wYlZ1r5Sjf8kMKfIiR A==;
X-CSE-ConnectionGUID: dJ71Ao+PQs+P81S11d0Fgw==
X-CSE-MsgGUID: M5BFc3mUSZWwAIrERZaPhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="57136978"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57136978"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 23:29:36 -0700
X-CSE-ConnectionGUID: vbnjxf/DSQKts5stoIHzGA==
X-CSE-MsgGUID: 147j/SAkQOmDErbLcCJ2EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="166018588"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 23:29:34 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,2/2] HAX: Add rc6-idle tests to fast feedback list
Date: Thu, 10 Apr 2025 11:55:22 +0530
Message-Id: <20250410062522.715836-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410062522.715836-1-sk.anirban@intel.com>
References: <20250410062522.715836-1-sk.anirban@intel.com>
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
index be0965110..f37dbf769 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -51,6 +51,7 @@ igt@gem_tiled_fence_blits@basic
 igt@gem_tiled_pread_basic
 igt@gem_wait@busy@all-engines
 igt@gem_wait@wait@all-engines
+igt@i915_pm_rc6_residency@rc6-idle
 igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
-- 
2.34.1

