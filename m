Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B25CAC5B2
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 13:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54EC10E12E;
	Tue, 23 Sep 2025 13:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCM/w9nF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C5410E12E
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758633022; x=1790169022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sW+y30xNiiU+i7SCShlEffIf6oc7m/p093PP2+ztjzo=;
 b=CCM/w9nFCZw8DTeCqnvxa03w3pgpjOzjPTsuUf3t2yBwQNwvCZBE8XEw
 Pz4OXUrXF2q22UlA8HeSgRwOnazV/hDx6bmzqQ92jVH57hBtFLMnG4CF0
 ReC0Z9s2stduNFOgy2Jh0TY9WOcz7jsYMTHcLvN12PKXJ+YYlovE1pVHM
 X5x/FNPxfBBEqte45//B1+V19fTaSHVUK775qW6kKS3UnQal5ZVnFKYTC
 9g2qJJjR1CMIxVcVieUpV9lmj4sxdKweJgVzINFGM0gF7VGlznftwlt4a
 84yrqpB12mAt+dLXqwPnXF7TujEhA/DV9jHGWxdI1gA2dKSqdApEiAn2j g==;
X-CSE-ConnectionGUID: z0G9z03CQH+5XAFtg2k9og==
X-CSE-MsgGUID: UfgEtvUXTXWEoQ454qFx1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61026866"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="61026866"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:10:22 -0700
X-CSE-ConnectionGUID: APsHe/KjTjCzCJ3OdfNs4g==
X-CSE-MsgGUID: 5ZNG7WMDTGKpz5U81jr6SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="200461896"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.237])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:10:20 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v4 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
Date: Tue, 23 Sep 2025 15:10:00 +0200
Message-Id: <20250923131002.24708-5-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
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

Rewrite SIGINT signal handler to toggle a variable instead of calling
pthread_exit instantly, as the thread could be in critical section,
causing a deadlock on the attempt of next entry into that critical
section.

Introduce received_signal, received_sigint and handled_sigint variables
to help with coordination of handling SIGINT and other signals.

Use the received_sigint variable in debugger_worker_loop to safely kill
the thread, set handled_sigint to help with coordination outside the
debugger loop.

Rename terminate_debugger to debugger_signal_handler to describe its
new function better. Add SIGTERM to signals that are handled by
debugger_signal_handler.

Don't kill debugger thread on non-SIGINT signals. Don't break on poll
failure if signal was received.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 26 ++++++++++++++++++++++----
 lib/xe/xe_eudebug.h |  4 ++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index deaea25cd..647da7b32 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1072,9 +1072,14 @@ xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
 	return ret;
 }
 
-static void terminate_debugger(int sig)
+static void debugger_signal_handler(int sig, siginfo_t *info, void *context)
 {
-	pthread_exit(NULL);
+	struct xe_eudebug_debugger *d = info->si_ptr;
+
+	d->received_signal = true;
+
+	if (sig == SIGINT)
+		d->received_sigint = true;
 }
 
 static void *debugger_worker_loop(void *data)
@@ -1092,14 +1097,24 @@ static void *debugger_worker_loop(void *data)
 	igt_assert(d->master_fd >= 0);
 
 	igt_assert_eq(sigaction(SIGINT, NULL, &sa), 0);
-	sa.sa_handler = terminate_debugger;
+	sa.sa_sigaction = debugger_signal_handler;
+	sa.sa_flags |= SA_SIGINFO;
 	igt_assert_eq(sigaction(SIGINT, &sa, NULL), 0);
 
+	igt_assert_eq(sigaction(SIGTERM, NULL, &sa), 0);
+	sa.sa_sigaction = debugger_signal_handler;
+	sa.sa_flags |= SA_SIGINFO;
+	igt_assert_eq(sigaction(SIGTERM, &sa, NULL), 0);
+
 	do {
 		p.fd = d->fd;
 		ret = poll(&p, 1, timeout_ms);
+		if (d->received_sigint) {
+			d->handled_sigint = true;
+			pthread_exit(NULL);
+		}
 
-		if (ret == -1) {
+		if (!d->received_signal && ret == -1) {
 			igt_info("poll failed with errno %d\n", errno);
 			break;
 		}
@@ -1168,6 +1183,9 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
 	d->fd = -1;
 	d->master_fd = master_fd;
 	d->ptr = data;
+	d->received_signal = false;
+	d->received_sigint = false;
+	d->handled_sigint = false;
 
 	return d;
 }
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 8f7f66220..46cd3463e 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -44,6 +44,10 @@ struct xe_eudebug_debugger {
 	pthread_t worker_thread;
 	enum xe_eudebug_debugger_worker_state worker_state;
 
+	bool received_signal;
+	bool received_sigint;
+	bool handled_sigint;
+
 	int p_client[2];
 };
 
-- 
2.34.1

