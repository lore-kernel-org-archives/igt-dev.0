Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4F5FF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F62C10EC43;
	Tue, 31 Mar 2026 17:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qRTwEPv0";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D5110EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E973F4E4288D
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B6BAA6029D;
 Tue, 31 Mar 2026 17:10:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C25BE10450448; 
 Tue, 31 Mar 2026 19:10:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lINCCIVWRinaZLVrucarJDk3GgfHwMPXnWWCP+K/HTA=;
 b=qRTwEPv0kf0m1dl3QFM31F5RK/l+qWjwZkx8pMqfnQGIfiRSxlko4LnvHvDJZRT+o0LXej
 k60F7KTVXWKvjFqzwSOvYXG37J492lTFt494lMtKqHuBGw1O4pK0672rNhyFZU5Sma82gl
 deyfIwjhoWe0jjX/lqK7ZnE4n5F3nZcPVP6HdX+8dztJ8tP+VIqmKyZopFyGNRjvCRL5yf
 xKggfaMJwMjUfJI8GeYaA5e4SB3pI/273R9EdQkMyjOWEKFbFfou+IQGN3MfmfD6eTZnYm
 +NnpL6SJcIHueoQCDQPuG5zYnY9qk+euA/WQk/TckVJCpoO3keeprvJ+YJj2BA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:23 +0200
Subject: [PATCH i-g-t v10 06/49] lib/tests: Add tests for array manipulations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-unigraf-integration-v10-6-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4976;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=dFdSDk8dHwYMEJPeBnY11cSOnc+KSjAvDB856MFwVx4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA8rqB2BxcErdzwmd+ZmhA/RT5QgWw+sNwxu
 sVIlkBLoByJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLGMA/+IGL7QDXqB/RNI+4miNQV0BBPjHLz6iA
 HvibT+FFRxmJvrGO640E+xFjDrvxXTz2GbukAJpofLVjazduwZrZ9ckqh8tDxDzQCBHQ6Gv7MVx
 kuib5QCDCaWXV9EHKykJyST3Lrb5xfAXySfEkUHmHdobbFvSbcocuLWbVKJyYA9asgY2cYqL+ew
 wpmFxof+zMy2XQaNyvF9+M7HIS6J8VZ0KvUQI5p0Be1t3qBVVE9/4p+t0s0coNbucahulQnbNpa
 Xf9b/7yCyL1MQFKp2JuOM5kBznSX3AXsVEjw2dahQ3k41+FiOyUKZbeI7dpiiut4psxIp1QN/g3
 r2+5gPhxvM6ka5J2pClRzaHmOx0Mq4j95OL49hYL31oHlFK2nq84o67op4HZn02NRRZEA0mOizq
 P42mf7UoFN57x2lb57eZD8moD3NKfdNbE5xU4EfjDoV4CDcybN6v14QCdQxWhRMLBc0X8isH1Zq
 msl4Ewech9rgBgycqKYmzYxD0q3rMvJ3G31ws/G0BffwdPNu2gVf5luej3wFrRSP+P2ADSbU3qi
 Oe1Qss/jIiQnkup2jcac/SggJyJzg/FI5PXqLRQgaTo8Mtip/u2dOYD8tvOWg2Sey/Y2PpKFW0+
 w2yaxrqoKiQ5MbIm8UCtLc6HmTV8iMC1ih7Lo8OgGT73asQy4C0c=
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

As array manipulation functions are not trivial, add few tests to ensure
they work properly.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/tests/igt_kms_array_diff.c | 159 +++++++++++++++++++++++++++++++++++++++++
 lib/tests/meson.build          |   1 +
 2 files changed, 160 insertions(+)

