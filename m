Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B166C44520
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 18:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8E210E10C;
	Mon, 20 Jul 2026 18:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CWhSjdc8";
	dkim-atps=neutral
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2884010E10C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 18:50:29 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92ec91dc265so684726085a.2
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 11:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784573428; x=1785178228;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MMhAtvcLBCnBLLx52YnbD0J7cfPcHalslqrtPY0Y9ts=;
 b=CWhSjdc8OC2/abF+2U5wfbWp4nPvV77jZFnrdj+RSi9JMwzwjNCFgzdB9njhQ+gSyb
 piJ2qGhv3ymD/JlonrmL+2F/VkH6xEd0XmHKlvEhw7bNXkq5p0UtILp2Lv0q5i0X9KZM
 Soa0+XIdWUsKVHQUVF2+MHos+lULFGAQeWcLauL3iTilts6wQwZGO1wwOemEUI0AzMDQ
 j5e4JeGQX95GXGA024yM4UdkDdiHeDencs7RT/VDUfVORfd01pHJ7wWb+Il+TpQ8hfvD
 PpHGf/OyetrsQWpAWuGnAzvcJTGy06ziKntDobj92iUCWrsxM+F51TDOoCXcKwqxyRoF
 KuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784573428; x=1785178228;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MMhAtvcLBCnBLLx52YnbD0J7cfPcHalslqrtPY0Y9ts=;
 b=E2w5dVV1lVHcPRUy1dogg426EoN+6nrrwpoqIXkGLRXhLGNxqKhlzHkscwapGdQBd3
 AqI7ySvxoL9uDM7UCkk66Cg6v1oKYGVSCZlKQtaAQyCzCeLKB+1abr2FPGw75SdoI4f8
 qjF6e0bRJwk/UxpPwm2JPBv4Ok9o5C5gJ4R5/N0INufZvyJWBdX58nlHIL9dTueL5rz/
 TTtgfE27/Du7VJIYdfBdtccS1Y4FWt8O6w+3DC1pkiO770BkBCV6X9RRd87FQxKsTg5C
 MTom3q9u1MLrXYvcr86bj/8Pohgkwwc7ydp4+tBcRA4nP82gToLtDxPetzNbAihYlUs7
 RZRQ==
X-Gm-Message-State: AOJu0YwCTRGXr7B93uC4HUl7gVBiCgePENfbv1pH0XrYMNBHYC16qgTx
 r1RleUO/U9oy6MjJ6qWQanwpAJTi7Z1/4sPUWkKxiv/KgQerew1mIwnKluatkWazVfSwue4feci
 VR5UgCL76lktdXMSSLg3g8klXKfSjEfEHVrMdImMa4AwylX/zc8QHbiHwxi8RxzmI9skfIObkgB
 FLnrUwx8EzDhj9wXFRbmKKntQ/MnhD6DD+mItOP3n4XP9wVHSdGCqmf6FoJ7t4dYK8dSQ=
X-Received: from qknxx23.prod.google.com ([2002:a05:620a:5d97:b0:921:2cb1:7e2])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:d85:b0:92e:745c:6c59 with SMTP id
 af79cd13be357-930b416ec02mr1579196585a.55.1784573427328; 
 Mon, 20 Jul 2026 11:50:27 -0700 (PDT)
Date: Mon, 20 Jul 2026 14:50:26 -0400
In-Reply-To: <20260715192949.1984280-1-markyacoub@google.com>
Mime-Version: 1.0
References: <20260715192949.1984280-1-markyacoub@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720185026.93121-1-markyacoub@google.com>
Subject: [PATCH v2] lib/igt_rc: Introduce generic config parser
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

Currently, libraries like unigraf explicitly rely on GKeyFile
for reading configuration from .igtrc. Android builds do not
natively supply glib, meaning these tools cannot be cleanly
compiled.

This patch abstracts config parsing into a dedicated `igt_rc` module.
On standard Linux, `igt_rc` seamlessly wraps glib's native methods.
On Android environments, `igt_rc` natively parses `.igtrc` using
a stripped-down, thread-safe linked-list implementation (lib/android/igt_rc=
.c).

v2:
 - Drop the GKeyFile abstraction fakes from android/glib.h (Review feedback=
)
 - Introduce a generic wrapper (igt_rc.h) instead of modifying glib.h.
 - Provide a pure glib backend for Linux to avoid regressions.
 - Isolate Android parsing implementation cleanly into lib/android/igt_rc.c=
.
---
 lib/android/igt_rc.c         | 172 +++++++++++++++++++++++++++++++++++
 lib/igt_rc.c                 |  61 +++++++++++++
 lib/igt_rc.h                 |   5 +
 lib/meson.build              |   1 +
 lib/vendor/unigraf/unigraf.c |  92 ++++++++-----------
 5 files changed, 279 insertions(+), 52 deletions(-)
 create mode 100644 lib/android/igt_rc.c
 create mode 100644 lib/igt_rc.c

