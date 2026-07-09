Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8D8C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 07:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D908110F3EE;
	Thu,  9 Jul 2026 07:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQm1r7FJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5175410F3DD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 07:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783581407; x=1815117407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BD7WoiYCupZLIuM0VuOIDUcY6Y3yrFH7tGXChiLB4pU=;
 b=GQm1r7FJXsfApX6vgIh06oH2077VMW1gQLnfCBstx4eB/mDE5U1Z/37C
 oND6DdrZDux3x/aEwk3nm1NoCbnaPzTuQtsKEAbfahzYZ60knJTJdtRqV
 tbefcZTutQQSmtDUulH6/0mQ5CCzwEWV3Ak42JHVqnMmv+nTfhr+GovZu
 SBLanOPAeIZuCqvp3dB0Q6Y6abvqq76n33rnkTPjAQmHyfudLnXEI8qyD
 5mwcefISIeVSYyT/nfF609rz/rCl4QYg++UqQcZubExlflRR8tPGfHqn9
 1l2k1utUE92EK3q8Sh6hQRl91/KD0fK7LEwHoybuxLzWOVbK5oWbIfO3B g==;
X-CSE-ConnectionGUID: RnT5Q7xsSZqFnhuIHa1ekQ==
X-CSE-MsgGUID: UzxETOn/SuKtbi65TWcaqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83229040"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83229040"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:16:47 -0700
X-CSE-ConnectionGUID: lqHyWW7mTOSMICqF/+AZGQ==
X-CSE-MsgGUID: u6c6nu6TTyGsQvdFIPaF8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254020969"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 00:16:45 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 1/2] tests/intel/xe_survivability: update ignored dmesg regex
Date: Thu,  9 Jul 2026 12:39:07 +0530
Message-ID: <20260709070905.405108-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709070905.405108-4-sk.anirban@intel.com>
References: <20260709070905.405108-4-sk.anirban@intel.com>
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

The kernel now reports -ENOTRECOVERABLE when the device is wedged.
As runtime-survivability deliberately wedges the device, update
dmesg regex so igt_runner does not treat the expected error logs
as failures.

kernel implementation:
https://patchwork.freedesktop.org/series/168780/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_survivability.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 74488bbea..cc54b37ad 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -43,12 +43,13 @@ static char bus_addr[NAME_MAX];
 static void ignore_wedged_in_dmesg(void)
 {
 	/* this is needed for igt_runner so it will ignore it */
-	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ECANCELED"
+	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ENOTRECOVERABLE"
 				    "|CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
-				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
+				    "|GT[0-9A-Fa-f]*: reset failed .-ENOTRECOVERABLE"
 				    "|GT[0-9A-Fa-f]*: Failed to submit"
 				    "|Modules linked in:"
-				    "|__pfx___drm_");
+				    "|__pfx___drm_"
+				    "|-ENOTRECOVERABLE");
 }
 
 static bool check_survivability_mode_sysfs(void)
-- 
2.43.0

