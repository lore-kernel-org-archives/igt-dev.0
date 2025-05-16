Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AD8C54756
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8FE10EB4A;
	Fri, 16 May 2025 17:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="If7hKvld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033B410EB4A
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415535; x=1778951535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7q4iNTIh64vGkYuV6eQ6zc95b2A+XGLBC2j0yLuqISY=;
 b=If7hKvldwGYYcHNexFPaQ6Q32Qp5jCByznxzr/WaYpSW436Y81aMN1CY
 I9fz53ODnA8IKD7K4j9ptg8eAqTEgT2LBJ1i1zEoiZ9K1tv0imMH8QLYi
 3Y3oWn3rmtoDDH0ocY+GXDvqXy0HPun7rBVsEUjJquI9VmQ+zEyYqfZEH
 lkH+Xw7Zna9MpYrjCRD0Cr3ZfMu0TIFGSKsZfvgpwAEnyCd5j4mRRgfDp
 IHdm8BgXOqkEBotD7DeTg1QvPr4EzR/AqzEuRmq5d7SJ5MYvNEM9yMlLg
 jM2mCAPmseuoEvMmHXmZuAiqOWsMlK4IQo+riMLHppHLil3CB2u8gx18w w==;
X-CSE-ConnectionGUID: rmYjlzJ+SkCK14hRBLvTFQ==
X-CSE-MsgGUID: 3VWtCXGRQUq50qfdiYMmSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49297056"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49297056"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:12:15 -0700
X-CSE-ConnectionGUID: BKSrLucURGWvPAk8qfkUvg==
X-CSE-MsgGUID: SgAEbAPiRGiI+7wIdxvPuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138793450"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 10:12:12 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com
Subject: [PATCH i-g-t v7 01/14] Add stub for libunwind, procps and glib
Date: Fri, 16 May 2025 17:11:40 +0000
Message-ID: <20250516171153.74079-2-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
References: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
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

