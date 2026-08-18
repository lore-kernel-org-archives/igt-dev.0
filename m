Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A46C5DF8A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 20:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEFF10ECDF;
	Tue, 18 Aug 2026 20:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbDx24do";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2C810EC8A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 20:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787084511; x=1818620511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VvQR0dOp1O2cBrHwZcEYCea03BCegka0ixRlp51fufA=;
 b=mbDx24do7L1ZkDRumfH9raeNlcH2WSzKogYMpUwdqm/3jFZ5tOMNAnND
 dXJKljjvX2qMiF3iVTC3DRuK3pwiP+DrPuv4xTIqF5TB2z5CA/8Q0qEyD
 uGxniJhYojzA8ajOHJd9Eua99aYfNhQMtvalyohU6qOZeoHNpA5ODUHqQ
 KPrGzMJ7cUfrbBINDYS2i0PyL/PjylrCUfPKtisYHk7our94NRFBINphX
 cJxQMe9UF0oi1eGBKZb2hmyA/xW+fVFaHZN9i68EotxOAxAQWt9YBcaRY
 +QGXdyGfXJlr2OOk8xAMatJYaNOIuS/4gteN9XK5rpm9ORZFwD2tKSpf1 Q==;
X-CSE-ConnectionGUID: q+5AqpJUR6adVZo+EEtkRA==
X-CSE-MsgGUID: HtKQ4f/xS2yIxBm0ogzRYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91271792"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="91271792"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 13:21:50 -0700
X-CSE-ConnectionGUID: RZQSNHAJQaiJPqG7wAK2bw==
X-CSE-MsgGUID: zHTgY3trS8G9EKaGTZfOdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="303551795"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 13:21:48 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
Date: Wed, 19 Aug 2026 01:41:50 +0530
Message-ID: <20260818201148.36020-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818201148.36020-4-sk.anirban@intel.com>
References: <20260818201148.36020-4-sk.anirban@intel.com>
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

kernel implementation:
https://patchwork.freedesktop.org/series/168780/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_survivability.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 74488bbea..e60a11c3a 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -43,9 +43,11 @@ static char bus_addr[NAME_MAX];
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
 				    "|__pfx___drm_");
-- 
2.43.0

