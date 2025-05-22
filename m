Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CA4C54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 14:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5444910E730;
	Thu, 22 May 2025 14:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQ13leSE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CCE10ECD8
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747924484; x=1779460484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cdtKwkjC2B47PplJu5PRShgPsAdoi/FnZUoRaoTDjxI=;
 b=AQ13leSEm8tl6O2t+0cTV89iaR+/hTOkN23YkOr637Rg/rLspgH/ytpH
 2gdkTJHpxXoE3Pn7gzXiH6TMjTG0SvmEHm4HRzmIRnrwdHQ6TN9mU0SGU
 viPiKBWF/hVyU6dVSFoi6eJDUv+fKCGUKZ5Wr1QnBLemxXac2/aps7boe
 +l8M6CINnrQXWwhiHWZwJNriNNY7cKovzz8txK9OCUgL9xiFTm24zdcXm
 rawNLkbgf24mTNTnHzI0GL+HSKzC1yS1rwcnfDS9pdASafR3cda/Tyctj
 qczE34y67aIiUG9tEDDYZcyoOdy/Pwjwl0884fCaWzNLLV9wtubstLBwg g==;
X-CSE-ConnectionGUID: PkD6RdFMScmDTQJUtDY/Bw==
X-CSE-MsgGUID: WCuecF1CSuOtIZuOi3qF9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75351154"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="75351154"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:34:44 -0700
X-CSE-ConnectionGUID: nJaqpt0kQSqfc2zYSUKMGw==
X-CSE-MsgGUID: aJO0Ww0EQsezOZSKoomVyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="140495546"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 22 May 2025 07:34:42 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com
Subject: [PATCH i-g-t v10 1/7] Add stub for procps and glib
Date: Thu, 22 May 2025 14:34:13 +0000
Message-ID: <20250522143419.28888-2-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
References: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
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
 include/android/glib.h   | 49 ++++++++++++++++++++++++++++++++++++++++
 include/android/procps.h | 47 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 include/android/glib.h
 create mode 100644 include/android/procps.h

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
-- 
2.49.0

