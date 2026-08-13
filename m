Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C50C5CFCF
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 16:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F39910E4CD;
	Thu, 13 Aug 2026 16:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="a8cqVphE";
	dkim-atps=neutral
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BC810E4CD
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 16:26:07 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-934993d0f39so8225985a.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1786638366; x=1787243166;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:mime-version:date:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=sdCnIm5qnBf7CBN142n4+GdJFhMPeRoPmncF3CmzOzo=;
 b=a8cqVphEru78za2yHmzsbttkWG2qR4T9OokQRucZMalNkMM/J6vnDH4NlyFjMqIIn6
 6+p4JKMtGeqm0dpbftyRGrhOudvs9fVc4tYFS8JmGIAEUqJieXaK+sUHa+Px22h3+bxG
 i4hDVM+MUW/K0YmnsaLL0LJu43Q8qj1309SM/Xa8RSJvhtrfYyrmcO36KrbHJo7yFzzt
 hwqDLWZT0bnYpr7aU0SnmPVP82QTLXX88/lnaJ5rUdsgOwf+/BfmQm6b9AqEqWr7mynK
 2sMAqpPHVkiDyfsutBK9SF5YmbpLMc6s8CNyefLFS667i/09gROG6KujSS49MNPALsLt
 PItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786638366; x=1787243166;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sdCnIm5qnBf7CBN142n4+GdJFhMPeRoPmncF3CmzOzo=;
 b=pbvU1q90C0Bm69iyr/lEUodrJytCc55pqFUEIvYGw7k04Qr4I59J2vyhPpk5b94lsP
 jja20LzF0eeMCi2yhc+Sd7FJkCjLCUHsTa4aSPpbZu+5tCVX2rQtWCzkCqg/sSlsDAS1
 Typ/4mqTR9Kh/RYcip4RFBYqrDceYL86lFTClqsgWFPlB1U3qrMKREthbykoiQVO1cw3
 ucKcvcSVXm5rTIdcfca7SaYCI7+mjpeokW6DvVlnnhG07LVOqrXSfCklIjK4dAvs9cWh
 p2+AJruzjEsgoa5qfYXUJzBdb/EK3W1e6hO8T5V9wU3EbpOgvuTNBGQiQ4yybp0Zy5rt
 pGsA==
X-Gm-Message-State: AOJu0YwHz7132mu1Xv+ISArXXC+zgeH/TTuzDdhKSivpBArBMiMHf0Bj
 Vy7yVXEjsFdPwDDq+vvJF5bJEf8f45UGHeVezVdd3xqTDSMQxRE3BphmaJLvTeQCONrYJTcStQh
 /IuCB0LQXx3k2JVKcjB7jP7+DSCYVry7aq6HXAyIf8WbwelTFQp1EiXS8Km64cBaLkFNyusj+Fo
 WL8QOR2Xo/S0m6ZvnQvIs41IiH9WD64wFzUGfTKt/ogi5uVq0MIvfievFpcXa6SyWu/yM=
X-Received: from qkpi20.prod.google.com ([2002:a05:620a:27d4:b0:92e:5292:786a])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:6b0b:b0:92f:199:b035 with SMTP id
 af79cd13be357-936bf8cdb68mr641792485a.3.1786638365435; 
 Thu, 13 Aug 2026 09:26:05 -0700 (PDT)
Date: Thu, 13 Aug 2026 12:25:59 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813162602.2250541-1-markyacoub@google.com>
Subject: [PATCH v5] lib/igt_rc: Introduce generic config parser
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, louis.chauvet@bootlin.com, 
 sebastian.brzezinka@intel.com, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="y"
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

Currently, libraries like unigraf and igt_core explicitly rely on GKeyFile
for reading configuration from .igtrc. Android builds do not natively suppl=
y
GLib, meaning these tools cannot be cleanly compiled.

This patch avoids platform-specific diverging implementations by dropping
the native GLib dependency from generic configuration access and parsing
`.igtrc` natively using a stripped-down, thread-safe `igt_list` implementat=
ion.

To prevent regressions for deeply-entrenched legacy Linux tools (such as Ch=
amelium),
the native GLib fallback `GKeyFile` structures are retained and populated
parallel to the generic parser at startup.

v5:
 - Rebased onto upstream 'lib/igt_core: move igt_load_igtrc to igt_rc'
 - Safely run GLib loader parallel to generic parser at startup for Chameli=