diff --git a/lib/android/igt_rc.c b/lib/android/igt_rc.c
new file mode 100644
index 000000000..6d9b348f7
--- /dev/null
+++ b/lib/android/igt_rc.c
@@ -0,0 +1,172 @@
+#include "igt_rc.h"
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <strings.h>
+#include <ctype.h>
+#include <pthread.h>
+
+struct igt_key_entry {
+	char *group;
+	char *key;
+	char *value;
+	struct igt_key_entry *next;
+};
+
+static struct igt_key_entry *rc_entries =3D NULL;
+static pthread_once_t rc_once_control =3D PTHREAD_ONCE_INIT;
+
+static char *trim_whitespace(char *str)
+{
+	char *end;
+
+	while (isspace((unsigned char)*str))
+		str++;
+
+	if (*str =3D=3D 0)
+		return str;
+
+	end =3D str + strlen(str) - 1;
+	while (end > str && isspace((unsigned char)*end))
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
+	struct igt_key_entry *tail =3D NULL;
+	char path[512];
+
+	snprintf(path, sizeof(path), "%s/.igtrc", "/data/local/tmp/igt");
+
+	fp =3D fopen(path, "r");
+	if (!fp)
+		return;
+
+	while ((read =3D getline(&line, &len, fp)) !=3D -1) {
+		char *trimmed =3D trim_whitespace(line);
+
+		if (*trimmed =3D=3D '\0' || *trimmed =3D=3D '#' || *trimmed =3D=3D ';')
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
+				*eq =3D '\0';
+				key =3D trim_whitespace(trimmed);
+				value =3D trim_whitespace(eq + 1);
+
+				entry =3D calloc(1, sizeof(*entry));
+				entry->group =3D strdup(current_group);
+				entry->key =3D strdup(key);
+				entry->value =3D strdup(value);
+				entry->next =3D NULL;
+
+				if (!rc_entries) {
+					rc_entries =3D entry;
+					tail =3D entry;
+				} else {
+					tail->next =3D entry;
+					tail =3D entry;
+				}
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
+	struct igt_key_entry *curr, *next;
+
+	curr =3D rc_entries;
+	while (curr) {
+		next =3D curr->next;
+		free(curr->group);
+		free(curr->key);
+		free(curr->value);
+		free(curr);
+		curr =3D next;
+	}
+	rc_entries =3D NULL;
+}
+
+char *igt_rc_get_string(const char *group_name, const char *key)
+{
+	char *last_match =3D NULL;
+	struct igt_key_entry *curr;
+
+	pthread_once(&rc_once_control, load_igtrc_once);
+
+	curr =3D rc_entries;
+	while (curr) {
+		if (strcmp(curr->group, group_name) =3D=3D 0 && strcmp(curr->key, key) =
=3D=3D 0)
+			last_match =3D curr->value;
+		curr =3D curr->next;
+	}
+
+	return last_match ? strdup(last_match) : NULL;
+}
+
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
+int igt_rc_get_integer(const char *group_name, const char *key, int *out)
+{
+	char *val =3D igt_rc_get_string(group_name, key);
+	char *endptr;
+	long lval;
+
+	if (!val)
+		return false;
+
+	lval =3D strtol(val, &endptr, 10);
+	if (*endptr !=3D '\0') {
+		free(val);
+		return false;
+	}
+
+	*out =3D (int)lval;
+	free(val);
+	return true;
+}
diff --git a/lib/igt_rc.c b/lib/igt_rc.c
new file mode 100644
index 000000000..31eb07bc0
--- /dev/null
+++ b/lib/igt_rc.c
@@ -0,0 +1,61 @@
+#include "igt_rc.h"
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <strings.h>
+#include <ctype.h>
+
+#include <glib.h>
+
+char *igt_rc_get_string(const char *group_name, const char *key)
+{
+	GError *error =3D NULL;
+	char *val;
+
+	if (!igt_key_file)
+		return NULL;
+
+	val =3D g_key_file_get_string(igt_key_file, group_name, key, &error);
+	if (error) {
+		g_error_free(error);
+		return NULL;
+	}
+
+	return val;
+}
+
+bool igt_rc_get_boolean(const char *group_name, const char *key, bool *out=
)
+{
+	GError *error =3D NULL;
+	gboolean val;
+
+	if (!igt_key_file)
+		return false;
+
+	val =3D g_key_file_get_boolean(igt_key_file, group_name, key, &error);
+	if (error) {
+		g_error_free(error);
+		return false;
+	}
+
+	*out =3D val;
+	return true;
+}
+
+int igt_rc_get_integer(const char *group_name, const char *key, int *out)
+{
+	GError *error =3D NULL;
+	int val;
+
+	if (!igt_key_file)
+		return false;
+
+	val =3D g_key_file_get_integer(igt_key_file, group_name, key, &error);
+	if (error) {
+		g_error_free(error);
+		return false;
+	}
+
+	*out =3D val;
+	return true;
+}
diff --git a/lib/igt_rc.h b/lib/igt_rc.h
index d871b3b26..a0942f8d0 100644
--- a/lib/igt_rc.h
+++ b/lib/igt_rc.h
@@ -1,3 +1,4 @@
+#include <stdbool.h>
 /*
  * Copyright =C2=A9 2017 Intel Corporation
  *
@@ -33,4 +34,8 @@
=20
 extern GKeyFile *igt_key_file;
=20
+char *igt_rc_get_string(const char *group_name, const char *key);
+bool igt_rc_get_boolean(const char *group_name, const char *key, bool *out=
);
+int igt_rc_get_integer(const char *group_name, const char *key, int *out);
+
 #endif /* IGT_RC_H */
diff --git a/lib/meson.build b/lib/meson.build
index 8db9fffde..20c2f34d7 100644
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
index 30ee3c72b..64268db34 100644
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
+		unigraf_debug("No default EDID set, use IGT default.\n");
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
2.55.0.229.g6434b31f56-goog

