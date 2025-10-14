Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB1ECCD190
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 09:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B111310E588;
	Tue, 14 Oct 2025 09:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PgpJPrMY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028C710E588
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760434745; x=1791970745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=29iZGA+oic7SCkFYStzowpPujVEYrUEH3Yqo2o7eZTs=;
 b=PgpJPrMYiV//d/0GIRASNRxwAq8u8uAA2rFvVY5SnuviwGtelVQVLRwP
 /ttW3tywwA34/eHEKL9vX/tAvcbvQqQPNLe0gG1TJ2OLG0/zqMjKlHc8K
 kuhbxYWg0EskTiz+FjTSuFyMhKreWy/8mNiamYIXGFbjPtxsaRzyEL1bT
 awQKdJTtj9zEDu8itcNDqFaHufB3XfkcA1xrhesO6b6ebhh4X/DkwsT3K
 nSM8N8vSbNHEosbbGOgPjBgTFx4yOGf3IIyO5JJwuFAtzUZ9lvdQ4gdH7
 P6cQDmXowU5igY17FYX1NWWJkBP9MSoAAKNgDZkconHxeToeitAoLnBBC g==;
X-CSE-ConnectionGUID: jEoulnlqSW+64DjvUt0A0g==
X-CSE-MsgGUID: n03o9dRQSAS2cG9L5hNhQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73192499"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73192499"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:05 -0700
X-CSE-ConnectionGUID: 2nUOwo9JQ5m/WtWsQAhZsQ==
X-CSE-MsgGUID: XCJYtSpITzOtDcIE5U7YnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181066476"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.244.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:03 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 1/7] lib/xe/xe_eudebug: fortify xe_eudebug_for_each_event
Date: Tue, 14 Oct 2025 12:38:42 +0300
Message-ID: <20251014093848.2394531-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
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

Add rigorous checking for xe_eudebug_for_each_event so
that we catch errors early if unitialized data is fed
into the macro.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c |  1 -
 lib/xe/xe_eudebug.h | 45 ++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 407940e122..4bf697a45e 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1061,7 +1061,6 @@ static void debugger_run_triggers(struct xe_eudebug_debugger *d,
 	}
 }
 
-#define MAX_EVENT_SIZE (32 * 1024)
 static int
 xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
 {
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index d2f64fe4c4..db79726c00 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -8,6 +8,7 @@
 #include <xe_drm.h>
 #include <xe_drm_eudebug.h>
 
+#include "igt_core.h"
 #include "igt_list.h"
 
 struct xe_eudebug_event_log {
@@ -90,11 +91,45 @@ typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
 		if (hwe__->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
 		    hwe__->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
 
-#define xe_eudebug_for_each_event(_e, _log) \
-	for ((_e) = (_e) ? (void *)(uint8_t *)(_e) + (_e)->len : \
-		    (void *)(_log)->log; \
-	    (uint8_t *)(_e) < (_log)->log + (_log)->head; \
-	    (_e) = (void *)(uint8_t *)(_e) + (_e)->len)
+#define MAX_EVENT_SIZE (32 * 1024)
+
+static inline struct drm_xe_eudebug_event *
+next_event(struct drm_xe_eudebug_event *e, struct xe_eudebug_event_log *l)
+{
+	uint8_t *start;
+	uint8_t *end;
+
+	igt_assert(l);
+	igt_assert(l->log);
+	igt_assert(l->head <= l->max_size);
+
+	if (!e)
+		return (struct drm_xe_eudebug_event *)l->log;
+
+	start = (uint8_t *)e;
+
+	if (start == l->log + l->head)
+		return NULL;
+
+	igt_assert(start >= l->log);
+	igt_assert(start < l->log + l->head);
+	igt_assert(e->len);
+	igt_assert(e->len <= MAX_EVENT_SIZE);
+
+	end = (uint8_t *)e + e->len;
+
+	if (end == l->log + l->head)
+		return NULL;
+
+	igt_assert(end < l->log + l->head);
+
+	return (struct drm_xe_eudebug_event *)end;
+}
+
+#define xe_eudebug_for_each_event(_e, _log)	\
+    for ((_e) = next_event((_e), (_log)); \
+         (_e); \
+         (_e) = next_event((_e), (_log)))
 
 #define xe_eudebug_assert(d, c)						\
 	do {								\
-- 
2.43.0

