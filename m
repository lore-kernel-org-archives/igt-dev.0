Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri, 19 Nov 2021 12:59:42 +0000
Message-Id: <20211119125945.55056-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
References: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] igt/core: Fix build warning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

.../lib/igt_thread.c: In function ‘__igt_unique____igt_constructor_l66’:
.../lib/igt_thread.c:68:9: warning: ‘pthread_setspecific’ expecting 1 byte in a region of size 0 [-Wstringop-overread]
   68 |         pthread_setspecific(__igt_is_main_thread, (void*) 0x1);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_core.c   | 6 ++++--
 lib/igt_thread.c | 4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index ec05535cd56e..acb9743c4a24 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2752,6 +2752,8 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
 	char *line, *formatted_line;
 	char *thread_id;
 	const char *program_name;
+	const uintptr_t false_key = 0;
+	const uintptr_t true_key = 1;
 	const char *igt_log_level_str[] = {
 		"DEBUG",
 		"INFO",
@@ -2796,9 +2798,9 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
 	}
 
 	if (line[strlen(line) - 1] == '\n')
-		pthread_setspecific(__vlog_line_continuation, (void*) false);
+		pthread_setspecific(__vlog_line_continuation, &false_key);
 	else
-		pthread_setspecific(__vlog_line_continuation, (void*) true);
+		pthread_setspecific(__vlog_line_continuation, &true_key);
 
 	/* append log buffer */
 	_igt_log_buffer_append(formatted_line);
diff --git a/lib/igt_thread.c b/lib/igt_thread.c
index 5bdda4102def..f5de2d57eaaa 100644
--- a/lib/igt_thread.c
+++ b/lib/igt_thread.c
@@ -64,6 +64,8 @@ bool igt_thread_is_main(void)
 }
 
 igt_constructor {
+	const uintptr_t key = 1;
+
 	pthread_key_create(&__igt_is_main_thread, NULL);
-	pthread_setspecific(__igt_is_main_thread, (void*) 0x1);
+	pthread_setspecific(__igt_is_main_thread, &key);
 }
-- 
2.32.0
