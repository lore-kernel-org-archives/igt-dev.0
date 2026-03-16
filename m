Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03212F4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC27610E262;
	Mon, 16 Mar 2026 10:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nbSpbg5P";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9315C10E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3DE444E42627
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 14E025FC4A;
 Mon, 16 Mar 2026 10:23:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E84F10369977; Mon, 16 Mar 2026 11:23:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0WI4LM83PRyfn8NVfmgVWayjosTiA5UTBzdYfXyhbsA=;
 b=nbSpbg5P+n7/skKKYqKm3+OPYMRyobgy8nLJ2L3uEwIiuaotKc8zD4ZvoX4fzd/0vE908H
 H9JLSoAm0an9GvSZDIv79kmyLulmx7veFColrUf4luHU/YaS/2ckVjTgHjCDKj79thHATt
 sHpfHx9kBb4HIRG3KwbAZCXds7mwRSM9QOBkeebar7szfGE4eakurYjIHjB94iE0b3DaAR
 SOS1vyIk5R0C76TKWJJoQtoY8jlJ5a6ic04gQfNAblRA2izIqyVctFX/75LdskMZnKZujP
 F+aix70zzV28xfB0uSFDATCJs260kIQKfc4QEARMTWKkWS+1Y8NLStyHgChg1A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:09 +0100
Subject: [PATCH i-g-t v8 01/49] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-1-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3697;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=wt3R+4f1jZQubLqo1bawUAf6hxlOqiqzuIkv+GJNORI=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pO5+g+k2uXcRBHgOX3qnCZG4/DRRf2E7vUw
 +Xw1mwvvIOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaThsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJWdxAAkYp0SHLNv7cHIVnJsuogODWYeqoq/Ef
 kRYjLsb8t5S91vPNcqJYaI7EIifiHxwyuq9pJDcca8eb7Yc6CGTfCZ2UF6rYql663t5tqUe4X3a
 muOzsLUllen8I4VZpIYoQk3wiv/Elhk8FRu4weP4hR/hHWFLHOCzI2YcijZuWLXCh7uhuHL+wB/
 MzMeQBN3A2p04SWYitUgBsufNqeiDeL1BHVkfSWZ1Xl4yqLIbSsSOUOeIpoFUjLLzTYUj48bsqk
 Kn9GOk2EUuY1F7+JgSsnjBmtExAnuoE9FNia0GsKmkQm+FuyRujgAhfR6lzk6rIGidt88FZ2DDN
 WvFr7qd38ykkMO4mgSdwD/HLcFp/OAnpUG7qZaXYQTT5K5DQfxZsMp1dAwtoYXxHo+wQBeSTTHS
 dbD726er3W45V1GnXl6GXDJUtrk01oRsEz1lHRzGaniOTdFz6fUR2bIK3jiLT3ir66QwBS0jfO3
 o8/Mr+D2KImSFOUsB7PGzQXvpAO2qig8LxfvwzgHMypat6BETONidSjyYBqTO6jsjorbfdqowNG
 B1ODgm6CuyKg7tID+V+HvqxXyjPVuuOy0JYrhxpWHQKDvJnQ13LB0aisov8Ue6iBrNzZdgw9mR2
 ThOSCOuZUUi8xeRnjrp8FHlgZfPDmUzXembGVu3x5QSm1pn7n1aU=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

Some tests need to wait for a specific connector status. In order to make
the timeout customisable for each target, add an option in the
configuration file.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_core.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_core.h |  9 +++++++++
 lib/igt_kms.c  |  1 +
 3 files changed, 43 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3ee670a41a91..e8f31d573512 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -26,6 +26,7 @@
  *
  */
 
+#include "igt_kms.h"
 #ifdef HAVE_LIBGEN_H
 #include <libgen.h>
 #endif
@@ -271,6 +272,10 @@
  *	&num; It is not mandatory and allows overriding default values.
  *	[DUT]
  *	SuspendResumeDelay=10
+ *
+ *	&num; The following option define the timeout (in seconds) for detection feature
+ *	&num; (waiting for a connector status)
+ *	DisplayDetectTimeout=10.0
  * ]|
  *
  * Some specific configuration options may be used by specific parts of IGT,
@@ -379,6 +384,21 @@ static bool stderr_needs_sentinel = false;
 
 static int _igt_dynamic_tests_executed = -1;
 
+/**
+ * default_display_detect_timeout: Timeout for display detection, in seconds
+ */
+static double default_display_detect_timeout;
+
+static void igt_set_default_display_detect_timeout(double timeout)
+{
+	default_display_detect_timeout = timeout;
+}
+
+double igt_default_display_detect_timeout(void)
+{
+	return default_display_detect_timeout;
+}
+
 static void print_backtrace(void)
 {
 #ifndef HAVE_LIBUNWIND
@@ -1003,6 +1023,7 @@ static void common_init_config(void)
 {
 	GError *error = NULL;
 	int ret = 0;
+	static double timeout = 0.0;
 
 	igt_key_file = igt_load_igtrc();
 
@@ -1023,6 +1044,18 @@ static void common_init_config(void)
 	if (ret != 0)
 		igt_set_autoresume_delay(ret);
 
+	if (igt_key_file)
+		timeout = g_key_file_get_double(igt_key_file, "DUT", "DisplayDetectTimeout",
+						&error);
+	if (error) {
+		igt_debug("Failed to read DisplayDetectTimeout, defaulting to %f\n",
+			  DEFAULT_DETECT_TIMEOUT);
+		g_clear_error(&error);
+		timeout = DEFAULT_DETECT_TIMEOUT;
+	}
+	g_clear_error(&error);
+	igt_set_default_display_detect_timeout(timeout);
+
 	/* Adding filters, order .igtrc, IGT_DEVICE, --device filter */
 	if (igt_device_filter_count() > 0)
 		igt_debug("Notice: using --device filters:\n");
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 6845f853c980..daf83cb5380d 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -143,6 +143,13 @@ struct _GKeyFile *igt_load_igtrc(void);
  */
 #define IGT_EXIT_ABORT 112
 
+/**
+ * DEFAULT_DETECT_TIMEOUT
+ *
+ * Default timeout in second used for some screen detection
+ * functions. It can be overiden by option DetectTimeout in the .igtrc file.
+ */
+#define DEFAULT_DETECT_TIMEOUT 10.0
 void __igt_assert_in_outer_scope(void);
 
 bool __igt_fixture(void);
@@ -446,6 +453,8 @@ void __igt_subtest_group_restore(int, int);
  */
 #define igt_main() igt_main_args(NULL, NULL, NULL, NULL, NULL)
 
+double igt_default_display_detect_timeout(void);
+
 const char *igt_test_name(void);
 void igt_simple_init_parse_opts(int *argc, char **argv,
 				const char *extra_short_opts,
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0b05ddd72977..692d75b70ecc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -60,6 +60,7 @@
 #include "igt_debugfs.h"
 #include "igt_device.h"
 #include "igt_pipe_crc.h"
+#include "igt_rc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM

-- 
2.52.0

