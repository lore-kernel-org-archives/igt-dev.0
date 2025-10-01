Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61966CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 11:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDBD10E6CF;
	Wed,  1 Oct 2025 11:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bd6eC+rz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D6310E6C8
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319715; x=1790855715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8UfDmroxJbx77S12KEMMRs2qyp/X9QcCAwMTWYYYPqE=;
 b=bd6eC+rzffHtlHXqm9aqj4CV7YIky/H5ZUqgpfNBKuSLDISuZQnyN3Ck
 3C5O075Ua97Ywc2QXf1zF55A6WqAn1Ma4voaDRo8/0iLLUi7Ibah2DVHT
 8crApjsmzsx71mr/DlCusm9SKUFlL+6Fm3qXKelASCvMAlykVEB4d4qSG
 POxm8VhTvpmGH1PzmkXoQvBRfy+9manmiaJ5sCnrwGucepxrPUEn747c/
 C8tWGYJl4E9QvO236MYdtu26Z1bzAtVZdtUK4N0wze61WXdUZZDtiadDz
 NVjUkuW08w/Ht/dB1GFQrUNXciuUtfuVtqoN1LF2V1pPRtGEzYpmz2OQK g==;
X-CSE-ConnectionGUID: tkvGo2icQIONYkamnxIpyw==
X-CSE-MsgGUID: 1bhsLlSmTl2Hufz8/JqZOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73014974"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="73014974"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:15 -0700
X-CSE-ConnectionGUID: kRryVviuRBOkBOQvmeHbSg==
X-CSE-MsgGUID: BhKk6u7MTx+xHPAZ+Fcz6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209496233"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:13 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v9 i-g-t 04/10] lib/xe_eudebug: Introduce
 xe_eudebug_debugger_kill
Date: Wed,  1 Oct 2025 13:54:41 +0200
Message-Id: <20251001115447.11843-5-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
References: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
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
index 1aa10eee1..614f327ae 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1393,6 +1393,19 @@ void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage
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

