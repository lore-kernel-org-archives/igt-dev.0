Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5F2C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 09:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BEC10E5AD;
	Tue, 21 May 2024 09:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGHfG8HU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D75C10E5AD
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 09:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716282190; x=1747818190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CWFfFe+eZdBlT/7/xioRcBBjo3bfGt0rm9hib/j9F80=;
 b=AGHfG8HUp8hTELoAVDXNfe9zjzlU4QuBv6byAHaot/wybRBg0VGLZZLq
 ClhXP4auq6X2Vj9R273ERm0PeWK2WI/wRBIpCGQ+KtbBvLBBr2g4z5y2a
 HX987BErHPsnP0NQ4PU5KMKV2+q5dg2ib5oUF5hRmhMmNRvIIBR3RIehm
 mrCJSubf++idvA5S5pVYEPv4PqR5s8T/RDn7Bvg5pc8/2QC2ntXY7CVTh
 oUTJK56/oO4Y5q/NsGNId3REVZD5mvcm0xt7LL+26xyVRRiogj3W/4jqV
 2ZA3an1GfEAO56vVGxhTTTmcceqgwa+FZaiOamBOaGQ9I28UKtU1mEib+ Q==;
X-CSE-ConnectionGUID: ohOhmRm4T6uw5TmDdGyULw==
X-CSE-MsgGUID: AmHfVf6+RIKdmz+QGsk+RA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12327358"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12327358"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:02:52 -0700
X-CSE-ConnectionGUID: brtLJSX6SnaPy1vrTPKHlA==
X-CSE-MsgGUID: nJGFyo8uRAakVENb9OINyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37804227"
Received: from mathiasj-mobl.amr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.211.157])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:02:50 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 2/4] lib/igt_psr: Psr status debugfs interface print
 "enabled" not "Enabled"
Date: Tue, 21 May 2024 12:02:31 +0300
Message-Id: <20240521090233.1998323-3-jouni.hogander@intel.com>
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

Psr status debugfs interface print "enabled" not "Enabled". Take this into
account in psr_mode psr_get_mode.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
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

