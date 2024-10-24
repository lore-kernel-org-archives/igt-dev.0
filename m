Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F4DCE8E65
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 11:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C7610E900;
	Thu, 24 Oct 2024 11:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIPhJ+RP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A9B10E900
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729769367; x=1761305367;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NT5Dek6gqNnko5v2226Riodig2xYz6b57VVFRg5FSDo=;
 b=PIPhJ+RPlNXoRKCq5q1DYBptyfCL4djQ0r/x3lDYrL0iIXTTF38+eJ9r
 X8blQCsF18q8BpLvQDj4o/efd4ODiJLPMiFIFLract0lGl1lRgUg2vHyo
 pDt8KE8vSWsaxCtM5PmMkJ8dUfUciOT6D2viGSFuto1pa0gDxVixKrVc5
 bOAEViZRLEb1VUnqkTQTOU4DjKlsBaywR3+QNpySbsYTyr8+QoEN07QcC
 pmbX3hO5yT7VaEL7qam1wk0w9wOiln8aeeNnCgBYyTJO0xsXhmVXzrfVC
 69VV5lFbefO34ZlSxOBLtlf7AvP9QXf/uKdAr3JC2r14Td/8tP1BHi1X+ Q==;
X-CSE-ConnectionGUID: mBnwMQuST5q/GasHNbzVUw==
X-CSE-MsgGUID: hkQrkKZuSvmbb9SMh0nxKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29290404"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="29290404"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 04:29:27 -0700
X-CSE-ConnectionGUID: GywVFrOuQ6q3X2OXDyAPRw==
X-CSE-MsgGUID: 98IKh0IpR26CfYbVpEpZPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="81382237"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 04:29:27 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1] /tests/intel/xe_eudebug_online: Remove
 vm_open_trigger on debugger reattachment.
Date: Thu, 24 Oct 2024 11:29:17 +0000
Message-Id: <20241024112917.327660-1-jan.sokolowski@intel.com>
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

On debugger detach-and-reattach, discovery worker will replay events
that have occurred, which leads to a vm event being sent and
vm_open_trigger being re-run, which would lead to us trying
to open a removed vm.

On debugger reattach trigger, remove vm open trigger from list of
triggers.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 lib/xe/xe_eudebug.c             | 25 +++++++++++++++++++++++++
 lib/xe/xe_eudebug.h             |  2 ++
 tests/intel/xe_eudebug_online.c |  6 ++++++
 3 files changed, 33 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 36763a184..62f7e7361 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1226,6 +1226,31 @@ void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d,
 	igt_debug("added trigger %p\n", t);
 }
 
+/**
+ * xe_eudebug_debugger_remove_trigger:
+ * @d: pointer to the debugger
+ * @type: the type of the event which activates the trigger.
+ * @fn: function to be removed when event of @type was read by the debugger.
+ *
+ * Removes function @fn from the list of triggers activated when event of
+ * @type has been read by worker.
+ */
+void xe_eudebug_debugger_remove_trigger(struct xe_eudebug_debugger *d,
+					int type, xe_eudebug_trigger_fn fn)
+{
+	struct event_trigger *t;
+
+	igt_list_for_each_entry(t, &d->triggers, link) {
+		if (type == t->type && fn == t->fn) {
+			igt_list_del(&t->link);
+			break;
+		}
+	}
+
+	igt_debug("removed trigger %p\n", t);
+	free(t);
+}
+
 /**
  * xe_eudebug_debugger_start_worker:
  * @d: pointer to the debugger
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 6e4666333..9aadbe847 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -150,6 +150,8 @@ void xe_eudebug_debugger_detach(struct xe_eudebug_debugger *d);
 void xe_eudebug_debugger_set_data(struct xe_eudebug_debugger *c, void *ptr);
 void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d, int type,
 				     xe_eudebug_trigger_fn fn);
+void xe_eudebug_debugger_remove_trigger(struct xe_eudebug_debugger *d, int type,
+				     xe_eudebug_trigger_fn fn);
 void xe_eudebug_debugger_signal_stage(struct xe_eudebug_debugger *d, uint64_t stage);
 void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage);
 
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 01ccf45eb..0ef0d8093 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1785,6 +1785,12 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
 	d->fd = ret;
 	d->target_pid = c_pid;
 
+	/* Discovery worker will replay events that have occurred, which leads to
+	 * a vm event being sent and vm_open_trigger being re-run, which would lead
+	 * to us trying to open a removed vm. Thus, remove this trigger from list.
+	 */
+	xe_eudebug_debugger_remove_trigger(d, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+
 	/* Let the discovery worker discover resources */
 	sleep(2);
 
-- 
2.34.1

