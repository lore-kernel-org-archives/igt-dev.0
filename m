Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0E3C021A2
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 12:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCADB10E6AE;
	Tue, 11 Feb 2025 12:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tc1HXy6M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AD810E0BA
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 12:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739276553; x=1770812553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5l3fYFPrDLlVeUxFrghfuAW3nnTnk+cruX4NhUsrA/c=;
 b=Tc1HXy6MouCFL9CsWvN1SzhB60L4JRQmlhHZ6sgfDOvYg/lY+Y/97jWq
 gXmWpZf1+Xr79yNAN9Irkkq6V07yA3Ag6NkXMmhb7QlZ40Iq3yUM42U4Y
 xL6wLa1crN+BuxrF/LnOkc18TuIg/CGoYqkTpxxvlXPPFIAg7HuFZtEKq
 xlj0W0WHWWjSu13GI2XKufTMYi4t5nzy2h1rnV3xzfnPXwZanYLuxc9jd
 dnLKJypIsqrNyfTVr+L/6wbtdXXA3Z1la3fc+dOvYjfX8MNBt0H+PkAnR
 Oa2VtD7YJVyPSmfPLQlR0JCRtRsD4MZol7Z8YOAvlc57i3ZulmbsvkvkJ A==;
X-CSE-ConnectionGUID: a4Fz8QENQJuKf63V98+TBA==
X-CSE-MsgGUID: vLMvP4nAQAOexHUmPAavIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57429353"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="57429353"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:22:33 -0800
X-CSE-ConnectionGUID: 986DBxC/SEqktc4K8Ym8og==
X-CSE-MsgGUID: LBrlUREFT5OF/zzZILGK0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112350969"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:22:32 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew Kempczy_ski <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/i915_pipe_stress:
 s/i915_pipe_stress/kms_pipe_stress
Date: Tue, 11 Feb 2025 17:57:42 +0530
Message-Id: <20250211122743.329838-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250211122743.329838-1-swati2.sharma@intel.com>
References: <20250211122743.329838-1-swati2.sharma@intel.com>
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

As i915_pipe_stress is a display specific test, rename it with
the "kms_" prefix, i.e kms_pipe_stress.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Zbigniew Kempczy_ski <zbigniew.kempczynski@intel.com>
---
 tests/intel/{i915_pipe_stress.c => kms_pipe_stress.c} | 0
 tests/meson.build                                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tests/intel/{i915_pipe_stress.c => kms_pipe_stress.c} (100%)

diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/kms_pipe_stress.c
similarity index 100%
rename from tests/intel/i915_pipe_stress.c
rename to tests/intel/kms_pipe_stress.c
diff --git a/tests/meson.build b/tests/meson.build
index 33dffad31..7b020c195 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -219,7 +219,6 @@ intel_i915_progs = [
 	'i915_hangman',
 	'i915_module_load',
 	'i915_pciid',
-	'i915_pipe_stress',
 	'i915_pm_freq_mult',
 	'i915_pm_rpm',
 	'i915_pm_rc6_residency',
@@ -259,6 +258,7 @@ intel_kms_progs = [
 	'kms_legacy_colorkey',
 	'kms_mmap_write_crc',
 	'kms_pipe_b_c_ivb',
+	'kms_pipe_stress',
 	'kms_pm_backlight',
 	'kms_pm_dc',
 	'kms_pm_lpsp',
-- 
2.25.1

