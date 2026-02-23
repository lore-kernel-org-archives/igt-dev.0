Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBF6EA4FB4
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D7910E372;
	Mon, 23 Feb 2026 12:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="0Kpt29t3";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D377510E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 22E631A116F;
 Mon, 23 Feb 2026 12:08:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ED82D5FD43;
 Mon, 23 Feb 2026 12:08:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E0CF910368F70; Mon, 23 Feb 2026 13:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7Tvp5hrHL/X244Ci/wkN27sLNUgvmvK8ZE0suySz0jE=;
 b=0Kpt29t3QDVIbobxCLGhm6d3L6GEv6Q8TqWW4fbsZDU71UnERbxEFwmP2g2tCQP0tjZY2J
 MF9OWfONdEn1X7ePZb5We466KT9s5pkCbupw/vrFhSoiuPwp2JLcYweGZxyWgJsmCmSVRL
 D0QxXhO/MicDapauZ536c+53SmqClXu+xqjojbEOnPoIlKxYipuSu8D5iUN/PSZ9QbO80o
 ONtdYBAWe10fv9+a48qI68mwP6JUuPjP26AE/M84HY4ZrBjY0DgRG9DE0INkaGIJErpjZN
 T3Fpa+rCiU9mz+ueih3VSG5W2bfwvLEtvAiCgIvz4Duuyzg5pzlpJf146ybj2Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:08 +0100
Subject: [PATCH i-g-t v7 01/48] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-1-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3585;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=IttdcE7oPjws1sedQbRG4WfCT0XhPv5hSgPxmVaQ7Bo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENm6OHUzheF2D6JI/QV5bVJs4Pz0EDbPb4SG
 xDizHqwFs+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDZhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOI9ABAAni+tTyphjXzbtbfismiNFZg5L1rwM8B
 O2z6muMUA5RZJMd5VDBYTOW/OMzwX2TQDM1AJQjbVFSIuD9I+6TbLdvC3bmcH+Nk6MaouPXLqxl
 FQTieFBFEcbtzNYSF5ABet9PDyzzOzARKPAE15ZCBF0qsQ+NQeZT57uvGb4CDNIO5g+KCoNznjO
 27PUyFC3AqHbDfi/CJ4PaquEfyhQ/A35wZLrotyUUpExe/ueDNY+ZEBKjCNExQyUguU7acEqQjR
 JIApR61fmmibI4eaf6qSxSNYRulvZ9dSH74YyWMgT1UDI9+kdXH8tlIcFuOrzTGRNXlfvxz//9t
 CINdi00NlIV6GAJHmzUR6IIvgs9T6ntFveiioRfJV5HHDSN26pR9w45Cl1B8sqADgRSIdJqjcls
 kO+juu6CItSREZ4p0wVYJRYFLqlZFQeLW6bASxplvvjboUfgxtmteQJASYMwTMoYAjpif7xxhzQ
 shKSJs+Gskbzu94bb5qiuuFOJ7iKWyY9IuqgUrfpyC+PACtFPBDX5ckI1FZxcfFC2nGuZcZaoMW
 dgeHWwdzFM4yvVLBclV7+5IYylT5GYkRjsVVM0SM0bv0F7t6gFUwRn7cc3zH1eHrDDpyoSY5Cp8
 1BwTww/a5C3BxoVTyzthsS3Xrm7es9ShKTCnAuS7YMP5DbadTC8Y=
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
index 5c48796040a2..65e657cffda7 100644
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

