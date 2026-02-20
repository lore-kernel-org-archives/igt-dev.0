Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCB3C56206
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D409610E80D;
	Fri, 20 Feb 2026 15:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8KhImvw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481CE10E806
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771601904; x=1803137904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CLdJ7P4bpXhmo6GOuDTyhaLe/lhVgK+6AaoNEYBLg6I=;
 b=S8KhImvwMU2DMP++zu8XGAVy8sH0u9U9REj9V5M4xj543fkUeYPmyLla
 M/0gD+v3hWKFZrFndSypMA5UX0rs72P5ibWWCzyNUzEVnfJS7kBwotLPO
 RshcehlV/172noc2sH1hxym53kmE/dzHfTcysYK/dXf92OujisXubt4JR
 wJZloqVer0mn2XsZNlrwmt9Rmmi09aYehrAcmtAatHxtibgE9aTmac2WB
 ZFHvdJC2dQ4U/HGYlBKRT78GcaLt7DgBCwSzU6CU6T2K6h2nm3UDswsSm
 SUYZYAmOcYQswjEGUI0uosyjo4ngZ7ewg6W8N/+gzpwSJQVKmjuQRxOII A==;
X-CSE-ConnectionGUID: u14lFqHuQMiGbrlWfIwCuw==
X-CSE-MsgGUID: f06dmnBaS6uftW1EM2q0xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90105383"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="90105383"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:38:24 -0800
X-CSE-ConnectionGUID: QXp+dabWRzq42ReHddeavA==
X-CSE-MsgGUID: Mh/bfsb+QIaO4fs04ynz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="215007725"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:38:22 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rudnicki@freedesktop.org, Piotr <piotr.rudnicki@intel.com>,
	Piatkowski@freedesktop.org,
	Dominik Karol <dominik.karol.piatkowski@intel.com>,
	Jan Sokolowski <jan.sokolowski@intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v4 4/5] lib/xe/xe_eudebug: Track active debugger
 sessions and close when disabling
Date: Fri, 20 Feb 2026 16:37:53 +0100
Message-ID: <20260220153748.210381-11-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260220153748.210381-7-christoph.manszewski@intel.com>
References: <20260220153748.210381-7-christoph.manszewski@intel.com>
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
index 7a641d2bd..a0caad2c3 100644
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
@@ -1270,6 +1322,8 @@ static int __xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, pid_t pid
 	d->fd = ret;
 	d->target_pid = pid;
 
+	register_debugger_fd(d->fd);
+
 	return 0;
 }
 
@@ -1323,6 +1377,7 @@ int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d,
 void xe_eudebug_debugger_detach(struct xe_eudebug_debugger *d)
 {
 	igt_assert(d->target_pid);
+	unregister_debugger_fd(d->fd);
 	close(d->fd);
 	d->target_pid = 0;
 	d->fd = -1;
@@ -1909,7 +1964,24 @@ bool xe_eudebug_enable(int fd, bool enable)
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

