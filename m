Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1775FC56201
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0E110E7F5;
	Fri, 20 Feb 2026 15:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdyFZOMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FB210E80F
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771601902; x=1803137902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KF31PiF5tMwsk52eyg1G4W7X/fpiWRBspG7GUIfp15I=;
 b=jdyFZOMjnVqGSex3Gnle9fVZA6ONbKssm0Gmgc/t8kC2w9H/x8ZtcfRO
 XiUVafM+v7cSLLEEgo156zJXczkoy/FPIl8Cs5rKfxfMrQ7u/OU8SiPHu
 OErWf3HE98DCFOi8uj0OnoSYfPGFCzg2IhfRCuwxXjz+Pu3PFDzxtdPZ8
 PMx3YxptZLGPsIMHCqTy2VzHuv/jdY5wZT8KYVHy8fZ0Jrt9qYsT9Xzcg
 fKL6BlHEJPGQqdJzGJ0h4xorLjrz+fmT4q8aM0otRw6gGHOV2PUyjSaeX
 2jeI3EiOVY1Q3HcPub7aFK1Aezf5nh3fh7lTNRWu9DEF0scP0/JGAa9bG Q==;
X-CSE-ConnectionGUID: StF9JNo0Sz2f0yg1nnbT4g==
X-CSE-MsgGUID: VXPY/3rbTaaldeZ9ofl2Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90105381"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="90105381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:38:22 -0800
X-CSE-ConnectionGUID: O2z2ZqRvRS6d8euVlrSKFg==
X-CSE-MsgGUID: LaxJwaOXTCW4rFGd0n4cUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="215007711"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:38:20 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rudnicki@freedesktop.org, Piotr <piotr.rudnicki@intel.com>,
	Piatkowski@freedesktop.org,
	Dominik Karol <dominik.karol.piatkowski@intel.com>,
	Jan Sokolowski <jan.sokolowski@intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v4 3/5] xe/xe_eudebug: Add reattach function and make
 plain connect private
Date: Fri, 20 Feb 2026 16:37:52 +0100
Message-ID: <20260220153748.210381-10-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260220153748.210381-7-christoph.manszewski@intel.com>
References: <20260220153748.210381-7-christoph.manszewski@intel.com>
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

