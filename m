Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1ACCAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 12:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0474510E1BC;
	Wed, 24 Sep 2025 12:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMkyrHTo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F02410E728
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758717711; x=1790253711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yRJEObT4LYiURtlSDY7yKuLFtXj2LsVVXFAO/dJx8XM=;
 b=PMkyrHToPT3pQOOC9ue08XYid+lUmerPXZaeaFe7jcVV6sLzNuPlTbLn
 KXnaq+Wh5WeFGXHl9xGFfd+7QraOHatk9dXVHt6imVycbLLBYxYGxcQ57
 cLR8GkNpuXnDmsQgUpxBgbrBHxW1id2hXbG3f0nQFxuB3MkcNh7oZuDtP
 hLfRNxWOSHlT8r1Z4b0bxsP3g4Lenvp+9fmPd9EScaZAzYwtHQhGDmi/R
 Wg72Dv6ws1D9+zwl4QvQdy91cXH5SX2wQPwhK8d3TeXl+9ZIvdwWLE2uG
 UHzKw+u89eMDWhaMe6p8zCIwKXIGY7OeinCKZHKfDUi85WP20EfoX1cdY w==;
X-CSE-ConnectionGUID: f42kKhlQRuCQAXpaCtmqGg==
X-CSE-MsgGUID: RiMkjK06Rnm9DcQbFRljOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61182105"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="61182105"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:50 -0700
X-CSE-ConnectionGUID: 5lYKUOAOTba4ukZxUPetlQ==
X-CSE-MsgGUID: Ow+OnglKSn6G/mfeEMtGsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177459903"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:48 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v5 i-g-t 5/6] lib/xe_eudebug: Introduce
 xe_eudebug_debugger_kill
Date: Wed, 24 Sep 2025 14:41:22 +0200
Message-Id: <20250924124123.14792-6-dominik.karol.piatkowski@intel.com>
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

Introduce xe_eudebug_debugger_kill helper for issuing signals to
debugger thread. Passes the debugger struct to signal handler.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_eudebug.c | 13 +++++++++++++
 lib/xe/xe_eudebug.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 5e8336e30..cf04c6e6e 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1414,6 +1414,19 @@ void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage
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

