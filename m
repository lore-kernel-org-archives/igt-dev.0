Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6D7CAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 10:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6663710E7C2;
	Thu,  2 Oct 2025 10:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMPRwwYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F3710E7C2
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 10:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759401914; x=1790937914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SL58z/Opk1b/SpwZZOFlddjnkjb2wX8SQqiyHTgEwuw=;
 b=HMPRwwYvLLNiNO1xV3/SS3CyVaczf5K3q7x9U5rDnKs9yhRSok6xWj5v
 S6WpiFk8yIGTS7iC6VP06owi6A0Ctv89ITNPDqLUHMy7Bq7/N9YHrxofa
 gp0daZZoWBM7YUumEoq3SxlkoPzENg9GqDRTtqjW7nfdD48XRuuruTlS2
 xx8PHm7wjRKoXXgZtfg77H+R3e6STyMcfY9agNRg4zadGnne1EkYYZzWt
 sVsKTlzCgcoDofRHX/p9/CmbhFcP69U+uzPgh9Tx9EFAPJfW3Pfws0XEp
 rPMy5gDlMC1vFSY1H9UsEOCLaGLYlHRHEHubfsKMKoDUrYCZ9Tl/aq0Gj g==;
X-CSE-ConnectionGUID: vIw1n385QhSfr2LtVUU6hg==
X-CSE-MsgGUID: sIHPXOswQJ6tGHAro5v7tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60895279"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="60895279"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:45:13 -0700
X-CSE-ConnectionGUID: zWtgyTk9R869V5mDK+XyQg==
X-CSE-MsgGUID: jCv8hPAiRiuE6UVnsJ+fGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="184213258"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.176])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:45:12 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v10 i-g-t 09/10] lib/xe_eudebug: Introduce SIGTERM handling
Date: Thu,  2 Oct 2025 12:44:42 +0200
Message-Id: <20251002104443.7021-10-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002104443.7021-1-dominik.karol.piatkowski@intel.com>
References: <20251002104443.7021-1-dominik.karol.piatkowski@intel.com>
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
Don't kill debugger thread on SIGTERM signal.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_eudebug.c | 16 ++++++++++++++--
 lib/xe/xe_eudebug.h |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 4f8bb4b7d..407940e12 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1084,6 +1084,8 @@ static void debugger_signal_handler(int sig, siginfo_t *info, void *context)
 
 	igt_assert(d);
 
+	d->received_signal = true;
+
 	if (sig == SIGINT)
 		d->received_sigint = true;
 }
@@ -1107,6 +1109,11 @@ static void *debugger_worker_loop(void *data)
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
@@ -1116,8 +1123,12 @@ static void *debugger_worker_loop(void *data)
 		}
 
 		if (ret == -1) {
-			if (errno == EINTR)
-				continue;
+			if (d->received_signal) {
+				d->received_signal = false;
+
+				if (errno == EINTR)
+					continue;
+			}
 
 			igt_info("poll failed with errno %d\n", errno);
 			break;
@@ -1189,6 +1200,7 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
 	d->ptr = data;
 	d->received_sigint = false;
 	d->handled_sigint = false;
+	d->received_signal = false;
 
 	return d;
 }
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 7c7a01471..d2f64fe4c 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -46,6 +46,7 @@ struct xe_eudebug_debugger {
 
 	bool received_sigint;
 	bool handled_sigint;
+	bool received_signal;
 
 	int p_client[2];
 };
-- 
2.34.1

