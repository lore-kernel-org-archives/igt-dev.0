Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553F6CCA475
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 10:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B5C10E565;
	Tue, 30 Sep 2025 10:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KR4uHJNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5030910E562
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759228950; x=1790764950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iq5bakV1yq/Fpatk9nPPEY7DfzrYI5xwE3ilvACGUh4=;
 b=KR4uHJNAlb+OEJ80uFfQfc4uqzDab0LWUDiAQzYchYi//tPOvdudUwGD
 JgJd3rOfouZo/lzVbnYOaIDrFZWxks2hIekPsFBvCUI54ln9c/jP2V4ta
 pojltgcwGL1nNRmOq2NHh4z6Bwp4H4xuw8MINbanb5mzdDu9fVSWGqOy5
 ha/MO9FHYwgRjkpkN7cQmwIMB2GRWl5Ccd5kxPOqy6RHJSsEQB95VgExu
 D3LFsArU51++vXp8f2mSbmfWlvfuWNR617pwMc6PoKVir61V7visWsw4L
 ApoDRyvT60nwg8f7LghUDupWzyb3BXguI00jNfI1pH+cswa8owzwKJDYQ w==;
X-CSE-ConnectionGUID: nHGNhMC6TECDOEfPqWA1IA==
X-CSE-MsgGUID: gDKXDK7QQyGVXKSIEEzn5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61371489"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61371489"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:28 -0700
X-CSE-ConnectionGUID: XbNAP5lkRZq9SA027D6PfA==
X-CSE-MsgGUID: D4SNryMCTWC/+iLT1i2ehg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178446590"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:27 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v8 i-g-t 4/9] lib/xe_eudebug: Introduce
 xe_eudebug_debugger_kill
Date: Tue, 30 Sep 2025 12:42:04 +0200
Message-Id: <20250930104209.22462-5-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
References: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
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
index e2a8ff559..18119c32e 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1394,6 +1394,19 @@ void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage
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

