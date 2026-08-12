Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EE2C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 14:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DC210F04F;
	Wed, 12 Aug 2026 14:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QhDOuq5k";
	dkim-atps=neutral
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1E210F04F
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 14:58:25 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-934963b2bc0so102486585a.3
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1786546704; x=1787151504;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qrhjGhI6jc0SDXk+t/4+dD7GyJ3EvuQZDcOyQNKSM68=;
 b=QhDOuq5k6LsWTqMwHlrOKIZSsNJk9vvuJXBTn7uo16RrAczJquKIByGv0tbU2sFbwa
 2dum9c4FYn+04P0bUc6MqdhiPEaJiMshiM28FDl0FHNyR0kgK2bo749tJFdpChTwIjlo
 shbdB+DKdhTIjZ/bxqYu8zlbD7GOoED3A5GaPyo7I6c8cZBX/21hr1cwgzqPfvLNFVSp
 /PqhnNUTXAnJHvUZDIybjY3CCfEoiyiYF0JxZpFPgh6H1CciyqBJ1Fkdof6gNR1bndPV
 FSjAp3wVpoQwEf8geZxBJUI59ECXC/NsGiOT2ClX0AhYvKTxDsXEPeVn8AXLjrHbKzos
 ji8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786546704; x=1787151504;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qrhjGhI6jc0SDXk+t/4+dD7GyJ3EvuQZDcOyQNKSM68=;
 b=RLDzIV/NyxFG2j3V1yTW4o4bUJTV+755V5iz/dKLlCZnAJ9bBpO8DyMTl5q2R9RP93
 1uIZgwJJ5oAn6FaMysBV9sPIq7/ull1taubBghrY2khFs/Wp13vPeq8p+8dHOtcnNcDk
 Hd7mvJT6JfY37g3o4WQUbnPdlvY6nAu178ia/7hCcebI4/ccdRuxb0ASTgpDwyOXd4Fr
 PMl6SDevT3H4pJ/ve2xapFV5zOfZSclFSDnSfcj7XgOgcKUGtuUmKFPbnWh0qMc0GqCG
 sGI/vSlwq/2BLeEu8bdGGQkv2aXpMpqeCKXznT+me8Bi8L61HBt4aVC2nK0cCnQuiPbe
 eRjg==
X-Gm-Message-State: AOJu0Yzv7LEBZrxsXQ+7LCCBHrQkrfgba/isnVh2/Fre/Vdjm3n3E+fO
 wG9CZ3FGWy+96euJjnHdvAtUqATKgyLvBqelG87QzbGHGWPjBgLJ1BuZxO5bl+J+vVKcsmKJSkw
 +EOkFt76vI/9zUljtRpfWze3VuJdkl8XNWWDgSdH1kCZrWdVhIPY2CnlPeTmXsEiIsG55cWvi+j
 0O5B7IKzkyIjVeFwovNmj4EMZUUh8fOnrDOsaRd3Qts+9pzdCYWvDJ4h8wRF1G/n++ZWc=
X-Received: from qkak24-n2.prod.google.com
 ([2002:a05:620a:a0d8:20b0:930:f57c:62dc])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:370b:b0:934:9524:2e89 with SMTP id
 af79cd13be357-936b3a75a97mr440157485a.13.1786546703750; 
 Wed, 12 Aug 2026 07:58:23 -0700 (PDT)
Date: Wed, 12 Aug 2026 10:58:09 -0400
In-Reply-To: <20260720185026.93121-1-markyacoub@google.com>
Mime-Version: 1.0
References: <20260720185026.93121-1-markyacoub@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260812145822.3349593-1-markyacoub@google.com>
Subject: [PATCH v4] lib/igt_rc: Introduce generic config parser
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, kamil.konieczny@linux.intel.com, 
 Mark Yacoub <markyacoub@google.com>
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

Currently, libraries like unigraf and igt_core explicitly rely on GKeyFile
for reading configuration from .igtrc. Android builds do not
natively supply glib, meaning these tools cannot be cleanly
compiled.

This patch abstracts config parsing into a dedicated `igt_rc` module.
To avoid platform-specific diverging implementations and glib dependencies,
`igt_rc` now natively parses `.igtrc` using a stripped-down, thread-safe
`igt_list` implementation for all platforms.

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
 - Update pointer assignments, array indexing [0], and public docstrings (L=
ouis Chauvet).

v2:
 - Drop the GKeyFile abstraction fakes from android/glib.h.
 - Introduce a generic wrapper (igt_rc.h) instead of modifying glib.h.
---
 lib/igt_core.c               |   7 +-
 lib/igt_rc.c                 | 245 +++++++++++++++++++++++++++++++++++
 lib/igt_rc.h                 |   6 +
 lib/meson.build              |   1 +
 lib/vendor/unigraf/unigraf.c |  92 ++++++-------
 5 files changed, 293 insertions(+), 58 deletions(-)
 create mode 100644 lib/igt_rc.c

diff --git a/lib/igt_core.c b/lib/igt_core.c
index a7c097d9e..433727644 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1044,16 +1044,11 @@ static void common_init_config(void)
 	if (ret !=3D 0)
 		igt_set_autoresume_delay(ret);
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
diff --git a/lib/igt_rc.c b/lib/igt_rc.c
new file mode 100644
index 000000000..2a1cd0532
--- /dev/null
+++ b/lib/igt_rc.c
@@ -0,0 +1,245 @@
+#include "igt_rc.h"
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <locale.h>
+#include <string.h>
+#include <strings.h>
+#include <ctype.h>
+#include <pthread.h>
+#include <limits.h>
+#include "igt_list.h"
+
+struct igt_key_entry {
+	char *group;
+	char *key;
+	char *value;
+	struct igt_list_head link;
+};
+
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
diff --git a/lib/igt_rc.h b/lib/igt_rc.h
index d871b3b26..f5f8d6081 100644
--- a/lib/igt_rc.h
+++ b/lib/igt_rc.h
@@ -1,3 +1,4 @@
+#include <stdbool.h>
 /*
  * Copyright =C2=A9 2017 Intel Corporation
  *
@@ -33,4 +34,9 @@
=20
 extern GKeyFile *igt_key_file;
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
diff --git a/lib/meson.build b/lib/meson.build
index 12d78de20..5348f2da0 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -97,6 +97,7 @@ lib_sources =3D [
 	'igt_kms.c',
 	'igt_fb.c',
 	'igt_core.c',
+	'igt_rc.c',
 	'igt_dir.c',
 	'igt_draw.c',
 	'igt_list.c',
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
2.55.0.679.g6767b8d81c-goog

