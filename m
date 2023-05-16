Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D1410E26E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:45:58 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 17:44:33 +0200
Message-Id: <20230516154434.810356-8-dominik.grzegorzek@intel.com>
In-Reply-To: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
References: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/8] xe/xe_eudebug: Race discovery against
 eudebug attach.
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

Validate eu debug resource discovery in a pretty cruel way.
Add subtests:

1) discovery-race - spawns N client proccesses, which create
   N+N*N resources each, then it creates M debugger
   threads competing for an access to the client proccess. After
   successful attach, with probability of 0.5 read and assert
   discovered resources, immediately detach otherwise.

2) discovery-empty[|-clients] - same as 1#, but destroy
   resources in flight (explicetly or by closing the client).
   Expect the last discovery not sending any events.

Currently N = 16, M = 4.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/xe/xe_eudebug.c | 271 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 271 insertions(+)

diff --git a/tests/xe/xe_eudebug.c b/tests/xe/xe_eudebug.c
index 6a4198841..92eaab7de 100644
--- a/tests/xe/xe_eudebug.c
+++ b/tests/xe/xe_eudebug.c
@@ -287,6 +287,268 @@ static void test_basic_sessions(int fd, unsigned int flags, int count)
 		session_destroy(s[i]);
 }
 
+#define RESOURCE_COUNT 16
+#define PRIMARY_THREAD			(1 << 0)
+#define DISCOVERY_CLOSE_CLIENT		(1 << 1)
+#define DISCOVERY_DESTROY_RESOURCES	(1 << 2)
+static void run_discovery_client(struct xe_eudebug_client *c)
+{
+	int fd[RESOURCE_COUNT], i;
+	bool skip_sleep = c->flags & (DISCOVERY_DESTROY_RESOURCES | DISCOVERY_CLOSE_CLIENT);
+
+	srand(getpid());
+
+	for (i = 0; i < RESOURCE_COUNT; i++) {
+		fd[i] = xe_eudebug_client_open_driver(c);
+
+		/*
+		 * Give the debugger a break in event stream after every
+		 * other client, that allows to read discovery and dettach in quiet.
+		 */
+		if (random() % 2 == 0 && !skip_sleep)
+			sleep(1);
+
+		for (int j = 0; j < RESOURCE_COUNT; j++) {
+			uint32_t vm = xe_eudebug_client_vm_create(c, fd[i], 0, 0);
+
+			if (c->flags & DISCOVERY_DESTROY_RESOURCES)
+				xe_eudebug_client_vm_destroy(c, fd[i], vm);
+		}
+
+		if (c->flags & DISCOVERY_CLOSE_CLIENT)
+			xe_eudebug_client_close_driver(c, fd[i]);
+	}
+}
+
+static void *discovery_race_thread(void *data)
+{
+	struct {
+		uint64_t client_handle;
+		int vm_count;
+	} clients[RESOURCE_COUNT];
+	struct session *s = data;
+	struct drm_xe_eudebug_event *e = NULL;
+	int expected = RESOURCE_COUNT * (1 + RESOURCE_COUNT);
+	const int tries = 100;
+	bool done = false;
+	int ret = 0;
+
+	for (int try = 0; try < tries && !done; try++) {
+
+		ret = xe_eudebug_debugger_attach(s->d, s->c->pid);
+
+		if (ret == -EBUSY) {
+			usleep(100000);
+			continue;
+		}
+
+		igt_assert_eq(ret, 0);
+
+		if (random() % 2) {
+			int i = -1;
+			xe_eudebug_debugger_start_worker(s->d);
+			sleep(1);
+			xe_eudebug_debugger_stop_worker(s->d, 1);
+			igt_debug("Resources discovered: %lu\n", s->d->event_count);
+
+			xe_eudebug_for_each_event(e, s->d->log) {
+				if (e->type == DRM_XE_EUDEBUG_EVENT_OPEN) {
+					struct drm_xe_eudebug_event_client *eo = (void *)e;
+
+					if (i >= 0) {
+						igt_assert_eq(clients[i].vm_count,
+							      RESOURCE_COUNT);
+					}
+
+					igt_assert(++i < RESOURCE_COUNT);
+					clients[i].client_handle = eo->client_handle;
+					clients[i].vm_count = 0;
+				}
+
+				if (e->type == DRM_XE_EUDEBUG_EVENT_VM)
+					clients[i].vm_count++;
+			};
+
+			for (int j = 0; j < i; j++)
+				for (int k = 0; k < i; k++) {
+					if (k == j)
+						continue;
+
+					igt_assert_neq(clients[j].client_handle,
+						       clients[k].client_handle);
+				}
+
+			if (s->d->event_count >= expected)
+				done = true;
+		}
+
+		xe_eudebug_debugger_dettach(s->d);
+		s->d->log->head = 0;
+		s->d->event_count = 0;
+	}
+
+	/* Primary thread must read everything */
+	if (s->flags & PRIMARY_THREAD) {
+		while ((ret = xe_eudebug_debugger_attach(s->d, s->c->pid)) == -EBUSY)
+			usleep(100000);
+
+		igt_assert_eq(ret, 0);
+
+		xe_eudebug_debugger_start_worker(s->d);
+		xe_eudebug_client_wait_done(s->c);
+
+		if (READ_ONCE(s->d->event_count) != expected)
+			sleep(5);
+
+		xe_eudebug_debugger_stop_worker(s->d, 1);
+		xe_eudebug_debugger_dettach(s->d);
+	}
+
+	return NULL;
+}
+
+static bool event_equals(struct drm_xe_eudebug_event *a,
+			 struct drm_xe_eudebug_event *b)
+{
+	uint64_t seqno_a = a->seqno;
+	int ret = 0;
+
+	if (a->size != b->size)
+		return 0;
+
+	a->seqno = b->seqno;
+	ret = memcmp(a, b, a->size);
+	a->seqno = seqno_a;
+
+	return ret == 0;
+}
+
+static void test_race_discovery(int fd, unsigned int flags, int clients)
+{
+	const int debuggers_per_client = 4;
+	int count = clients * debuggers_per_client;
+	struct drm_xe_eudebug_event *ef = NULL, *e = NULL;
+	struct session *sessions, *s;
+	struct xe_eudebug_client *c;
+	pthread_t *threads;
+	bool found;
+	int i, j;
+
+	sessions = calloc(count, sizeof(*sessions));
+	threads = calloc(count, sizeof(*threads));
+
+	for (i = 0; i < clients; i++) {
+		c = xe_eudebug_client_create(run_discovery_client, flags);
+		for (j = 0; j < debuggers_per_client; j++) {
+			s = &sessions[i * debuggers_per_client + j];
+			s->c = c;
+			s->d = xe_eudebug_debugger_create(fd, flags);
+			s->flags = flags | (!j ? PRIMARY_THREAD : 0);
+		}
+	}
+
+	for (i = 0; i < count; i++) {
+		if (sessions[i].flags & PRIMARY_THREAD)
+			xe_eudebug_client_start(sessions[i].c);
+
+		pthread_create(&threads[i], NULL, discovery_race_thread, &sessions[i]);
+	}
+
+	for (i = 0; i < count; i++)
+		pthread_join(threads[i], NULL);
+
+	for (i = count - 1; i > 0; i--) {
+		if (sessions[i].flags & PRIMARY_THREAD) {
+			igt_assert_eq(sessions[i].c->seqno-1, sessions[i].d->event_count);
+
+			xe_eudebug_for_each_event(ef, sessions[0].d->log) {
+				found = false;
+				e = NULL;
+				xe_eudebug_for_each_event(e, sessions[i].d->log) {
+					if (event_equals(ef, e)) {
+						igt_assert_f(!found, "Event duplicated"
+								     " in session %d\n", i);
+						found = true;
+					}
+				}
+
+				if (!found)
+					xe_eudebug_event_log_print(sessions[i].d->log, false);
+				igt_assert_f(found, "Missing event in session %d\n", i);
+			}
+			xe_eudebug_client_destroy(sessions[i].c);
+		}
+		xe_eudebug_debugger_destroy(sessions[i].d);
+	}
+}
+
+static void *attach_dettach_thread(void *data)
+{
+	struct session *s = data;
+	const int tries = 100;
+	int ret = 0;
+
+	for (int try = 0; try < tries; try++) {
+
+		ret = xe_eudebug_debugger_attach(s->d, s->c->pid);
+
+		if (ret == -EBUSY) {
+			usleep(100000);
+			continue;
+		}
+
+		igt_assert_eq(ret, 0);
+
+		if (random() % 2 == 0) {
+			xe_eudebug_debugger_start_worker(s->d);
+			xe_eudebug_debugger_stop_worker(s->d, 1);
+		}
+
+		xe_eudebug_debugger_dettach(s->d);
+		s->d->log->head = 0;
+		s->d->event_count = 0;
+	}
+
+	return NULL;
+}
+
+static void test_empty_discovery(int fd, unsigned int flags, int clients)
+{
+	struct session **s;
+	pthread_t *threads;
+	int i, expected = flags & DISCOVERY_CLOSE_CLIENT ? 0 : RESOURCE_COUNT;
+
+	igt_assert(flags & (DISCOVERY_DESTROY_RESOURCES | DISCOVERY_CLOSE_CLIENT));
+
+	s = calloc(clients, sizeof(struct session *));
+	threads = calloc(clients, sizeof(*threads));
+
+	for (i = 0; i < clients; i++)
+		s[i] = session_create(fd, run_discovery_client, flags);
+
+	for (i = 0; i < clients; i++) {
+		xe_eudebug_client_start(s[i]->c);
+
+		pthread_create(&threads[i], NULL, attach_dettach_thread, s[i]);
+	}
+
+	for (i = 0; i < clients; i++)
+		pthread_join(threads[i], NULL);
+
+	for (i = 0; i < clients; i++) {
+		xe_eudebug_client_wait_done(s[i]->c);
+		igt_assert_eq(xe_eudebug_debugger_attach(s[i]->d, s[i]->c->pid), 0);
+
+		xe_eudebug_debugger_start_worker(s[i]->d);
+		xe_eudebug_debugger_stop_worker(s[i]->d, 5);
+		xe_eudebug_debugger_dettach(s[i]->d);
+
+		igt_assert_eq(s[i]->d->event_count, expected);
+
+		session_destroy(s[i]);
+	}
+}
+
 igt_main
 {
 	int fd;
@@ -313,6 +575,15 @@ igt_main
 	igt_subtest("basic-vms")
 		test_basic_sessions(fd, CREATE_VMS, 1);
 
+	igt_subtest("discovery-race")
+		test_race_discovery(fd, 0, 16);
+
+	igt_subtest("discovery-empty")
+		test_empty_discovery(fd, DISCOVERY_CLOSE_CLIENT, 16);
+
+	igt_subtest("discovery-empty-clients")
+		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
+
 	igt_fixture
 		close(fd);
 }
-- 
2.34.1
