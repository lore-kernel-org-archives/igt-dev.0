Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68D1D3942C
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 13:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1E510F2A8;
	Thu,  2 Apr 2026 13:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOJvViDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADEB10F2A7
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775137821; x=1806673821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p6bXGR2ByFfrwEd6bo1HRbK3vrGYU+pOUkACQOXPXGc=;
 b=AOJvViDPlOF6Cst1pYG9Gp6iFxv8kSye3rjryi5VxxRiUW4mG02Q+Sh5
 87EEW6FTDWKxy+ZWljocJfbaknsItshi6B39IY5RocpLV+vWChvKHn7Ao
 jl7sscWpAffPQNI8dWHL/QU6PD5TW2FufU+XoEaZuN8B8p/RYmjMGVcot
 UrSyg8IKyIhQWuJ8ZVOMxsSZVmyQ4aOM6YFLToBCBDFvzszpS8otswZ4E
 O4bRElOmOIfYtlnxO5TRinNaJiDYni/D/zx7ZqYKH9CJIJZG3M8XCfiIe
 zglx0oIQw1QGxATaLe0H6NLqUJgQN6Cz4SRvR56Tq3lmnUFRkvXwP2HYk w==;
X-CSE-ConnectionGUID: 0TJuS6AhTX6LbgwJ+KmK1w==
X-CSE-MsgGUID: ZGZn/U45RoOOpoaz7zg6Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76085831"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76085831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:50:20 -0700
X-CSE-ConnectionGUID: 3RTkK/VDRiuP+J8PwO+Drw==
X-CSE-MsgGUID: gdVPBzXjQv+H57Fs7ZbMGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="231910633"
Received: from vsrini4-xps-8920.iind.intel.com ([10.223.167.75])
 by orviesa005.jf.intel.com with ESMTP; 02 Apr 2026 06:50:20 -0700
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vidya Srinivas <vidya.srinivas@intel.com>
Subject: [PATCH] tools/gputop: Fix zero output when stdout is not a terminal
Date: Thu,  2 Apr 2026 19:15:21 +0530
Message-ID: <20260402134522.108322-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.45.2
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

When gputop output is redirected to a file or pipe, such as:

  gputop -n 5 -d 1 > results.txt
  gputop -n 3 -d 2 | grep rcs

ioctl(0, TIOCGWINSZ) fails with -1 since stdin is not a terminal.
update_console_size() then returns without setting *w and *h, leaving
con_w and con_h at their initial value of -1.

The main display loop uses 'if (lines >= con_h) break' to limit output
to the terminal height. With con_h = -1, the condition (0 >= -1) is
immediately true on the very first line, causing all client output to be
silently suppressed. The result is that gputop produces only ANSI clear-
screen escape sequences and zero actual data.

This affects anyone using gputop in automation, CI pipelines, or any
non-interactive context on Linux or Android where output is redirected
or piped.

Fix this by falling back to a default console size of 80x50 when the
ioctl fails, consistent with the existing fallback for serial consoles
(where ws_col and ws_row are both 0).

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tools/gputop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 9b2e8cb6f..112ec5ddb 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -505,8 +505,11 @@ static void update_console_size(int *w, int *h)
 {
 	struct winsize ws = {};
 
-	if (ioctl(0, TIOCGWINSZ, &ws) == -1)
+	if (ioctl(0, TIOCGWINSZ, &ws) == -1) {
+		*w = 80;
+		*h = 50;
 		return;
+	}
 
 	*w = ws.ws_col;
 	*h = ws.ws_row;
-- 
2.45.2

