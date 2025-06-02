Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C00EC61CE5
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 19:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A95110E1BA;
	Mon,  2 Jun 2025 19:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GG7P2q5k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF2910E1BA
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 19:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748892353; x=1780428353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=co/4IjvZAyGy1ebpbuV9+nzUyTfJiBJBCcHeqi4G1zE=;
 b=GG7P2q5kr3qddp8MRTIBPHXe2IHbLXlEa/XEbF52KChy7zSsihweV/WV
 uvJo/MrQbExIIADQ3oDUI5BttgkixLgW9z0qWzjV+3ZvnONhSRHzwtW0r
 l1whPy7BvLxN7lb1hllTwNltufxegjL+Y5sDwvx6+wscO9hbK1Y+l+emD
 A7K+27yRLReeA1jyF8aeELxWouO2ytwapH3lII6ybRFrwGbguxVyI7VeV
 WUFn78+aCFZZeRUGAsErra+OFXl8dL9o3Yf7QeFeCOTBvBSXJX2pvqsWM
 KYkglW0HBCtptwxdJWwfZOCgXU0gpEjoMBHM12ZTgEtDU1IJqHXwhNxun Q==;
X-CSE-ConnectionGUID: V/oFfQIhRxufvW69BVDo5A==
X-CSE-MsgGUID: 52Q/UwF2Q/iowejjNO4f8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50777092"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50777092"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:25:52 -0700
X-CSE-ConnectionGUID: 6Q7ursJbT/ylJO+fsPbDoA==
X-CSE-MsgGUID: ltlHqPrmQZexUEXXqa830w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="144590211"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2025 12:25:50 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v12 01/11] include/android: Add stub for procps and glib
Date: Mon,  2 Jun 2025 19:25:05 +0000
Message-ID: <20250602192515.95309-2-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
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
and linux from same code base. Incase of linux systems, system libraries
will be used whereas for Android stubs will be used with reduced
test coverage.

Signed-off-by: Sapna Singh <sapna1.singh@intel.com>
Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 include/android/glib.h   | 42 ++++++++++++++++++++++++++++++++++++
 include/android/procps.h | 46 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)
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
-- 
2.49.0

