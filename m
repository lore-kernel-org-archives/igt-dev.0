Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A8FCE8E67
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 12:09:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF6810E116;
	Thu, 24 Oct 2024 12:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDfCwfzk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C894B10E116
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729771749; x=1761307749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7m77sqJGyqlmlfeEsq/fQMCGysUwFjLu6518aDu4Jjo=;
 b=eDfCwfzkcD71JuOqrqRjSA3xyZ4m2wQvepp524xwtGvAC1qywVBPHo/U
 m6By5Y5O5xr1gBS25u7d0BRhSFdiYZ7Q7xaNVmSdFIjdqt6pCqe0zQIBT
 C9Klj8qNJZlt0vKIEMvk3EP4knDTxkObbn17RA6tSRSe7rpRl7bt0/f1V
 QoxeKK1/deT7hYpZIYiAf+p+nJcIFve+TlXFvGPIUJ9nLvITziBr8TM+j
 oOEk+QjfBCQrMLX28qOeww79TKuj0R3ZznJk8knVeZF9hZ15nSa2Ebd2K
 Yha5AzB2LY6cDw30kuusvERGCP/elh4ao72K3Tu9hygBEAJaZpD2CTHoe g==;
X-CSE-ConnectionGUID: fh0MmNGwT9+uk4Xvve72Pw==
X-CSE-MsgGUID: WGtRFWzmTVe4PvTeqU+rDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="39985001"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="39985001"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 05:09:09 -0700
X-CSE-ConnectionGUID: uupU8oy5RzqirIO5cODg4w==
X-CSE-MsgGUID: UCdhzsVUT9qXVSENgq8HkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="80495742"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 05:09:07 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v2 1/2] /lib/xe/xe_eudebug: Add trigger removal method
Date: Thu, 24 Oct 2024 12:08:50 +0000
Message-Id: <20241024120851.328536-1-jan.sokolowski@intel.com>
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

Add method xe_eudebug_debugger_remove_trigger to remove
trigger from list of triggers.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Dominik Grzegorzk <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 30 ++++++++++++++++++++++++++++++
 lib/xe/xe_eudebug.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 36763a184..74aa26024 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1226,6 +1226,36 @@ void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d,
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
+	bool found = false;
+
+	igt_list_for_each_entry(t, &d->triggers, link) {
+		if (type == t->type && fn == t->fn) {
+			igt_list_del(&t->link);
+			found = true;
+			break;
+		}
+	}
+	if (found) {
+		igt_debug("removed trigger %p\n", t);
+		free(t);
+	} else {
+		igt_debug("trigger of type %d was not removed as it's not in the list\n", type);
+	}
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
 
-- 
2.34.1

