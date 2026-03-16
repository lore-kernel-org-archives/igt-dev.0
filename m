Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D888CF4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B74F10E264;
	Mon, 16 Mar 2026 10:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fDBG5zEB";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C8E10E252
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5DD0B4E42627;
 Mon, 16 Mar 2026 10:23:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2E2E35FC4A;
 Mon, 16 Mar 2026 10:23:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1EA8F10369E67; Mon, 16 Mar 2026 11:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nBlYPCkAMqVYSJjyUC3WuZqPmcLdKtFcu8JMcAl0+0w=;
 b=fDBG5zEBww3R1dsUY4XnRJ0zTfcstWnKcf6le2uP4WCbZi29CQQJ1hjuUR0u6nXpmcpZY5
 W+uoWrgaekY+PyhvEsf/T0i0FIOqVO2GjB04O3BEjHY7Qy5Pl6VFj6Y4AJ7dvONx5YfAGm
 8Ldlq4FGYVP87DQy0FKAqXZAgNSzrZQdyIu2gOp1TLVK0KeAvFGuWRAW0HrpRrbpW3kdQ7
 iQ6bd19G4vAt3B1JoNjR7230wXVAjHxqdnHBRrRu3a6/4P1LVhzZ/JM9PiaodIDgTPZaHw
 c3yY+JYGPhcS4+0FT/L/KuBqwTC+Q7jnQSBqwTnEc8sTkRmRfiYg1rfbiyMkiA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:14 +0100
Subject: [PATCH i-g-t v8 06/49] lib/tests: Add tests for array
 manipulations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-unigraf-integration-v8-6-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4941;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=sI+60jgoUeiU7Pw+JI9OTeLHGDRyayxKIg7t/JYZ9jE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pPxhopCwMrZfV4wcDxgI9oJef/pH92Kfc27
 X7k1G/TwKaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaTxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK+Ew//Q8MxFGUXnHXNN8vFi0T6B55w5/46JAx
 3d11xfBS9Grfwnhj0tMOs+YkV5dZHvSlKY7TIsKOH/xNXMAlNS4dLY+kXKwRiE6Nrr2arSY2u18
 qz1kU+NUiTpc4xBay6KIRIrSPak+VC/pwxbzKAr9GQM7Mo43gEq5xQL3/GWJw6wXv+jQxKerNNr
 1piI/3uD7v11vQ5Oo5cUZ1rTpMplLZpZIQgniiBbs609K0qTt5ifuhDuCoRdZw1mOXRu6NtlX8/
 sO4KY9Fkl8Emk0f7tPMbCIXBeBC/vLXCKmJtsMe3EvBK5XiYrOxEww86J/jCjlaPUjAywWaYURn
 IGdyx9htZXzkgvso5uvCuaSaDSto7qP5FpicrzUBJtdbQCMjUrw3Ta95xuaz7Qg31Tw9UJYgRpN
 ilej4vQH9l/rmH1mw8+EOsbl0ZRSaHl21v/5lEO/iGyp4mhHrEu6NCplvLnvuNxtp8jk8wbi00x
 DeGGTCmrOuQOxM48KMLJRYq+ygP8jP7PPjyiU8BXF3DKlpMCk+UhBjNsPCsF9tU3TyL8HLhj+PZ
 x4fNtzjRJTrSZF3/2p7if+zUnCCP0EGcYXb2qWcFB7k7Hv3BhDmQRjyIL6Q7dFJftxeM38XvdFD
 Cv5Dj5aG7PXV6iu6pGXOQhFL83dpvLUA2imop+T+rM38iXB+NPac=
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
index 000000000000..db34819b168a
--- /dev/null
+++ b/lib/tests/igt_kms_array_diff.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Google
+ *
+ * Authors:
+ *   Mistral Vibe <vibe@mistral.ai>
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

