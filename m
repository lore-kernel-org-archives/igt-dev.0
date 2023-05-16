Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F82B10E25E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:45:56 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 17:44:31 +0200
Message-Id: <20230516154434.810356-6-dominik.grzegorzek@intel.com>
In-Reply-To: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
References: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/8] xe/xe_eudebug: exercise read_event ioctl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Introduce synchronous test, which validates eu debugger read_event
ioctl.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/xe/xe_eudebug.c | 81 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/tests/xe/xe_eudebug.c b/tests/xe/xe_eudebug.c
index cf49a4bd4..31f0f274d 100644
--- a/tests/xe/xe_eudebug.c
+++ b/tests/xe/xe_eudebug.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+#include <poll.h>
 
 #include <xe_drm_tmp.h>
 #include "xe/xe_eudebug.h"
@@ -66,6 +67,34 @@ static void session_destroy(struct session *s)
 	xe_eudebug_client_destroy(s->c);
 }
 
+static int __read_event(int debugfd, struct drm_xe_eudebug_event *event)
+{
+	int ret;
+
+	ret = igt_ioctl(debugfd, DRM_XE_EUDEBUG_IOCTL_READ_EVENT, event);
+	if (ret < 0)
+		return -errno;
+
+	return ret;
+}
+
+static int poll_event(int fd, int timeout_ms)
+{
+	int ret;
+
+	struct pollfd p = {
+		.fd = fd,
+		.events = POLLIN,
+		.revents = 0,
+	};
+
+	ret = poll(&p, 1, timeout_ms);
+	if (ret == -1)
+		return -errno;
+
+	return ret == 1 && (p.revents & POLLIN);
+}
+
 static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect_param *param)
 {
 	int ret = 0;
@@ -174,6 +203,55 @@ static void test_close(int fd)
 	close(debug_fd1);
 }
 
+#define MAX_EVENT_SIZE (32 * 1024)
+static void test_read_event(int fd)
+{
+	struct drm_xe_eudebug_event event = {};
+	struct xe_eudebug_debugger *d;
+	struct xe_eudebug_client *c;
+
+	c = xe_eudebug_client_create(run_basic_client, 0);
+	d = xe_eudebug_debugger_create(fd, 0);
+
+	igt_assert_eq(xe_eudebug_debugger_attach(d, c->pid), 0);
+	igt_assert_eq(poll_event(d->fd, 500), 0);
+
+	event.size = 1;
+	event.type = DRM_XE_EUDEBUG_EVENT_NONE;
+	igt_assert_eq(__read_event(d->fd, &event), -EINVAL);
+
+	event.size = MAX_EVENT_SIZE;
+	event.type = DRM_XE_EUDEBUG_EVENT_NONE;
+	igt_assert_eq(__read_event(d->fd, &event), -EINVAL);
+
+	xe_eudebug_client_start(c);
+
+	igt_assert_eq(poll_event(d->fd, 500), 1);
+	event.type = DRM_XE_EUDEBUG_EVENT_READ;
+	igt_assert_eq(__read_event(d->fd, &event), 0);
+
+	igt_assert_eq(poll_event(d->fd, 500), 1);
+	event.size = MAX_EVENT_SIZE;
+	event.flags = 0;
+	event.type = DRM_XE_EUDEBUG_EVENT_READ;
+	igt_assert_eq(__read_event(d->fd, &event), 0);
+
+	igt_assert_eq(poll_event(d->fd, 500), 0);
+	event.size = MAX_EVENT_SIZE;
+	event.flags = 0;
+	event.type = DRM_XE_EUDEBUG_EVENT_READ;
+	igt_assert_eq(__read_event(d->fd, &event), -ENOENT);
+
+	xe_eudebug_client_wait_done(c);
+	xe_eudebug_client_stop(c);
+
+	igt_assert_eq(poll_event(d->fd, 500), 0);
+	igt_assert_eq(__read_event(d->fd, &event), -ENOENT);
+
+	xe_eudebug_debugger_destroy(d);
+	xe_eudebug_client_destroy(c);
+}
+
 static void test_basic_sessions(int fd, unsigned int flags, int count)
 {
 	struct session **s;
@@ -210,6 +288,9 @@ igt_main
 	igt_subtest("basic-close")
 		test_close(fd);
 
+	igt_subtest("basic-read-event")
+		test_read_event(fd);
+
 	igt_subtest("basic-client")
 		test_basic_sessions(fd, 0, 1);
 
-- 
2.34.1
