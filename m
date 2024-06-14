Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F487C27C7B
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 05:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D27010EC31;
	Fri, 14 Jun 2024 05:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YF6gWAWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA7110E055
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 05:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718343536; x=1749879536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+kQGm5p/noQ7xOkhNMSVlLMZAScHK+oxmjHoXRK05oM=;
 b=YF6gWAWH3kHafLvklATqbQRX8n9Mq+2aQ10lS5hHYKkaNAJd3GWJYXJu
 YzwVDCpRC3rdlJH0qpmbBVz22LRVZiVQKxIO8ZSov1L8rR67B0PnWspWO
 QihnMoe/FF5qkGQCtuOwC9eZCIbbZ24N5XqFE+bMU0IHlqS09WPhGqOL2
 8L3RsYSEBUvx5eUobLIUrR60SDXB0Sxtiqbi4Hzeu8WnvH9XgfHXNnVXf
 z8war9akbd0RznD3haZFRa1EY00u9Ui4b9dBB35e9qykJ6BRkDLZ08Fup
 y9SfORch/BXTWGrdNb9EPfuLeW+Fg/NsmcMLxB0/Mliq/j6TO8ZgAe3Fq w==;
X-CSE-ConnectionGUID: Plk+L31qQYCszhge5FspmA==
X-CSE-MsgGUID: j+NI3eq5Qyuk1TixBirz2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26331585"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="26331585"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:38:56 -0700
X-CSE-ConnectionGUID: pk+/uqBFRXCyP6EqAzsEtw==
X-CSE-MsgGUID: P5KsDKQhQvOXFM+b0RJESQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="77864034"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:38:54 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v3 1/7] lib/igt_psr: Set Panel Replay disable bit for
 PSR modes
Date: Fri, 14 Jun 2024 08:38:33 +0300
Message-Id: <20240614053839.1822879-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240614053839.1822879-1-jouni.hogander@intel.com>
References: <20240614053839.1822879-1-jouni.hogander@intel.com>
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
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
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

