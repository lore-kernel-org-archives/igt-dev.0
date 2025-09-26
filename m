Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EA8CAC5AC
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 07:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32E910E9E5;
	Fri, 26 Sep 2025 07:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKmBKODG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3951310E9FC
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872911; x=1790408911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=01yCfkkSCydu+zt4QQ+uUvoArxA4G6P5q2dq0o7BPSw=;
 b=gKmBKODG4oDE8wgPgY85oIbN1+Mn1rA0rMOxDMTdRI/rNWQaKmpF17/1
 yOiLVT8YnJXzmA9jOPVpSFW2vS7dGwrxQVSabdRa28sdsIKSil4Lk/gqV
 RIMwrGm5a3JqBkErPNThTaCLuZbN2h177zcEV/rQq9/2HQ/AZs++OyGqi
 dbTRMQOz5g/nHLTcdGFgfXvyROJNnbsnTcRy0oV/FKxGTLOyc6bwQCUnA
 AQxsM2QZwWs1qejb+QqN9UPef3+HRi1QA+QYhzNQhlpoRm/8OJDPyb+TK
 HjlmjmVXX8t+aPfFz0ZEXfnFli1s3TRPtGWOOJYscKMNsTsrCV9xzzrIM Q==;
X-CSE-ConnectionGUID: SyfyRQOMQHCOuZIeaW6Nxg==
X-CSE-MsgGUID: GP87jOk0RDOZ0Z2XfIJlfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61372388"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61372388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:26 -0700
X-CSE-ConnectionGUID: NjEGL14ATV+89NXa8oCSFA==
X-CSE-MsgGUID: /dvuvrRuSbCs71oCI5GTdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="208474230"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:25 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v7 i-g-t 6/9] lib/xe_eudebug: Improve SIGINT handling
Date: Fri, 26 Sep 2025 09:47:58 +0200
Message-Id: <20250926074801.9031-7-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
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
 lib/xe/xe_eudebug.c | 18 +++++++++++++++---
 lib/xe/xe_eudebug.h |  3 +++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 3495354e3..8276a6dab 100644
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
+	igt_assert(d);
+
+	if (sig == SIGINT)
+		d->received_sigint = true;
 }
 
 static void *debugger_worker_loop(void *data)
@@ -1094,12 +1099,17 @@ static void *debugger_worker_loop(void *data)
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
@@ -1170,6 +1180,8 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
 	d->fd = -1;
 	d->master_fd = master_fd;
 	d->ptr = data;
+	d->received_sigint = false;
+	d->handled_sigint = false;
 
 	return d;
 }
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 389572ed0..7c7a01471 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -44,6 +44,9 @@ struct xe_eudebug_debugger {
 	pthread_t worker_thread;
 	enum xe_eudebug_debugger_worker_state worker_state;
 
+	bool received_sigint;
+	bool handled_sigint;
+
 	int p_client[2];
 };
 
-- 
2.34.1

