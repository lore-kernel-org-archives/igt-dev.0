Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A5AEB7ECF
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 12:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DA010E9D7;
	Wed,  4 Mar 2026 12:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0rQOp+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DA710E176
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 12:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772626665; x=1804162665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yfr4mdEKcwxGDdr2pAqGe0UlfrdQoMAxQ8vLeAJoxMk=;
 b=c0rQOp+QI4BC69dZ+YfWq+O8GjfJAGu/UVI0hdIc/Re6bZxvjJ1tvEuk
 1C7Dv1xuD3DGsU0VoBteKpGur+uL0rXSGo5tueM7VWIpt/nw8OZAR+JQS
 sY7PPIwe2gNGefDSx6foEBNZqfdB2RxwISeH7PgFSCS0pRmJOsOavQbIA
 8J1O2MlHmK7iIGqDQ/BE1Oj3/zLvy4+PslLgpkV13C/fWUFHSula2rgmv
 lJvIPJopkVGjA7k+lH/W1bAeMOOtY768ME0hiBWPVaNjZ/t1qmo93wgCT
 JngALYz26ynwhxHd3EMET9gLG3q2KPFUAZiNcQ5Kk7M4M1gZbMtVO2IVi w==;
X-CSE-ConnectionGUID: jwjiG2yeQUCF0aIQWk9KRg==
X-CSE-MsgGUID: wD7EpsizTey6/AlResCUSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84773821"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="84773821"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:17:45 -0800
X-CSE-ConnectionGUID: d+jeA0ouQxOHUwSw7MTBPQ==
X-CSE-MsgGUID: 3O8GejCsQvaRocLticbPJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="241333436"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.170])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:17:43 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>
Subject: [RFC PATCH i-g-t 1/2] lib/xe: add xe_watch listener for watch queue
 events
Date: Wed,  4 Mar 2026 13:17:24 +0100
Message-ID: <20260304121725.161213-2-thomas.hellstrom@linux.intel.com>
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

Add a new xe_watch library module that subscribes an Xe device file
descriptor to kernel watch queue notifications and dispatches them to a
caller-supplied handler from a background pthread.

The public API consists of two functions and three types:

  xe_watch_listener_create(xe_fd, event)
    Opens an O_NOTIFICATION_PIPE, sizes it, filters it to
    WATCH_TYPE_DRM_NOTIFY events, registers it with the Xe device via
    DRM_IOCTL_XE_WATCH_QUEUE, and starts a worker pthread.

  xe_watch_listener_destroy(listener)
    Signals the worker to exit via an internal stop-pipe, joins the
    thread, and frees all resources.

  struct xe_watch_event / xe_watch_event_ops / xe_watch_event_fn
    Caller embeds struct xe_watch_event in its own private state and
    points ops->event_deliver at its handler. The worker sets
    event->notif (a struct watch_notification *) before each call, and
    the handler uses container_of() to recover its private context.

The implementation relies on the userspace-safe guard added to
<linux/watch_queue.h> so it can be included from xe_drm.h directly.
A WATCH_TYPE_DRM_XE_NOTIFY fallback define is provided for build
environments whose system header predates that define.

xe_drm.h is updated to match the upstream watch_queue branch:
  - Add DRM_XE_WATCH_QUEUE ioctl number (0x0f) and
    DRM_IOCTL_XE_WATCH_QUEUE macro.
  - Add struct drm_xe_watch_queue, enum drm_xe_watch_event
    (DRM_XE_WATCH_EVENT_VM_ERR = 0), and
    struct drm_xe_watch_notification_vm_oom.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/drm-uapi/xe_drm.h        |  46 +++++++
 include/drm-uapi/xe_drm_events.h |  65 +++++++++
 lib/meson.build                  |   1 +
 lib/xe/xe_watch.c                | 221 +++++++++++++++++++++++++++++++
 lib/xe/xe_watch.h                |  80 +++++++++++
 5 files changed, 413 insertions(+)
 create mode 100644 include/drm-uapi/xe_drm_events.h
 create mode 100644 lib/xe/xe_watch.c
 create mode 100644 lib/xe/xe_watch.h

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index f7abd9b37..934d92634 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -83,6 +83,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_OBSERVATION
  *  - &DRM_IOCTL_XE_MADVISE
  *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
