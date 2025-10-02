Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B467CCAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 10:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644CC10E7B5;
	Thu,  2 Oct 2025 10:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1Mn7E8I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF3D10E7B5
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 10:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759401910; x=1790937910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hiyLAerGWKtvQ06ult84hR88ddLoWTaplf4pqH90ntw=;
 b=j1Mn7E8I1WwFNAANWwMUDa260mHPqYy05DDTKnro2omv/A/t+iUQ4ClT
 6KlE4XKmSMbgwJR7Nt0E3Uibesmvgaut5/NcNBusqQlnjmjG+j20nY2k1
 s/Dxh1frTTr1wUIK2mLckmMMXOAAI7/3MMStCGwSpsZlI1ngz4UnlNC+D
 3TkxLIJ/jAILL3uOOh1OG1AOVb73YuS1wtkPDTLDDiUEzo5JQuUs2m2iV
 7SROV8pvJj9d41FfI7cLJQ3KUC++lp8MZ2YQsBhrxfr10GlwAGYfa3P7P
 EAZv7PtBJv8QJ+tMMjwnGMdBAEyC8MiuO3DDfdehj72tXB2mK+gDqZMOo g==;
X-CSE-ConnectionGUID: gXid0PEjQRq8UuKmtGaL2A==
X-CSE-MsgGUID: 2aehEz5fSKen0G3br6aH5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60895261"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="60895261"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:45:10 -0700
X-CSE-ConnectionGUID: kFkOxUH4SdSgeJ0fWOzGWA==
X-CSE-MsgGUID: WXHYxWHKT/m9DlbH6U9lQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="184213242"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.176])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:45:08 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v10 i-g-t 07/10] lib/xe_eudebug: Improve SIGINT handling
Date: Thu,  2 Oct 2025 12:44:40 +0200
Message-Id: <20251002104443.7021-8-dominik.karol.piatkowski@intel.com>
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

Rewrite SIGINT signal handler to toggle a variable instead of calling
pthread_exit instantly, as the thread could be in critical section,
causing a deadlock on the attempt of next entry into that critical
section.

Use the received_sigint variable in debugger_worker_loop to safely kill
the thread.

Rename terminate_debugger to debugger_signal_handler to describe its
new function better.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_eudebug.c | 15 ++++++++++++---
 lib/xe/xe_eudebug.h |  2 ++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 74adeff35..6cea8286f 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1078,9 +1078,14 @@ xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
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
@@ -1098,12 +1103,15 @@ static void *debugger_worker_loop(void *data)
 	igt_assert(d->master_fd >= 0);
 
 	igt_assert_eq(sigaction(SIGINT, NULL, &sa), 0);
-	sa.sa_handler = terminate_debugger;
+	sa.sa_sigaction = debugger_signal_handler;
+	sa.sa_flags |= SA_SIGINFO;
 	igt_assert_eq(sigaction(SIGINT, &sa, NULL), 0);
 
 	do {
 		p.fd = d->fd;
 		ret = poll(&p, 1, timeout_ms);
+		if (d->received_sigint)
+			pthread_exit(NULL);
 
 		if (ret == -1) {
 			if (errno == EINTR)
@@ -1177,6 +1185,7 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
 	d->fd = -1;
 	d->master_fd = master_fd;
 	d->ptr = data;
+	d->received_sigint = false;
 
 	return d;
 }
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 389572ed0..dd5c5e20a 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -44,6 +44,8 @@ struct xe_eudebug_debugger {
 	pthread_t worker_thread;
 	enum xe_eudebug_debugger_worker_state worker_state;
 
+	bool received_sigint;
+
 	int p_client[2];
 };
 
-- 
2.34.1

