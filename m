Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF921061217
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 11:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D857810E0C6;
	Wed, 11 Mar 2026 11:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeUPLqnw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4966310E88C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 11:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773227220; x=1804763220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b/nGQz9fkCLCdEvAw3XOX/nnBdFqbmN4+UegfZAWajo=;
 b=BeUPLqnw2oKaTnOkKUT/Ybe3iAYits39FUhkFwC9dmAv4Qkl902EB+n4
 fanVt6JVCxadaPZEnpR12TePEyb+/lgBD/P6wu8Lj0R+dPGz76zGuabeV
 U5IQt4BtDQcUShLpJi7IrFbQXtZ7SBQ11olxKwhTKoFeLmGrrCPtvCecT
 e/iM2pgTeF3b4GdeVwerWGXlrWIFhXyVdFptprGTabKfiwhQK7/gDkfFq
 7zMnRD1xUFnHGLX/OFymEclqSWXwtKIiC9kqslaSiAziewnOMSMqAnFY3
 krNGQjwWihHrhaQg5WHRpCU0sGkIJwwrO+XnUBV8IxL/ECJ14EgRQ+RTr g==;
X-CSE-ConnectionGUID: pTVcd4HESr6JYUNPrxUPtg==
X-CSE-MsgGUID: jg152Q0DRxiGPeydM95tEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85378234"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85378234"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:07:00 -0700
X-CSE-ConnectionGUID: tzln82JZR7WIS0bGvtQezw==
X-CSE-MsgGUID: 7SZfLmwNSJeljf6ekId+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="258344681"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:06:59 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v5 3/5] xe/xe_eudebug: Add reattach function and make
 plain connect private
Date: Wed, 11 Mar 2026 12:06:40 +0100
Message-ID: <20260311110636.798120-10-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260311110636.798120-7-christoph.manszewski@intel.com>
References: <20260311110636.798120-7-christoph.manszewski@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Convert xe_eudebug_connect (the raw connect ioctl wrapper) back into
a library private function and introduce a dedicated
xe_eudebug_debugger_reattach function that is documented accordingly.

This ensures proper session management and awareness on the library level.

Reviewed-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
Link: https://lore.kernel.org/r/20260220153748.210381-10-christoph.manszewski@intel.com
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c             | 74 ++++++++++++++++++++-------------
 lib/xe/xe_eudebug.h             |  2 +-
 tests/intel/xe_eudebug_online.c |  6 +--
 3 files changed, 48 insertions(+), 34 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 41eed7614..7a641d2bd 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -396,22 +396,6 @@ static void client_signal(struct xe_eudebug_client *c,
 	token_signal(c->p_out, token, value);
 }
 
-static int __xe_eudebug_connect(int fd, pid_t pid, uint32_t flags, uint64_t events)
-{
-	struct drm_xe_eudebug_connect param = {
-		.pid = pid,
-		.flags = flags,
-	};
-	int debugfd;
-
-	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
-
-	if (debugfd < 0)
-		return -errno;
-
-	return debugfd;
-}
-
 static void event_log_write_to_fd(struct xe_eudebug_event_log *l, int fd)
 {
 	igt_assert_eq(write(fd, &l->head, sizeof(l->head)),
@@ -905,14 +889,20 @@ static void event_log_sort(struct xe_eudebug_event_log *l)
  *
  * Returns: 0 if the debugger was successfully attached, -errno otherwise.
  */
-int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags)
+static int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags)
 {
-	int ret;
-	uint64_t events = 0; /* events filtering not supported yet! */
+	struct drm_xe_eudebug_connect param = {
+		.pid = pid,
+		.flags = flags,
+	};
+	int debugfd;
 
-	ret = __xe_eudebug_connect(fd, pid, flags, events);
+	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
 
-	return ret;
+	if (debugfd < 0)
+		return -errno;
+
+	return debugfd;
 }
 
 /**
@@ -1266,6 +1256,39 @@ void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d)
 	free(d);
 }
 
+static int __xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, pid_t pid)
+{
+	int ret;
+
+	igt_assert_eq(d->fd, -1);
+	igt_assert_eq(d->target_pid, 0);
+
+	ret = xe_eudebug_connect(d->master_fd, pid, 0);
+	if (ret < 0)
+		return ret;
+
+	d->fd = ret;
+	d->target_pid = pid;
+
+	return 0;
+}
+
+/**
+ * xe_eudebug_debugger_reattach:
+ * @d: pointer to the debugger
+ * @pid: pid of the process to attach to
+ *
+ * Re-establishes debugger connection to a process. To be used only for
+ * reconnection scenarios where the debugger was previously attached using
+ * xe_eudebug_debugger_attach() and detached with xe_eudebug_debugger_detach().
+ *
+ * Returns: 0 if the debugger was successfully reattached, -errno otherwise.
+ */
+int xe_eudebug_debugger_reattach(struct xe_eudebug_debugger *d, pid_t pid)
+{
+	return  __xe_eudebug_debugger_attach(d, pid);
+}
+
 /**
  * xe_eudebug_debugger_attach:
  * @d: pointer to the debugger
@@ -1280,20 +1303,13 @@ int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d,
 {
 	int ret;
 
-	igt_assert_eq(d->fd, -1);
-	igt_assert_neq(c->pid, 0);
-	ret = xe_eudebug_connect(d->master_fd, c->pid, 0);
-
+	ret = __xe_eudebug_debugger_attach(d, c->pid);
 	if (ret < 0)
 		return ret;
 
-	d->fd = ret;
-	d->target_pid = c->pid;
 	d->p_client[0] = c->p_in[0];
 	d->p_client[1] = c->p_in[1];
 
-	igt_debug("debugger connected to %" PRIu64 "\n", d->target_pid);
-
 	return 0;
 }
 
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index f1a2da4d8..23f0d7e34 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -175,7 +175,6 @@ next_event(struct drm_xe_eudebug_event *e, struct xe_eudebug_event_log *l)
 #define XE_EUDEBUG_FILTER_ALL				GENMASK(DRM_XE_EUDEBUG_EVENT_PAGEFAULT, 0)
 #define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)		((1UL << (_e)) & (_f))
 
-int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags);
 const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e, char *buf, size_t len);
 struct drm_xe_eudebug_event *
 xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno);
@@ -193,6 +192,7 @@ struct xe_eudebug_debugger *
 xe_eudebug_debugger_create(int xe, uint64_t flags, void *data);
 void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d);
 int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, struct xe_eudebug_client *c);
+int xe_eudebug_debugger_reattach(struct xe_eudebug_debugger *d, pid_t pid);
 void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d);
 void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d);
 void xe_eudebug_debugger_detach(struct xe_eudebug_debugger *d);
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 059f918a6..f5f7594e1 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -2225,10 +2225,8 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
 	 */
 	reset_debugger_log(d);
 
-	ret = xe_eudebug_connect(d->master_fd, c_pid, 0);
-	igt_assert(ret >= 0);
-	d->fd = ret;
-	d->target_pid = c_pid;
+	ret = xe_eudebug_debugger_reattach(d, c_pid);
+	igt_assert_eq(ret, 0);
 
 	/* Discovery worker will replay events that have occurred, which leads to
 	 * a vm event being sent and vm_open_trigger being re-run, which would lead
-- 
2.47.1

