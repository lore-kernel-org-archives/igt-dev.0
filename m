Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D9AE68974
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 11:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D1D10E0A1;
	Thu, 31 Oct 2024 11:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDCLt2yP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AF510E0A1
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 11:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730374269; x=1761910269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IVVL142Vvf8mZihtRk05mVfukW8tN/MLSZ4sCYyzA5M=;
 b=QDCLt2yPeiho758x4sn1IGcUFEvf7fH6e8NYcx04NfXPXqwDqGY+SdxX
 CmsUXtoXWrZc3WHM+Pfmat7Vlcle/C9BGoTLXnrJaq23A6Co/vscu6s4k
 nOV/MagQFSPateYGNcRWuHMi95oTIncWlw2hymNtthvAOVP5fsVmYaits
 RLswnFHjW7WngctGe8Tup/4/NKP0ljpuBBlYFfXIY+Vd224MzQQAwcQtB
 9FpFwdTaR5gqEJUKITaDsT/QrJSPVXGTkl1nMSDm3DXBTRcMwnHyavO7d
 vOG95cjBMLg0H+ST6jyAWws6nyDTOweZFuQyWX3SWXF3tBFAfFlkjtKr0 Q==;
X-CSE-ConnectionGUID: T/RROW1OQGyJ47WizOwSGw==
X-CSE-MsgGUID: s6Lw5OE+Smirn7SY3s3mvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52660778"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52660778"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 04:31:09 -0700
X-CSE-ConnectionGUID: r0JQc56DS16X0H6/PJatrw==
X-CSE-MsgGUID: Gc0dmu9dR6C8qAWwJsBQ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="83402540"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 04:31:08 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t] lib/xe/xe_eudebug: Deny unused triggers
Date: Thu, 31 Oct 2024 13:19:58 +0200
Message-Id: <20241031111958.524160-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

Assert that if you add a trigger, it is used.

Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 74aa26024..97ed71838 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -20,6 +20,7 @@
 struct event_trigger {
 	xe_eudebug_trigger_fn fn;
 	int type;
+	unsigned int count;
 	struct igt_list_head link;
 };
 
@@ -1014,8 +1015,26 @@ static void debugger_run_triggers(struct xe_eudebug_debugger *d,
 	struct event_trigger *t;
 
 	igt_list_for_each_entry(t, &d->triggers, link) {
-		if (e->type == t->type)
-			t->fn(d, e);
+		if (e->type != t->type)
+			continue;
+
+		t->fn(d, e);
+		++t->count;
+
+		igt_debug("Trigger run for %s:%d %d times\n",
+			  type_to_str(t->type), t->type,
+			  t->count);
+	}
+}
+
+static void debugger_check_triggers(struct xe_eudebug_debugger *d)
+{
+	struct event_trigger *t;
+
+	igt_list_for_each_entry(t, &d->triggers, link) {
+		igt_assert_f(READ_ONCE(t->count),
+			     "Trigger %s(%d): was never invoked\n",
+			     type_to_str(t->type), t->type);
 	}
 }
 
@@ -1223,7 +1242,7 @@ void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d,
 	t->fn = fn;
 
 	igt_list_add_tail(&t->link, &d->triggers);
-	igt_debug("added trigger %p\n", t);
+	igt_debug("Trigger added for %s:%d\n", type_to_str(t->type), t->type);
 }
 
 /**
@@ -1303,6 +1322,8 @@ void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d,
 	igt_assert_f(ret == 0 || ret != ESRCH,
 		     "pthread join failed with error %d!\n", ret);
 
+	debugger_check_triggers(d);
+
 	event_log_sort(d->log);
 }
 
@@ -1603,6 +1624,8 @@ void xe_eudebug_session_run(struct xe_eudebug_session *s)
  */
 void xe_eudebug_session_check(struct xe_eudebug_session *s, bool match_opposite, uint32_t filter)
 {
+	debugger_check_triggers(s->debugger);
+
 	xe_eudebug_event_log_compare(s->client->log, s->debugger->log, filter);
 
 	if (match_opposite)
-- 
2.34.1

