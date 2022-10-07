Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4E310E914
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 04:07:58 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id b204so2817563iof.2
 for <igt-dev@lists.freedesktop.org>; Thu, 06 Oct 2022 21:07:58 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Oct 2022 23:07:17 -0500
Message-Id: <20221007040717.2924978-9-jfree@freebsd.org>
In-Reply-To: <20221007040717.2924978-1-jfree@freebsd.org>
References: <20221007040717.2924978-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/10] Restrict sigev_notify_thread_id macro
 definition to Linux
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The `#define sigev_notify_thread_id _sigev_un._tid` macro differs on
FreeBSD. This patch uses ifdefs to stop the compiler from overriding
FreeBSD's existing definition.

Signed-off-by: Jake Freeland <jfree@freebsd.org>
---
 benchmarks/gem_syslatency.c | 2 ++
 lib/igt_aux.h               | 2 +-
 tests/i915/gem_close_race.c | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
index 395d2e71..366c8af6 100644
--- a/benchmarks/gem_syslatency.c
+++ b/benchmarks/gem_syslatency.c
@@ -53,7 +53,9 @@
 #include "igt_freebsd.h"
 #endif
 
+#ifdef __linux__
 #define sigev_notify_thread_id _sigev_un._tid
+#endif
 
 static volatile int done;
 
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index c98cf28f..569b92d7 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -48,8 +48,8 @@
 # ifndef HAVE_GETTID
 #  define gettid() (pid_t)(syscall(__NR_gettid))
 # endif
-#endif
 #define sigev_notify_thread_id _sigev_un._tid
+#endif
 
 /* auxialiary igt helpers from igt_aux.c */
 /* generally useful helpers */
diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
index 938fde8f..42fe1657 100644
--- a/tests/i915/gem_close_race.c
+++ b/tests/i915/gem_close_race.c
@@ -61,7 +61,9 @@ static bool has_softpin;
 static uint64_t exec_addr;
 static uint64_t data_addr;
 
+#ifdef __linux__
 #define sigev_notify_thread_id _sigev_un._tid
+#endif
 
 static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
 {
-- 
2.37.3
