Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D224BFEEF44
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 13:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BB010E04D;
	Tue,  7 Apr 2026 13:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xezo5C/k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBF710E04D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 13:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775569484; x=1807105484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9TBzjMc3Et7LJHSJcBQYHVPPnCEVshcb7YHjfAy37Pw=;
 b=Xezo5C/kAlCKpWMbKx7Mr/tjLqEiBH+Dfb+uu7KsezLXc54p+UKqKZ5x
 jHm2Fi1/JLqvE8RgUNcwoqvuhKK4d8sokfeJjdTKiHhzFJSE2/GDVSwKU
 x/DEuMkrylAh15aD/fs8GBm1zpzc8gMPE9B1BPYzc1eRbD770VPDPxCP1
 4+Zqn9kluxCmymFGwprhIXVESIxNZVtGzh4EVLOTBJaP5VbE6C+FbB0Lw
 wwu8ITi8VR376YdL4OfgIXkwHKnyio0InmwbBmYd8izQK5rA7bGJWQFcq
 e4+o0z0U9hejwq3CQzwku1Ddandw+/bBwNrbIP99quhNLnaNznHATLEOS g==;
X-CSE-ConnectionGUID: nxbrLvmBTECdsGndTO2Bbw==
X-CSE-MsgGUID: cDFkuYEhSXqTPuBVfBXtfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76415049"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76415049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 06:44:44 -0700
X-CSE-ConnectionGUID: UqlElBw2QRaiO7JBhX+ZoA==
X-CSE-MsgGUID: H8OFfq37TRKkDqiUB/dmIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="224990618"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by fmviesa007.fm.intel.com with ESMTP; 07 Apr 2026 06:44:43 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vidya Srinivas <vidya.srinivas@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH] tools/gputop: Fix zero output when stdout is not a terminal
Date: Tue,  7 Apr 2026 19:09:40 +0530
Message-ID: <20260407133940.134931-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260402134522.108322-1-vidya.srinivas@intel.com>
References: <20260402134522.108322-1-vidya.srinivas@intel.com>
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

When gputop output is redirected to a file or run via adb shell
(e.g., on Android), update_console_size() calls ioctl(0, TIOCGWINSZ)
on stdin which may not be a terminal. If stdin is a pipe or
redirected, the ioctl returns -1 and con_w/con_h remain at their
initial value of -1.

This causes the main display loop to immediately break since
lines >= con_h evaluates to true (0 >= -1), resulting in zero
output being produced.

Fix this by initializing con_w and con_h to default values of
80 and 50 respectively, so that when ioctl fails the display
loop still produces output with sensible dimensions.

v2: Try stdout, stdin, and stderr for terminal size before falling
    back to defaults (Soham Purkait)

v3: Initialize defaults in main() instead of adding fallback logic
    in update_console_size() (Soham Purkait)

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tools/gputop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 9b2e8cb6f..0ed5af456 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -609,7 +609,7 @@ int main(int argc, char **argv)
 	unsigned int period_us;
 	struct igt_profiled_device *profiled_devices = NULL;
 	struct igt_drm_clients *clients = NULL;
-	int con_w = -1, con_h = -1;
+	int con_w = 80, con_h = 50;
 	int ret;
 	long n;
 
-- 
2.45.2

