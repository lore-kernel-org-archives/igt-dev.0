Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23176C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11F210E0E5;
	Tue,  3 Jun 2025 19:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3qX1o/T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87FE10E0E5
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748978674; x=1780514674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6AkYm9RAJmwnqE5/KrXHTSmK6o2N9ItNB2oOU876BJo=;
 b=m3qX1o/TCMAdQdgLG+FEjJK1HJiFZAZ0XuT/cccV5ey2mdxQV0WxH5zn
 lOlXe++W2H0pfMeLMMIHRIgoWjzb3hiytOn9jPPJyJWx/I1/GFZQqhzrp
 8iAlE81yILXM0eFvmAuVk/8eUPh5qUstCMChK3b3k7TQuOkC/N9hyCMT0
 YhCHX2LdgRhs5tL4uwazQg4mV+mdg0ifBLaJ3BCif0N2rl4UZqR/LDcVU
 USzIpy5hKqNVKgd3O2jCXuZvJvKtCCrKewLJuw622eTF05APi2ptccdn+
 92ubKIE6LZew88kKtFgzaxX3cmw1yBmBx9sFpv+YFui/jnoVYRanO9f3S w==;
X-CSE-ConnectionGUID: xR1P8m8oSvukdqTiA0FqyA==
X-CSE-MsgGUID: 1m7Udu/ITiiiXkZlQwCvzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76424299"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="76424299"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:24:34 -0700
X-CSE-ConnectionGUID: 647JLJFjQNii7YO29IQY+g==
X-CSE-MsgGUID: Wwm+nEtwRbaAZ5G8hTCh+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="175821275"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2025 12:24:31 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v14 03/11] include/android: Add stub for procps and glib
Date: Tue,  3 Jun 2025 19:23:46 +0000
Message-ID: <20250603192355.77019-4-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
References: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
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

From: Sapna Singh <sapna1.singh@intel.com>

As procps, glib are not available in Android, not able to build igt
for Android.

Provided stub implementations so igt can be compiled for both Android
and linux from same code base. In case of linux systems, system
libraries will be used whereas for Android stubs will be used with
reduced test coverage.

Signed-off-by: Sapna Singh <sapna1.singh@intel.com>
Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 include/android/glib.h   | 44 ++++++++++++++++++++++++++++++++++++++++
 include/android/procps.h | 40 ++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 include/android/glib.h
 create mode 100644 include/android/procps.h

diff --git a/include/android/glib.h b/include/android/glib.h
new file mode 100644
index 000000000..c80a16e47
--- /dev/null
+++ b/include/android/glib.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+
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
index 000000000..f859dffe1
--- /dev/null
+++ b/include/android/procps.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef _IGT_ANDROID_PROCPS_H
+#define _IGT_ANDROID_PROCPS_H
+
+enum pids_item {
+	PIDS_NOT_IMPLEMENTED = 0,
+};
+
+enum pids_fetch_type {
+	PIDS_FETCH_TASKS_ONLY,
+	PIDS_FETCH_THREADS_TOO
+};
+
+struct pids_result {
+	enum pids_item item;
+	union {
+		unsigned long long ull_int;
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
+	((info & 0) | (stack)->head[relative_enum].result.type)
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
-- 
2.49.0

