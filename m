Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3BAC3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A0C10E515;
	Tue, 30 Jul 2024 11:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ez/x5Xa3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5FD10E515
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340071; x=1753876071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LTaGx//pvJwlsorKbT8Mc5n1/6iWmoEBHP6UtJKut8c=;
 b=ez/x5Xa33QtBQoinlEaE3wktEuZmFYlzaWBWwVUL0gMcCo94tgVaVbcL
 xiYySgLJn8tFKZzbqqr3hc/S97R32nNYSy7x0S6DVBr/5LOVGE/Mq9yq0
 JZu6yJZzgu4lho1dhg47WUmR3iZ2JPSUXQyMWqg11r6iDKljJJy/KAYdj
 EaVHX30t3tyFtOrlB2F/pUPmDlvtQmFuC3XzdgVAPgUsE5Uc5MGqepQtA
 QfNJAj8Ur8V79afjKcRz6Ymc3WRCZ1DQL5MbOvVXCC+pfiF6GDurQYGRL
 LdGp9ShQNIY1Wbo81lwd4LjKPJnbLEsuOy0OE7e9iisVz3IlL1tT19xaY g==;
X-CSE-ConnectionGUID: rR2Z4awAT2Su8q0TQenAqQ==
X-CSE-MsgGUID: ksooehR0S96FXcEdlUucnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937301"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937301"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:51 -0700
X-CSE-ConnectionGUID: DynvDerOREa8dMzarCCX2w==
X-CSE-MsgGUID: J7QHNnVNSVuGvlgBApqbvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216787"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:47 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 23/66] lib/xe_eudebug: Allow debugger to wait for
 client
Date: Tue, 30 Jul 2024 13:44:40 +0200
Message-Id: <20240730114523.334156-24-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
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

In some tests, we need to pause the debugger at a certain stage as
the point at which the client performs certain activities, determines
the executed code path in the driver.

Add a possibility to pause debugger and to signal continuation by
the client.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 37 +++++++++++++++++++++++++++++++++++++
 lib/xe/xe_eudebug.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 36eef25c7..ed1e382c7 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -45,6 +45,7 @@ struct match_dto {
 #define CLIENT_FINI 3
 #define CLIENT_STOP 4
 #define CLIENT_STAGE 5
+#define DEBUGGER_STAGE 6
 
 #define DEBUGGER_WORKER_INACTIVE  0
 #define DEBUGGER_WORKER_ACTIVE  1
@@ -1250,6 +1251,29 @@ void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t st
 	token_signal(d->p_client, CLIENT_STAGE, stage);
 }
 
+/**
+ * xe_eudebug_debugger_wait_stage:
+ * @s: pointer to xe_eudebug_debugger structure
+ * @stage: stage to wait on
+ *
+ * Pauses debugger until the client has signalled the corresponding stage with
+ * xe_eudebug_client_signal_stage. This is only for situatuons where the actual
+ * event flow is not enough to coordinate between client/debugger and extra sync
+ * mechanism is needed.
+ */
+void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage)
+{
+	u64 stage_in;
+
+	igt_debug("debugger xe client fd: %d pausing for stage %lu\n", s->d->master_fd, stage);
+
+	stage_in = wait_from_client(s->c, DEBUGGER_STAGE);
+	igt_debug("debugger xe client fd: %d stage %lu, expected %lu, stage\n", s->d->master_fd,
+		  stage_in, stage);
+
+	igt_assert_eq(stage_in, stage);
+}
+
 /**
  * xe_eudebug_client_create:
  * @master_fd: xe client used to open the debugger connection
@@ -1397,6 +1421,19 @@ void xe_eudebug_client_wait_done(struct xe_eudebug_client *c)
 	}
 }
 
+/**
+ * xe_eudebug_client_signal_stage:
+ * @c: pointer to the client
+ * @stage: stage to signal
+ *
+ * Signals to debugger, waiting in xe_eudebug_debugger_wait_stage(),
+ * releasing it to proceed.
+ */
+void xe_eudebug_client_signal_stage(struct xe_eudebug_client *c, uint64_t stage)
+{
+	token_signal(c->p_out, DEBUGGER_STAGE, stage);
+}
+
 /**
  * xe_eudebug_client_wait_stage:
  * @c: pointer to xe_eudebug_client structure
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 1343cb25c..81c33417f 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -135,6 +135,7 @@ void xe_eudebug_debugger_set_data(struct xe_eudebug_debugger *c, void *ptr);
 void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d, int type,
 				     xe_eudebug_trigger_fn fn);
 void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t stage);
+void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage);
 
 struct xe_eudebug_client *
 xe_eudebug_client_create(int xe, xe_eudebug_client_work_fn work, uint64_t flags, void *data);
@@ -142,6 +143,7 @@ void xe_eudebug_client_destroy(struct xe_eudebug_client *c);
 void xe_eudebug_client_start(struct xe_eudebug_client *c);
 void xe_eudebug_client_stop(struct xe_eudebug_client *c);
 void xe_eudebug_client_wait_done(struct xe_eudebug_client *c);
+void xe_eudebug_client_signal_stage(struct xe_eudebug_client *c, uint64_t stage);
 void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage);
 
 uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c);
-- 
2.34.1

