Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E549CEDF150
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 10:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936D510E7D6;
	Fri, 13 Feb 2026 10:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPp2TZbw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7B710E7E0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 10:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770980361; x=1802516361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sTWTcPLKPVEsaRlZ4ig1QgwKZOm8oIYCrYmXFTrue2k=;
 b=FPp2TZbwD0HjXdFWUQCR0XW0mdOJYAnAMgzz1n0hz7U18YNFioPI99eo
 mK8rsNHBNrEbpBjE85NUBXQTktQwB5Y5/JexmU5irSezUHHj852gGm6rt
 o728MwU3Y3LItybCGX1NJkvBmy0zUxU+uiyeBHvTf3HH9fLdQ5YD4PiNj
 JX0raYmsf+7UThuZ8sYxx6HvX5cSgw1DvaAfKA9SjZ0BxB/qfQsYmmkJz
 VZqdGvnAE7RSBWjwuin/b7INsQlCOT8LmIA2j5Dh9Cx24Q9g9+DlG0IBT
 STpQziTUw333Tfy2UBv/iLsCfhxmS3z1Bbj67queXbBCIkR3qDu4kSwZJ Q==;
X-CSE-ConnectionGUID: Yp2i2Zm6RqeTBeKBZFwowA==
X-CSE-MsgGUID: 4XRT9E/wT9ex2mQgzwtf+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72258578"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72258578"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:59:21 -0800
X-CSE-ConnectionGUID: /FyC/bQLSfieNHF5sHQPvQ==
X-CSE-MsgGUID: SrodkNveTHyOB7ocQ+/3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="243489882"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:59:19 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rudnicki@freedesktop.org, Piotr <piotr.rudnicki@intel.com>,
	Piatkowski@freedesktop.org,
	Dominik Karol <dominik.karol.piatkowski@intel.com>,
	Jan Sokolowski <jan.sokolowski@intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 4/5] lib/xe/xe_eudebug: Track active debugger
 sessions and close when disabling
Date: Fri, 13 Feb 2026 11:59:00 +0100
Message-ID: <20260213105855.3790052-11-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260213105855.3790052-7-christoph.manszewski@intel.com>
References: <20260213105855.3790052-7-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Active debugger sessions prevent disabling EU Debug via the sysfs
toggle. As a result when a test fails the igt_fixture will fail to
disable EU Debug if the worker threads have open debugger fds.

Introduce active debugger session (debugger fd) tracking and use it to
close leftover sessions before attempting to disable eudebug. The kernel
'struct drm_driver.postclose' handler which removes the debugger
sessions tracked by Xe EU Debug runs asynchronously to 'close' so retry
disabling in a loop on '-EBUSY'.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c | 74 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 643111679..fcd2b398a 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -18,6 +18,58 @@
 #include "xe_ioctl.h"
 #include "xe/xe_query.h"
 
+struct debugger_fd_entry {
+	int fd;
+	struct igt_list_head link;
+};
+
+static IGT_LIST_HEAD(active_debugger_fds);
+static pthread_mutex_t active_debugger_fds_lock = PTHREAD_MUTEX_INITIALIZER;
+
+static void register_debugger_fd(int fd)
+{
+	struct debugger_fd_entry *entry;
+
+	pthread_mutex_lock(&active_debugger_fds_lock);
+
+	entry = calloc(1, sizeof(*entry));
+	igt_assert(entry);
+	entry->fd = fd;
+	IGT_INIT_LIST_HEAD(&entry->link);
+	igt_list_add(&entry->link, &active_debugger_fds);
+
+	pthread_mutex_unlock(&active_debugger_fds_lock);
+}
+
+static void unregister_debugger_fd(int fd)
+{
+	struct debugger_fd_entry *entry, *tmp;
+
+	pthread_mutex_lock(&active_debugger_fds_lock);
+	igt_list_for_each_entry_safe(entry, tmp, &active_debugger_fds, link) {
+		if (entry->fd == fd) {
+			igt_list_del(&entry->link);
+			free(entry);
+			break;
+		}
+	}
+	pthread_mutex_unlock(&active_debugger_fds_lock);
+}
+
+static void close_all_debugger_fds(void)
+{
+	struct debugger_fd_entry *entry, *tmp;
+
+	pthread_mutex_lock(&active_debugger_fds_lock);
+	igt_list_for_each_entry_safe(entry, tmp, &active_debugger_fds, link) {
+		igt_debug("closing leftover debugger fd %d\n", entry->fd);
+		close(entry->fd);
+		igt_list_del(&entry->link);
+		free(entry);
+	}
+	pthread_mutex_unlock(&active_debugger_fds_lock);
+}
+
 struct event_trigger {
 	xe_eudebug_trigger_fn fn;
 	int type;
@@ -1281,6 +1333,8 @@ int xe_eudebug_debugger_reattach(struct xe_eudebug_debugger *d, pid_t pid)
 	d->fd = ret;
 	d->target_pid = pid;
 
+	register_debugger_fd(d->fd);
+
 	igt_debug("debugger reconnected to %d\n", pid);
 
 	return 0;
@@ -1320,6 +1374,7 @@ int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d,
 void xe_eudebug_debugger_detach(struct xe_eudebug_debugger *d)
 {
 	igt_assert(d->target_pid);
+	unregister_debugger_fd(d->fd);
 	close(d->fd);
 	d->target_pid = 0;
 	d->fd = -1;
@@ -1906,7 +1961,24 @@ bool xe_eudebug_enable(int fd, bool enable)
 {
 	char sysfs_path[PATH_MAX];
 	bool old = false;
-	int ret = __xe_eudebug_enable_getset(fd, &old, &enable);
+	int ret = 0;
+
+	/* When disabling eudebug, close all active debugger sessions first. */
+	if (!enable)
+		close_all_debugger_fds();
+
+	/* 'struct drm_driver.postclose' runs asynchronously to 'close', wait for it to complete */
+	for (int i = 0; i < 10; ++i) {
+		ret = __xe_eudebug_enable_getset(fd, &old, &enable);
+
+		if (ret != -EBUSY)
+			break;
+
+		if (i < 9) {
+			igt_debug("xe_eudebug_enable: Failed (%d), retrying...\n", ret);
+			sleep(1);
+		}
+	}
 
 	if (ret == -ENOENT) {
 		igt_assert(igt_sysfs_path(fd, sysfs_path, sizeof(sysfs_path)));
-- 
2.47.1

