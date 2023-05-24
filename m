Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB5C10E226
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 14:30:07 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 24 May 2023 16:29:27 +0200
Message-Id: <20230524142931.119823-6-dominik.grzegorzek@intel.com>
In-Reply-To: <20230524142931.119823-1-dominik.grzegorzek@intel.com>
References: <20230524142931.119823-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/9] xe/staging/xe_eudebug: test open close
 events
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

Introduce basic tests which validate client create/destroy events
sent on xe drm client open/close.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/xe/staging/xe_eudebug.c | 89 +++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tests/xe/staging/xe_eudebug.c b/tests/xe/staging/xe_eudebug.c
index 7202da689..6b97a4851 100644
--- a/tests/xe/staging/xe_eudebug.c
+++ b/tests/xe/staging/xe_eudebug.c
@@ -4,7 +4,68 @@
  */
 
 #include <xe_drm_tmp.h>
+
 #include "igt.h"
+#include "xe/staging/xe_eudebug.h"
+
+static void run_basic_client(struct xe_eudebug_client *c)
+{
+	int fd;
+
+	fd = xe_eudebug_client_open_driver(c);
+	xe_eudebug_client_close_driver(c, fd);
+}
+
+struct session {
+	unsigned int flags;
+	struct xe_eudebug_debugger *d;
+	struct xe_eudebug_client *c;
+};
+
+static struct session *session_create(int fd, xe_eudebug_client_work_fn work, unsigned int flags)
+{
+	struct session *s;
+
+	s = calloc(1, sizeof(*s));
+	igt_assert(s);
+
+	s->c = xe_eudebug_client_create(work, flags);
+	s->d = xe_eudebug_debugger_create(fd, flags);
+
+	return s;
+}
+
+static void session_run(struct session *s)
+{
+	struct xe_eudebug_debugger *debugger = s->d;
+	struct xe_eudebug_client *client = s->c;
+
+	igt_assert_eq(xe_eudebug_debugger_attach(debugger, client->pid), 0);
+
+	xe_eudebug_debugger_start_worker(debugger);
+
+	xe_eudebug_client_start(client);
+	xe_eudebug_client_wait_done(client);
+
+	xe_eudebug_debugger_stop_worker(debugger, 1);
+
+	xe_eudebug_event_log_print(debugger->log, true);
+	xe_eudebug_event_log_print(client->log, true);
+}
+
+static void session_check(struct session *s, bool match_opposite)
+{
+	xe_eudebug_event_log_compare(s->c->log, s->d->log);
+
+	if (match_opposite)
+		xe_eudebug_event_log_match_opposite(s->d->log);
+}
+
+static void session_destroy(struct session *s)
+{
+	xe_eudebug_debugger_destroy(s->d);
+	xe_eudebug_client_destroy(s->c);
+}
 
 static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect_param *param)
 {
@@ -114,6 +175,28 @@ static void test_close(int fd)
 	close(debug_fd1);
 }
 
+static void test_basic_sessions(int fd, unsigned int flags, int count)
+{
+	struct session **s;
+	int i;
+
+	s = calloc(count, sizeof(*s));
+
+	igt_assert(s);
+
+	for (i = 0; i < count; i++)
+		s[i] = session_create(fd, run_basic_client, flags);
+
+	for (i = 0; i < count; i++)
+		session_run(s[i]);
+
+	for (i = 0; i < count; i++)
+		session_check(s[i], true);
+
+	for (i = 0; i < count; i++)
+		session_destroy(s[i]);
+}
+
 igt_main
 {
 	int fd;
@@ -128,6 +211,12 @@ igt_main
 	igt_subtest("basic-close")
 		test_close(fd);
 
+	igt_subtest("basic-client")
+		test_basic_sessions(fd, 0, 1);
+
+	igt_subtest("multiple-sessions")
+		test_basic_sessions(fd, 0, 4);
+
 	igt_fixture
 		close(fd);
 }
-- 
2.34.1
