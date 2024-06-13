Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BBBC2BA15
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 09:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3609410E9BE;
	Thu, 13 Jun 2024 09:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLkg3+0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF99D10E9BD
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 09:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718270760; x=1749806760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c8McMnvJyB0lv7vkKd615CBEHRy9tNSDTZx9YTWLQlY=;
 b=HLkg3+0FgFdU8cgV8LPyJN2i9otygLr4gexBucFayqaYoVuQoNfg0rZs
 pgjMxPktdy5bMcuLszWU4DFENm4O0R5DbyzuP1MaETGPCCKMV5UFAY7Hr
 AJPxUBjQWMWqn72EUFy/oAsWUMeQsTJpwf07d8+Yox5UKcMJimkGjKYEu
 Er9BPtKs1rE0jj0vfsMYfcphl41u2psZB/WM3EbsVMK/aX3woz4sM8CYE
 WXndD0fexy+dSAJ/82GKpqVHv50bcf+dI662a2ndZVnGFSbua3XbRCbVe
 cgFaoCc5p+0b/IqXERHY6/DVPMcu8PWYeOKzTpaV8yFe97Njgzd9Hghey w==;
X-CSE-ConnectionGUID: lXEBD/CSRCe8JtI0GsyluQ==
X-CSE-MsgGUID: xi43cczzSFaVeBN6guuHwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18004696"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18004696"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:58 -0700
X-CSE-ConnectionGUID: RiabYA+uTaqwhgQSMbeViQ==
X-CSE-MsgGUID: 3dacHG2VQjCLJPP4HTqbjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40045499"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.31])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:30 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 2/6] lib/igt_psr: Psr status debugfs interface print
 "enabled" not "Enabled"
Date: Thu, 13 Jun 2024 12:25:10 +0300
Message-Id: <20240613092514.1288801-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613092514.1288801-1-jouni.hogander@intel.com>
References: <20240613092514.1288801-1-jouni.hogander@intel.com>
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

Psr status debugfs interface print "enabled" not "Enabled". Take this into
account in psr_mode psr_get_mode.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 964f18487..d1286276c 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -399,9 +399,9 @@ enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output)
 		return PSR_DISABLED;
 	}
 
-	if (strstr(buf, "Panel Replay Enabled"))
+	if (strstr(buf, "Panel Replay enabled"))
 		return PR_MODE;
-	else if (strstr(buf, "Panel Replay Selective Update Enabled"))
+	else if (strstr(buf, "Panel Replay Selective Update enabled"))
 		return PR_MODE_SEL_FETCH;
 	else if (strstr(buf, "PSR2 selective fetch: enabled"))
 		return PSR_MODE_2_SEL_FETCH;
-- 
2.34.1

