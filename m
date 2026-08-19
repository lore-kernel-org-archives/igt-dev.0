Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC37C5DF81
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 14:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF16E10E551;
	Wed, 19 Aug 2026 14:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G2HAfY3h";
	dkim-atps=neutral
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906B510E551
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 14:23:46 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-934979ee9f1so142043185a.2
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1787149425; x=1787754225;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:mime-version:date:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=s69RCWLUyY7DLTtjiTqwNfx3JPUpQ3H1o06rKF97aDY=;
 b=G2HAfY3hhLd5gXFHxbeiMrqoMC4/8P5c8UN3JxJYDBlyactnXduhxWv1MLO88yiqwV
 ubiNEIdlu99RXB+DoCAor5ltrOlYSjntUOqvTalW3SuVJSoeJCZvGf3QyfcT7G/E/DEV
 Ks5HsnOfnDaWeQ6JgA+dMgzpWwqt18nH6ln8jWIbOHsP2aOrNcURo0Z+KB43QvG2zC3m
 I0XrejibhQyjHNOH36JkNj/NF2rte+KI8PdsLfZ+075vLmpbsAkEe01YtQZl8AMwbLhu
 SH+OECFLMMSS3/CbyfPMlmmbk/CxoIiJyu6SMwzE6ZIMXF6zStB52BxI6YPW6W0xGLhB
 oj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787149425; x=1787754225;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=s69RCWLUyY7DLTtjiTqwNfx3JPUpQ3H1o06rKF97aDY=;
 b=jTyTATtRCjLtKSRGowVxjeCKlzxHUtiB9vJRJI0eQDhzbu3EPCQ6dRiof9xiw0kXlN
 1yCYuCh/gnRj+sW9lMgWp2KSGc6igT5P5tvG+G1fBwsWCWXkNoH3uKrwN/PiOUO6ACbK
 sXq4egdvtZdKPbGv8vx5JXekZB+BmxJRCVFYqKYlOu9e6xlsVJYhwkUZ0sNLDifhFLN5
 wb6nfZKTQ+oAantLXQ2BAozSStWLf+UwjIc5nr9ZWiEAlYl+/0YGNbf4z09aF+UQqxqn
 q5l03aPPHGUbyxMiYgpg2wucxXAbqKGsU/ChAlJ2fq3wshhKDGL6BxaBuP5RgCiRwEmD
 2W3w==
X-Gm-Message-State: AOJu0Yw6YEU9UZsFl7KXcWQqegzSKW27QagrID7it2CCsVeEyqVISRPv
 HU/6OKPBEIkSIYb6v7+nAYQ2qqpvxd+2UkkMNFAZuzSHxg4Y9Ylwy4a8W0HAlddxm1rOBX/7FsB
 Vmm+ThJEGkmuZjsNblmChOeyCA7o1yYixyybmg99ve+SiK1gEG3hb3R0FTbm4R6mAIhNaTlpX6f
 zPdAdAtA6CWHSTfAoVhMzAfdb7tA8zYgbTH09ksSyjBWoB87y5dSYcHMdZCZwt9ZHKni8=
X-Received: from qkog11.prod.google.com ([2002:a05:620a:40cb:b0:92e:6cd6:d114])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:a015:b0:937:1e9b:be6c with SMTP id
 af79cd13be357-9371e9bd6bamr289473385a.10.1787149424958; 
 Wed, 19 Aug 2026 07:23:44 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:23:34 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.737.g08866a6d13-goog
Message-ID: <20260819142337.3232406-1-markyacoub@google.com>
Subject: [PATCH v6] lib/igt_rc: Introduce generic config parser
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, louis.chauvet@bootlin.com, 
 sebastian.brzezinka@intel.com, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Currently, libraries like unigraf and igt_core explicitly rely on
GKeyFile for reading configuration from .igtrc. Android builds do
not natively supply GLib, meaning these tools cannot be cleanly
compiled.

This patch avoids platform-specific diverging implementations by
dropping the native GLib dependency from generic configuration access
and parsing `.igtrc` natively using a stripped-down `igt_list`
implementation.

To prevent regressions for deeply-entrenched legacy Linux tools (such
as Chamelium), the native GLib fallback `GKeyFile` structures are
retained and populated parallel to the generic parser at startup.

v6:
 - Drop pthread_once dependency and expose idempotent igt_rc_init()
   to fix armhf linking (Kamil).
 - Replace __attribute__((destructor)) with explicit igt_rc_free()
   called during igt_exit().
 - Add 32-bit INT bounds checking in igt_rc_get_integer().
 - Optimize igt_rc_get_string() using reverse list traversal for fast
   INI override matching.
 - Fix trailing whitespace and header comment formatting flagged by
   checkpatch.pl.

