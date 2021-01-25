Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 25 Jan 2021 15:28:01 +0000
Message-Id: <20210125152801.2515999-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/sysfs_clients: Check that client ids
 are cyclic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

The client id used is a cyclic allocator as that reduces the likelihood
of userspace seeing the same id used again (and so confusing the new
client as the old). Verify that each new client has an id greater than
the last.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 tests/i915/sysfs_clients.c | 109 +++++++++++++++++++++++++++++++++----
 1 file changed, 98 insertions(+), 11 deletions(-)

diff --git a/tests/i915/sysfs_clients.c b/tests/i915/sysfs_clients.c
index 6be52c04f..936774661 100644
--- a/tests/i915/sysfs_clients.c
+++ b/tests/i915/sysfs_clients.c
@@ -47,6 +47,8 @@
 #define assert_within_epsilon(x, ref, tolerance) \
 	__assert_within_epsilon(x, ref, tolerance / 100., tolerance / 100.)
 
+#define BUFSZ 280
+
 #define MI_BATCH_BUFFER_START (0x31 << 23)
 #define MI_BATCH_BUFFER_END (0xa << 23)
 #define MI_ARB_CHECK (0x5 << 23)
@@ -73,7 +75,7 @@ static void pidname(int i915, int clients)
 {
 	struct dirent *de;
 	int sv[2], rv[2];
-	char buf[280];
+	char buf[BUFSZ];
 	int me = -1;
 	long count;
 	pid_t pid;
@@ -181,7 +183,7 @@ static long count_clients(int clients)
 {
 	struct dirent *de;
 	long count = 0;
-	char buf[280];
+	char buf[BUFSZ];
 	DIR *dir;
 
 	dir = fdopendir(dup(clients));
@@ -230,11 +232,9 @@ static void create(int i915, int clients)
 	igt_assert_eq(count_clients(clients), 1);
 }
 
-static int find_me(int clients, pid_t pid)
+static const char *find_client(int clients, pid_t pid, char *buf)
 {
 	struct dirent *de;
-	char buf[280];
-	int me = -1;
 	DIR *dir;
 
 	dir = fdopendir(dup(clients));
@@ -245,17 +245,101 @@ static int find_me(int clients, pid_t pid)
 		if (!isdigit(de->d_name[0]))
 			continue;
 
-		snprintf(buf, sizeof(buf), "%s/pid", de->d_name);
+		sprintf(buf, "%s/pid", de->d_name);
 		igt_sysfs_read(clients, buf, buf, sizeof(buf));
 		if (atoi(buf) != pid)
 			continue;
 
-		me = openat(clients, de->d_name, O_DIRECTORY | O_RDONLY);
-		break;
+		strcpy(buf, de->d_name);
+		goto out;
 	}
-
+	igt_warn("Did not find client for pid:%d\n", pid);
+	*buf = '\0';
+out:
 	closedir(dir);
-	return me;
+	return buf;
+}
+
+static int find_me(int clients, pid_t pid)
+{
+	char buf[BUFSZ];
+
+	return openat(clients,
+		      find_client(clients, pid, buf),
+		      O_DIRECTORY | O_RDONLY);
+}
+
+static int reopen_directory(int fd)
+{
+	char buf[BUFSZ];
+	int dir;
+
+	snprintf(buf, sizeof(buf), "/proc/self/fd/%d", fd);
+	dir = open(buf, O_RDONLY);
+	igt_assert_fd(dir);
+
+	return dir;
+}
+
+static unsigned int recycle_client(int i915, int clients)
+{
+	int device, client;
+	char buf[BUFSZ];
+
+	device = gem_reopen_driver(i915);
+	client = atoi(find_client(clients, getpid(), buf));
+	close(device);
+
+	return client;
+}
+
+static int my_id(int clients, pid_t pid)
+{
+	char buf[BUFSZ];
+
+	return atoi(find_client(clients, getpid(), buf));
+}
+
+static void recycle(int i915, int clients)
+{
+	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
+
+	/*
+	 * As we open and close clients, we do not expect to reuse old ids,
+	 * i.e. we use a cyclic ida. This reduces the likelihood of userspace
+	 * watchers becoming confused and mistaking the new client as a
+	 * continuation of the old.
+	 */
+	igt_require(my_id(clients, getpid()) < 10000000);
+	igt_assert(my_id(clients, getpid()));
+
+	igt_fork(child, 2 * ncpus) {
+		unsigned int client, last;
+
+		/* Reopen the directory fd for each client */
+		clients = reopen_directory(clients);
+
+		last = recycle_client(i915, clients);
+		igt_info("Child[%d] first client:%d\n", getpid(), last);
+		igt_until_timeout(5) {
+			client = recycle_client(i915, clients);
+
+			/* In 5 seconds we are not going to exhaust the ids */
+			igt_assert(client > last);
+			last = client;
+		}
+		igt_info("Child[%d] last client:%d\n", getpid(), last);
+	}
+	igt_waitchildren();
+
+	/* Cleanup delayed behind rcu */
+	igt_until_timeout(30) {
+		sched_yield();
+		if (count_clients(clients) == 1)
+			break;
+		usleep(10000);
+	}
+	igt_assert_eq(count_clients(clients), 1);
 }
 
 static int64_t read_runtime(int client, int class)
@@ -720,7 +804,7 @@ sema(int i915, int clients, const struct intel_execution_engine2 *e, int f)
 static int read_all(int clients, pid_t pid, int class, uint64_t *runtime)
 {
 	struct dirent *de;
-	char buf[280];
+	char buf[BUFSZ];
 	int count = 0;
 	DIR *dir;
 
@@ -959,6 +1043,9 @@ igt_main
 	igt_subtest("create")
 		create(i915, clients);
 
+	igt_subtest("recycle")
+		recycle(i915, clients);
+
 	igt_subtest_group
 		test_busy(i915, clients);
 
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
