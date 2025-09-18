Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EA8CAC5A0
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 12:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3656210E827;
	Thu, 18 Sep 2025 12:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Prmq1/dZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA4210E827
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 12:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758198859; x=1789734859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZEC3qhNK/mB4StNQrVjPdI3dQhSukpkKuIUTE0v2wwU=;
 b=Prmq1/dZo+YTRUl4IOXJv1Yo25RrK7GZWg1m/RawSw3bLmT02YSXyWSm
 fUmgSxKgGXWaEi0hImuvYV5BRtdLI0hhOdeh+7XEexIV7eAb6rkTHRGzC
 X+A7MOsO5PQYPvFipxL09Xs2jPJ3sEiO4I8428LblSfQr/MVNm5xPIwZ1
 W7NTy20YzcCvfFd2mUWWSAkQiXS3pYk38EUSR7QYji6XK+aU+LCm5R4sg
 D0RRxnTFux0j9CaV/4ZyORdTR4OLJhLOes8tJJz5xVNFpuencqcZp4bv2
 b3uIQHqJPR64YaQZOyf9FQouQxMLgPyBdTqs5WsA28nwkYYzpw+hn30Qe w==;
X-CSE-ConnectionGUID: ze/1tpuPQRmP1qt+9WW6VA==
X-CSE-MsgGUID: qRRjizIYRMumACV1GvWHIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="85966203"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="85966203"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:19 -0700
X-CSE-ConnectionGUID: j1VzzORnTEWyWDZwdWdTTA==
X-CSE-MsgGUID: 1Bj9mLrnSn+wTyVaJOGy1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="176328175"
Received: from rvuia-mobl.ger.corp.intel.com (HELO dpiatkow-mobl1.mshome.net)
 ([10.245.244.174])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:17 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 4/5] lib/xe_eudebug: Improve SIGINT handling
Date: Thu, 18 Sep 2025 14:34:00 +0200
Message-Id: <20250918123401.5433-5-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
References: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
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

Introduce received_sigint and handled_sigint variables to help with
coordination of handling SIGINT.

Use the received_sigint variable in debugger_worker_loop to safely kill
the thread, set handled_sigint to help with coordination outside the
debugger loop.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 15 ++++++++++++---
 lib/xe/xe_eudebug.h |  3 +++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index deaea25cd..8e23fec9b 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1072,9 +1072,11 @@ xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
 	return ret;
 }
 
-static void terminate_debugger(int sig)
+static void terminate_debugger(int sig, siginfo_t *info, void *context)
 {
-	pthread_exit(NULL);
+	struct xe_eudebug_debugger *d = info->si_ptr;
+
+	d->received_sigint = true;
 }
 
 static void *debugger_worker_loop(void *data)
@@ -1092,12 +1094,17 @@ static void *debugger_worker_loop(void *data)
 	igt_assert(d->master_fd >= 0);
 
 	igt_assert_eq(sigaction(SIGINT, NULL, &sa), 0);
-	sa.sa_handler = terminate_debugger;
+	sa.sa_sigaction = terminate_debugger;
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
@@ -1168,6 +1175,8 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
 	d->fd = -1;
 	d->master_fd = master_fd;
 	d->ptr = data;
+	d->received_sigint = false;
+	d->handled_sigint = false;
 
 	return d;
 }
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 8f7f66220..209a76b01 100644
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

