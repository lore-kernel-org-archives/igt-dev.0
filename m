Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BBEC88E50
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 11:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00C810F568;
	Fri, 11 Sep 2026 11:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUfKkNMw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6490910F568
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 11:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789127152; x=1820663152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d0jEocU7i41w4x0s61SF+lEBXa8O3Ao6dfI72q/bwgA=;
 b=FUfKkNMwAQdDxnnsjj/JabGKy88bS4GdiSlRvELg+pGGrW2H+hZr5EwZ
 nV3HjBzioqfjSFEi9k6ZEWEzj0w8Pg17WCcJKjbHdWrbFHOXE600LHRKH
 +ZjwWxlYAto2KbyGgY2K/Y5PuIk240cVUiQTFhVXkAfc+hZYPaEG5KI8V
 ciF/uT47MglofcAJVJua2N+Kp0biAfspmhZ+uL7fAibWj1Kw3bWl39sB4
 WTxqqnjH3fpNURihGxsVCB4l7mPRbicHsc8OtiU7GqTH/ANDJ9mTCuBjE
 0IOAR6m5WQ2PcSfr41evAf2rFSz3bEeg/81UdmTPoKEYOs05pMsdU4MDR A==;
X-CSE-ConnectionGUID: TxxAga5yQRGfkeE81ghquw==
X-CSE-MsgGUID: THIRCFMEQqyJ7cNVcDqKOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89521101"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89521101"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:45:51 -0700
X-CSE-ConnectionGUID: Rfrl8rq0QQCw2Vq3GJWnFQ==
X-CSE-MsgGUID: wS1FsORWTRyY6fXfB6LbWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="272403867"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:45:49 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
Date: Fri, 11 Sep 2026 17:04:50 +0530
Message-ID: <20260911113448.1300864-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911113448.1300864-4-sk.anirban@intel.com>
References: <20260911113448.1300864-4-sk.anirban@intel.com>
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

kernel implementation:
https://patchwork.freedesktop.org/series/168780/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_survivability.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 74488bbea..396194b4f 100644
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
+				    "|SIGID=103 .*SURVIVABILITY: Firmware flash required"
+				    "|SIGID=103 .*SURVIVABILITY: Runtime Mode enabled"
+				    "|SIGID=102 .*WEDGED: Device declared wedged"
+				    "|IOCTLs and executions are now blocked"
+				    "|SIGID=[0-9]+ .*GT: reset failed");
 }
 
 static bool check_survivability_mode_sysfs(void)
-- 
2.43.0

