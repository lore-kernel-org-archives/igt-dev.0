Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1754CAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 12:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A1510E2C7;
	Thu, 25 Sep 2025 12:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JU5+zZ2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5D310E90A
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758803897; x=1790339897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FZ0RHRgYAL0clsdT0ow2XpF98bTR6+XJJZwQLnUI7eA=;
 b=JU5+zZ2GSajY9jGXgN3UfHJrXzKXojMUwr2ALCE5o9e2SjH74MZQIOxQ
 53jYiJcJysLQ/YJvZN/caJbX0+HRCYBC7ujoXOcaEtl/yx7/jnE6uWjco
 1STPG0242C0ffLcC4O3EGWAQs7BxYZeekIOLYogQgOWqQWjlHPkNcVXVd
 19+b1dsG15AoIXsxJfijzlHdklCk03XrcfRymTw2OZrLqWUzZcD3itFEp
 EaMetgjU64YDqsG9hEAuOu7GVF16GJ9ThEITd7C+iowX4GlJ2O0OneoW0
 /Mx3M9FO7irFmlI1D9HYIdeOAWQzRwMEfO5Bqu0b5xwUaAOeKP5eGI/Nf g==;
X-CSE-ConnectionGUID: 1QiRl9ncQNa24fzVCJIKRQ==
X-CSE-MsgGUID: MAmiA4WIQtCgG1eBA4Uj0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61226521"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="61226521"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:38:17 -0700
X-CSE-ConnectionGUID: DPNj38j9Rum7AKJkVvqqjA==
X-CSE-MsgGUID: 4l09ZVjfRX6vrJR2+KapLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176894496"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.53])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:38:16 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v6 i-g-t 8/9] lib/xe_eudebug: Introduce SIGTERM handling
Date: Thu, 25 Sep 2025 14:37:44 +0200
Message-Id: <20250925123745.15721-9-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925123745.15721-1-dominik.karol.piatkowski@intel.com>
References: <20250925123745.15721-1-dominik.karol.piatkowski@intel.com>
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

Add SIGTERM to signals that are handled by debugger_signal_handler.
Don't kill debugger thread on SIGTERM signal. Don't break on poll
failure if signal was received and errno is set to EINTR.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index a600931b7..dc4e3d959 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1104,6 +1104,11 @@ static void *debugger_worker_loop(void *data)
 	sa.sa_flags |= SA_SIGINFO;
 	igt_assert_eq(sigaction(SIGINT, &sa, NULL), 0);
 
+	igt_assert_eq(sigaction(SIGTERM, NULL, &sa), 0);
+	sa.sa_sigaction = debugger_signal_handler;
+	sa.sa_flags |= SA_SIGINFO;
+	igt_assert_eq(sigaction(SIGTERM, &sa, NULL), 0);
+
 	do {
 		p.fd = d->fd;
 		ret = poll(&p, 1, timeout_ms);
@@ -1113,6 +1118,13 @@ static void *debugger_worker_loop(void *data)
 		}
 
 		if (ret == -1) {
+			if (d->received_signal) {
+				d->received_signal = false;
+
+				if (errno == EINTR)
+					continue;
+			}
+
 			igt_info("poll failed with errno %d\n", errno);
 			break;
 		}
-- 
2.34.1