+ *  - &DRM_IOCTL_XE_WATCH_QUEUE
  */
 
 /*
@@ -107,6 +108,7 @@ extern "C" {
 #define DRM_XE_MADVISE			0x0c
 #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
 #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
+#define DRM_XE_WATCH_QUEUE		0x0f
 
 /* Must be kept compact -- no holes */
 
@@ -125,6 +127,7 @@ extern "C" {
 #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
 #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
+#define DRM_IOCTL_XE_WATCH_QUEUE		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_WATCH_QUEUE, struct drm_xe_watch_queue)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -2363,6 +2366,49 @@ struct drm_xe_exec_queue_set_property {
 	__u64 reserved[2];
 };
 
+/**
+ * DOC: DRM_XE_WATCH_QUEUE
+ *
+ * Subscribe a notification pipe to receive device events for the calling
+ * process's DRM file handle.  Events are scoped to the subscribing file:
+ * only events that belong to that file (for example, VM error on a VM created
+ * through the same file) are delivered, preventing information leaks between
+ * processes sharing the same GPU device.
+ *
+ * The pipe must first be opened with O_NOTIFICATION_PIPE (i.e. O_EXCL passed
+ * to pipe2()) and sized via %IOC_WATCH_QUEUE_SET_SIZE before subscribing.
+ *
+ * Events are delivered as notification records read from the pipe.  The
+ * @watch_id field is embedded in the notification info field and can be used
+ * to distinguish multiple watches sharing a pipe.
+ *
+ * Currently defined event subtypes:
+ *  - %DRM_XE_WATCH_EVENT_VM_ERR - a VM owned by this file has encountered an error
+ */
+
+/**
+ * struct drm_xe_watch_queue - subscribe to device event notifications
+ *
+ * Used with %DRM_IOCTL_XE_WATCH_QUEUE.  Notifications are scoped to the
+ * DRM file handle used to issue this IOCTL.
+ */
+struct drm_xe_watch_queue {
+	/** @fd: file descriptor of pipe opened with O_NOTIFICATION_PIPE */
+	__u32 fd;
+
+	/**
+	 * @watch_id: identifier (0–255) embedded in the watch notification
+	 * info field; allows multiplexing several watches on one pipe
+	 */
+	__u32 watch_id;
+
+	/** @flags: must be zero */
+	__u32 flags;
+
+	/** @pad: reserved, must be zero */
+	__u32 pad;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/drm-uapi/xe_drm_events.h b/include/drm-uapi/xe_drm_events.h
new file mode 100644
index 000000000..604955950
--- /dev/null
+++ b/include/drm-uapi/xe_drm_events.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _UAPI_XE_DRM_EVENTS_H_
+#define _UAPI_XE_DRM_EVENTS_H_
+
+#include <linux/types.h>
+#include <linux/watch_queue.h>
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+
+/*
+ * WATCH_TYPE_DRM_XE_NOTIFY is defined in the xe watch_queue branch; provide
+ * a fallback for system headers that do not yet carry it.
+ */
+#ifndef WATCH_TYPE_DRM_XE_NOTIFY
+#define WATCH_TYPE_DRM_XE_NOTIFY 2
+#endif
+
+/**
+ * enum drm_xe_watch_event - Xe device watch event subtypes
+ *
+ * Subtypes for notifications delivered via %WATCH_TYPE_DRM_XE_NOTIFY when
+ * reading from a pipe subscribed with %DRM_IOCTL_XE_WATCH_QUEUE.
+ */
+enum drm_xe_watch_event {
+	/**
+	 * @DRM_XE_WATCH_EVENT_VM_ERR: a VM has encountered an error.
+	 *
+	 * Indicates that a memory allocation failure occurred within the
+	 * given VM.  The vm_id of the affected VM is carried in the
+	 * @drm_xe_watch_notification_vm_err::vm_id field of the extended
+	 * notification record.
+	 */
+	DRM_XE_WATCH_EVENT_VM_ERR = 0,
+};
+
+/**
+ * struct drm_xe_watch_notification_vm_err - VM error event notification
+ *
+ * Notification record delivered for %DRM_XE_WATCH_EVENT_VM_ERR.
+ * The record type is always %WATCH_TYPE_DRM_XE_NOTIFY and the subtype is
+ * %DRM_XE_WATCH_EVENT_VM_ERR.
+ */
+struct drm_xe_watch_notification_vm_err {
+	/** @base: common watch notification header */
+	struct watch_notification base;
+
+	/** @vm_id: ID of the VM that hit out-of-memory */
+	__u32 vm_id;
+
+	/** @error_code: error code describing the error condition (negative errno) */
+	__s32 error_code;
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* _UAPI_XE_DRM_H_ */
diff --git a/lib/meson.build b/lib/meson.build
index ea721ecf7..1fa2cac0b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -132,6 +132,7 @@ lib_sources = [
 	'xe/xe_sriov_debugfs.c',
 	'xe/xe_sriov_provisioning.c',
 	'xe/xe_util.c',
+	'xe/xe_watch.c',
 ]
 
 lib_deps = [
diff --git a/lib/xe/xe_watch.c b/lib/xe/xe_watch.c
new file mode 100644
index 000000000..46febb18a
--- /dev/null
+++ b/lib/xe/xe_watch.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <poll.h>
+#include <pthread.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#include <xf86drm.h>
+
+#include "igt_core.h"
+#include "xe_drm.h"
+#include "xe_drm_events.h"
+#include "xe/xe_watch.h"
+
+/* Pipe ring-buffer size in pages (one page holds multiple records). */
+#define XE_WATCH_PIPE_PAGES	1
+
+/* Read buffer – large enough for any single notification record. */
+#define XE_WATCH_BUF_SIZE	512
+
+/**
+ * struct xe_watch_listener - internal state for an Xe watch queue listener
+ * @xe_fd: xe DRM device file descriptor passed to xe_watch_listener_create()
+ * @pipe_fd: read end of the O_NOTIFICATION_PIPE used to receive kernel events
+ * @stop_pipe: internal pipe pair used to unblock the worker; write end is
+ *             written by xe_watch_listener_destroy() to signal the thread to exit
+ * @event: caller-supplied event object dispatched for each notification
+ * @thread: background pthread running xe_watch_worker()
+ * @running: set to %false by xe_watch_listener_destroy() to request exit
+ */
+struct xe_watch_listener {
+	int xe_fd;
+	int pipe_fd;
+	int stop_pipe[2];
+	struct xe_watch_event *event;
+	pthread_t thread;
+	bool running;
+};
+
+static void *xe_watch_worker(void *arg)
+{
+	struct xe_watch_listener *l = arg;
+	unsigned char buf[XE_WATCH_BUF_SIZE];
+	struct pollfd pfds[2] = {
+		{ .fd = l->pipe_fd,      .events = POLLIN },
+		{ .fd = l->stop_pipe[0], .events = POLLIN },
+	};
+
+	while (READ_ONCE(l->running)) {
+		unsigned char *p, *end;
+		ssize_t len;
+		int ret;
+
+		ret = poll(pfds, 2, 200/* ms */);
+		if (ret < 0) {
+			if (errno == EINTR)
+				continue;
+			igt_warn("xe_watch: poll failed: %s\n", strerror(errno));
+			break;
+		}
+
+		/* Stop signal received */
+		if (pfds[1].revents & POLLIN)
+			break;
+
+		if (!(pfds[0].revents & POLLIN))
+			continue;
+
+		len = read(l->pipe_fd, buf, sizeof(buf));
+
+		if (len < 0) {
+			if (errno == EINTR || errno == EAGAIN)
+				continue;
+			igt_warn("xe_watch: read failed: %s\n", strerror(errno));
+			break;
+		}
+
+		p = buf;
+		end = buf + len;
+
+		while (p + sizeof(struct watch_notification) <= end) {
+			const struct watch_notification *notif =
+				(const struct watch_notification *)p;
+			size_t rec_len = notif->info & WATCH_INFO_LENGTH;
+
+			if (rec_len < sizeof(struct watch_notification) ||
+			    p + rec_len > end)
+				break;
+
+			l->event->notif = notif;
+			(*l->event->ops->event_deliver)(l->event);
+
+			p += rec_len;
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * xe_watch_listener_create - create and start an Xe watch queue listener
+ * @xe_fd: open xe DRM device file descriptor
+ * @event: caller-initialised event object; its @ops->event_deliver function
+ *         is called from a background pthread for every received
+ *         %WATCH_TYPE_DRM_XE_NOTIFY record, with @event->notif pointing to the
+ *         notification.  The caller typically embeds @event in a larger
+ *         private structure and uses container_of() inside the callback.
+ *
+ * Opens an ``O_NOTIFICATION_PIPE``, registers it with the Xe device via
+ * %DRM_IOCTL_XE_WATCH_QUEUE, and starts a background pthread that reads
+ * events and dispatches them via @event->ops->event_deliver().
+ *
+ * Returns a pointer to the new listener on success, or asserts on failure.
+ * Free with xe_watch_listener_destroy().
+ */
+struct xe_watch_listener *xe_watch_listener_create(int xe_fd,
+						   struct xe_watch_event *event)
+{
+	struct xe_watch_listener *l;
+	struct {
+		struct watch_notification_filter filter;
+		struct watch_notification_type_filter slot[2];
+	} fbuf = {
+		.filter = { .nr_filters = 2 },
+		.slot = {
+			{
+				.type           = WATCH_TYPE_DRM_XE_NOTIFY,
+				.subtype_filter = { [0] = UINT32_MAX },
+			},
+			{
+				.type           = WATCH_TYPE_META,
+				.subtype_filter = { [0] = UINT32_MAX },
+			},
+		},
+	};
+	struct drm_xe_watch_queue args = {};
+	int pipefd[2];
+	int ret;
+
+	igt_assert(event && event->ops && event->ops->event_deliver);
+
+	l = calloc(1, sizeof(*l));
+	igt_assert(l);
+
+	l->xe_fd = xe_fd;
+	l->event = event;
+	WRITE_ONCE(l->running, true);
+
+	/* Create the notification pipe */
+	ret = pipe2(pipefd, O_NOTIFICATION_PIPE);
+	igt_assert_f(ret == 0, "xe_watch: pipe2(O_NOTIFICATION_PIPE) failed: %s\n",
+		     strerror(errno));
+	l->pipe_fd = pipefd[0];
+
+	/* Size the pipe ring buffer */
+	ret = ioctl(l->pipe_fd, IOC_WATCH_QUEUE_SET_SIZE, XE_WATCH_PIPE_PAGES);
+	igt_assert_f(ret == 0, "xe_watch: IOC_WATCH_QUEUE_SET_SIZE failed: %s\n",
+		     strerror(errno));
+
+	/* Filter to only DRM_XE and META notifications */
+	ret = ioctl(l->pipe_fd, IOC_WATCH_QUEUE_SET_FILTER, &fbuf.filter);
+	igt_assert_f(ret == 0, "xe_watch: IOC_WATCH_QUEUE_SET_FILTER failed: %s\n",
+		     strerror(errno));
+
+	/* Register the pipe with the Xe device */
+	args.fd       = pipefd[1];
+	args.watch_id = 0;
+	ret = drmIoctl(xe_fd, DRM_IOCTL_XE_WATCH_QUEUE, &args);
+	igt_assert_f(ret == 0, "xe_watch: DRM_IOCTL_XE_WATCH_QUEUE failed: %s\n",
+		     strerror(errno));
+
+	/*
+	 * The write end is owned by the kernel after subscription; close our
+	 * copy so that the pipe is torn down when the device closes it.
+	 */
+	close(pipefd[1]);
+
+	/* Internal stop-signal pipe */
+	ret = pipe(l->stop_pipe);
+	igt_assert_f(ret == 0, "xe_watch: pipe(stop) failed: %s\n",
+		     strerror(errno));
+
+	ret = pthread_create(&l->thread, NULL, xe_watch_worker, l);
+	igt_assert_f(ret == 0, "xe_watch: pthread_create failed: %s\n",
+		     strerror(ret));
+
+	return l;
+}
+
+/**
+ * xe_watch_listener_destroy - stop and free an Xe watch queue listener
+ * @listener: listener returned by xe_watch_listener_create()
+ *
+ * Signals the worker thread to exit, waits for it to finish, closes file
+ * descriptors and frees the listener.
+ */
+void xe_watch_listener_destroy(struct xe_watch_listener *listener)
+{
+	if (!listener)
+		return;
+
+	/* Signal the worker to exit */
+	WRITE_ONCE(listener->running, false);
+	write(listener->stop_pipe[1], "\0", 1);
+
+	pthread_join(listener->thread, NULL);
+
+	close(listener->stop_pipe[0]);
+	close(listener->stop_pipe[1]);
+	close(listener->pipe_fd);
+
+	free(listener);
+}
diff --git a/lib/xe/xe_watch.h b/lib/xe/xe_watch.h
new file mode 100644
index 000000000..135cfe941
--- /dev/null
+++ b/lib/xe/xe_watch.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_WATCH_H_
+#define _XE_WATCH_H_
+
+#include <stdint.h>
+
+#include "xe_drm.h"
+
+struct xe_watch_event;
+
+/**
+ * typedef xe_watch_event_fn - callback invoked for each watch queue event
+ * @event: the event object whose @ops->event_deliver was registered; the
+ *         @notif field is set to the received notification before the call.
+ *         The caller typically uses container_of() to recover its private
+ *         state from @event.
+ */
+typedef void (*xe_watch_event_fn)(struct xe_watch_event *event);
+
+/**
+ * struct xe_watch_event_ops - operations table for &struct xe_watch_event
+ * @event_deliver: called by the watch listener worker for every received
+ *                 %WATCH_TYPE_DRM_XE_NOTIFY record.  Must not be NULL.
+ */
+struct xe_watch_event_ops {
+	xe_watch_event_fn event_deliver;
+};
+
+/**
+ * struct xe_watch_event - base object embedded in caller-private event state
+ * @ops: pointer to the operations table; must be initialised before calling
+ *       xe_watch_listener_create()
+ * @notif: set by the worker to the current notification record immediately
+ *         before dispatching @ops->event_deliver(); valid only for the
+ *         duration of that call.  Cast to
+ *         &struct drm_xe_watch_notification_vm_err when
+ *         @notif->subtype == %DRM_XE_WATCH_EVENT_VM_ERR.
+ *
+ * Callers embed this struct in their own private structure and recover it
+ * inside the callback using container_of():
+ *
+ * .. code-block:: c
+ *
+ *   struct my_state {
+ *       struct xe_watch_event base;
+ *       int my_field;
+ *   };
+ *
+ *   static void on_event(struct xe_watch_event *e)
+ *   {
+ *       struct my_state *s = container_of(e, struct my_state, base);
+ *       // use s->base.notif and s->my_field
+ *   }
+ *
+ *   static const struct xe_watch_event_ops my_ops = {
+ *       .event_deliver = on_event,
+ *   };
+ */
+struct xe_watch_event {
+	const struct xe_watch_event_ops *ops;
+	const struct watch_notification *notif;
+};
+
+/**
+ * struct xe_watch_listener - listener state for Xe device watch queue events
+ *
+ * Opaque handle returned by xe_watch_listener_create().  Do not access
+ * members directly; use the xe_watch_listener_* API.
+ */
+struct xe_watch_listener;
+
+struct xe_watch_listener *xe_watch_listener_create(int xe_fd,
+						   struct xe_watch_event *event);
+void xe_watch_listener_destroy(struct xe_watch_listener *listener);
+
+#endif /* _XE_WATCH_H_ */
-- 
2.53.0

