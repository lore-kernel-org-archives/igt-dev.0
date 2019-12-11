Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D119E6EA37
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:51 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:28 -0800
Message-Id: <20191211005235.67897-23-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 22/29] lib: Add FreeBSD-specific pthread
 logic
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

Add a definition for FreeBSD's platform specific method of
fetching a thread-id and delivering a signal to the current
thread.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/igt_aux.h               | 7 +++++++
 lib/igt_core.c              | 2 ++
 tests/i915/gem_close_race.c | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 04d22904..5cbef592 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -45,8 +45,15 @@
 # ifndef HAVE_GETTID
 #  define gettid() (pid_t)(syscall(__NR_gettid))
 # endif
+#else
+# ifndef HAVE_GETTID
+#  include <pthread_np.h>
+#  define gettid() (pid_t)(pthread_getthreadid_np())
+# endif
 #endif
+#if defined(__linux__)
 #define sigev_notify_thread_id _sigev_un._tid
+#endif
 
 /* auxialiary igt helpers from igt_aux.c */
 /* generally useful helpers */
diff --git a/lib/igt_core.c b/lib/igt_core.c
index 8df89905..c89030ba 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2398,6 +2398,8 @@ static void fatal_sig_handler(int sig)
 		pid_t tid = gettid();
 
 		syscall(SYS_tgkill, pid, tid, sig);
+#elif defined(__FreeBSD__)
+		pthread_kill(pthread_self(), sig);
 #else
 		pthread_t tid = pthread_self();
 		union sigval value = { .sival_ptr = NULL };
diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
index 57e00480..cbef33e2 100644
--- a/tests/i915/gem_close_race.c
+++ b/tests/i915/gem_close_race.c
@@ -51,7 +51,9 @@
 static uint32_t devid;
 static bool has_64bit_relocations;
 
+#if defined(__linux__)
 #define sigev_notify_thread_id _sigev_un._tid
+#endif
 
 static void selfcopy(int fd, uint32_t handle, int loops)
 {
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