um

v4:
 - Implement igt_rc_get_double() to parse floating point configs natively.
 - Migrate igt_core.c over to igt_rc_get_double() to drop GKeyFile dependen=
cies.
 - Add robust standard bounds checking (ERANGE and unmatched digits) to num=
ber parsers.

v3:
 - Drop Android-specific fallback paths; use IGT_CONFIG_PATH natively.
 - Drop glib Linux wrappers entirely; unify a single generic parser for all=
 platforms.
 - Port manual linked-list tracking over to standard igt_list.h APIs.
 - Inherit base 0 for strtol to safely parse hex masks.
 - Use robust PATH_MAX for dynamic config paths.
 - Update pointer assignments, array indexing [0], and public docstrings.

v2:
 - Drop the GKeyFile abstraction fakes from android/glib.h.
 - Introduce a generic wrapper (igt_rc.h) instead of modifying glib.h.
---
 lib/igt_core.c               |  37 ++----
 lib/igt_rc.c                 | 248 ++++++++++++++++++++++++++++++++++-
 lib/igt_rc.h                 |   6 +
 lib/vendor/unigraf/unigraf.c |  92 ++++++-------
 4 files changed, 297 insertions(+), 86 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 2f737b01a..b3efab247 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -974,39 +974,24 @@ static void oom_adjust_for_doom(void)
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
@@ -1016,11 +1001,7 @@ static void common_init_config(void)
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
diff --git a/lib/igt_rc.c b/lib/igt_rc.c
index b7f1731fe..b5035d788 100644
--- a/lib/igt_rc.c
+++ b/lib/igt_rc.c
@@ -3,16 +3,252 @@
  * Copyright =C2=A9 2026 Intel Corporation
  */
=20
+#include "igt_rc.h"
+
 #include <stdio.h>
 #include <stdlib.h>
+#include <errno.h>
+#include <locale.h>
+#include <string.h>
+#include <strings.h>
+#include <ctype.h>
+#include <pthread.h>
+#include <limits.h>
+#include "igt_list.h"
=20
-#ifndef ANDROID
-#include <glib.h>
-#else
-#include "android/glib.h"
-#endif
+struct igt_key_entry {
+	char *group;
+	char *key;
+	char *value;
+	struct igt_list_head link;
+};
=20
-#include "igt_rc.h"
+static IGT_LIST_HEAD(rc_entries);
+static pthread_once_t rc_once_control =3D PTHREAD_ONCE_INIT;
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
+static void load_igtrc_once(void)
+{
+	FILE *fp;
+	char *line =3D NULL;
+	size_t len =3D 0;
+	ssize_t read;
+	char *current_group =3D NULL;
+	char path[PATH_MAX];
+
+	char *config_path =3D getenv("IGT_CONFIG_PATH");
+	if (config_path) {
+		snprintf(path, sizeof(path), "%s", config_path);
+	} else {
+		char *home =3D getenv("HOME");
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
+__attribute__((destructor))
+static void free_igtrc(void)
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
+ * The returned string is newly allocated and must be freed by=20
+ * the caller using free().
+ *
+ * Returns: A newly allocated string containing the value, or NULL if not =
found.
+ */
+char *igt_rc_get_string(const char *group_name, const char *key)
+{
+	char *last_match =3D NULL;
+	struct igt_key_entry *curr;
+
+	pthread_once(&rc_once_control, load_igtrc_once);
+
+	igt_list_for_each_entry(curr, &rc_entries, link) {
+		if (strcmp(curr->group, group_name) =3D=3D 0 && strcmp(curr->key, key) =
=3D=3D 0)
+			last_match =3D curr->value;
+	}
+
+	return last_match ? strdup(last_match) : NULL;
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
+	if (endptr =3D=3D val || endptr[0] !=3D '\0' || errno =3D=3D ERANGE) {
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
+
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
index 3b7179808..1fa4f9a11 100644
--- a/lib/igt_rc.h
+++ b/lib/igt_rc.h
@@ -30,9 +30,15 @@
 #else
 #include "android/glib.h"
 #endif
+#include <stdbool.h>
=20
 extern GKeyFile *igt_key_file;
=20
 struct _GKeyFile *igt_load_igtrc(void);
=20
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
2.55.0.691.gc56d675ccc-goog

