Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB07E9D83B
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 06:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FECE10E023;
	Mon,  6 Apr 2026 06:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Go5nKsii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E3E10E023
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 06:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775455670; x=1806991670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VT+Zx1Z5DFrzFSoLtURcMRsl/o0iO2Qx57Sf8XGBVFI=;
 b=Go5nKsiiJLXfG1wTaYJpvCuQB5adudy26NgteFNeU2uCqo13bmeZehVg
 WsbdAK5z9Am35MkBAYOX3biZfhDrsozpbXcGrWB/5rCHLzVnKcUUn6hOj
 GiXwAPaNFAm48vrLe7DeijEMIw7kpEtbGsZRrqTsbqrock89DlBPZNQan
 QwxhYoR2AmeSJfFs5FWgKnHtNUUmcCcjmrLCKzKtsRWmL56Ca7Fjr3F5V
 XUuDryiZqSvwlnrvh8dL1OLca+KLXZfm6WUYUzmvitCMeMhlj11/Pw1Zt
 wafnU+7fEHAeTXO3EWbp1ZlTJ773OsshWX3c+1ntq+WtVq2BsEHB9slMp A==;
X-CSE-ConnectionGUID: Yrt93qMXSRitYvmK1X48uw==
X-CSE-MsgGUID: PpCb2M8sRFmG6JCUL3oozA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="63959842"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="63959842"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:07:49 -0700
X-CSE-ConnectionGUID: +35BwQNAR9elQFbvBW4GAA==
X-CSE-MsgGUID: GRuV399NS2qq6w6ltGTqfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="225037066"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by fmviesa008.fm.intel.com with ESMTP; 05 Apr 2026 23:07:48 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vidya Srinivas <vidya.srinivas@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH] tools/gputop: Fix zero output when stdout is not a terminal
Date: Mon,  6 Apr 2026 11:32:46 +0530
Message-ID: <20260406060247.126979-1-vidya.srinivas@intel.com>
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

When gputop's output is redirected to a file or run via adb shell
(e.g., on Android), update_console_size() calls ioctl(0, TIOCGWINSZ)
on stdin which may not be a terminal. If stdin is a pipe or
redirected, the ioctl returns -1 and con_w/con_h remain at their
initial value of -1.

This causes the main display loop to immediately break since
'lines >= con_h' evaluates to true (0 >= -1), resulting in zero
output being produced.

Fix this by trying ioctl on stdout first, then stdin, then stderr
before falling back to a default of 80x50. This ensures the real
terminal size is obtained when any of the standard file descriptors
is connected to a terminal, and provides a sensible default when
none are (e.g., full redirection or adb shell).

This affects anyone using gputop in automation, CI pipelines, or any
non-interactive context on Linux and Android where output is
redirected or piped.

v2: Try stdout, stdin, and stderr for terminal size before falling
    back to defaults (Soham Purkait)

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/gputop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 9b2e8cb6f..3b5e3c0cf 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -505,8 +505,13 @@ static void update_console_size(int *w, int *h)
 {
 	struct winsize ws = {};
 
-	if (ioctl(0, TIOCGWINSZ, &ws) == -1)
+	if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &ws) == -1 &&
+	    ioctl(STDIN_FILENO, TIOCGWINSZ, &ws) == -1 &&
+	    ioctl(STDERR_FILENO, TIOCGWINSZ, &ws) == -1) {
+		*w = 80;
+		*h = 50;
 		return;
+	}
 
 	*w = ws.ws_col;
 	*h = ws.ws_row;
-- 
2.45.2

