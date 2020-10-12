Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AC66E44C
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2020 12:39:04 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 12 Oct 2020 14:39:00 +0200
Message-Id: <20201012123900.485289-4-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20201012123900.485289-1-maarten.lankhorst@linux.intel.com>
References: <20201012123900.485289-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tests: Do not use pread on userptr in
 gem_exec_parallel.
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
List-ID: <igt-dev@lists.freedesktop.org>

It's even silly to use pread, directly read from the pointer instead by
executing gem_wait first.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 tests/i915/gem_exec_parallel.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index 96feb82507da..698f1f776387 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -151,7 +151,7 @@ static void *thread(void *data)
 	return NULL;
 }
 
-static void check_bo(int fd, uint32_t handle, int pass, struct thread *threads)
+static void check_bo(int fd, uint32_t *data, uint32_t handle, int pass, struct thread *threads)
 {
 	uint32_t x = hash32(handle * pass) % 1024;
 	uint32_t result;
@@ -161,8 +161,14 @@ static void check_bo(int fd, uint32_t handle, int pass, struct thread *threads)
 
 	igt_debug("Verifying result (pass=%d, handle=%d, thread %d)\n",
 		  pass, handle, x);
-	gem_read(fd, handle, x * sizeof(result), &result, sizeof(result));
-	igt_assert_eq_u32(result, x);
+
+	if (data) {
+		gem_wait(fd, handle, NULL);
+		igt_assert_eq_u32(data[x], x);
+	} else {
+		gem_read(fd, handle, x * sizeof(result), &result, sizeof(result));
+		igt_assert_eq_u32(result, x);
+	}
 }
 
 static uint32_t handle_create(int fd, unsigned int flags, void **data)
@@ -178,6 +184,7 @@ static uint32_t handle_create(int fd, unsigned int flags, void **data)
 		return handle;
 	}
 
+	*data = NULL;
 	return gem_create(fd, 4096);
 }
 
@@ -258,7 +265,7 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
 		pthread_join(threads[i].thread, NULL);
 
 	for (i = 0; i < NUMOBJ; i++) {
-		check_bo(fd, handle[i], i, threads);
+		check_bo(fd, arg[i], handle[i], i, threads);
 		handle_close(fd, flags, handle[i], arg[i]);
 	}
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
