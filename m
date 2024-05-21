Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA21C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 09:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7546810E564;
	Tue, 21 May 2024 09:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ftz4j+of";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A0C10E564
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716282183; x=1747818183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KLwy04x2NycHilUivZDBZhnOJtJ/jSG8vbDtgVRhb5M=;
 b=Ftz4j+of77wlarmZRJHstMxp3SFxJErHsx3nDCIHc/6TMKbyCuBzdGlf
 aTxyproGWOybHXo32R99xuNjNOskQPs3UK+ZlnM8S4H0rqluMGarZme06
 f+31DbFxHMVQL+YHwBTbASIEqw+j/UtU/8bq5YHShIcmKHb2V2/9X5mFC
 aapOxzP6FmMKy+aBCSEeCuvKGSD1H4PMnhgg9IQJdfbDXbID/2nIKlJPs
 P5LEu1Z0j20zD1OVmF03/he1Oobwm8HMg9JEUIFYMzGhXhD4YPa+pYmYx
 PPy5kCIaFSUvLJ88si1okERhnDKpybAech83/ZOSsQjRWM4RRHzpyg91q Q==;
X-CSE-ConnectionGUID: 3f4ILiVVQfKdwkhJ9U/EbQ==
X-CSE-MsgGUID: NLepIW5PTVKI2WaftZiTnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12327349"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12327349"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:02:50 -0700
X-CSE-ConnectionGUID: FtVBu1qTTfeU/FWcpRqN4A==
X-CSE-MsgGUID: FMTxOW7MRXezKegOV/XSYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37804192"
Received: from mathiasj-mobl.amr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.211.157])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:02:48 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 1/4] lib/igt_psr: Set Panel Replay disable bit for PSR
 modes
Date: Tue, 21 May 2024 12:02:30 +0300
Message-Id: <20240521090233.1998323-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521090233.1998323-1-jouni.hogander@intel.com>
References: <20240521090233.1998323-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Set Panel Replay disable bit for PSR_MODE_* to prevent using Panel Replay
for panels supporting it.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 6008b73a6..964f18487 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -163,30 +163,36 @@ static bool psr_set(int device, int debugfs_fd, int mode, igt_output_t *output)
 		 */
 		ret = psr_modparam_set(device, mode >= PSR_MODE_1);
 	} else {
-		const char *debug_val;
+		int debug_val = mode <= PSR_MODE_2_SEL_FETCH ? 0x40 : 0;
 
 		switch (mode) {
 		case PSR_MODE_1:
-			debug_val = "0x3";
-			break;
+		case PR_MODE:
+			debug_val |= 0x3;
+				break;
 		case PSR_MODE_2:
-			debug_val = "0x2";
-			break;
+			debug_val |= 0x2;
+				break;
 		case PSR_MODE_2_SEL_FETCH:
-			debug_val = "0x4";
-			break;
-		case PR_MODE:
-			debug_val = "0x5";
-			break;
 		case PR_MODE_SEL_FETCH:
-			debug_val = "0x6";
+			debug_val |= 0x4;
 			break;
 		default:
 			/* Disables PSR */
-			debug_val = "0x1";
+			debug_val = 0x1;
 		}
 
-		ret = psr_write(debugfs_fd, debug_val, output);
+		/* old debugfs interface doesn't recognize Panel Replay disable bit */
+		do {
+			char debug_str[8];
+
+			sprintf(debug_str, "0x%x", debug_val);
+			ret = psr_write(debugfs_fd, debug_str, output);
+			if (!(debug_val & 0x40))
+				break;
+
+			debug_val &= ~0x40;
+		} while (ret <= 0);
 		igt_require_f(ret > 0, "PSR2 SF feature not available\n");
 	}
 
-- 
2.34.1

