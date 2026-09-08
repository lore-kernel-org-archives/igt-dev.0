Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E29C79F82
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 19:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A4110E161;
	Tue,  8 Sep 2026 19:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ikymbnua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F076E10ED35
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 19:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788894299; x=1820430299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7q0WRQO5qeKfstTH8B06l69JjKpPBx2T/bwqE8cT25M=;
 b=IkymbnuaNCp1cwMexb3KdjZobVvmfP/ZE57RccyIkTSCqPSPCRShIPPc
 p+NE3/yqz2yys1yVWdhzIIu80pfPsYyN8PP5PCQBTskLFjSrvn6ZQkmrM
 cxMJSzyDmv4zpXK0hV0vdW4pDHhOaNGFQLpRmIpz7SlS3p9j+iAuNCxOY
 5Hxpkd+NU0/un/JxClge24gdIu5mE0CaYS13W9zU5dJHO4rRZeBNijfsK
 +xyFmyo51+uGpSKV0D+yd8jM4zicIblk+XD4XYqpGq2rNZX5Y+nFqvVa/
 zj+h0rDnNukNSyAgjXSCTWNe9+UGjDZeWwGoFfyaiZ8MPvQUTrEQYxTj1 w==;
X-CSE-ConnectionGUID: uIo9m977RzuX4WD7P7L7Cw==
X-CSE-MsgGUID: Vj5W5TeySpm+k31uRobSjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106824608"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="106824608"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 12:04:59 -0700
X-CSE-ConnectionGUID: QCVkFJt/RzSF8o9l9gSd0A==
X-CSE-MsgGUID: dUrY4MdxQEqLGlAQ+qUCXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="276324664"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 12:04:56 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
Date: Wed,  9 Sep 2026 00:24:08 +0530
Message-ID: <20260908185406.1023993-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908185406.1023993-4-sk.anirban@intel.com>
References: <20260908185406.1023993-4-sk.anirban@intel.com>
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

kernel implementation:
https://patchwork.freedesktop.org/series/168780/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_survivability.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 74488bbea..7471d4986 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -43,12 +43,20 @@ static char bus_addr[NAME_MAX];
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
+				    "|SIGID=[0-9]+ .*WEDGED: Device declared wedged"
+				    "|SIGID=[0-9]+ .*SURVIVABILITY: Runtime Mode enabled"
+				    "|SIGID=[0-9]+ .*SURVIVABILITY: Firmware flash required"
+				    "|SIGID=[0-9]+ .*GT: reset failed"
+				    "|IOCTLs and executions are now blocked");
 }
 
 static bool check_survivability_mode_sysfs(void)
-- 
2.43.0

