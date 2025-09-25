Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6E2CAC5A7
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 12:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD71210E8FD;
	Thu, 25 Sep 2025 12:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b67f9vlR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988BB10E906
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 12:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758803895; x=1790339895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i/J1drfzpx1hexPvQOjkwSeC1Shj+7j49+OActL4IZg=;
 b=b67f9vlRlnDU97YwWa3KtHeL3J86sNNfZT19XFRPNibnB9CMqySaxIOR
 Ilsks24NN8nrX2uIZm0xnbjzn18gorUis/y7skT/LN/pxwlBRL4d47+Mg
 l0wM2zzYYvsbs+tD1V817rGMNm/Kzs7QHRUnRl54/ZDay8Ri9Geooywv1
 WrbVdRE+sobslfPpXQ5L57U/sr90Q5mnca5MmfiXjRGAX0eZvsfyemszT
 EvO9IMh40HTMMkoJNimgbNMLO+HBEXYgXvd4+VFN5AegcQW/73OcqRJFc
 D1EjXE2rTFFsqQZs/mOkF5Zhg0DpO2+E7HYv51s/6lD9U95PM4iRmWtRp Q==;
X-CSE-ConnectionGUID: BONRyVl/T7ibuAxaAyARtg==
X-CSE-MsgGUID: dgkrOy7oSAq+k98Hv1tTog==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61226520"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="61226520"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:38:15 -0700
X-CSE-ConnectionGUID: y9871OD9RIObAOIoin9snQ==
X-CSE-MsgGUID: F2YMftjLQ4efu06cxFt5iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176894482"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.53])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:38:14 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v6 i-g-t 7/9] lib/xe_eudebug: Improve SIGINT handling
Date: Thu, 25 Sep 2025 14:37:43 +0200
Message-Id: <20250925123745.15721-8-dominik.karol.piatkowski@intel.com>
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

Rewrite SIGINT signal handler to toggle a variable instead of calling
pthread_exit instantly, as the thread could be in critical section,
causing a deadlock on the attempt of next entry into that critical
section.

Use the received_sigint variable in debugger_worker_loop to safely kill
the thread, set handled_sigint to help with coordination outside the
debugger loop.

Rename terminate_debugger to debugger_signal_handler to describe its
new function better.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 512c81bf5..a600931b7 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1074,9 +1074,15 @@ xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
 	return ret;
 }
 
-static void terminate_debugger(int sig)
+static void debugger_signal_handler(int sig, siginfo_t *info, void *context)
 {
-	pthread_exit(NULL);
+	struct xe_eudebug_debugger *d = info->si_ptr;
+
+	igt_assert(d);
+	d->received_signal = true;
+
+	if (sig == SIGINT)
+		d->received_sigint = true;
 }
 
 static void *debugger_worker_loop(void *data)
@@ -1094,12 +1100,17 @@ static void *debugger_worker_loop(void *data)
 	igt_assert(d->master_fd >= 0);
 
 	igt_assert_eq(sigaction(SIGINT, NULL, &sa), 0);
-	sa.sa_handler = terminate_debugger;
+	sa.sa_sigaction = debugger_signal_handler;
+	sa.sa_flags |= SA_SIGINFO;
 	igt_assert_eq(sigaction(SIGINT, &sa, NULL), 0);
 
 	do {
 		p.fd = d->fd;
 		ret = poll(&p, 1, timeout_ms);
+		if (d->received_sigint) {
+			d->handled_sigint = true;
+			pthread_exit(NULL);
+		}
 
 		if (ret == -1) {
 			igt_info("poll failed with errno %d\n", errno);
-- 
2.34.1

