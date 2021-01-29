Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65526EAB0
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jan 2021 10:09:45 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 29 Jan 2021 10:09:34 +0000
Message-Id: <20210129100934.3115085-1-chris@chris-wilson.co.uk>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

The client id used is a cyclic allocator as that reduces the likelihood
of userspace seeing the same id used again (and so confusing the new
client as the old). Verify that each new client has an id greater than
the last.

v2: Use (int)(b - a) > 0 to handle wraparound

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 tests/i915/sysfs_clients.c | 129 +++++++++++++++++++++++++++++++------
 1 file changed, 108 insertions(+), 21 deletions(-)

diff --git a/tests/i915/sysfs_clients.c b/tests/i915/sysfs_clients.c
index a3a1f81e1..e936bd48d 100644
--- a/tests/i915/sysfs_clients.c
+++ b/tests/i915/sysfs_clients.c
@@ -8,6 +8,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
+#include <limits.h>
 #include <math.h>
 #include <sched.h>
 #include <sys/socket.h>
@@ -47,6 +48,8 @@
 #define assert_within_epsilon(x, ref, tolerance) \
 	__assert_within_epsilon(x, ref, tolerance / 100., tolerance / 100.)
 
+#define BUFSZ 280
+
 #define MI_BATCH_BUFFER_START (0x31 << 23)
 #define MI_BATCH_BUFFER_END (0xa << 23)
 #define MI_ARB_CHECK (0x5 << 23)
@@ -75,7 +78,7 @@ static void pidname(int i915, int clients)
 {
 	struct dirent *de;
 	int sv[2], rv[2];
-	char buf[280];
+	char buf[BUFSZ];
 	int me = -1;
 	long count;
 	pid_t pid;
@@ -180,7 +183,7 @@ static long count_clients(int clients)
 {
 	struct dirent *de;
 	long count = 0;
-	char buf[280];
+	char buf[BUFSZ];
 	DIR *dir;
 
 	dir = fdopendir(dup(clients));
@@ -229,32 +232,113 @@ static void create(int i915, int clients)
 	igt_assert_eq(count_clients(clients), 1);
 }
 
+static const char *find_client(int clients, pid_t pid, char *buf)
+{
+	DIR *dir = fdopendir(dup(clients));
+
+	/* Reading a dir as it changes does not appear to be stable, SEP */
+	for (int pass = 0; pass < 3; pass++) {
+		struct dirent *de;
+
+		rewinddir(dir);
+		fsync(dirfd(dir));
+		while ((de = readdir(dir))) {
+			if (!isdigit(de->d_name[0]))
+				continue;
+
+			snprintf(buf, BUFSZ, "%s/pid", de->d_name);
+			igt_sysfs_read(clients, buf, buf, sizeof(buf));
+			if (atoi(buf) != pid)
+				continue;
+
+			strncpy(buf, de->d_name, BUFSZ);
+			goto out;
+		}
+	}
+	*buf = '\0';
+out:
+	closedir(dir);
+	return buf;
+}
+
 static int find_me(int clients, pid_t pid)
 {
-	struct dirent *de;
-	char buf[280];
-	int me = -1;
-	DIR *dir;
+	char buf[BUFSZ];
 
-	dir = fdopendir(dup(clients));
-	igt_assert(dir);
-	rewinddir(dir);
+	return openat(clients,
+		      find_client(clients, pid, buf),
+		      O_DIRECTORY | O_RDONLY);
+}
 
-	while ((de = readdir(dir))) {
-		if (!isdigit(de->d_name[0]))
-			continue;
+static int reopen_directory(int fd)
+{
+	char buf[BUFSZ];
+	int dir;
 
-		snprintf(buf, sizeof(buf), "%s/pid", de->d_name);
-		igt_sysfs_read(clients, buf, buf, sizeof(buf));
-		if (atoi(buf) != pid)
-			continue;
+	snprintf(buf, sizeof(buf), "/proc/self/fd/%d", fd);
+	dir = open(buf, O_DIRECTORY | O_RDONLY);
+	igt_assert_fd(dir);
 
-		me = openat(clients, de->d_name, O_DIRECTORY | O_RDONLY);
-		break;
+	return dir;
+}
+
+static unsigned long my_id(int clients, pid_t pid)
+{
+	char buf[BUFSZ];
+
+	return strtoul(find_client(clients, pid, buf), NULL, 0);
+}
+
+static unsigned long recycle_client(int i915, int clients)
+{
+	unsigned long client;
+	int device;
+
+	device = gem_reopen_driver(i915);
+	client = my_id(clients, getpid());
+	close(device);
+
+	igt_assert(client != 0);
+	return client;
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
+	igt_assert(my_id(clients, getpid()));
+
+	igt_fork(child, 2 * ncpus) {
+		unsigned long client, last;
+
+		/* Reopen the directory fd for each client */
+		clients = reopen_directory(clients);
+
+		last = recycle_client(i915, clients);
+		igt_info("Child[%d] first client:%lu\n", getpid(), last);
+		igt_until_timeout(5) {
+			client = recycle_client(i915, clients);
+			igt_assert((long)(client - last) > 0);
+			last = client;
+		}
+		igt_info("Child[%d] last client:%lu\n", getpid(), last);
 	}
+	igt_waitchildren();
 
-	closedir(dir);
-	return me;
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
@@ -719,7 +803,7 @@ sema(int i915, int clients, const struct intel_execution_engine2 *e, int f)
 static int read_all(int clients, pid_t pid, int class, uint64_t *runtime)
 {
 	struct dirent *de;
-	char buf[280];
+	char buf[BUFSZ];
 	int count = 0;
 	DIR *dir;
 
@@ -958,6 +1042,9 @@ igt_main
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
