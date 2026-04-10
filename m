Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4C6E9904A
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 08:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE1289DFC;
	Fri, 10 Apr 2026 08:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bP6MIhbF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F48689DFC
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 08:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775808321; x=1807344321;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KJMoe2kFo8d8k4CQcWLT9xy4ZX3Tbvhzkq+iiKDuukw=;
 b=bP6MIhbFOCctIVU6qCGgvEaIPnfZT3rKKnrYgKUGpN4buU7VaMbRMvj+
 NX618VOlpTk3WliDL1vZSsAPPWzRA2EJc7AeNPWcbEUr9gN6StkN47b4H
 Kd5Sc/YpYiQ0EEH67ihKs3vGg5Xn8dyUmL0pT+z5QEg6TYSaBDopeVyy0
 +4Pk1qt6O5rcQInXAl6UYe3dOEF+RMQGkPQ+p3GXrN0zKvnFmwLCT5etf
 5Oxf3S6Nm9F34vtG2ReuRyXruudYMXMdBrLWkKi466BzRvJAJnwOvoYAi
 Mh0Lkc2ikd48xkRog85ef8AABx0YzeT/BYKfh9CyfVFwxie6UxE3bU/t0 w==;
X-CSE-ConnectionGUID: 4PMbsH3uQYuJQLkXLT3q0g==
X-CSE-MsgGUID: 9flOBb2tTea10i/a4jysDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87901556"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="87901556"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:05:20 -0700
X-CSE-ConnectionGUID: xdOct5+ZRnKp9d6m/Yp3tg==
X-CSE-MsgGUID: 7ofR3LUlT8eFRQXQRxFMKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="233103744"
Received: from jsokolow-alderlakeclientplatform.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:05:18 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, peter.senna@linux.intel.com,
 piotr.rudnicki@intel.com, mika.kuoppala@intel.com,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t 1/1] lib/xe/xe_eudebug: Remove unnecessary debug message
Date: Fri, 10 Apr 2026 10:10:44 +0200
Message-ID: <20260410081044.783673-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.43.0
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

"poll: timeout" message is a leftover development
artifact that no longer points to any problems
and makes output less readable.

Remove it.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 lib/xe/xe_eudebug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 3bffda561..1d9cb8289 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -325,7 +325,6 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 
 		ret = poll(&r, 1, interval_ms);
 		if (!ret) {
-			igt_debug("poll: timeout\n");
 			catch_child_failure();
 			t += interval_ms;
 		} else if (ret == -1) {
-- 
2.43.0

