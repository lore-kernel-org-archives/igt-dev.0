Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C45CC5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 17:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3B910E0BC;
	Thu, 29 May 2025 17:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAZ5ESgM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D106010E76B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748538800; x=1780074800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M59KyGguy7fwEneJclZNnGy5JD2i63hqOy/FFBc+TWE=;
 b=QAZ5ESgMOjPoJ/CjE1eveAKTQNSI+hroFOzLjp6aQFbpAVIUh1uo3B5T
 TYNXidkVwfLZhvG52LiwQBpPyaH2bk5byR3P65tT182jBLga0qNcm4uj2
 ugj90SqY2GKhB5d+BmXvsGoUTb/FfbnNsfQ9oti1HhGLzHczndv30VDCJ
 jtP1r8c9JMHzHJ8CYULJ3hFbIqZrEllAgGfkOBW30p+bSfciriExWYYVW
 k0Mf39RJJ/fn/piNhAsA0vI2n3goOl7t+o2sK72fqq4SaQvo0clOBOyJI
 Xv5KJ2AOYqmRZujHu6lvtNisOZJfot+tzIMah4nDFrYZeh5sw/tTweDsb w==;
X-CSE-ConnectionGUID: U9OpBcGKSv+QCZ9a4574Fw==
X-CSE-MsgGUID: uarr2MAGT4m6cWNZDdZJ6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="62016795"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="62016795"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:13:20 -0700
X-CSE-ConnectionGUID: +UJWJ4MKSom02FpGts1Wlg==
X-CSE-MsgGUID: 6L19HupGTh+KSGyoVJtEOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143537947"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 29 May 2025 10:13:17 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com
Subject: [PATCH i-g-t v11 1/7] Add stub for procps and glib
Date: Thu, 29 May 2025 17:12:40 +0000
Message-ID: <20250529171246.74375-2-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Sapna <sapna1.singh@intel.com>

As procps, glib are not available in Android, not able to build igt
for Android.

Provided stub implementations so igt can be compiled for both Android
and linux from same code base. Incase of linux systems, system libraries
will be used whereas for Android stubs will be used with reduced
test coverage.

Signed-off-by: Sapna <sapna1.singh@intel.com>
---
 include/android/glib.h     | 42 ++++++++++++++++++++++++++++++++++
 include/android/procps.h   | 46 ++++++++++++++++++++++++++++++++++++++
 lib/intel_batchbuffer.c    |  3 +++
 tests/intel/api_intel_bb.c |  3 +++
 tests/intel/xe_intel_bb.c  |  3 +++
 5 files changed, 97 insertions(+)
 create mode 100644 include/android/glib.h
 create mode 100644 include/android/procps.h

diff --git a/include/android/glib.h b/include/android/glib.h
new file mode 100644
index 000000000..4d0a63098
--- /dev/null
+++ b/include/android/glib.h
@@ -0,0 +1,42 @@
+#ifndef _IGT_ANDROID_GLIB_H
+#define _IGT_ANDROID_GLIB_H
+
+#include <stdbool.h>
+#include <stdlib.h>
+
+#define G_KEY_FILE_NONE 0
+#define G_REGEX_OPTIMIZE 0
+
+typedef struct _GError {
+	int code;
+	char *message;
+} GError;
+
+typedef struct _GKeyFile {
+	char *key;
+	char *value;
+} GKeyFile;
+
+typedef int gint;
+typedef size_t gsize;
+typedef char gchar;
+typedef unsigned char guchar;
+typedef void GRegex;
+
+static inline void g_clear_error(GError **error) { }
+static inline void g_error_free(GError *error) { }
+static inline const char *g_get_home_dir(void) { return "/data/local/tmp/igt"; }
+static inline void g_key_file_free(GKeyFile *file) { }
+static inline GKeyFile *g_key_file_new(void) { return NULL; }
+static inline int g_key_file_get_integer(GKeyFile *key_file,
+	const char *group_name, const char *key, GError **error) { return 0; }
+static inline char *g_key_file_get_string(GKeyFile *key_file,
+	const char *group_name, const char *key, GError **error) { return NULL; }
+static inline bool g_key_file_load_from_file(GKeyFile *key_file,
+	const char *file, int flags, GError **error) { return false; }
+static inline GRegex *g_regex_new(const char *pattern, int compile_options,
+	int match_options, GError **error) { return NULL; }
+static inline void g_regex_unref(GRegex *pattern) { };
+static gchar *g_base64_encode(const guchar *data, gsize len) { return NULL; }
+
+#endif /* _IGT_ANDROID_GLIB_H */
diff --git a/include/android/procps.h b/include/android/procps.h
new file mode 100644
index 000000000..327c9bcc5
--- /dev/null
+++ b/include/android/procps.h
@@ -0,0 +1,46 @@
+#ifndef _IGT_ANDROID_PROCPS_H
+#define _IGT_ANDROID_PROCPS_H
+
+enum pids_item {
+	PIDS_CMD     = 13, /* str stat: comm or status: Name */
+	PIDS_ID_EGID = 29, /* u_int status: Gid */
+	PIDS_ID_EUID = 31, /* u_int status: Uid */
+	PIDS_ID_PID  = 39, /* s_int from /proc/<pid> */
+};
+enum pids_fetch_type {
+	PIDS_FETCH_TASKS_ONLY,
+	PIDS_FETCH_THREADS_TOO
+};
+
+struct pids_result {
+	enum pids_item item;
+	union {
+		signed char s_ch;
+		signed int s_int;
+		unsigned int u_int;
+		unsigned long ul_int;
+		unsigned long long ull_int;
+		char *str;
+		char **strv;
+		double real;
+	} result;
+};
+
+struct pids_stack {
+	struct pids_result *head;
+};
+
+struct pids_info;
+
+#define PIDS_VAL(relative_enum, type, stack, info) \
+	stack->head[relative_enum].result.type
+
+int procps_pids_new(struct pids_info **info, enum pids_item *items, int numitems) { return 0; }
+int procps_pids_unref(struct pids_info **info) { return 0; }
+
+struct pids_stack *procps_pids_get(struct pids_info *info, enum pids_fetch_type which)
+{
+	return NULL;
+}
+
+#endif /* _IGT_ANDROID_PROCPS_H */
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index f7569e768..03ce65ded 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2348,6 +2348,9 @@ static void intel_bb_dump_base64(struct intel_bb *ibb, int linelen)
 
 	igt_info("--- bb ---\n");
 	pos = str = g_base64_encode((const guchar *) ibb->batch, ibb->size);
+	if (str == NULL)
+		return;
+
 	outsize = strlen(str);
 
 	while (outsize > 0) {
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 4a1c9be91..39bc2525c 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -944,7 +944,10 @@ static int dump_base64(const char *name, struct intel_buf *buf)
 
 		igt_info("--- %s ---\n", name);
 		pos = str = g_base64_encode(destbuf, outsize);
+		if (str == NULL)
+			return -1;
 		outsize = strlen(str);
+
 		while (pos) {
 			char line[LINELEN + 1];
 			int to_copy = min(LINELEN, outsize);
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index d8bd7b519..caa17498f 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -595,7 +595,10 @@ static int dump_base64(const char *name, struct intel_buf *buf)
 
 		igt_info("--- %s ---\n", name);
 		pos = str = g_base64_encode(destbuf, outsize);
+		if (str == NULL)
+			return -1;
 		outsize = strlen(str);
+
 		while (pos) {
 			char line[LINELEN + 1];
 			int to_copy = min(LINELEN, outsize);
-- 
2.49.0

