Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C154EB7EDB
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 12:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D9410E9DC;
	Wed,  4 Mar 2026 12:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHwiIZk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B9E10E9DC
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 12:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772626667; x=1804162667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0E6S29a3GFVBH3UKcXQ+mqQeRvAL0iipzTL7n50TmNA=;
 b=jHwiIZk1tifBSM6WAjgmIxWwWbiw+/vo9XNEMSqlG7PJTRXB8OtuT8aV
 Sjg5kpWHzDQL7ffyBlXWptmHasbIgiAAD4uLNrrL5XLdHkjsOVdsLRm/e
 fX4YlL3/ysH3HHV3MMO8BNv/HHns2X/Qkklkv+gbI6xlxOhuhu/GYZ4bO
 yIYXpTSlYxqtUtkbMZdJCZ3i3Qhx01hdto4sPIN9HGYSWuDxf5g+P3OGo
 sTNZT/fHQazKsnATFVLjBxxB9W+f/kcds0J+SvAsFGzKM18c3xAuh9v+V
 5AY+6m61tmFbWm2m2PDZv3Qn+WFVu5bR7geWuExzPR38r84QGod++GpO2 Q==;
X-CSE-ConnectionGUID: 8SOrFau6QNGWtdGmwN/Tmg==
X-CSE-MsgGUID: e/wuP+pxTvmJZio2q8rdrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84773827"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="84773827"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:17:47 -0800
X-CSE-ConnectionGUID: SEgH0ifKQJu/vIj2RGsHAA==
X-CSE-MsgGUID: b87tkcRHTvWueUw4GaJrmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="241333450"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.170])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:17:45 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>
Subject: [RFC PATCH i-g-t 2/2] tests/intel/xe_exec_compute_mode: Add a
 listener for file events
Date: Wed,  4 Mar 2026 13:17:25 +0100
Message-ID: <20260304121725.161213-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304121725.161213-1-thomas.hellstrom@linux.intel.com>
References: <20260304121725.161213-1-thomas.hellstrom@linux.intel.com>
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

Using the new xe_watch library functionality, add a listener
for file events. The listener gets notified on

* File close,
* Lost event,
* Rebind worker error.

But doesn't take any action.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 59 +++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 438ea163f..0784f3a31 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -22,6 +22,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_watch.h"
 #include <string.h>
 
 #define MAX_N_EXECQUEUES 	16
@@ -35,6 +36,52 @@
 #define FREE_MAPPPING			(0x1 << 7)
 #define UNMAP_MAPPPING			(0x1 << 8)
 
+static void xe_event_fn(struct xe_watch_event *event)
+{
+	const struct watch_notification *notif = event->notif;
+	const struct drm_xe_watch_notification_vm_err *err_event =
+		igt_container_of(notif, err_event, base);
+
+	switch (notif->type) {
+	case WATCH_TYPE_META:
+		switch (notif->subtype) {
+		case WATCH_META_REMOVAL_NOTIFICATION:
+			igt_info("The device file was closed.\n");
+			break;
+		case WATCH_META_LOSS_NOTIFICATION:
+			igt_warn("The listener lost a message.\n");
+			break;
+		default:
+			igt_warn("Unknown META subtype.\n");
+			break;
+		}
+		break;
+
+	case WATCH_TYPE_DRM_XE_NOTIFY:
+		switch (notif->subtype) {
+		case DRM_XE_WATCH_EVENT_VM_ERR:
+			igt_info("VM with id %u saw an error: %d\n",
+				 (unsigned int) err_event->vm_id,
+				 (int) err_event->error_code);
+			break;
+		default:
+			igt_warn("Unknown XE watch subtype %u\n",
+				 (unsigned int) notif->subtype);
+			break;
+		}
+
+		break;
+
+	default:
+		igt_warn("Unknown watch type %u.\n", notif->type);
+		break;
+	}
+}
+
+const struct xe_watch_event_ops event_ops = {
+	.event_deliver = xe_event_fn,
+};
+
 /**
  * SUBTEST: twice-%s
  * Description: Run %arg[1] compute machine test twice
@@ -430,9 +477,15 @@ int igt_main()
 		{ NULL },
 	};
 	int fd;
+	struct xe_watch_event watch_event = {
+		.ops = &event_ops,
+	};
+	struct xe_watch_listener *listener;
 
-	igt_fixture()
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
+		listener = xe_watch_listener_create(fd, &watch_event);
+	}
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
@@ -465,6 +518,8 @@ int igt_main()
 		lr_mode_workload(fd);
 
 
-	igt_fixture()
+	igt_fixture() {
 		drm_close_driver(fd);
+		xe_watch_listener_destroy(listener);
+	}
 }
-- 
2.53.0

