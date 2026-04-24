Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE41FED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5D68961D;
	Fri, 24 Apr 2026 16:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JxtSM7Bl";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CA6890BE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 40D961A3406
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 189CE604EB;
 Fri, 24 Apr 2026 16:54:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1A2EA10720A1D; 
 Fri, 24 Apr 2026 18:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049672; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5UJU5Ch9A30KFtkOVbX4xvBmlYmgy1puAxoz9UP0kAg=;
 b=JxtSM7Blrm3jB0kEl83fE74lf4VE7ruGrXtp4EGAtPJ+KWWrPgpRUAQFz54BnV6GwEYojK
 6Tc3lQQirE181ILXXULL/puyc0OJZsUpCziepO6XjXsG8ti8Y8DkIC6LwZN3bG5FmqwSBB
 smhqC+NBn4AT8M36+y94zh9DG3l+0sX2kuYqht3y2OxCpdBMO8QIkgkkulneIOJPoFZmP9
 2/gtyVYXp0UuQe1cSQPGmrOdN4wO316EWS9KWhc6RNRHpTL/Plgd+KjjgHoeEW3gsMEixJ
 d5NSovrwfuT7tUsMAFRciukY5ait9qpFSu8dcVtX0/S5x6kYepH/oC+fnMJjkA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:41 +0200
Subject: [PATCH i-g-t v11 06/49] lib/tests: Add tests for array manipulations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260424-unigraf-integration-v11-6-0c5f5346ae60@bootlin.com>
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

As array manipulation functions are not trivial, add few tests to ensure
they work properly.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
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
2.54.0

