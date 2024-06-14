Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62754C27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 05:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7721710EC35;
	Fri, 14 Jun 2024 05:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1dxkeAU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BEC10EC32
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 05:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718343545; x=1749879545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CJBr+WaZyOHdX6wACo8bzVFQO+R7FE+/EOnCagow4iQ=;
 b=I1dxkeAUnBhHi6KzLX3w4nD77pnaBm114kzvTzDI9nPccbZXkOuo8Rky
 My1BpIyAW/6b47pJ7cs2byMbb/o2jO0jZZ075XWw1HKVE/pSLi47uPUOW
 WiJKR4cFmbVL1JL2ZTz786dDfKpQ/wUoJX81S/hzIeAGwlkSxhmGlRTXW
 QdfjTjGpNk5/n86tJYQV+sZUAbq5SVLYUJwD42AJG0TBtNK4NjbLdfndD
 FFRofuKqoKpbVzvQsf+7UncyOxS9MkieVxGNklFt2fRLa+543Hqw3kg7U
 fYhOod7IlRrGpiyzA6ELDLIUh+7iMvyB5nH+/7AmAqlDnmsV8MFOX7gXm w==;
X-CSE-ConnectionGUID: Dd6spA3IQXWOHprS1sduDA==
X-CSE-MsgGUID: KlDsSOl6SgGSo8Bc20wnWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26331591"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="26331591"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:39:05 -0700
X-CSE-ConnectionGUID: dnTDa3enTOeTr+HYHsA8BQ==
X-CSE-MsgGUID: pxEwHRA6Q5SbaaALq1pExw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="77864064"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:39:03 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v3 6/7] lib/igt_psr: Fix PR_MODE sink support check
Date: Fri, 14 Jun 2024 08:38:38 +0300
Message-Id: <20240614053839.1822879-7-jouni.hogander@intel.com>
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

Panel Replay supporting PR_MODE_SEL_FETCH always support PR_MODE as
well. Change sink support check accordingly.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 012521fc5..42012243d 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -270,7 +270,7 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       (strstr(line, "PSR = yes") &&
 		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
 	case PR_MODE:
-		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
+		return strstr(line, "Panel Replay = yes");
 	case PR_MODE_SEL_FETCH:
 		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
 	default:
-- 
2.34.1