v5:
 - Rebased onto upstream 'lib/igt_core: move igt_load_igtrc to igt_rc'
 - Safely run GLib loader parallel to generic parser at startup for
   Chamelium

v4:
 - Implement igt_rc_get_double() to parse floating point configs
   natively.
 - Migrate igt_core.c over to igt_rc_get_double() to drop GKeyFile
   dependencies.
 - Add robust standard bounds checking (ERANGE and unmatched digits)
   to number parsers.

v3:
 - Drop Android-specific fallback paths; use IGT_CONFIG_PATH natively.
 - Drop glib Linux wrappers entirely; unify a single generic parser for
   all platforms.
 - Port manual linked-list tracking over to standard igt_list.h APIs.
 - Inherit base 0 for strtol to safely parse hex masks.
 - Use robust PATH_MAX for dynamic config paths.
 - Update pointer assignments, array indexing [0], and public
   docstrings.

v2:
 - Drop the GKeyFile abstraction fakes from android/glib.h.
 - Introduce a generic wrapper (igt_rc.h) instead of modifying glib.h.

Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 lib/igt_core.c               |  39 ++----
 lib/igt_rc.c                 | 248 ++++++++++++++++++++++++++++++++++-
 lib/igt_rc.h                 |  12 +-
 lib/vendor/unigraf/unigraf.c |  92 ++++++-------
 4 files changed, 303 insertions(+), 88 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 2f737b01a..93489dffc 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -974,39 +974,25 @@ static void oom_adjust_for_doom(void)
