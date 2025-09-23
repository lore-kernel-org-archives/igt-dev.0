Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D3FCAC5B0
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 13:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDE710E146;
	Tue, 23 Sep 2025 13:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RU/KFBgV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A89A10E12E
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758633024; x=1790169024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j/yNLDHRZw78iGMAzz3OYcNHMRkRzto4CTWazL5MsEg=;
 b=RU/KFBgVF9wym7LJqlRvIjPCt1jG6hBA7AZk30a8udWTArol/ppM9NzN
 2u9yg3O8XdfZgdt+iUrIhB8z+GeXOgn5A0yOIHCGoF/lJYqMtsoy30T0I
 QgVSLiUCHUp8OlDwQHxd5J59z0v3LYlriEEpW+LoFK+e45qBHGbpa7q7i
 vO8EFd5majWIDzr+skkGZOjMGlog29YRhJMu3JK5EM0095RU/jlPoiSJN
 kuMt7KngQIyQmCitH4/VvKF7jY4SSZJy/34rHjwyaxn59NnSGPwBBa/u/
 coOgloVP38okE/+7aVoifjDswkMQJ/QWe0s3OvzsOaj1AuqC2gcy2BvM1 w==;
X-CSE-ConnectionGUID: +cjS5DeYShyuvd8mCgSZIg==
X-CSE-MsgGUID: MuE5dA6FQ02nVJljKwlF0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61026868"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="61026868"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:10:23 -0700
X-CSE-ConnectionGUID: 2pnAL0koTRy1w5feSKTbrg==
X-CSE-MsgGUID: q5Avjfx+SauKN8HO8pOd8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="200461909"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.237])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:10:22 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v4 i-g-t 5/6] lib/xe_eudebug: Introduce
 xe_eudebug_debugger_kill
Date: Tue, 23 Sep 2025 15:10:01 +0200
Message-Id: <20250923131002.24708-6-dominik.karol.piatkowski@intel.com>
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

Introduce xe_eudebug_debugger_kill helper for issuing signals to
debugger thread. Passes the debugger struct to signal handler.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 13 +++++++++++++
 lib/xe/xe_eudebug.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 647da7b32..d3e9096c6 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1407,6 +1407,19 @@ void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage
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
index 46cd3463e..4d658e11b 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -164,6 +164,7 @@ void xe_eudebug_debugger_remove_trigger(struct xe_eudebug_debugger *d, int type,
 				     xe_eudebug_trigger_fn fn);
 void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t stage);
 void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage);
+void xe_eudebug_debugger_kill(struct xe_eudebug_debugger *d, int sig);
 
 struct xe_eudebug_client *
 xe_eudebug_client_create(int xe, xe_eudebug_client_work_fn work, uint64_t flags, void *data);
-- 
2.34.1

