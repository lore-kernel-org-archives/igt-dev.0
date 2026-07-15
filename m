Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58C3C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 19:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969AE10E218;
	Wed, 15 Jul 2026 19:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Ga/A00VK";
	dkim-atps=neutral
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com
 [209.85.160.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12EA10E218
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 19:29:51 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id
 d75a77b69052e-51c1d137a68so130171761cf.3
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784143791; x=1784748591;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ajU3GHAQnooBpKwYW2MEC75hgOhuhnsxklvU7xwtdEM=;
 b=Ga/A00VKGu3geVFRTQ5XDBrxDNH66DJuwSLxAseVp6xv+6DVoB+Kj8Bu0qCsRYM5Iq
 9VLC26uGJoQAPpmVaaVjUB0+1vulQwhEVx9sRxBEpdnoirQQ6IpSDbDtVnyk6v7F5wqX
 kP115QPGEbXPhnUYTwiFkM/SeU0BDSOOqdhjTtpdkH5p6hv1jHuXuEq/8cJnIYVoa3C4
 jBqC2Fg+MuzuPcfKvik5EiOndzjqDBRZ1ePTOHZQhbMb37SoJRjDmBz+n+b0L2W3qRLe
 g1eegRb+7Lyg+KdKGdTChGAAO5ZPWdJCRsDt+JTrK1FPQ7z84r5HRYOnRJxkIbS+Exaa
 YuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784143791; x=1784748591;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ajU3GHAQnooBpKwYW2MEC75hgOhuhnsxklvU7xwtdEM=;
 b=aO2zzbBwJKacTQ2candz0Rjp1vvFSKHFzcfrdZ7AuW2HivH/dwdaouwJASMjMDERJT
 GyDT4UcGbcEVwK3i3XW+Qdt8f/Z06KmfVgzjEjVe+1RSTP1Yx+z3VFG167CeTCTh6fhk
 Yr75NIPFgE04YV8SSW83eHHlC/UycDpEa5XHkN9rFcx/p5N0NyyQB4cNQtTWhVTvlI+R
 2tsWo3OUGLvEsqasYV6GgAW3Nv/FJjTlfd1GtuAYZNZ+GY4CAGgNfVmS/x45UKqZpZpK
 5X8cH+GJEfl/ytFmBVpPHaUEI2s0xf7ChSfsDwhpnyy22wQa83PssBKfL7tufFdR5SQp
 qoNg==
X-Gm-Message-State: AOJu0YyZnuWa9Hn3lsfoFunfBsCNYkkYhbZnOLDDq/Ye6Ac07l/Z1qVp
 gaF0qzcepg6Ls+moJV2Bbr2eAPJooW6PA/L/FV5gqXlBY3SHxlFxrX6r1l7x5B2mBphg0Gn+RrX
 cqcA8lTtcmGpIKJt2UD6eUIiNl94oR08D2oW8bFdtAUUPi51aZCLL3l2Dd7LOX2LL2C7i0Uy395
 3PNm1zG3VgZuKqKk7x3qD/DnWaA5Hr4LRH9UxjUbkWOoKOZaZy+U4tRdUGXFuno5cvaV4=
X-Received: from qtof8.prod.google.com ([2002:ac8:4648:0:b0:51c:a03a:a57b])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:5a17:b0:519:55c0:a1e5 with SMTP id
 d75a77b69052e-51e4ede1c39mr44943441cf.8.1784143790373; 
 Wed, 15 Jul 2026 12:29:50 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:29:47 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715192949.1984280-1-markyacoub@google.com>
Subject: [PATCH 1/3] android: Implement lightweight GKeyFile INI string parser
 in glib shim
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
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

[Why]
Android's Bionic C library lacks libglib2, requiring IGT to build against
an Android-specific mock header (include/android/glib.h). The existing mock
implementation of GKeyFile and g_key_file_load_from_file is a hardcoded
no-op returning NULL, which prevents tests relying on configuration files
(such as .igtrc) from dynamically retrieving values on Android.

[How]
Expand the dummy GKeyFile structure to record the file path upon calling
g_key_file_load_from_file. Implement a minimal internal INI parser function
(__android_g_key_file_get) inside g_key_file_get_string to traverse the file
line-by-line, matching requested [group] and key strings, stripping trailing
newlines, and returning a heap-allocated duplicate string (strdup).

Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 include/android/glib.h | 120 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 111 insertions(+), 9 deletions(-)

diff --git a/include/android/glib.h b/include/android/glib.h
index 0b6658287..5b8ba86c7 100644
--- a/include/android/glib.h
+++ b/include/android/glib.h
@@ -16,8 +16,7 @@ typedef struct _GError {
 } GError;
 
 typedef struct _GKeyFile {
-	char *key;
-	char *value;
+	char path[512];
 } GKeyFile;
 
 typedef struct _GMatchInfo {
@@ -45,16 +44,119 @@ static inline void g_error_free(GError *error) { }
 
 static inline const char *g_get_home_dir(void) { return "/data/local/tmp/igt"; }
 
-static inline void g_key_file_free(GKeyFile *file) { }
-static inline GKeyFile *g_key_file_new(void) { return NULL; }
+/*
+ * __android_g_key_file_get: Minimal INI parser to mock GLib's GKeyFile getters.
+ *
+ * This function manually traverses a provided INI-style configuration file
+ * (e.g., .igtrc) searching for a specific [group] and key. It parses line-by-line
+ * without relying on the heavy libglib2 parsing dictionary framework natively
+ * required by standard IGT.
+ *
+ * It operates strictly on the specific file path saved in the GKeyFile struct during
+ * g_key_file_load_from_file(). This ensures it properly acts as a decoupled file
+ * parser and prevents it from hijacking other distinct config operations.
+ *
+ * Parameters:
+ * - key_file: The mocked GKeyFile struct holding the parsed file path.
+ * - target_group: The [group] section to search within (e.g. "Unigraf").
+ * - target_key: The key to matching inside the group (e.g. "Connector").
+ *
+ * Returns:
+ * A newly allocated string (`strdup`) containing the right-side value of the
+ * matched key, or NULL if not found. The caller is responsible for freeing it.
+ */
+static inline char *__android_g_key_file_get(GKeyFile *key_file, const char *target_group, const char *target_key)
+{
+	/* Ensure a valid file path was actively loaded into our GKeyFile mock */
+	if (!key_file || !key_file->path[0]) return NULL;
+
+	FILE *fp = fopen(key_file->path, "r");
+	if (!fp)
+		return NULL;
+
+	char line[256];
+	bool in_group = false;
+	size_t key_len = strlen(target_key);
+
+	while (fgets(line, sizeof(line), fp)) {
+		char *trim = line;
+
+		/* Skip any leading whitespace (spaces or tabs) for the current line */
+		while (*trim == ' ' || *trim == '\t') trim++;
+
+		/* Check if this line declares a new [Group] section */
+		if (trim[0] == '[') {
+			/* Verify if it perfectly matches the user's requested [target_group] */
+			in_group = (strncmp(trim + 1, target_group, strlen(target_group)) == 0 &&
+				    trim[1 + strlen(target_group)] == ']');
+			continue; /* Move to the next line of the file */
+		}
+
+		/* If we are inside the correct group, evaluate if the line starts with `target_key=` */
+		if (in_group && strncmp(trim, target_key, key_len) == 0 && trim[key_len] == '=') {
+			/* Pointer to the start of the value (immediately right of '=') */
+			char *val = trim + key_len + 1;
+			char *end = val + strlen(val);
+
+			/* Strip any trailing whitespace, carriage returns, or newlines by inserting null terminators */
+			while (end > val && (end[-1] == '\r' || end[-1] == '\n' || end[-1] == ' ' || end[-1] == '\t'))
+				end[-1] = '\0';
+
+			fclose(fp);
+			/* Return a standard heap-allocated copy of the value string just as GLib would */
+			return strdup(val);
+		}
+	}
+
+	fclose(fp);
+	return NULL;
+}
+
+static inline void g_key_file_free(GKeyFile *file) { free(file); }
+
+static inline GKeyFile *g_key_file_new(void) { return (GKeyFile *)calloc(1, sizeof(GKeyFile)); }
+
 static inline int g_key_file_get_integer(GKeyFile *key_file,
-	const char *group_name, const char *key, GError **error) { return 0; }
+	const char *group_name, const char *key, GError **error) {
+	char *val = __android_g_key_file_get(key_file, group_name, key);
+	if (!val) return 0;
+	int res = atoi(val);
+	free(val);
+	return res;
+}
+
 static inline char *g_key_file_get_string(GKeyFile *key_file,
-	const char *group_name, const char *key, GError **error) { return NULL; }
+	const char *group_name, const char *key, GError **error) {
+	return __android_g_key_file_get(key_file, group_name, key);
+}
+
 static inline double g_key_file_get_double(GKeyFile *key_file,
-	const char *group_name, const char *key, GError **error) { return 0.0; }
-static inline bool g_key_file_load_from_file(GKeyFile *key_file,
-	const char *file, int flags, GError **error) { return false; }
+	const char *group_name, const char *key, GError **error) {
+	char *val = __android_g_key_file_get(key_file, group_name, key);
+	if (!val) return 0.0;
+	double res = strtod(val, NULL);
+	free(val);
+	return res;
+}
+
+static inline bool g_key_file_get_boolean(GKeyFile *key_file,
+	const char *group_name, const char *key, GError **error) {
+	char *val = __android_g_key_file_get(key_file, group_name, key);
+	if (!val) return false;
+	bool res = (strcmp(val, "true") == 0 || strcmp(val, "1") == 0 || strcmp(val, "yes") == 0);
+	free(val);
+	return res;
+}
+
+static inline bool
+		g_key_file_load_from_file(GKeyFile *key_file,
+	const char *file, int flags, GError **error) {
+	if (key_file && file) {
+		snprintf(key_file->path, sizeof(key_file->path), "%s", file);
+		return true;
+	}
+	return false;
+}
 
 static inline GRegex *g_regex_new(const char *pattern, int compile_options,
 	int match_options, GError **error) { return NULL; }
-- 
2.55.0.141.g00534a21ce-goog