diff --git a/lib/tests/igt_kms_array_diff.c b/lib/tests/igt_kms_array_diff.c
new file mode 100644
index 000000000000..ebdc3b62bc31
--- /dev/null
+++ b/lib/tests/igt_kms_array_diff.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Google
+ *
+ * Authors:
+ *   Louis Chauvet <louis.chauvet@bootlin.com> (assisted by MistralAI)
+ */
+
+#include <stdint.h>
+#include <stdlib.h>
+
+#include "drmtest.h"
+#include "igt_core.h"
+#include "igt_kms.h"
+
+/**
+ * TEST: get_array_diff
+ * Category: Core
+ * Description: Test the get_array_diff() function
+ *
+ * SUBTEST: get_array_diff-empty-both
+ * Description: Test with both arrays empty
+ *
+ * SUBTEST: get_array_diff-empty-a
+ * Description: Test with array_a empty
+ *
+ * SUBTEST: get_array_diff-empty-b
+ * Description: Test with array_b empty
+ *
+ * SUBTEST: get_array_diff-no-diff
+ * Description: Test with identical arrays (no difference)
+ *
+ * SUBTEST: get_array_diff-full-diff
+ * Description: Test with completely different arrays
+ *
+ * SUBTEST: get_array_diff-partial-diff
+ * Description: Test with partial overlap between arrays
+ *
+ * SUBTEST: get_array_diff-null-diff
+ * Description: Test with diff parameter set to NULL (count only)
+ */
+
+static void test_get_array_diff_empty_both(void)
+{
+	uint32_t *diff = NULL;
+	int diff_len;
+
+	diff_len = get_array_diff(NULL, 0, NULL, 0, &diff);
+	igt_assert_eq(diff_len, 0);
+	free(diff);
+}
+
+static void test_get_array_diff_empty_a(void)
+{
+	uint32_t array_b[] = {1, 2, 3};
+	uint32_t *diff = NULL;
+	int diff_len;
+
+	diff_len = get_array_diff(NULL, 0, array_b, ARRAY_SIZE(array_b), &diff);
+	igt_assert_eq(diff_len, 0);
+	free(diff);
+}
+
+static void test_get_array_diff_empty_b(void)
+{
+	uint32_t array_a[] = {1, 2, 3};
+	uint32_t *diff = NULL;
+	int diff_len;
+
+	diff_len = get_array_diff(array_a, ARRAY_SIZE(array_a), NULL, 0, &diff);
+	igt_assert_eq(diff_len, 3);
+	igt_assert(diff);
+	igt_assert_eq(diff[0], 1);
+	igt_assert_eq(diff[1], 2);
+	igt_assert_eq(diff[2], 3);
+	free(diff);
+}
+
+static void test_get_array_diff_no_diff(void)
+{
+	uint32_t array_a[] = {1, 2, 3};
+	uint32_t array_b[] = {1, 2, 3};
+	uint32_t *diff = NULL;
+	int diff_len;
+
+	diff_len = get_array_diff(array_a, ARRAY_SIZE(array_a), array_b, ARRAY_SIZE(array_b),
+				  &diff);
+	igt_assert_eq(diff_len, 0);
+	free(diff);
+}
+
+static void test_get_array_diff_full_diff(void)
+{
+	uint32_t array_a[] = {1, 2, 3};
+	uint32_t array_b[] = {4, 5, 6};
+	uint32_t *diff = NULL;
+	int diff_len;
+
+	diff_len = get_array_diff(array_a, ARRAY_SIZE(array_a), array_b, ARRAY_SIZE(array_b),
+				  &diff);
+	igt_assert_eq(diff_len, 3);
+	igt_assert(diff);
+	igt_assert_eq(diff[0], 1);
+	igt_assert_eq(diff[1], 2);
+	igt_assert_eq(diff[2], 3);
+	free(diff);
+}
+
+static void test_get_array_diff_partial_diff(void)
+{
+	uint32_t array_a[] = {1, 2, 3, 4, 5};
+	uint32_t array_b[] = {2, 3, 6};
+	uint32_t *diff = NULL;
+	int diff_len;
+
+	diff_len = get_array_diff(array_a, ARRAY_SIZE(array_a), array_b, ARRAY_SIZE(array_b),
+				  &diff);
+	igt_assert_eq(diff_len, 3);
+	igt_assert(diff);
+	igt_assert_eq(diff[0], 1);
+	igt_assert_eq(diff[1], 4);
+	igt_assert_eq(diff[2], 5);
+	free(diff);
+}
+
+static void test_get_array_diff_null_diff(void)
+{
+	uint32_t array_a[] = {1, 2, 3};
+	uint32_t array_b[] = {2, 3};
+	int diff_len;
+
+	diff_len = get_array_diff(array_a, ARRAY_SIZE(array_a), array_b, ARRAY_SIZE(array_b), NULL);
+	igt_assert_eq(diff_len, 1);
+}
+
+IGT_TEST_DESCRIPTION("Test get_array_diff() function");
+int igt_main()
+{
+	igt_subtest("get_array_diff-empty-both")
+		test_get_array_diff_empty_both();
+
+	igt_subtest("get_array_diff-empty-a")
+		test_get_array_diff_empty_a();
+
+	igt_subtest("get_array_diff-empty-b")
+		test_get_array_diff_empty_b();
+
+	igt_subtest("get_array_diff-no-diff")
+		test_get_array_diff_no_diff();
+
+	igt_subtest("get_array_diff-full-diff")
+		test_get_array_diff_full_diff();
+
+	igt_subtest("get_array_diff-partial-diff")
+		test_get_array_diff_partial_diff();
+
+	igt_subtest("get_array_diff-null-diff")
+		test_get_array_diff_null_diff();
+}
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index 124a9ecae84d..f1db66d07c28 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -13,6 +13,7 @@ lib_tests = [
 	'igt_fork_helper',
 	'igt_hook',
 	'igt_hook_integration',
+	'igt_kms_array_diff',
         'igt_ktap_parser',
 	'igt_list_only',
 	'igt_invalid_subtest_name',

-- 
2.52.0

