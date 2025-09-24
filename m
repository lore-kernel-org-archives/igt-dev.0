Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F63CAC5B0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 12:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112BF10E236;
	Wed, 24 Sep 2025 12:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQCrNGIU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D86A10E162
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 12:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758717709; x=1790253709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FNLs15TQS8PaTVnzIYDAuVmAm3GN8ExvmzlxP3rTIfg=;
 b=CQCrNGIUGLO44Q2+6Kz32F7ES4KshpTbOgTCjshAIZKSej3RpVRCIE2B
 25FK3JFRJe5fhUjdgbJ2iRwsXFPWNeF+jOfyHzrIz8WNrnMUQxXxzAfHf
 1YwaZrUEb9akYD4pMQl++OnGSVUmsr7w3BNChVat4QftPxkDeVplxnVjQ
 sImEVB9QEo5CR6mXQQVaNtMQC+DbDxXHbJYHcoQKLXDqhUPeFMRybt1pH
 JXSFF2Kxolg9nw4P3D5iDWDMGGRAcZxIueSwPmj0jc2IAktE+xSc8rInO
 1nbmEQWzF5GIbOAQYgWUsdBMccWY/nIQ8FqoOWUDvxA7ac1dntjRpgA4l Q==;
X-CSE-ConnectionGUID: KpuIvZEoQHit+dMJ/JojTA==
X-CSE-MsgGUID: RnHFXpQiRdyqOMKTKinbPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61182099"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="61182099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:49 -0700
X-CSE-ConnectionGUID: yRSX9/RnRcWmn0CKPrkimg==
X-CSE-MsgGUID: kbFxJUfTRIKLK3GFDQTPPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177459894"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:47 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v5 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
Date: Wed, 24 Sep 2025 14:41:21 +0200
Message-Id: <20250924124123.14792-5-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924124123.14792-1-dominik.karol.piatkowski@intel.com>
References: <20250924124123.14792-1-dominik.karol.piatkowski@intel.com>
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

Don't kill debugger thread on SIGTERM signal. Don't break on poll
failure if signal was received and errno is set to EINTR.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 31 +++++++++++++++++++++++++++----
 lib/xe/xe_eudebug.h |  4 ++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 0c3262c41..5e8336e30 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1074,9 +1074,14 @@ xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
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
@@ -1094,14 +1099,29 @@ static void *debugger_worker_loop(void *data)
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
+
+		if (!d->received_signal && ret == -1) {
+			d->received_signal = false;
+
+			if (errno == EINTR)
+				continue;
 
-		if (ret == -1) {
 			igt_info("poll failed with errno %d\n", errno);
 			break;
 		}
@@ -1170,6 +1190,9 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
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

