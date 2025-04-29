Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A61C3ABA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 20:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D81F10E23B;
	Tue, 29 Apr 2025 20:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aByFq5TT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB38410E127
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 20:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745959267; x=1777495267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w+fE/d6zATxO+SXcIbG/VQJdXddLGTbSTpugmwGyrXs=;
 b=aByFq5TTKT4sTqzX7+Z5hPS1xHAzaBY6mbjKmu/w4YHqW0m7EY022UoM
 eyvIkiSGHqS/cD7MMuZ4GMJU9IOd+XofJ8OCOb7RPgrHzjF9JNEebFg2K
 v7czumKutDD+EdKRII0zzXYzgCrL28QvX6TxgBMu7nSLtdm4kulVvxe6V
 3N5kqRuJ6+LmjmjYyOAQmaPT+300Q+qatK1OR1l+d7ywOMahel+U8jg0L
 lFsf9N3hWigxUEdb6J0jOU+VIy9Zlq8Nij0/e0+NIE4Yjr3PirQnYSxm7
 cjyCypPJW5eBolYbayi+YhFWnmoSNl/qFHkvtMLSx1QXOYoZykVmOvfxA A==;
X-CSE-ConnectionGUID: 0PK95rreQ4yPMvMXtv9N0A==
X-CSE-MsgGUID: EQL/tbpUSvW3Vh0HEZiMnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47484525"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="47484525"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:41:07 -0700
X-CSE-ConnectionGUID: 8FyaXvc7RA62F8FzKpHeYQ==
X-CSE-MsgGUID: oJ7G8bAFQo+X7+xK2myBig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="133832038"
Received: from intel-s2600stb.iind.intel.com (HELO
 08ca91f16b80.iind.intel.com) ([10.66.234.77])
 by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2025 13:41:05 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, sapna1.singh@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com
Subject: [PATCH 1/5] Add stub for libunwind, procps and glib
Date: Tue, 29 Apr 2025 20:39:56 +0000
Message-ID: <20250429204000.41537-2-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
References: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
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
 include/stub/glib.h          | 43 ++++++++++++++++++++++++++++++++++++
 include/stub/libproc2/pids.h | 41 ++++++++++++++++++++++++++++++++++
 include/stub/libunwind.h     | 20 +++++++++++++++++
 3 files changed, 104 insertions(+)
 create mode 100644 include/stub/glib.h
 create mode 100644 include/stub/libproc2/pids.h
 create mode 100644 include/stub/libunwind.h

diff --git a/include/stub/glib.h b/include/stub/glib.h
new file mode 100644
index 000000000..0bd862fa2
--- /dev/null
+++ b/include/stub/glib.h
@@ -0,0 +1,43 @@
+#pragma once
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
diff --git a/include/stub/libproc2/pids.h b/include/stub/libproc2/pids.h
new file mode 100644
index 000000000..bcdd095e0
--- /dev/null
+++ b/include/stub/libproc2/pids.h
@@ -0,0 +1,41 @@
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
diff --git a/include/stub/libunwind.h b/include/stub/libunwind.h
new file mode 100644
index 000000000..168c31c14
--- /dev/null
+++ b/include/stub/libunwind.h
@@ -0,0 +1,20 @@
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
-- 
2.49.0

