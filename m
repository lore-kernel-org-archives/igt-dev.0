Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6294C9832A
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 03:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E95B10E148;
	Tue, 29 Sep 2026 03:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFe0dH2y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1470610E148
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 03:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790652982; x=1822188982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q/609gECJNFhPuo4mF1eegpYdeMyX/pndtNuFh2ZBno=;
 b=jFe0dH2yzIVdf0ckyTvCDHE6NQOEefzkVx5gCmBUt/x76R3It8TvfQtx
 UwndkCdmbpzCs2YtJ+B0vygbvNrZQR2gVahmv/6YlSVqNGENFaC3LgcRd
 WfnbtQM9GFzy4ldgHLd2cp0wAlUexkypvHk71qA2GYz2EeUiWqSW4/Fjb
 FgYTHfRhWcoz+WVfHKCrrhcD0TPeJhGu9g+ulK4SPwxXAXKOVVCV7v/yj
 22MICju6MPQJ7xnUNh9m3DnBDthF7LxI7L7l1rPUtbnoLhPeh1/R5dY8p
 Q3W5fu3WkPP9h3/nrzTrFVZUTA6TfHWWMjhDYPQmZsGPO/VzeVljjYkxO w==;
X-CSE-ConnectionGUID: fkuRk63YS0qzONvfi84A8w==
X-CSE-MsgGUID: HycB39MkR7+8CQzv15GBTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="94076322"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="94076322"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 20:36:22 -0700
X-CSE-ConnectionGUID: n6k/hwxPS3Gv8C7/l4hfpA==
X-CSE-MsgGUID: uKgiPVzvSBuDm1rmz/J3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="279967918"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 20:36:19 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v6 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
Date: Tue, 29 Sep 2026 08:53:55 +0530
Message-ID: <20260929032354.1971070-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929032354.1971070-4-sk.anirban@intel.com>
References: <20260929032354.1971070-4-sk.anirban@intel.com>
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

v2: Keep older error codes (Kamil)
    Modify regex (Kamil)
v3: Modify regex (Riana)
v4: Support sigid based logging (Riana)
v5: Use constant sigid values instead of strings (Riana)
v6: Fix strings (Riana)

kernel implementation:
https://patchwork.freedesktop.org/series/168780/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_survivability.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 74488bbea..e63f2c063 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -43,12 +43,19 @@ static char bus_addr[NAME_MAX];
 static void ignore_wedged_in_dmesg(void)
 {
 	/* this is needed for igt_runner so it will ignore it */
-	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ECANCELED"
+	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: "
+				    "(-ECANCELED|-ENOTRECOVERABLE)"
+				    "|GT[0-9A-Fa-f]*: reset failed .(-ECANCELED|-ENOTRECOVERABLE)"
 				    "|CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
-				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
+				    "|xe [0-9A-Fa-f:.]*:.*-ENOTRECOVERABLE"
 				    "|GT[0-9A-Fa-f]*: Failed to submit"
 				    "|Modules linked in:"
-				    "|__pfx___drm_");
+				    "|__pfx___drm_"
+				    /* SIGID-based logging (newer kernels) */
+				    "|IOCTLs and executions are now blocked"
+				    "|SIGID=[0-9]+ .*GT: reset failed"
+				    "|SIGID=102"
+				    "|SIGID=103");
 }
 
 static bool check_survivability_mode_sysfs(void)
-- 
2.43.0

