Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF401CD8CA8
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 11:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651B910E9E2;
	Fri, 12 Jun 2026 11:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gF9uCq8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021EE10E9E2
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 11:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781262426; x=1812798426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CzfJM/2wuOOg2EJjd4N6XUxfzsP8M2Wbux8NhA1kpQQ=;
 b=gF9uCq8hnetkmQiKG9EmIEX8/dcLQwQo23Y49kVmn+AQ2Y4eYhgIIr0h
 fmx9/Q8Wjg4IY/R3xufB6FVCt1R0BLO5KdFAHkuBcEm460x0RlY3eoKq+
 sjWE8RD667A/H5guuA6LowwQkxGv05XzX1T0R93Wess/Rn7BzN9SxfQjF
 Sa2zvdWEHZmf1ZwErwcbtEUwBG0nI08bO4a0NDyAXuGjvtOrG3e39mvvM
 LQGN2aTeuf8LNE1gZSZnQp98Vi7mJHFKYUAs+u/EEtpZSMRKWl7+1zRR8
 G7CMyCGJXj3dOd0QDlxe/HvEOhSw/B+N+X0xA6jjeYDvX9ujXyJ3a1ziD g==;
X-CSE-ConnectionGUID: zCsSc52iQH+Akry3k4JD+w==
X-CSE-MsgGUID: 2zud00OESku8Elbi7CaDPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81997615"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="81997615"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:07:05 -0700
X-CSE-ConnectionGUID: /asHW8lQTl6EvFxHX7LN4Q==
X-CSE-MsgGUID: 2fn4L9PrT06nRzGbW5odWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="250717767"
Received: from slindbla-desk.ger.corp.intel.com (HELO fedora) ([10.245.245.68])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:07:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/xe_exec_compute_mode: Restart VM on
 ENOMEM/ENOSPC errors
Date: Fri, 12 Jun 2026 13:06:19 +0200
Message-ID: <20260612110619.103198-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612110619.103198-1-thomas.hellstrom@linux.intel.com>
References: <20260612110619.103198-1-thomas.hellstrom@linux.intel.com>
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

When a DRM_XE_EVENT_VM_ERR event is received with error code -ENOMEM or
-ENOSPC, call DRM_IOCTL_XE_VM_RESTART to attempt recovery via the
preempt-rebind worker.

To pass the file descriptor into the event callback, introduce struct
xe_watch_ctx embedding the existing struct xe_watch_event alongside an
fd field, following the container_of() pattern documented by the
xe_watch library.

The restart uses __xe_vm_restart() (failable) rather than the asserting
xe_vm_restart() since the callback runs on the background listener
thread.  -ENOENT is treated as non-fatal (event arrived after VM
destruction); other errors are logged as warnings.

Alongside the test change, add the __xe_vm_restart() and xe_vm_restart()
helpers to lib/xe/xe_ioctl and the DRM_XE_VM_RESTART UAPI to
include/drm-uapi/xe_drm.h, taken from the xe_event kernel branch.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
---
 include/drm-uapi/xe_drm.h          |  6 ++---
 tests/intel/xe_exec_compute_mode.c | 37 +++++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 1b7857a9f..f6ec85a02 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -2624,8 +2624,8 @@ enum drm_xe_ras_error_component {
  * been created with exec queues that use preempt fences).
  *
  * On return the rebind attempt has completed or a retriable error was
- * encountered.  Any non-retriable error is surfaced through the event
- * mechanism if the caller has subscribed to %DRM_XE_EVENT_MASK_VM_ERR.
+ * encountered.  Any non-retriable error is surfaced through the watch queue
+ * if the caller has subscribed via %DRM_IOCTL_XE_WATCH_QUEUE.
  * The IOCTL may return -EAGAIN if userptr memory needs to be repinned;
  * callers should retry in that case.
  */
@@ -2654,8 +2654,6 @@ struct drm_xe_vm_restart {
 
 /**
  * DOC: DRM_XE_WATCH_QUEUE
- *
- * Subscribe a notification pipe to receive device events for the calling
  * process's DRM file handle.  Events are scoped to the subscribing file:
  * only events that belong to that file (for example, VM error on a VM created
  * through the same file) are delivered, preventing information leaks between
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 5bab971b0..71b6110e2 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -11,7 +11,9 @@
  * Functionality: compute test
  */
 
+#include <errno.h>
 #include <fcntl.h>
+#include <stdatomic.h>
 
 #include "igt.h"
 #include "lib/igt_syncobj.h"
@@ -40,11 +42,19 @@
 #define FREE_MAPPPING			(0x1 << 7)
 #define UNMAP_MAPPPING			(0x1 << 8)
 
+struct xe_watch_ctx {
+	struct xe_watch_event base;
+	int fd;
+	atomic_uint restart_count;
+};
+
 static void xe_event_fn(struct xe_watch_event *event)
 {
+	struct xe_watch_ctx *ctx = igt_container_of(event, ctx, base);
 	const struct watch_notification *notif = event->notif;
 	const struct drm_xe_watch_notification_vm_err *err_event =
 		igt_container_of(notif, err_event, base);
+	int err;
 
 	switch (notif->type) {
 	case WATCH_TYPE_META:
@@ -67,6 +77,16 @@ static void xe_event_fn(struct xe_watch_event *event)
 			igt_info("VM with id %u saw an error: %d\n",
 				 (unsigned int) err_event->vm_id,
 				 (int) err_event->error_code);
+			if (err_event->error_code == -ENOMEM ||
+			    err_event->error_code == -ENOSPC) {
+				err = __xe_vm_restart(ctx->fd, err_event->vm_id,
+					      err_event->timestamp_ns);
+				if (err && err != -ENOENT)
+					igt_warn("VM %u restart failed: %d\n",
+						 (unsigned int) err_event->vm_id, err);
+				else if (!err)
+					atomic_fetch_add(&ctx->restart_count, 1);
+			}
 			break;
 		default:
 			igt_warn("Unknown XE watch subtype %u\n",
@@ -176,7 +196,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_debug("%s running on: %s\n", __func__, xe_engine_class_string(eci->engine_class));
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_RESTARTABLE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
 
@@ -401,7 +422,8 @@ static void lr_mode_workload(int fd)
 	uint32_t bo;
 	uint32_t ts_1, ts_2;
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_RESTARTABLE, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 	bo_size = xe_bb_size(fd, sizeof(*spin));
 	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COPY);
@@ -481,14 +503,15 @@ int igt_main()
 		{ NULL },
 	};
 	int fd;
-	struct xe_watch_event watch_event = {
-		.ops = &event_ops,
+	struct xe_watch_ctx watch_ctx = {
+		.base.ops = &event_ops,
 	};
 	struct xe_watch_listener *listener;
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
-		listener = xe_watch_listener_create(fd, &watch_event);
+		watch_ctx.fd = fd;
+		listener = xe_watch_listener_create(fd, &watch_ctx.base);
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
@@ -523,7 +546,9 @@ int igt_main()
 
 
 	igt_fixture() {
-		drm_close_driver(fd);
 		xe_watch_listener_destroy(listener);
+		igt_info("VM restarts performed: %u\n",
+			 atomic_load(&watch_ctx.restart_count));
+		drm_close_driver(fd);
 	}
 }
-- 
2.54.0

