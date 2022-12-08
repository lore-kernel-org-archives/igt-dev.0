Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0EA10E1BD
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Dec 2022 22:41:26 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Dec 2022 23:38:04 +0100
Message-Id: <20221208223808.66267-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221208223808.66267-1-kamil.konieczny@linux.intel.com>
References: <20221208223808.66267-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/6] lib/igt_core: add prefix to logging
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Allow to store prefix for logs and print it before any message.
This will allow to diagnose on wich GPU occurred problems when
tested on multi-GPU machines.

Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 0b1b2a5f..eff3d427 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -348,6 +348,8 @@ static struct {
 	uint8_t start, end;
 } log_buffer;
 static pthread_mutex_t log_buffer_mutex = PTHREAD_MUTEX_INITIALIZER;
+#define LOG_PREFIX_SIZE 32
+char log_prefix[LOG_PREFIX_SIZE] = { 0 };
 
 GKeyFile *igt_key_file;
 
@@ -3075,8 +3077,12 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
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
