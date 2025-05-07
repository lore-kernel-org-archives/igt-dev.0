Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5E2C3ABC5
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEFA10E84F;
	Wed,  7 May 2025 16:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+8lkrgn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD0D10E84F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633863; x=1778169863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pW3IvzCtODxZ+XpBa8DG66S93NC3gQyD/vPrBo0diXE=;
 b=j+8lkrgnbHrGvU/gjdjwtgRjXT0UJ0HariiDOt36G1FHWCtFDqpzCwph
 aEGN2skuvdfpAta16Ic5hv45YXJMmB23le2PtoP89CqG11jYOfVKZBK6A
 Z1NTdv2rip0VRJPNdpIwOlF1HzpLUULSzPCd7HFqWIiv+DgYXQ4j5u/VC
 yEY/n1u3+coRozpRjNIwJ+CVsRnaJV8+1vTlG9RF1EC2K1OD8ih+zrzFL
 e7SPA2AFq5YzO+vEg/8jcx+PZtPHiZIyg+Pdh1YWqr6tpcEdMiA/p4Npb
 hDv1EQvqSwfoIvnQmwf6hSFmAPDVkz8QNutuAfM71o0961zqHHhq1Tl0E g==;
X-CSE-ConnectionGUID: T3oQ2L4QTWuH/UtB4sWvUQ==
X-CSE-MsgGUID: Kv8p6XMOTyKKabHFPuRr+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48518933"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48518933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:03:05 -0700
X-CSE-ConnectionGUID: QAf0e58AR1afP1v0u163eg==
X-CSE-MsgGUID: qJ4ejIwMRB6seFGGL6TylA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173200271"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:03:02 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com
Subject: [PATCH v4 01/15] Add stub for libunwind, procps and glib
Date: Wed,  7 May 2025 16:01:34 +0000
Message-ID: <20250507160148.53857-2-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
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

As libunwind, procps, glib are not available in Android, not able to
build igt for Android.

Provided stub implementations so igt can be compiled for both Android
and linux from same code base. Incase of linux systems, system libraries
will be used whereas for Android stubs will be used with reduced
test coverage.

Signed-off-by: Sapna <sapna1.singh@intel.com>
---
 lib/igt_glib.h   | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_procps.h | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_unwind.h | 25 +++++++++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 lib/igt_glib.h
 create mode 100644 lib/igt_procps.h
 create mode 100644 lib/igt_unwind.h

diff --git a/lib/igt_glib.h b/lib/igt_glib.h
new file mode 100644
index 000000000..fc1743970
--- /dev/null
+++ b/lib/igt_glib.h
@@ -0,0 +1,47 @@
+#ifndef IGT_GLIB_H
+#define IGT_GLIB_H
+
+#include <stdbool.h>
+#include <stdlib.h>
+#define G_KEY_FILE_NONE 0
+#define G_REGEX_OPTIMIZE 0
+
+typedef struct _GError {
+    int code;
+    char *message;
+} GError;
+
+typedef struct _GKeyFile {
+    char *key;
+    char *value;
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
+    const char *group_name, const char *key, GError **error) { return 0; }
+static inline char *g_key_file_get_string(GKeyFile *key_file,
+    const char *group_name, const char *key, GError **error) { return NULL; }
+static inline bool g_key_file_load_from_file(GKeyFile *key_file,
+    const char *file, int flags, GError **error) { return false; }
+static inline GRegex* g_regex_new(const char *pattern, int compile_options,
+    int match_options, GError **error) { return NULL; }
+static inline void g_regex_unref(GRegex *pattern) { };
+static gchar* g_base64_encode(const guchar* data, gsize len) {
+    gchar* str = (gchar*)malloc(1);  // Allocate memory for an empty string
+    if (str) {
+        str[0] = '\0';  // Set the string to be empty
+    }
+    return str;
+}
+
+#endif // IGT_GLIB_H
diff --git a/lib/igt_procps.h b/lib/igt_procps.h
new file mode 100644
index 000000000..27d5a0902
--- /dev/null
+++ b/lib/igt_procps.h
@@ -0,0 +1,46 @@
+#ifndef IGT_PROCPS_H
+#define IGT_PROCPS_H
+
+enum pids_item {
+    PIDS_CMD     = 13,           //      str        stat: comm or status: Name
+    PIDS_ID_EGID = 29,           //    u_int        status: Gid
+    PIDS_ID_EUID = 31,           //    u_int        status: Uid
+    PIDS_ID_PID  = 39,           //    s_int        from /proc/<pid>
+};
+enum pids_fetch_type {
+    PIDS_FETCH_TASKS_ONLY,
+    PIDS_FETCH_THREADS_TOO
+};
+
+struct pids_result {
+    enum pids_item item;
+    union {
+        signed char         s_ch;
+        signed int          s_int;
+        unsigned int        u_int;
+        unsigned long       ul_int;
+        unsigned long long  ull_int;
+        char               *str;
+        char              **strv;
+        double              real;
+    } result;
+};
+
+struct pids_stack {
+    struct pids_result *head;
+};
+
+struct pids_info;
+
+#define PIDS_VAL( relative_enum, type, stack, info) \
+    stack -> head [ relative_enum ] . result . type
+
+int procps_pids_new   (struct pids_info **info, enum pids_item *items, int numitems) { return 0; }
+int procps_pids_unref (struct pids_info **info) { return 0;}
+
+struct pids_stack *procps_pids_get(struct pids_info *info, enum pids_fetch_type which) {
+    struct pids_stack *ps = NULL;
+    return ps;
+}
+
+#endif // IGT_PROCPS_H
diff --git a/lib/igt_unwind.h b/lib/igt_unwind.h
new file mode 100644
index 000000000..9e1811678
--- /dev/null
+++ b/lib/igt_unwind.h
@@ -0,0 +1,25 @@
+#ifndef IGT_UNWIND_H
+#define IGT_UNWIND_H
+
+#define UNW_TDEP_CURSOR_LEN     127
+typedef struct unw_cursor
+{
+   int opaque[UNW_TDEP_CURSOR_LEN];
+}
+unw_cursor_t;
+
+
+typedef struct unw_context
+{
+   int ctx;
+}
+unw_context_t;
+
+typedef uint32_t unw_word_t;
+
+int unw_getcontext(unw_context_t *uc) { return 0; }
+int unw_init_local (unw_cursor_t *cur, unw_context_t *uc) { return 0; }
+int unw_step (unw_cursor_t *cur) { return 0; }
+int unw_get_proc_name (unw_cursor_t *cur, char *ch, size_t size, unw_word_t *word) { return 0; }
+
+#endif // IGT_UNWIND_H
-- 
2.34.1

