Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E30710E25B
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:45:52 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 17:44:29 +0200
Message-Id: <20230516154434.810356-4-dominik.grzegorzek@intel.com>
In-Reply-To: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
References: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/8] xe/xe_eudebug: introduce eu debug
 testing framework
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Mika Kuoppala <mika.kuaoppala@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Introduce library which simplifies testing of eu debug capability.
The library provides event log helpers together with asynchronous
abstraction for client proccess and the debugger itself.

xe_eudebug_client creates its own proccess with user's work function,
and gives machanisms to synchronize beginning of execution and event
logging.

xe_eudebug_debugger allows to attach to the given proccess, provides
asynchronous thread for event reading and introduces triggers - a
callback mechanism triggered every time subscribed event was read.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuaoppala@linux.intel.com>
---
 lib/meson.build     |    1 +
 lib/xe/xe_eudebug.c | 1047 +++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_eudebug.h |   89 ++++
 3 files changed, 1137 insertions(+)
 create mode 100644 lib/xe/xe_eudebug.c
 create mode 100644 lib/xe/xe_eudebug.h

diff --git a/lib/meson.build b/lib/meson.build
index 85f100f75..40eb46398 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -102,6 +102,7 @@ lib_sources = [
 	'igt_dsc.c',
 	'xe/xe_compute.c',
 	'xe/xe_compute_square_kernels.c',
+	'xe/xe_eudebug.c',
 	'xe/xe_ioctl.c',
 	'xe/xe_query.c',
 	'xe/xe_spin.c'
diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
new file mode 100644
index 000000000..4803e23a4
--- /dev/null
+++ b/lib/xe/xe_eudebug.c
@@ -0,0 +1,1047 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <sys/select.h>
+#include <poll.h>
+#include <fcntl.h>
+#include <signal.h>
+
+#include "xe_eudebug.h"
+#include "xe_ioctl.h"
+#include "igt.h"
+
+struct event_trigger {
+	xe_eudebug_trigger_fn fn;
+	int type;
+	struct igt_list_head link;
+};
+
+#define CLIENT_PID  1
+#define CLIENT_RUN  2
+#define CLIENT_FINI 3
+#define CLIENT_STOP 4
+
+#define DEBUGGER_WORKER_INACTIVE  0
+#define DEBUGGER_WORKER_ACTIVE  1
+#define DEBUGGER_WORKER_QUITTING 2
+
+static const char *type_to_str(unsigned int type)
+{
+	switch (type) {
+	case DRM_XE_EUDEBUG_EVENT_NONE:
+		return "none";
+	case DRM_XE_EUDEBUG_EVENT_READ:
+		return "read";
+	case DRM_XE_EUDEBUG_EVENT_OPEN:
+		return "client";
+	case DRM_XE_EUDEBUG_EVENT_VM:
+		return "vm";
+	}
+
+	return "unknown";
+}
+
+static const char *event_type_to_str(struct drm_xe_eudebug_event *e, char *buf)
+{
+	sprintf(buf, "%s(%d)", type_to_str(e->type), e->type);
+
+	return buf;
+}
+
+static const char *flags_to_str(unsigned int flags)
+{
+	if (flags & DRM_XE_EUDEBUG_EVENT_CREATE)
+		return "create";
+
+	if (flags & DRM_XE_EUDEBUG_EVENT_DESTROY)
+		return "destroy";
+
+	if (flags & DRM_XE_EUDEBUG_EVENT_STATE_CHANGE)
+		return "state-change";
+
+	return "flags unknown";
+}
+
+static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *b)
+{
+	switch (e->type) {
+	case DRM_XE_EUDEBUG_EVENT_OPEN: {
+		struct drm_xe_eudebug_event_client *ec = (struct drm_xe_eudebug_event_client *)e;
+
+		sprintf(b, "handle=%llu", ec->client_handle);
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM: {
+		struct drm_xe_eudebug_event_vm *evm = (struct drm_xe_eudebug_event_vm *)e;
+
+		sprintf(b, "client_handle=%llu, handle=%llu",
+			evm->client_handle, evm->vm_handle);
+		break;
+	}
+	default:
+		strcpy(b, "<...>");
+	}
+
+	return b;
+}
+
+static const char *event_to_str(struct drm_xe_eudebug_event *e, char *buf)
+{
+	char a[256];
+	char b[256];
+
+	sprintf(buf, "(%llu) %15s:%s: %s",
+		e->seqno,
+		event_type_to_str(e, a),
+		flags_to_str(e->flags),
+		event_members_to_str(e, b));
+
+	return buf;
+}
+
+static void catch_child_failure(void)
+{
+	pid_t pid;
+	int status;
+
+	pid = waitpid(-1, &status, WNOHANG);
+
+	if (pid == 0 || pid == -1)
+		return;
+
+	if (!WIFEXITED(status))
+		return;
+
+	igt_assert_f(WEXITSTATUS(status) == 0, "Client failed!\n");
+}
+
+static int safe_pipe_read(int pipe[2], void *buf, int nbytes)
+{
+	int ret;
+	struct pollfd fd = {
+		.fd = pipe[0],
+		.events = POLLIN,
+		.revents = 0
+	};
+
+	/* When child fails we may get stuck forever. Check whether
+	 * the child process ended with an error.
+	 */
+	do {
+		ret = poll(&fd, 1, 1000);
+
+		if (!ret)
+			catch_child_failure();
+	} while (!ret);
+
+	return read(pipe[0], buf, nbytes);
+}
+
+static uint64_t pipe_wait_u64(int pipe[2])
+{
+	uint64_t in;
+	uint64_t ret;
+
+	ret = safe_pipe_read(pipe, &in, sizeof(in));
+	igt_assert(ret == sizeof(in));
+
+	return in;
+}
+
+#define pipe_wait pipe_wait_u64
+
+static void pipe_wait_token(int pipe[2], uint64_t token)
+{
+	uint64_t in;
+
+	in = pipe_wait_u64(pipe);
+	igt_assert_eq(token, in);
+}
+
+static void pipe_signal(int pipe[2], uint64_t token)
+{
+	igt_assert(write(pipe[1], &token, sizeof(token)) == sizeof(token));
+}
+
+static void pipe_close(int pipe[2])
+{
+	if (pipe[0] != -1)
+		close(pipe[0]);
+
+	if (pipe[1] != -1)
+		close(pipe[1]);
+}
+
+static int __xe_eudebug_connect(int fd, pid_t pid, uint32_t flags, uint64_t events)
+{
+	struct drm_xe_eudebug_connect_param param = {
+		.pid = pid,
+		.flags = flags,
+		.events = events
+	};
+	int debugfd;
+
+	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
+
+	if (debugfd < 0)
+		return -errno;
+
+	return debugfd;
+}
+
+static int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags)
+{
+	int ret;
+	uint64_t events = 0; /* events filtering not supported yet! */
+
+	ret = __xe_eudebug_connect(fd, pid, flags, events);
+
+	return ret;
+}
+
+static void event_log_write_to_fd(struct xe_eudebug_event_log *l, int fd)
+{
+	igt_assert_eq(write(fd, &l->head, sizeof(l->head)),
+		      sizeof(l->head));
+
+	igt_assert_eq(write(fd, l->log, l->head), l->head);
+}
+
+static void event_log_read_from_fd(struct xe_eudebug_event_log *l, int fd)
+{
+	igt_assert_eq(read(fd, &l->head, sizeof(l->head)),
+		      sizeof(l->head));
+
+	igt_assert_lt(l->head, l->max_size);
+
+	igt_assert_eq(read(fd, l->log, l->head), l->head);
+}
+
+typedef int (*cmp_fn_t)(struct drm_xe_eudebug_event *,	void *data);
+
+static struct drm_xe_eudebug_event *
+event_cmp(struct xe_eudebug_event_log *l,
+	  struct drm_xe_eudebug_event *current,
+	  cmp_fn_t match,
+	  void *data)
+{
+	struct drm_xe_eudebug_event *e = current;
+
+	xe_eudebug_for_each_event(e, l) {
+		if (match(e, data))
+			return e;
+	}
+
+	return NULL;
+}
+
+static int match_type_and_flags(struct drm_xe_eudebug_event *a, void *data)
+{
+	struct drm_xe_eudebug_event *b = data;
+
+	if (a->type == b->type &&
+	    a->flags == b->flags)
+		return 1;
+
+	return 0;
+}
+
+static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
+{
+	uint64_t h = *(uint64_t *)data;
+
+	switch (e->type) {
+	case DRM_XE_EUDEBUG_EVENT_OPEN: {
+		struct drm_xe_eudebug_event_client *client = (struct drm_xe_eudebug_event_client *)e;
+
+		if (client->client_handle == h)
+			return 1;
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM: {
+		struct drm_xe_eudebug_event_vm *vm = (struct drm_xe_eudebug_event_vm *)e;
+
+		if (vm->client_handle == h)
+			return 1;
+		break;
+	}
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
+{
+
+	struct drm_xe_eudebug_event *d = (void *)data;
+	int ret;
+
+	d->flags ^= DRM_XE_EUDEBUG_EVENT_CREATE | DRM_XE_EUDEBUG_EVENT_DESTROY;
+	ret = match_type_and_flags(e, data);
+	d->flags ^= DRM_XE_EUDEBUG_EVENT_CREATE | DRM_XE_EUDEBUG_EVENT_DESTROY;
+
+	if (!ret)
+		return 0;
+
+	switch (e->type) {
+	case DRM_XE_EUDEBUG_EVENT_OPEN: {
+		struct drm_xe_eudebug_event_client *client = (struct drm_xe_eudebug_event_client *)e;
+		struct drm_xe_eudebug_event_client *filter = (struct drm_xe_eudebug_event_client *)data;
+
+		if (client->client_handle == filter->client_handle)
+			return 1;
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM: {
+		struct drm_xe_eudebug_event_vm *vm = (struct drm_xe_eudebug_event_vm *)e;
+		struct drm_xe_eudebug_event_vm *filter = (struct drm_xe_eudebug_event_vm *)data;
+
+		if (vm->vm_handle == filter->vm_handle)
+			return 1;
+		break;
+	}
+	default:
+		break;
+	}
+	return 0;
+}
+
+static struct drm_xe_eudebug_event *
+event_type_match(struct xe_eudebug_event_log *l,
+		 struct drm_xe_eudebug_event *filter,
+		 struct drm_xe_eudebug_event *current)
+{
+	return event_cmp(l, current, match_type_and_flags, filter);
+}
+
+static struct drm_xe_eudebug_event *
+client_match(struct xe_eudebug_event_log *l,
+	     uint64_t client_handle,
+	     struct drm_xe_eudebug_event *current)
+{
+	return event_cmp(l, current, match_client_handle, &client_handle);
+}
+
+static struct drm_xe_eudebug_event *
+opposite_event_match(struct xe_eudebug_event_log *l,
+		    struct drm_xe_eudebug_event *filter,
+		    struct drm_xe_eudebug_event *current)
+{
+	return event_cmp(l, current, match_opposite_resource, filter);
+}
+
+static void compare_client(struct xe_eudebug_event_log *c, struct drm_xe_eudebug_event *_ce,
+			   struct xe_eudebug_event_log *d, struct drm_xe_eudebug_event *_de)
+{
+	struct drm_xe_eudebug_event_client *ce = (void *)_ce;
+	struct drm_xe_eudebug_event_client *de = (void *)_de;
+	struct drm_xe_eudebug_event *hc, *hd;
+
+	igt_assert(ce);
+	igt_assert(de);
+
+	igt_debug("client: %llu -> %llu\n", ce->client_handle, de->client_handle);
+
+	hc = NULL;
+	hd = NULL;
+
+	do {
+		hc = client_match(c, ce->client_handle, hc);
+		if (!hc)
+			break;
+
+		hd = client_match(d, de->client_handle, hd);
+		if (!hd) {
+			igt_warn("no matching event type %u found for client %llu\n",
+				 hc->type, ce->client_handle);
+			igt_assert(hd);
+		}
+
+		igt_debug("comparing %s %llu vs %s %llu\n",
+			 c->name, hc->seqno, d->name, hd->seqno);
+
+		igt_assert_eq(hc->type, hd->type);
+		igt_assert_eq(hc->flags, hd->flags);
+	} while (hc);
+}
+
+/*
+ * Yeah very slow but someone with lots of events
+ * will conjure a better datastruct
+ */
+static struct drm_xe_eudebug_event *
+xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno)
+{
+	struct drm_xe_eudebug_event *e = NULL, *found = NULL;
+
+	xe_eudebug_for_each_event(e, l) {
+		if (e->seqno == seqno) {
+			igt_assert(!found);
+			found = e;
+		}
+	}
+
+	return found;
+}
+
+static void event_log_sort(struct xe_eudebug_event_log *l)
+{
+	struct xe_eudebug_event_log *tmp;
+	struct drm_xe_eudebug_event *e = NULL;
+	uint64_t first_seqno = 0;
+	uint64_t last_seqno = 0;
+	uint64_t events = 0, added = 0;
+	uint64_t i;
+
+	xe_eudebug_for_each_event(e, l) {
+		if (e->seqno > last_seqno)
+			last_seqno = e->seqno;
+
+		if (e->seqno < first_seqno)
+			first_seqno = e->seqno;
+
+		events++;
+	}
+
+	tmp = xe_eudebug_event_log_create("tmp", l->max_size);
+
+	for (i = 0; i <= last_seqno; i++) {
+		e = xe_eudebug_event_log_find_seqno(l, i);
+		if (e) {
+			xe_eudebug_event_log_write(tmp, e);
+			added++;
+		}
+	}
+
+	igt_assert_eq(events, added);
+	igt_assert_eq(tmp->head, l->head);
+
+	memcpy(l->log, tmp->log, tmp->head);
+
+	xe_eudebug_event_log_destroy(tmp);
+}
+
+/**
+ * xe_eudebug_event_log_create:
+ * @name: event log identifier
+ * @max_size: maximum size of created log
+ *
+ * Function creates an Eu Debugger event log with size equal to @max_size.
+ *
+ * Returns: pointer to just created log
+ */
+#define MAX_EVENT_LOG_SIZE (32 * 1024 * 1024)
+struct xe_eudebug_event_log *xe_eudebug_event_log_create(const char *name, unsigned int max_size)
+{
+	struct xe_eudebug_event_log *l;
+
+	l = calloc(1, sizeof(*l));
+	igt_assert(l);
+	l->log = calloc(1, max_size);
+	igt_assert(l->log);
+	l->max_size = max_size;
+	strncpy(l->name, name, sizeof(l->name) - 1);
+
+	return l;
+}
+
+/**
+ * xe_eudebug_event_log_destroy:
+ * @l: event log pointer
+ *
+ * Frees given event log @l.
+ */
+void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l)
+{
+	free(l->log);
+	free(l);
+}
+
+/**
+ * xe_eudebug_event_log_write:
+ * @l: event log pointer
+ * @e: event to be written to event log
+ *
+ * Writes event @e to the event log.
+ */
+void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eudebug_event *e)
+{
+	igt_assert_lt(l->head + e->size, l->max_size);
+	memcpy(l->log + l->head, e, e->size);
+	l->head += e->size;
+
+#ifdef DEBUG_LOG
+	igt_info("%s: wrote %u bytes to eventlog, free %u bytes\n",
+		 l->name, size, l->max_size - l->head);
+#endif
+}
+
+/**
+ * xe_eudebug_event_log_print:
+ * @l: event log pointer
+ * @debug: when true function uses igt_debug instead of igt_info.
+ *
+ * Prints given event log.
+ */
+void
+xe_eudebug_event_log_print(struct xe_eudebug_event_log *l, bool debug)
+{
+	struct drm_xe_eudebug_event *e = NULL;
+	int level = debug ? IGT_LOG_DEBUG : IGT_LOG_INFO;
+	char str[4096];
+
+	igt_log(IGT_LOG_DOMAIN, level,
+		"event log '%s' (%u bytes):\n", l->name, l->head);
+
+	xe_eudebug_for_each_event(e, l) {
+		event_to_str(e, str);
+		igt_log(IGT_LOG_DOMAIN, level, "%s\n", str);
+	}
+}
+
+/**
+ * xe_eudebug_event_log_compare:
+ * @a: event log pointer
+ * @b: event log pointer
+ *
+ * Compares and asserts event logs @a, @b if the event
+ * sequence matches.
+ */
+void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *a, struct xe_eudebug_event_log *b)
+{
+	struct drm_xe_eudebug_event *ae = NULL;
+	struct drm_xe_eudebug_event *be = NULL;
+
+	xe_eudebug_for_each_event(ae, a) {
+		if (ae->type == DRM_XE_EUDEBUG_EVENT_OPEN &&
+		    ae->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+			be = event_type_match(b, ae, be);
+
+			compare_client(a, ae, b, be);
+			compare_client(b, be, a, ae);
+		}
+	}
+}
+
+/**
+ * xe_eudebug_event_log_match_opposite:
+ * @l: event log pointer
+ *
+ * Matches and asserts content of all opposite events (create vs destroy).
+ */
+void
+xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l)
+{
+	struct drm_xe_eudebug_event *ce = NULL;
+	struct drm_xe_eudebug_event *de = NULL;
+
+	xe_eudebug_for_each_event(ce, l) {
+		if (ce->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+			uint8_t offset = sizeof(struct drm_xe_eudebug_event);
+			int opposite_matching;
+
+			de = opposite_event_match(l, ce, ce);
+
+			igt_assert_eq(ce->size, de->size);
+			opposite_matching = memcmp((uint8_t *)de + offset,
+						   (uint8_t *)ce + offset,
+						   de->size - offset) == 0;
+
+			igt_assert_f(opposite_matching,
+				     "%s: create|destroy event not "
+				     "maching (%llu) vs (%llu)\n",
+				     l->name, de->seqno, ce->seqno);
+		}
+	}
+}
+
+static void debugger_run_triggers(struct xe_eudebug_debugger *d,
+				  struct drm_xe_eudebug_event *e)
+{
+	struct event_trigger *t;
+
+	igt_list_for_each_entry(t, &d->triggers, link) {
+		if (e->type == t->type)
+			t->fn(d, e);
+	}
+}
+
+#define MAX_EVENT_SIZE (32 * 1024)
+static int
+xe_eudebug_read_event(int fd, struct drm_xe_eudebug_event *event)
+{
+	int ret;
+
+	event->type = DRM_XE_EUDEBUG_EVENT_READ;
+	event->flags = 0;
+	event->size = MAX_EVENT_SIZE;
+
+	ret = igt_ioctl(fd, DRM_XE_EUDEBUG_IOCTL_READ_EVENT, event);
+	if (ret < 0)
+		return -errno;
+
+	return ret;
+}
+
+static void *debugger_worker_loop(void *data)
+{
+	uint8_t buf[MAX_EVENT_SIZE];
+	struct drm_xe_eudebug_event *e = (void *)buf;
+	struct xe_eudebug_debugger *d = data;
+	struct pollfd p = {
+		.fd = d->fd,
+		.events = POLLIN,
+		.revents = 0,
+	};
+	int timeout_ms = 100, ret;
+
+	igt_assert(d->master_fd >= 0);
+
+	 do {
+		ret = poll(&p, 1, timeout_ms);
+
+		if (ret == -1) {
+			igt_info("poll failed with errno %d\n", errno);
+			break;
+		}
+
+		if (ret == 1 && (p.revents & POLLIN)) {
+			int err = xe_eudebug_read_event(d->fd, e);
+
+			if (!err) {
+				++d->event_count;
+
+				xe_eudebug_event_log_write(d->log, e);
+				debugger_run_triggers(d, e);
+			} else {
+				igt_info("xe_eudebug_read_event returned %d\n", ret);
+			}
+		}
+	} while ((ret && READ_ONCE(d->worker_state) == DEBUGGER_WORKER_QUITTING) ||
+		 READ_ONCE(d->worker_state) == DEBUGGER_WORKER_ACTIVE);
+
+	d->worker_state = DEBUGGER_WORKER_INACTIVE;
+	return NULL;
+}
+
+/**
+ * xe_eudebug_debugger_create:
+ * @master_fd: xe client used to open the debugger connection
+ * @flags: flags stored in a debugger structure, can be used at will
+ * of the caller, i.e. to be used inside triggers.
+ *
+ * Returns: newly created xe_eudebug_debugger structure with its
+ * event log initialized. Note that to open the connection
+ * you need call @xe_eudebug_debugger_attach.
+ */
+struct xe_eudebug_debugger *
+xe_eudebug_debugger_create(int master_fd, uint64_t flags)
+{
+	struct xe_eudebug_debugger *d;
+
+	d = calloc(1, sizeof(*d));
+	d->flags = flags;
+	igt_assert(d);
+	IGT_INIT_LIST_HEAD(&d->triggers);
+	d->log = xe_eudebug_event_log_create("debugger", MAX_EVENT_LOG_SIZE);
+	d->fd = -1;
+	d->master_fd = master_fd;
+
+	return d;
+}
+
+static void debugger_destroy_triggers(struct xe_eudebug_debugger *d)
+{
+	struct event_trigger *t, *tmp;
+
+	igt_list_for_each_entry_safe(t, tmp, &d->triggers, link)
+		free(t);
+}
+
+/**
+ * xe_eudebug_debugger_destroy:
+ * @d: pointer to the debugger
+ *
+ * Frees xe_eudebug_debugger structure pointed by @d. If the debugger
+ * connection was still opened it terminates it.
+ */
+void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d)
+{
+	if (d->worker_state)
+		xe_eudebug_debugger_stop_worker(d, 1);
+
+	if (d->target_pid)
+		xe_eudebug_debugger_dettach(d);
+
+	xe_eudebug_event_log_destroy(d->log);
+	debugger_destroy_triggers(d);
+	free(d);
+}
+
+/**
+ * xe_eudebug_debugger_attach:
+ * @d: pointer to the debugger
+ * @target: pid of the process to attach debugger
+ *
+ * Opens the xe eu debugger connection to the @target proccess.
+ *
+ * Returns: 0 if the debugger was successfully attached, -errno otherwise.
+ */
+int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, pid_t target)
+{
+	int ret;
+
+	igt_assert_eq(d->fd, -1);
+	ret = xe_eudebug_connect(d->master_fd, target, 0);
+
+	if (ret < 0)
+		return ret;
+
+	d->fd = ret;
+	d->target_pid = target;
+
+	igt_debug("debugger connected to %lu\n", d->target_pid);
+
+	return 0;
+}
+
+/**
+ * xe_eudebug_debugger_dettach:
+ * @d: pointer to the debugger
+ *
+ * Closes previously opened xe eu debugger connection. Asserts if
+ * the debugger has active session.
+ */
+void xe_eudebug_debugger_dettach(struct xe_eudebug_debugger *d)
+{
+	igt_assert(d->target_pid);
+	close(d->fd);
+	d->target_pid = 0;
+	d->fd = -1;
+}
+
+/**
+ * xe_eudebug_debugger_add_trigger:
+ * @d: pointer to the debugger
+ * @type: the type of the event which activates the trigger
+ * @fn: function to be called when event of @type was read by the debugger.
+ *
+ * Adds function @fn to the list of triggers activated when event of @type
+ * has been read by worker.
+ * Note: Triggers are activated by the worker.
+ */
+void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d,
+				     int type, xe_eudebug_trigger_fn fn)
+{
+	struct event_trigger *t;
+
+	t = calloc(1, sizeof(*t));
+	IGT_INIT_LIST_HEAD(&t->link);
+	t->type = type;
+	t->fn = fn;
+
+	igt_list_add_tail(&t->link, &d->triggers);
+	igt_debug("added trigger %p\n", t);
+}
+
+/**
+ * xe_eudebug_debugger_start_worker:
+ * @d: pointer to the debugger
+ *
+ * Starts the debugger worker. Worker is resposible for reading all
+ * incoming events from the debugger, put then into debugger log and
+ * execute appropriate event triggers. Note that using the debuggers
+ * event log while worker is running is not safe.
+ */
+void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d)
+{
+	int ret;
+
+	d->worker_state = true;
+	ret = pthread_create(&d->worker_thread, NULL, &debugger_worker_loop, d);
+
+	igt_assert_f(ret == 0, "Debugger worker thread creation failed!");
+}
+
+/**
+ * xe_eudebug_debugger_stop_worker:
+ * @d: pointer to the debugger
+ *
+ * Stops the debugger worker. Event log is sorted by seqno after closure.
+ */
+void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d,
+				     int timeout_s)
+{
+	struct timespec t = {};
+	int ret;
+
+	igt_assert(d->worker_state);
+
+	d->worker_state = DEBUGGER_WORKER_QUITTING; /* First time be polite. */
+	igt_assert_eq(clock_gettime(CLOCK_REALTIME, &t), 0);
+	t.tv_sec += timeout_s;
+
+	ret = pthread_timedjoin_np(d->worker_thread, NULL, &t);
+
+	if (ret == ETIMEDOUT) {
+		d->worker_state = DEBUGGER_WORKER_INACTIVE;
+		ret = pthread_join(d->worker_thread, NULL);
+	}
+
+	igt_assert_f(ret == 0 || ret != ESRCH,
+		     "pthread join failed with error %d!\n", ret);
+
+	event_log_sort(d->log);
+}
+
+/**
+ * xe_eudebug_client_create:
+ * @work: function that opens xe device and executes arbitrary workload
+ * @flags: flags stored in a client structure, can be used at will
+ * of the caller, i.e. to provide the @work function an additional switch.
+ *
+ * Forks and creates the debugger process. @work won't be called until
+ * xe_eudebug_client_start is called.
+ *
+ * Returns: newly created xe_eudebug_debugger structure with its
+ * event log initialized.
+ */
+struct xe_eudebug_client *xe_eudebug_client_create(xe_eudebug_client_work_fn work, uint64_t flags)
+{
+	struct xe_eudebug_client *c;
+
+	c = calloc(1, sizeof(*c));
+	c->flags = flags;
+	igt_assert(c);
+	igt_assert(!pipe(c->p_in));
+	igt_assert(!pipe(c->p_out));
+	c->seqno = 1;
+	c->log = xe_eudebug_event_log_create("client", MAX_EVENT_LOG_SIZE);
+	c->done = 0;
+
+	igt_fork(child, 1) {
+		igt_assert_eq(c->pid, 0);
+
+		close(c->p_out[0]);
+		c->p_out[0] = -1;
+		close(c->p_in[1]);
+		c->p_in[1] = -1;
+
+		pipe_signal(c->p_out, CLIENT_PID);
+		pipe_signal(c->p_out, getpid());
+
+		pipe_wait_token(c->p_in, CLIENT_RUN);
+		work(c);
+		pipe_signal(c->p_out, CLIENT_FINI);
+
+		igt_assert_eq(c->pid, 0);
+		event_log_write_to_fd(c->log, c->p_out[1]);
+		pipe_signal(c->p_out, c->seqno);
+		pipe_wait_token(c->p_in, CLIENT_STOP);
+	}
+
+	close(c->p_out[1]);
+	c->p_out[1] = -1;
+	close(c->p_in[0]);
+	c->p_in[0] = -1;
+
+	pipe_wait_token(c->p_out, CLIENT_PID);
+	c->pid = pipe_wait(c->p_out);
+
+	igt_info("client running with pid %d\n", c->pid);
+
+	return c;
+}
+
+/**
+ * xe_eudebug_client_stop:
+ * @c: pointer to xe_eudbug_client structure
+ *
+ * Waits for the end of client's work and exits the proccess.
+ */
+void xe_eudebug_client_stop(struct xe_eudebug_client *c)
+{
+	if (c->pid) {
+		int waitstatus;
+
+		xe_eudebug_client_wait_done(c);
+
+		pipe_signal(c->p_in, CLIENT_STOP);
+		igt_assert_eq(waitpid(c->pid, &waitstatus, 0),
+			      c->pid);
+		c->pid = 0;
+	}
+}
+
+/**
+ * xe_eudebug_client_destroy:
+ * @c: pointer to xe_eudbug_client structure to be freed
+ *
+ * Frees the @c client structure. Note that it calls xe_eudebug_client_stop if
+ * client proccess has not terminated yet.
+ */
+void xe_eudebug_client_destroy(struct xe_eudebug_client *c)
+{
+	xe_eudebug_client_stop(c);
+	pipe_close(c->p_in);
+	pipe_close(c->p_out);
+	xe_eudebug_event_log_destroy(c->log);
+	free(c);
+}
+
+/**
+ * xe_eudebug_client_get_seqno:
+ * @c: pointer to xe_eudbug_client structure
+ *
+ * Increments and returns current seqno value of the given client @c
+ *
+ * Returns: incremented seqno
+ */
+uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c)
+{
+	return c->seqno++;
+}
+
+/**
+ * xe_eudebug_client_start:
+ * @c: pointer to xe_eudebug_client structure
+ *
+ * Starts execution of client's work function within the client's proccess.
+ */
+void xe_eudebug_client_start(struct xe_eudebug_client *c)
+{
+	pipe_signal(c->p_in, CLIENT_RUN);
+}
+
+/**
+ * xe_eudebug_client_wait_done:
+ * @c: pointer to xe_eudebug_client structure
+ *
+ * Waits for the client work end updates the event log.
+ * Doesn't terminate the client's proccess yet.
+ */
+void xe_eudebug_client_wait_done(struct xe_eudebug_client *c)
+{
+	if (!c->done) {
+		c->done = 1;
+		pipe_wait_token(c->p_out, CLIENT_FINI);
+		event_log_read_from_fd(c->log, c->p_out[0]);
+		c->seqno = pipe_wait(c->p_out);
+	}
+}
+
+#define to_base(x) ((struct drm_xe_eudebug_event *)&x)
+
+static void base_event(struct xe_eudebug_client *c,
+		       struct drm_xe_eudebug_event *e,
+		       uint32_t type,
+		       uint32_t flags,
+		       uint64_t size)
+{
+	e->type = type;
+	e->flags = flags;
+	e->seqno = xe_eudebug_client_get_seqno(c);
+	e->size = size;
+}
+
+static void client_event(struct xe_eudebug_client *c, uint32_t flags, int client_fd)
+{
+	struct drm_xe_eudebug_event_client ec;
+
+	base_event(c, to_base(ec), DRM_XE_EUDEBUG_EVENT_OPEN, flags, sizeof(ec));
+
+	ec.client_handle = client_fd;
+
+	xe_eudebug_event_log_write(c->log, (void *)&ec);
+}
+
+static void vm_event(struct xe_eudebug_client *c, uint32_t flags, int client_fd, uint32_t vm_id)
+{
+	struct drm_xe_eudebug_event_vm evm;
+
+	base_event(c, to_base(evm), DRM_XE_EUDEBUG_EVENT_VM, flags, sizeof(evm));
+
+	evm.client_handle = client_fd;
+	evm.vm_handle = vm_id;
+
+	xe_eudebug_event_log_write(c->log, (void *)&evm);
+}
+
+/* Eu debugger wrappers around resource creating xe ioctls. */
+
+/**
+ * xe_eudebug_client_open_driver:
+ * @c: pointer to xe_eudebug_client structure
+ *
+ * Calls drm_open_client(DRIVER_XE) and logs the corresponding
+ * event in client's event log.
+ *
+ * Returns: valid DRM file descriptor
+ */
+int xe_eudebug_client_open_driver(struct xe_eudebug_client *c)
+{
+	int fd;
+
+	fd = drm_open_driver(DRIVER_XE);
+	client_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd);
+
+	return fd;
+}
+
+/**
+ * xe_eudebug_client_close_driver:
+ * @c: pointer to xe_eudebug_client structure
+ * @fd: xe client
+ *
+ * Calls close driver and logs the corresponding event in
+ * client's event log.
+ */
+void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd)
+{
+	client_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd);
+	close(fd);
+}
+
+/**
+ * xe_eudebug_client_vm_create:
+ * @c: pointer to xe_eudebug_client structure
+ * @fd: xe client
+ * @flags: vm bind flags
+ * @ext: pointer to the first user extension
+ *
+ * Calls xe_vm_create() and logs the corresponding event in
+ * client's event log.
+ *
+ * Returns: valid vm handle
+ */
+uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
+				     uint32_t flags, uint64_t ext)
+{
+	uint32_t vm;
+
+	vm = xe_vm_create(fd, flags, ext);
+	vm_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, vm);
+
+	return vm;
+}
+
+/**
+ * xe_eudebug_client_vm_destroy:
+ * @c: pointer to xe_eudebug_client structure
+ * fd: xe client
+ * vm: vm handle
+ *
+ * Calls xe_vm_destroy() and logs the corresponding event in
+ * client's event log.
+ */
+void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t vm)
+{
+	xe_vm_destroy(fd, vm);
+	vm_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, vm);
+}
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
new file mode 100644
index 000000000..5170878dc
--- /dev/null
+++ b/lib/xe/xe_eudebug.h
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include <stdint.h>
+#include <fcntl.h>
+#include <pthread.h>
+
+#include <xe_drm.h>
+#include <xe_drm_tmp.h>
+#include "igt_list.h"
+
+struct xe_eudebug_event_log {
+	uint8_t *log;
+	unsigned int head;
+	unsigned int max_size;
+	char name[80];
+};
+
+struct xe_eudebug_debugger {
+	int fd;
+	uint64_t flags;
+
+	struct xe_eudebug_event_log *log;
+
+	uint64_t event_count;
+
+	uint64_t target_pid;
+
+	struct igt_list_head triggers;
+
+	int master_fd;
+
+	pthread_t worker_thread;
+	int worker_state;
+};
+
+struct xe_eudebug_client {
+	int pid;
+	uint64_t seqno;
+	uint64_t flags;
+	struct xe_eudebug_event_log *log;
+
+	int done;
+	int p_in[2];
+	int p_out[2];
+};
+
+typedef void (*xe_eudebug_client_work_fn)(struct xe_eudebug_client *);
+typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
+				      struct drm_xe_eudebug_event *);
+
+#define xe_eudebug_for_each_event(_e, _log) \
+	for ((_e) = (_e) ? (void *)(uint8_t *)(_e) + (_e)->size : \
+		    (void *)(_log)->log; \
+	    (uint8_t *)(_e) < (_log)->log + (_log)->head; \
+	    (_e) = (void *)(uint8_t *)(_e) + (_e)->size)
+
+struct xe_eudebug_event_log *
+xe_eudebug_event_log_create(const char *name, unsigned int max_size);
+void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l);
+void xe_eudebug_event_log_print(struct xe_eudebug_event_log *l, bool debug);
+void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *c, struct xe_eudebug_event_log *d);
+void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eudebug_event *e);
+void xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l);
+
+struct xe_eudebug_debugger *
+xe_eudebug_debugger_create(int xe, uint64_t flags);
+void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d);
+int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, pid_t pid);
+void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d);
+void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d, int timeout_s);
+void xe_eudebug_debugger_dettach(struct xe_eudebug_debugger *d);
+void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d, int type,
+				     xe_eudebug_trigger_fn fn);
+
+struct xe_eudebug_client *
+xe_eudebug_client_create(xe_eudebug_client_work_fn work, uint64_t flags);
+void xe_eudebug_client_destroy(struct xe_eudebug_client *c);
+void xe_eudebug_client_start(struct xe_eudebug_client *c);
+void xe_eudebug_client_stop(struct xe_eudebug_client *c);
+void xe_eudebug_client_wait_done(struct xe_eudebug_client *c);
+uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c);
+
+int xe_eudebug_client_open_driver(struct xe_eudebug_client *c);
+void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd);
+uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
+				     uint32_t flags, uint64_t ext);
+void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t vm);
-- 
2.34.1
