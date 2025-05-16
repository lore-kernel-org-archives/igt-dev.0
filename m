Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B752C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EA810EB15;
	Fri, 16 May 2025 16:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkLJwk2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8846D10EB15
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411581; x=1778947581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7q4iNTIh64vGkYuV6eQ6zc95b2A+XGLBC2j0yLuqISY=;
 b=BkLJwk2OAxOzKeu5k64YW0IgWiPRRJZg14lWegIz//xh5IMuJWGIPRs7
 PowJXPTBqN6ntNT20QbdY2XyUqT4tPhA4co8scgHFWa8MCVXXo1Oa93o4
 yPD+ZeposJ/3KJQMMJZRHB87x/VPktt+lXqRFrwtHs8MopzTtmxKNg+9i
 BACnA+lZaFnac+S1XYo04D7D0pbg/+DIpXl/Au17zDqJ09zFS1+XLsX83
 ORoTOJNBXwz4DUmWo+ASE+r16QFXqZzZXdbSNisIY389D0E6VzOJx984V
 W7/dym2REzX+aiwEF/UWQwvoAhmntLzYW+30AxAOQOlqNwFPbX/CJydrr A==;
X-CSE-ConnectionGUID: 4zVoNW5bQTK5/8mxtQMusQ==
X-CSE-MsgGUID: UpEpiPTDTqmLZnTg7USInA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66941066"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66941066"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:06:20 -0700
X-CSE-ConnectionGUID: WUEKvbQWRH+LpAuZrdSX7Q==
X-CSE-MsgGUID: d4wRvZTfSaikVasp+NAZgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169772454"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:06:16 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com
Subject: [PATCH i-g-t v6 01/14] Add stub for libunwind, procps and glib
Date: Fri, 16 May 2025 16:05:38 +0000
Message-ID: <20250516160551.58760-2-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
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
 include/android/glib.h   | 49 ++++++++++++++++++++++++++++++++++++++++
 include/android/procps.h | 47 ++++++++++++++++++++++++++++++++++++++
 include/android/unwind.h | 22 ++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 include/android/glib.h
 create mode 100644 include/android/procps.h
 create mode 100644 include/android/unwind.h

diff --git a/include/android/glib.h b/include/android/glib.h
new file mode 100644
index 000000000..84654f33b
--- /dev/null
+++ b/include/android/glib.h
@@ -0,0 +1,49 @@
+#ifndef _ANDROID_GLIB_H
+#define _ANDROID_GLIB_H
+
+#include <stdbool.h>
+#include <stdlib.h>
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
+static gchar *g_base64_encode(const guchar *data, gsize len)
+{
+	gchar *str = (gchar *)malloc(1);  /* Allocate memory for an empty string */
+
+	if (str)
+		str[0] = '\0';  /* Set the string to be empty */
+
+	return str;
+}
+
+#endif /* _ANDROID_GLIB_H */
diff --git a/include/android/procps.h b/include/android/procps.h
new file mode 100644
index 000000000..b428ebe20
--- /dev/null
+++ b/include/android/procps.h
@@ -0,0 +1,47 @@
+#ifndef _ANDROID_PROCPS_H
+#define _ANDROID_PROCPS_H
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
+	struct pids_stack *ps = NULL;
+	return ps;
+}
+
+#endif /* _ANDROID_PROCPS_H */
diff --git a/include/android/unwind.h b/include/android/unwind.h
new file mode 100644
index 000000000..d4d754e40
--- /dev/null
+++ b/include/android/unwind.h
@@ -0,0 +1,22 @@
+#ifndef _ANDROID_UNWIND_H
+#define _ANDROID_UNWIND_H
+
+#define UNW_TDEP_CURSOR_LEN     127
+
+typedef struct unw_cursor {
+	int opaque[UNW_TDEP_CURSOR_LEN];
+} unw_cursor_t;
+
+
+typedef struct unw_context {
+	int ctx;
+} unw_context_t;
+
+typedef uint32_t unw_word_t;
+
+int unw_getcontext(unw_context_t *uc) { return 0; }
+int unw_init_local(unw_cursor_t *cur, unw_context_t *uc) { return 0; }
+int unw_step(unw_cursor_t *cur) { return 0; }
+int unw_get_proc_name(unw_cursor_t *cur, char *ch, size_t size, unw_word_t *word) { return 0; }
+
+#endif /* _ANDROID_UNWIND_H */
-- 
2.49.0

