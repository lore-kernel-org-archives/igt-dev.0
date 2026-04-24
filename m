Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4D0FED3F1
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FD88961D;
	Fri, 24 Apr 2026 16:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xc678A9A";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CED890BE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DF6E34E42A66;
 Fri, 24 Apr 2026 16:54:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AF0A1604EB;
 Fri, 24 Apr 2026 16:54:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F74C1072089B; 
 Fri, 24 Apr 2026 18:54:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=31EVhESw0vQo6NW51DzA54CnsEZvQ1dl8EH+pu2/ooI=;
 b=xc678A9ACaSi5ImYE70lVLWHf2Io/eZ2+cPIYIKNZeSnAwrsPhRBF1YCX4hiar0r9QCiiV
 sLWk0JStECeLybxpLJz0aqiH5UBTDSzcfEKhidGEsqGWiYEYHW0TA6OZe4/TPj0YpfmCWa
 JDTQaVZUg3/sHYbtHr4JjLMaS51JBMoMZbtoJeRquho+PCQoc67PoPqa0m9xBMk4hO1lmP
 oLvw76HrDh+JyJSv8g56DqiHMFCbshq60N0hfP1pV7Ib/yvpRh8G6o93lTUetCo/sDS0+t
 fDv4FaXlGddUNSd8VsWasHpt4xYGsntPrnLHjWZvIgTWTJN18jj2329Inoh6fw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:36 +0200
Subject: [PATCH i-g-t v11 01/49] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-1-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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
 lib/igt_core.c | 32 ++++++++++++++++++++++++++++++++
 lib/igt_core.h | 10 ++++++++++
 lib/igt_kms.c  |  1 +
 3 files changed, 43 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 4f79c02948ab..4378c0810a54 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -271,6 +271,10 @@
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
@@ -379,6 +383,21 @@ static bool stderr_needs_sentinel = false;
 
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
@@ -1003,6 +1022,7 @@ static void common_init_config(void)
 {
 	GError *error = NULL;
 	int ret = 0;
+	static double timeout = 0.0;
 
 	igt_key_file = igt_load_igtrc();
 
@@ -1023,6 +1043,18 @@ static void common_init_config(void)
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
index 9fe3997e7abf..7ee9ceddd24c 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -143,6 +143,14 @@ struct _GKeyFile *igt_load_igtrc(void);
  */
 #define IGT_EXIT_ABORT 112
 
+/**
+ * DEFAULT_DETECT_TIMEOUT
+ *
+ * Default timeout in second used for some screen detection
+ * functions. It can be overiden by option DetectTimeout in the .igtrc file.
+ */
+#define DEFAULT_DETECT_TIMEOUT 3.0
+
 void __igt_assert_in_outer_scope(void);
 
 bool __igt_fixture(void);
@@ -446,6 +454,8 @@ void __igt_subtest_group_restore(int, int);
  */
 #define igt_main() igt_main_args(NULL, NULL, NULL, NULL, NULL)
 
+double igt_default_display_detect_timeout(void);
+
 const char *igt_test_name(void);
 void igt_simple_init_parse_opts(int *argc, char **argv,
 				const char *extra_short_opts,
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 38c28f45f8b2..4ae18926a454 100644
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
2.54.0

