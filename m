Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F53EC4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 13:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063EE10E78B;
	Wed,  7 Feb 2024 13:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYXZ/UnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8006F10E766
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 13:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707313443; x=1738849443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0u5u3nsr9VkRtDbbke1imnKLPoEwLUJjySN1PJePXv8=;
 b=kYXZ/UnT0QiGLtM4rB3/lOkbv/gKzvaeioCl9FpUfjJ+tyedTKwKkAeR
 PMKb6pkxgasI3H9UsypzOPLDweUQmNaICaa3JPv5bXmChp3COkEn6MbY+
 PQcympUfb4pRvi57i9sGYLig7vmgbg4Lvlp1nMnrKWTx5MA2ijIb7QR/G
 W8mdJrBEPvDFqdz2GbB8D+hYavXFlGIo3v5ljErWAqXFmyIZcU2WAurQQ
 Fhp1kQ3bZtlIzPNP9okDxyqHhVbt439Q/lxQ8xR512Xx6lPo3kYwl3ud4
 T2xbeRMftgytUXwaYHVvxP7ITu1QGDmidvd82yaKh8IOhhTzPMuoDfwut A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1133294"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1133294"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 05:44:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="5973371"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 05:44:02 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_psr: add support for PR selective update
Date: Wed,  7 Feb 2024 19:23:17 +0530
Message-Id: <20240207135319.1880229-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240207135319.1880229-1-kunal1.joshi@intel.com>
References: <20240207135319.1880229-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

adapt to kmd changes to support PR selective update
https://patchwork.freedesktop.org/patch/575163/?series=128193&rev=3

v2: "PSR2 selective fetch: enable" valid for both cases (Jouni)

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index ac214fcfc..8acab2231 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -245,7 +245,9 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       (strstr(line, "PSR = yes") &&
 		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
 	case PR_MODE:
-		return strstr(line, "Panel Replay = yes");
+		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
+	case PR_MODE_SEL_FETCH:
+		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
 	default:
 		igt_assert_f(false, "Invalid psr mode\n");
 		return false;
@@ -385,11 +387,13 @@ enum psr_mode psr_get_mode(int debugfs_fd)
 
 	if (strstr(buf, "Panel Replay Enabled"))
 		return PR_MODE;
+	else if (strstr(buf, "Panel Replay Selective Update Enabled"))
+		return PR_MODE_SEL_FETCH;
 	else if (strstr(buf, "PSR2 selective fetch: enabled"))
 		return PSR_MODE_2_SEL_FETCH;
-	else if (strstr(buf, "PSR2 enabled"))
+	else if (strstr(buf, "PSR2"))
 		return PSR_MODE_2;
-	else if (strstr(buf, "PSR1 enabled"))
+	else if (strstr(buf, "PSR1"))
 		return PSR_MODE_1;
 
 	return PSR_DISABLED;
-- 
2.25.1