=20
 static void common_init_config(void)
 {
-	GError *error =3D NULL;
 	int ret =3D 0;
 	static double timeout =3D 0.0;
=20
-	igt_key_file =3D igt_load_igtrc();
-
-	if (igt_key_file && !igt_frame_dump_path)
-		igt_frame_dump_path =3D
-			g_key_file_get_string(igt_key_file, "Common",
-					      "FrameDumpPath", &error);
-
-	g_clear_error(&error);
-
-	if (igt_key_file)
-		ret =3D g_key_file_get_integer(igt_key_file, "DUT", "SuspendResumeDelay"=
,
-					     &error);
-	assert(!error || error->code !=3D G_KEY_FILE_ERROR_INVALID_VALUE);
=20
-	g_clear_error(&error);
+	igt_rc_init();
+	igt_key_file =3D igt_load_igtrc();
+	if (!igt_frame_dump_path)
+		igt_frame_dump_path =3D igt_rc_get_string("Common", "FrameDumpPath");
=20
-	if (ret !=3D 0)
-		igt_set_autoresume_delay(ret);
+	if (igt_rc_get_integer("DUT", "SuspendResumeDelay", &ret)) {
+		if (ret !=3D 0)
+			igt_set_autoresume_delay(ret);
+	}
=20
-	if (igt_key_file)
-		timeout =3D g_key_file_get_double(igt_key_file, "DUT", "DisplayDetectTim=
eout",
-						&error);
-	if (error) {
+	if (!igt_rc_get_double("DUT", "DisplayDetectTimeout", &timeout)) {
 		igt_debug("Failed to read DisplayDetectTimeout, defaulting to %f\n",
 			  DEFAULT_DETECT_TIMEOUT);
-		g_clear_error(&error);
 		timeout =3D DEFAULT_DETECT_TIMEOUT;
 	}
-	g_clear_error(&error);
 	igt_set_default_display_detect_timeout(timeout);
=20
 	/* Adding filters, order .igtrc, IGT_DEVICE, --device filter */
@@ -1016,11 +1002,7 @@ static void common_init_config(void)
 		if (igt_rc_device) {
 			igt_debug("Notice: using IGT_DEVICE env:\n");
 		} else {
-			if (igt_key_file)
-				igt_rc_device =3D	g_key_file_get_string(igt_key_file,
-								      "Common",
-								      "Device", &error);
-			g_clear_error(&error);
+			igt_rc_device =3D igt_rc_get_string("Common", "Device");
 			if (igt_rc_device)
 				igt_debug("Notice: using .igtrc "
 					  "Common::Device:\n");
@@ -2374,6 +2356,7 @@ void igt_exit(void)
=20
 	if (igt_key_file)
 		g_key_file_free(igt_key_file);
+	igt_rc_free();
=20
 	if (run_single_subtest && !run_single_subtest_found) {
 		igt_critical("Unknown subtest: %s\n", run_single_subtest);
diff --git a/lib/igt_rc.c b/lib/igt_rc.c
index b7f1731fe..4ae0acab5 100644
--- a/lib/igt_rc.c
+++ b/lib/igt_rc.c
@@ -3,16 +3,252 @@
  * Copyright =C2=A9 2026 Intel Corporation
  */
=20
+#include "igt_rc.h"
+
+#include <ctype.h>
+#include <errno.h>
+#include <limits.h>
+#include <locale.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
+#include <strings.h>
=20
-#ifndef ANDROID
-#include <glib.h>
-#else
-#include "android/glib.h"
-#endif
+#include "igt_list.h"
=20
-#include "igt_rc.h"
+struct igt_key_entry {
+	char *group;
+	char *key;
+	char *value;
+	struct igt_list_head link;
+};
+
+static IGT_LIST_HEAD(rc_entries);
+
+static char *trim_whitespace(char *str)
+{
+	char *end;
+
+	while (isspace((unsigned char)str[0]))
+		str++;
+
+	if (str[0] =3D=3D 0)
+		return str;
+
+	end =3D str + strlen(str) - 1;
+	while (end > str && isspace((unsigned char)end[0]))
+		end--;
+
+	end[1] =3D '\0';
+	return str;
+}
+
+void igt_rc_init(void)
+{
+	FILE *fp;
+	char *line =3D NULL;
+	size_t len =3D 0;
+	ssize_t read;
+	char *current_group =3D NULL;
+	char path[PATH_MAX];
+
+	if (!igt_list_empty(&rc_entries))
+		return;
+
+	char *config_path =3D getenv("IGT_CONFIG_PATH");
+
+	if (config_path) {
+		snprintf(path, sizeof(path), "%s", config_path);
+	} else {
+		char *home =3D getenv("HOME");
+
+		if (!home)
+			home =3D "";
+		snprintf(path, sizeof(path), "%s/.igtrc", home);
+	}
+
+	fp =3D fopen(path, "r");
+	if (!fp)
+		return;
+
+	while ((read =3D getline(&line, &len, fp)) !=3D -1) {
+		char *trimmed =3D trim_whitespace(line);
+
+		if (trimmed[0] =3D=3D '\0' || trimmed[0] =3D=3D '#' || trimmed[0] =3D=3D=
 ';')
+			continue;
+
+		if (trimmed[0] =3D=3D '[' && trimmed[strlen(trimmed) - 1] =3D=3D ']') {
+			free(current_group);
+			trimmed[strlen(trimmed) - 1] =3D '\0';
+			current_group =3D strdup(trimmed + 1);
+			continue;
+		}
+
+		if (current_group) {
+			char *eq =3D strchr(trimmed, '=3D');
+
+			if (eq) {
+				char *key;
+				char *value;
+				struct igt_key_entry *entry;
+
+				eq[0] =3D '\0';
+				value =3D eq + 1;
+				key =3D trim_whitespace(trimmed);
+				value =3D trim_whitespace(value);
+
+				entry =3D calloc(1, sizeof(*entry));
+				entry->group =3D strdup(current_group);
+				entry->key =3D strdup(key);
+				entry->value =3D strdup(value);
+				igt_list_add_tail(&entry->link, &rc_entries);
+			}
+		}
+	}
+
+	free(current_group);
+	free(line);
+	fclose(fp);
+}
+
+void igt_rc_free(void)
+{
+	struct igt_key_entry *curr, *tmp;
+
+	igt_list_for_each_entry_safe(curr, tmp, &rc_entries, link) {
+		free(curr->group);
+		free(curr->key);
+		free(curr->value);
+		free(curr);
+	}
+	IGT_INIT_LIST_HEAD(&rc_entries);
+}
+
+/**
+ * igt_rc_get_string:
+ * @group_name: The group name in the config file.
+ * @key: The key to look up.
+ *
+ * Looks up a string configuration value in the `.igtrc` file.
+ * The returned string is newly allocated and must be freed by
+ * the caller using free().
+ *
+ * Returns: A newly allocated string containing the value, or NULL if not =
found.
+ */
+char *igt_rc_get_string(const char *group_name, const char *key)
+{
+	struct igt_key_entry *curr;
+
+	igt_list_for_each_entry_reverse(curr, &rc_entries, link) {
+		if (strcmp(curr->group, group_name) =3D=3D 0 && strcmp(curr->key, key) =
=3D=3D 0)
+			return strdup(curr->value);
+	}
+
+	return NULL;
+}
+
+/**
+ * igt_rc_get_boolean:
+ * @group_name: The group name in the config file.
+ * @key: The key to look up.
+ * @out: Pointer to a boolean where the result will be stored.
+ *
+ * Looks up a boolean configuration value in the `.igtrc` file.
+ * Parses standard boolean representations like "true", "false", "1", "0".
+ *
+ * Returns: true if the key exists and was successfully parsed, false othe=
rwise.
+ */
+bool igt_rc_get_boolean(const char *group_name, const char *key, bool *out=
)
+{
+	char *val =3D igt_rc_get_string(group_name, key);
+
+	if (!val)
+		return false;
+
+	if (strcasecmp(val, "true") =3D=3D 0 || strcmp(val, "1") =3D=3D 0) {
+		*out =3D true;
+	} else if (strcasecmp(val, "false") =3D=3D 0 || strcmp(val, "0") =3D=3D 0=
) {
+		*out =3D false;
+	} else {
+		free(val);
+		return false;
+	}
+
+	free(val);
+	return true;
+}
+
+/**
+ * igt_rc_get_integer:
+ * @group_name: The group name in the config file.
+ * @key: The key to look up.
+ * @out: Pointer to an integer where the result will be stored.
+ *
+ * Looks up an integer configuration value in the `.igtrc` file.
+ *
+ * Returns: true if the key exists and was successfully parsed, false othe=
rwise.
+ */
+bool igt_rc_get_integer(const char *group_name, const char *key, int *out)
+{
+	char *val =3D igt_rc_get_string(group_name, key);
+	char *endptr;
+	long lval;
+
+	if (!val)
+		return false;
+
+	errno =3D 0;
+	lval =3D strtol(val, &endptr, 0);
+	if (endptr =3D=3D val || endptr[0] !=3D '\0' || errno =3D=3D ERANGE ||
+	    lval < INT_MIN || lval > INT_MAX) {
+		free(val);
+		return false;
+	}
+
+	*out =3D (int)lval;
+	free(val);
+	return true;
+}
+
+/**
+ * igt_rc_get_double:
+ * @group_name: The group name in the config file.
+ * @key: The key to look up.
+ * @out: Pointer to a double where the result will be stored.
+ *
+ * Looks up a double configuration value in the `.igtrc` file.
+ *
+ * Returns: true if the key exists and was successfully parsed, false othe=
rwise.
+ */
+bool igt_rc_get_double(const char *group_name, const char *key, double *ou=
t)
+{
+	char *val =3D igt_rc_get_string(group_name, key);
+	char *endptr;
+	double dval;
+	char *dot;
+	struct lconv *lc;
+
+	if (!val)
+		return false;
+
+	/* Handle locale-specific decimal separator for strtod */
+	dot =3D strchr(val, '.');
+	lc =3D localeconv();
+	if (dot && lc && lc->decimal_point && lc->decimal_point[0] !=3D '.') {
+		*dot =3D lc->decimal_point[0];
+	}
+
+	errno =3D 0;
+	dval =3D strtod(val, &endptr);
+	if (endptr =3D=3D val || endptr[0] !=3D '\0' || errno =3D=3D ERANGE) {
+		free(val);
+		return false;
+	}
+
+	*out =3D dval;
+	free(val);
+	return true;
+}
=20
 /**
  * igt_load_igtrc:
diff --git a/lib/igt_rc.h b/lib/igt_rc.h
index 3b7179808..61f883ee1 100644
--- a/lib/igt_rc.h
+++ b/lib/igt_rc.h
@@ -21,10 +21,11 @@
  * IN THE SOFTWARE.
  */
=20
-
 #ifndef IGT_RC_H
 #define IGT_RC_H
=20
+#include <stdbool.h>
+
 #ifndef ANDROID
 #include <glib.h>
 #else
@@ -32,7 +33,14 @@
 #endif
=20
 extern GKeyFile *igt_key_file;
-
 struct _GKeyFile *igt_load_igtrc(void);
=20
+void igt_rc_init(void);
+void igt_rc_free(void);
+
+char *igt_rc_get_string(const char *group_name, const char *key);
+bool igt_rc_get_boolean(const char *group_name, const char *key, bool *out=
);
+bool igt_rc_get_integer(const char *group_name, const char *key, int *out)=
;
+bool igt_rc_get_double(const char *group_name, const char *key, double *ou=
t);
+
 #endif /* IGT_RC_H */
diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 30ee3c72b..a6b3008eb 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -364,7 +364,6 @@ int unigraf_get_connector_id_by_stream(int drm_fd, int =
stream_id)
 bool unigraf_open_device(int drm_fd)
 {
 	TSI_RESULT r;
-	GError *cfg_error =3D NULL;
 	char *cfg_device =3D NULL;
 	char *cfg_role =3D NULL;
 	char *cfg_input =3D NULL;
@@ -382,63 +381,52 @@ bool unigraf_open_device(int drm_fd)
=20
 	unigraf_init();
=20
-	if (igt_key_file) {
-		cfg_device =3D g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
-						   UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
-		if (cfg_error) {
-			unigraf_debug("No device name configured, uses first device available.\=
n");
-			cfg_device =3D NULL;
-		}
+	cfg_device =3D igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
+				       UNIGRAF_CONFIG_DEVICE_NAME);
+	if (!cfg_device) {
+		unigraf_debug("No device name configured, uses first device available.\n=
");
+		cfg_device =3D NULL;
+	}
=20
-		cfg_error =3D NULL;
-		cfg_role =3D g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
-						 UNIGRAF_CONFIG_DEVICE_ROLE, &cfg_error);
-		if (cfg_error) {
-			unigraf_debug("No device role configured.\n");
-			cfg_role =3D NULL;
-		}
+	cfg_role =3D igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
+				     UNIGRAF_CONFIG_DEVICE_ROLE);
+	if (!cfg_role) {
+		unigraf_debug("No device role configured.\n");
+		cfg_role =3D NULL;
+	}
=20
-		cfg_error =3D NULL;
-		cfg_input =3D g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
-						  UNIGRAF_CONFIG_INPUT_NAME, &cfg_error);
-		if (cfg_error) {
-			unigraf_debug("No input name configured.\n");
-			cfg_input =3D NULL;
-		}
+	cfg_input =3D igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
+				      UNIGRAF_CONFIG_INPUT_NAME);
+	if (!cfg_input) {
+		unigraf_debug("No input name configured.\n");
+		cfg_input =3D NULL;
+	}
=20
-		cfg_error =3D NULL;
-		unigraf_connector_name =3D g_key_file_get_string(igt_key_file, UNIGRAF_C=
ONFIG_GROUP,
-							       UNIGRAF_CONFIG_CONNECTOR_NAME,
-							       &cfg_error);
-		if (cfg_error) {
-			unigraf_debug("No connector name configured, will autodetect.\n");
-			unigraf_connector_name =3D NULL;
-		}
+	unigraf_connector_name =3D igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
+						   UNIGRAF_CONFIG_CONNECTOR_NAME);
+	if (!unigraf_connector_name) {
+		unigraf_debug("No connector name configured, will autodetect.\n");
+		unigraf_connector_name =3D NULL;
+	}
=20
-		cfg_error =3D NULL;
-		cfg_edid_name =3D g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GRO=
UP,
-						      UNIGRAF_CONFIG_EDID_NAME, &cfg_error);
-		if (cfg_error) {
-			unigraf_debug("No default EDID set, use IGT default.\n");
-			cfg_edid_name =3D NULL;
-		}
+	cfg_edid_name =3D igt_rc_get_string(UNIGRAF_CONFIG_GROUP,
+					  UNIGRAF_CONFIG_EDID_NAME);
+	if (!cfg_edid_name) {
+		unigraf_debug("No default EDID set, using IGT default.\n");
+		cfg_edid_name =3D NULL;
+	}
=20
-		cfg_error =3D NULL;
-		unigraf_crc =3D g_key_file_get_boolean(igt_key_file, UNIGRAF_CONFIG_GROU=
P,
-						     UNIGRAF_CONFIG_USE_CRC_NAME, &cfg_error);
-		if (cfg_error) {
-			unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
-			unigraf_crc =3D true;
-		}
+	if (!igt_rc_get_boolean(UNIGRAF_CONFIG_GROUP,
+				UNIGRAF_CONFIG_USE_CRC_NAME, &unigraf_crc)) {
+		unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
+		unigraf_crc =3D true;
+	}
=20
-		cfg_error =3D NULL;
-		unigraf_stream_count =3D g_key_file_get_integer(igt_key_file, UNIGRAF_CO=
NFIG_GROUP,
-							      UNIGRAF_CONFIG_MST_STREAM_COUNT,
-							      &cfg_error);
-		if (cfg_error) {
-			unigraf_debug("MST usage not configured, using SST.\n");
-			unigraf_stream_count =3D 0;
-		}
+	if (!igt_rc_get_integer(UNIGRAF_CONFIG_GROUP,
+				UNIGRAF_CONFIG_MST_STREAM_COUNT,
+				&unigraf_stream_count)) {
+		unigraf_debug("MST usage not configured, using SST.\n");
+		unigraf_stream_count =3D 0;
 	}
=20
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
--=20
2.55.0.737.g08866a6d13-goog

