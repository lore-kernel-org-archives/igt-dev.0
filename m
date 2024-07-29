Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794A5C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAF810E427;
	Mon, 29 Jul 2024 16:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZdSotBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD22E10E42D
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268978; x=1753804978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wqy1xKPkhIYa1oRELfZq/pgl7/PbJgErAqoOe1e1sE4=;
 b=MZdSotBMmWBROD9s8yGtywF38ejx+JJfCKP07yg3lD/whtkis1XhzT6a
 HPX5OSNa24Xoo5KnxBJXSUI08muc7G5svd3Yko6RjdJzJ1LlfFxOMe1Y1
 aBQLvHPh7uUQN+F3h6ZQHTxPQ43kk02HXbr2VafdcRpggskmUdIsIwkYm
 CGzIg+m8uX/gDg1zHUhUGgU4czYfBYlKYovgt0zoYEdPtyvmtS4E06Krb
 e44IsnILUsPJdfR+ZIiA687o7ZZleCou3q5uCYv5yFwvzcnbQFj6VPdnc
 +fgth0MVRDCgscjGwimgUbxloBsUrfvSjSP4XAyQiCvjveBgzJr/9/9dW w==;
X-CSE-ConnectionGUID: KX7xYM/VT+mKBuR6br3exw==
X-CSE-MsgGUID: 31F1l2vOTFiuccDE81p/MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426863"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426863"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:58 -0700
X-CSE-ConnectionGUID: MrF65C8IQCSf7vzu9hxuPQ==
X-CSE-MsgGUID: mXUEZf9WTD2HGWPdxShYag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737437"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:51 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 10/66] lib/xe_eudebug: Add support for dynamic debugger sysfs
 toggle
Date: Mon, 29 Jul 2024 18:01:03 +0200
Message-Id: <20240729160159.37036-11-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

The debugger now uses a dedicated sysfs entry:

/sys/class/drm/card<N>/device/enable_eudebug

to toggle the debugger on/off. This change adds helper functons for
toggling the debugger.

Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 88 +++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_eudebug.h |  3 ++
 2 files changed, 91 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 7f99fabc5..18e0ac422 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -7,10 +7,12 @@
 #include <poll.h>
 #include <signal.h>
 #include <sys/select.h>
+#include <sys/stat.h>
 #include <sys/types.h>
 #include <sys/wait.h>
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "intel_pat.h"
 #include "xe_eudebug.h"
 #include "xe_ioctl.h"
@@ -1034,6 +1036,24 @@ static void *debugger_worker_loop(void *data)
 	return NULL;
 }
 
+/**
+ * xe_eudebug_debugger_available:
+ * @fd: Xe file descriptor
+ *
+ * Returns: true it debugger connection is available, false otherwise.
+ */
+bool xe_eudebug_debugger_available(int fd)
+{
+	struct drm_xe_eudebug_connect param = { .pid = getpid() };
+	int debugfd;
+
+	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
+	if (debugfd >= 0)
+		close(debugfd);
+
+	return debugfd >= 0;
+}
+
 /**
  * xe_eudebug_debugger_create:
  * @master_fd: xe client used to open the debugger connection
@@ -1557,6 +1577,74 @@ static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
 	xe_eudebug_event_log_write(c->log, (void *)&em);
 }
 
+static int enable_getset(int fd, bool *old, bool *new)
+{
+	static const char * const fname = "enable_eudebug";
+	int ret = 0;
+
+	int sysfs, device_fd;
+	bool val_before;
+	struct stat st;
+
+	igt_assert(new || old);
+
+	igt_assert_eq(fstat(fd, &st), 0);
+	sysfs = igt_sysfs_open(fd);
+	if (sysfs < 0)
+		return -1;
+
+	device_fd = openat(sysfs, "device", O_DIRECTORY | O_RDONLY);
+	close(sysfs);
+	if (device_fd < 0)
+		return -1;
+
+	if (!__igt_sysfs_get_boolean(device_fd, fname, &val_before)) {
+		ret = -1;
+		goto out;
+	}
+
+	igt_debug("enable_eudebug before: %d\n", val_before);
+
+	if (old)
+		*old = val_before;
+
+	ret = 0;
+	if (new) {
+		if (__igt_sysfs_set_boolean(device_fd, fname, *new))
+			igt_assert_eq(igt_sysfs_get_boolean(device_fd, fname), *new);
+		else
+			ret = -1;
+	}
+
+out:
+	close(device_fd);
+	return ret;
+}
+
+/**
+ * xe_eudebug_enable
+ * @fd: xe client
+ * @enable: state toggle - true to enable, false to disable
+ *
+ * Enables/disables eudebug capability by writing to
+ * '/sys/class/drm/card<N>/device/enable_eudebug' sysfs entry.
+ *
+ * Returns: previous toggle value, i.e. true when eudebugging was enabled,
+ * false when eudebugging was disabled.
+ */
+bool xe_eudebug_enable(int fd, bool enable)
+{
+	bool old = false;
+	int ret = enable_getset(fd, &old, &enable);
+
+	if (ret) {
+		igt_skip_on(enable);
+		old = false;
+	}
+
+	return old;
+}
+
 /* Eu debugger wrappers around resource creating xe ioctls. */
 
 /**
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index ec75634f5..1343cb25c 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -123,6 +123,7 @@ void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *c, struct xe_eude
 void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eudebug_event *e);
 void xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t filter);
 
+bool xe_eudebug_debugger_available(int fd);
 struct xe_eudebug_debugger *
 xe_eudebug_debugger_create(int xe, uint64_t flags, void *data);
 void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d);
@@ -146,6 +147,8 @@ void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage);
 uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c);
 void xe_eudebug_client_set_data(struct xe_eudebug_client *c, void *ptr);
 
+bool xe_eudebug_enable(int fd, bool enable);
+
 int xe_eudebug_client_open_driver(struct xe_eudebug_client *c);
 void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd);
 uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
-- 
2.34.1

