Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EB9CAC5AC
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 07:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E24610E9F7;
	Fri, 26 Sep 2025 07:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTDnrA5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691C910E9F7
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 07:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872903; x=1790408903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=axPoLc8RpFvxfam1Ief2R0z9UXDExMRAV8rXW1RwV/M=;
 b=dTDnrA5fanlBwpHsnPjZikL0UWbEO2SG7zaoANoyq7TcE5Ehd7g47pZs
 fNFzRtrDZ+rKYCNKrOMgHmOiR2m2yFyZXL4lgiucYLz8ak/PdqtkN9qg5
 WvYKsvsQEvwyZ2daF2cwfJTTgFo7Dnv6g+KTNROemj07hPy/mhWdG+vE8
 73yV3/4ADzeNFtjizxtSMF0kmlekC+2tOc8hKMx9alOGNXfLIOHBuhBmS
 h54XeEe43NfsGXjlZMfqCeVJ23M62EKwPLQbDYjo+lXeRV9yD81ORPKUc
 PLLi8Ua5My7fL6jtNiJr9d9G/gvEY9Tpi68tUQizeEt025QrH9rsovD/M g==;
X-CSE-ConnectionGUID: GULX25wmSQKe8FNHY0VxwA==
X-CSE-MsgGUID: 6bCLjRHqQjiDtvbgW+m4oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61372381"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61372381"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:23 -0700
X-CSE-ConnectionGUID: q2qhfEekR7idJgpzcR4fpA==
X-CSE-MsgGUID: GMjjhtN2TU2ZDOBNwzAMig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="208474218"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:22 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v7 i-g-t 4/9] lib/xe_eudebug: Introduce
 xe_eudebug_debugger_kill
Date: Fri, 26 Sep 2025 09:47:56 +0200
Message-Id: <20250926074801.9031-5-dominik.karol.piatkowski@intel.com>
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

Introduce xe_eudebug_debugger_kill helper for issuing signals to
debugger thread. Passes the debugger struct to signal handler.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_eudebug.c | 13 +++++++++++++
 lib/xe/xe_eudebug.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 0c3262c41..3495354e3 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1391,6 +1391,19 @@ void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage
 	igt_assert_eq(stage_in, stage);
 }
 
+/**
+ * xe_eudebug_debugger_kill:
+ * @d: pointer to the debugger
+ * @sig: signal to send
+ *
+ * Sends @sig signal to the debugger thread.
+ * Passes the debugger struct to signal handler.
+ */
+void xe_eudebug_debugger_kill(struct xe_eudebug_debugger *d, int sig)
+{
+	pthread_sigqueue(d->worker_thread, sig, (union sigval){ .sival_ptr = (void*)d });
+}
+
 /**
  * xe_eudebug_client_create:
  * @master_fd: xe client used to open the debugger connection
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 8f7f66220..389572ed0 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -160,6 +160,7 @@ void xe_eudebug_debugger_remove_trigger(struct xe_eudebug_debugger *d, int type,
 				     xe_eudebug_trigger_fn fn);
 void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t stage);
 void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage);
+void xe_eudebug_debugger_kill(struct xe_eudebug_debugger *d, int sig);
 
 struct xe_eudebug_client *
 xe_eudebug_client_create(int xe, xe_eudebug_client_work_fn work, uint64_t flags, void *data);
-- 
2.34.1

