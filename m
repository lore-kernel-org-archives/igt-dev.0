Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93122C5B549
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C9E10E76E;
	Wed,  4 Jun 2025 17:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mo+c6mTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D4E10E75F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749057571; x=1780593571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K5phwXY6uOkxIxmqwDg4wpeIQB7Zlw6hFDu5nVGcLVA=;
 b=Mo+c6mTdAdANi3NmaIPvK/JpgSdx9VLrvExalMMKhnjEwbGinXbAsJWp
 Is0EBCrViMp4IehgCHC4tAg8EWlHZS5em0CkDKU9jUa4EvddDWZzkZjq1
 aVHoxb7GjNXtgtT70P28UUa9Nrnd0HLTc13D4IBGNl6AXvgzMBQWwvtSs
 ZYrdT4VV+NoZJTIgkBisMUEUr3cfSMQDwCRWmd5G9p/T2IISV8y5RPQtE
 SOaDDU1UpIWJfJXIjhWVNwq0r3pBdVAC3Xu2fJQX32H1FULFQuh8nhzJ+
 hYx/X6uRQ1BB6cT8UrFRenedOjr7cKIzG4AJQyVAtBOA8h6DszEJL6Vt8 w==;
X-CSE-ConnectionGUID: LF5fTtZnTbON4tO/97eaqQ==
X-CSE-MsgGUID: s29d0qM9T3St+xB4kGibNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68595921"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68595921"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:17:28 -0700
X-CSE-ConnectionGUID: +lNC1sj1RHuI4a1FGtQ3PQ==
X-CSE-MsgGUID: 4TrDVOqRTYyOUzwy6ycwww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145203234"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2025 10:17:27 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v15 1/9] include/android: Add stub for glib
Date: Wed,  4 Jun 2025 17:16:48 +0000
Message-ID: <20250604171656.31559-2-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
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

As glib is not available in Android, not able to build igt for Android.

Provided stub implementations so igt can be compiled for both Android
and linux from same code base. In case of linux systems, system
libraries will be used whereas for Android stubs will be used with
reduced test coverage.

Signed-off-by: Sapna Singh <sapna1.singh@intel.com>
Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 include/android/glib.h | 55 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 include/android/glib.h

diff --git a/include/android/glib.h b/include/android/glib.h
new file mode 100644
index 000000000..8540d3514
--- /dev/null
+++ b/include/android/glib.h
@@ -0,0 +1,55 @@
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
+typedef struct _GMatchInfo {
+	int dummy;
+} GMatchInfo;
+
+typedef int gint;
+typedef size_t gsize;
+typedef char gchar;
+typedef unsigned char guchar;
+typedef void GRegex;
+typedef int GRegexMatchFlags;
+
+static inline void g_clear_error(GError **error) { }
+static inline void g_error_free(GError *error) { }
+
+static inline const char *g_get_home_dir(void) { return "/data/local/tmp/igt"; }
+
+static inline void g_key_file_free(GKeyFile *file) { }
+static inline GKeyFile *g_key_file_new(void) { return NULL; }
+static inline int g_key_file_get_integer(GKeyFile *key_file,
+	const char *group_name, const char *key, GError **error) { return 0; }
+static inline char *g_key_file_get_string(GKeyFile *key_file,
+	const char *group_name, const char *key, GError **error) { return NULL; }
+static inline bool g_key_file_load_from_file(GKeyFile *key_file,
+	const char *file, int flags, GError **error) { return false; }
+
+static inline GRegex *g_regex_new(const char *pattern, int compile_options,
+	int match_options, GError **error) { return NULL; }
+static inline void g_regex_unref(GRegex *pattern) { };
+static inline gboolean g_regex_match(GRegex *regex, const gchar *string,
+	GRegexMatchFlags match_options, GMatchInfo **match_info) { return false; }
+
+static gchar *g_base64_encode(const guchar *data, gsize len) { return NULL; }
+
+#endif /* _IGT_ANDROID_GLIB_H */
-- 
2.49.0

