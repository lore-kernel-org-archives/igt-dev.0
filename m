Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC2B10E745
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 12:02:17 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Nov 2022 13:01:43 +0100
Message-Id: <20221125120148.28490-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221125120148.28490-1-kamil.konieczny@linux.intel.com>
References: <20221125120148.28490-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH v3 3/8] lib/igt_core: add prefix to logging
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

Allow to store prefix for logs and print it before any message.
This will allow to diagnose on wich GPU occurred problems when
tested on multi-GPU machines.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index c86acf2a..62f0d85b 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -348,6 +348,8 @@ static struct {
 	uint8_t start, end;
 } log_buffer;
 static pthread_mutex_t log_buffer_mutex = PTHREAD_MUTEX_INITIALIZER;
+#define LOG_PREFIX_SIZE 32
+char log_prefix[LOG_PREFIX_SIZE] = { 0 };
 
 GKeyFile *igt_key_file;
 
@@ -2581,6 +2583,7 @@ bool __igt_fork_dyn(void)
 		igt_assert(0);
 	case 0:
 		test_dyn_child = true;
+		snprintf(log_prefix, LOG_PREFIX_SIZE, "<g:%d> ", num_test_dyn_children - 1);
 		num_test_dyn_children = 0; /* only parent should care */
 		pthread_mutex_init(&print_mutex, NULL);
 		//FIXME child_pid = getpid(); /* for allocator */
@@ -3117,8 +3120,12 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
 	program_name = command_str;
 #endif
 
-	if (asprintf(&thread_id, "[thread:%d] ", gettid()) == -1)
-		thread_id = NULL;
+	if (igt_thread_is_main()) {
+		thread_id = strdup(log_prefix);
+	} else {
+		if (asprintf(&thread_id, "%s[thread:%d] ", log_prefix, gettid()) == -1)
+			thread_id = NULL;
+	}
 
 	if (!thread_id)
 		return;
-- 
2.34.1
