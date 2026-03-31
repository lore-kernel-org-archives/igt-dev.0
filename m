Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BA3FF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C0310EC79;
	Tue, 31 Mar 2026 17:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VK4JOD7H";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D2F10EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3F65F1A30B3;
 Tue, 31 Mar 2026 17:10:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 15AC26029D;
 Tue, 31 Mar 2026 17:10:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E40D510450340; 
 Tue, 31 Mar 2026 19:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977054; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=48K9L1cqWHwjgz7mphaDuJ6Kq2mK5dknt50I6Kysnw8=;
 b=VK4JOD7HxlHt5eMfl0oDIIsPrdZLZ1PG+GH6gLh2OZbMLVI91TH6qoxg9QKTrpbvTPD+9F
 aOpXFtbfLsPjPlbje8mmlfBEJc0pI/EjdYyZMKBPV3CUlmUq9S7P9Zs/qizytg8AxebnCj
 AcxNapEfhV5tf4tga60mvPYANkZN8g61CmnSfWefKHc7Dsv3daV/wXgyUUkKmZLuuIsc7J
 rWz6HbKn9g2j1Ipz/kqdFTT1NLpXH2j1vMU0q91W8HOCLog7QEs6pkeNDuksGrDd5JctDo
 ltxAlnhgmNJln4h5dHfRSB524ffnBaRJA0HDvxQV9cWSBH6fo17tQmr7D28XGA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:22 +0200
Subject: [PATCH i-g-t v10 05/49] lib/igt_kms: Add helper to wait for new
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-5-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4483;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=eoUp9z+giQz9JtBh1iBiww51BLoNYpopKOpOvvyzhcw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA7tkgcg6WFNY539xirT4wMiR+92uZamcjOA
 zEA5UW8mSmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAOxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKbvQ//e+zFUCL2mVSLYQDrfr03RHrDMTfGMzM
 Y8hDpv91xruQ3C9EOIOFFPsVa1LnqWjgqWz+gDZ5T9ju7I0kCLx/Mmhz0DFq7Cu+Y0QOy0VYjRG
 2nZK5ab8NkuNPQG4yKSBdAN/BlxhRttwt0XDsrM58O03+oASKIQWenqOOV0hTQaA+YE7D5XANFq
 yUoK7Qu/0557L7helEo0NGeiy17BU8AuSKtdlnQt2dskCFUVIsWXgOrpadgyseTiEpr3jyG7+cc
 vgMGEJjhSqyxpeOmdGpf5lbhhnfQ/BYzyPNwZO395LM1rg3pV2H611PIk8zWEAI4G6my0A3pr0J
 CGa65YYheE+D5Q6ZKo049PRpiRLr9xEtaPbeZqp3CJKwAx3HkpZ1cn1/T/hNCL7zyl0SIKwFWLj
 pEY+2TZn14b/makoMTyXJAgf2jAf/7rDqqSSNwzb0oAIU36YzdTM5+lDsYLH6RYHDKa6jvjRWu9
 Tbc4DqgsgGvaanRqyg3sFn1eCxpTPq8INUvaB9TolV7X8q/KIiQDgDk+PjVSdYT4wv86uJczAA8
 SqYzfHtreTxayp8XAkZve7+wGIe0UVnpHM8fDvUZ78XzO/X778NkZ0Y4Ft23/DyS34dTlCm7vsI
 fwFnkiD+Ra1Z3Q4viJBr+I/btaT2SXjyBtvReElZ1am+IsgJhbr8=
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

Add list comparison utilities and a new function to wait for new
connectors to appear on the system.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   6 ++++
 2 files changed, 106 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6c41f021aad3..481b556dee99 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8383,3 +8383,103 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
 	return 0;
 }
+
+/**
+ * array_contains() - Search an element in the array
+ *
+ * @array: Pointer to the array to search into
+ * @array_len: Length of the array
+ * @value: Value to search in the array
+ *
+ * Returns true if @array contains @value
+ */
+static bool array_contains(const uint32_t *array, int array_len, uint32_t value)
+{
+	igt_assert(array_len == 0 || array);
+
+	for (int i = 0; i < array_len; i++)
+		if (array[i] == value)
+			return true;
+
+	return false;
+}
+
+/**
+ * get_array_diff() - Compute and return the set difference between two arrays
+ *
+ * @array_a: Pointer to the first array to compare
+ * @array_a_len: Length of the first array
+ * @array_b: Pointer to the second array to compare
+ * @array_b_len: Length of the second array
+ * @diff: Out pointer returning a array of items in @array_a but not
+ *        in @array_b. Can be NULL to only count the elements.
+ *
+ * Returns the number of element which are in @array_a but not in @array_b.
+ */
+int
+get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b, int array_b_len,
+	       uint32_t **diff)
+{
+	int diff_len = 0;
+
+	igt_assert(array_a_len == 0 || array_a);
+	igt_assert(array_b_len == 0 || array_b);
+
+	if (diff)
+		*diff = NULL;
+
+	for (int i = 0; i < array_a_len; i++) {
+		if (!array_contains(array_b, array_b_len, array_a[i])) {
+			if (diff) {
+				*diff = reallocarray(*diff, diff_len + 1, sizeof(**diff));
+				igt_assert(*diff);
+				(*diff)[diff_len] = array_a[i];
+			}
+
+			diff_len++;
+		}
+	}
+
+	return diff_len;
+}
+
+/**
+ * kms_wait_for_new_connectors() - Wait for new connector to appear
+ *
+ * @newly_connected: Out pointer returning the array of connectors currently
+ *                   found connected. If @newly_connected is not null, the
+ *                   content will be freed and replaced by a new allocation.
+ * @already_connected: Input pointer to array of connectors previously
+ *                     connected
+ * @already_connected_count: Length of @already_connected
+ * @drm_fd: DRM file descriptor
+ *
+ * Assert if:
+ * - @drm_fd is invalid
+ * - igt_get_time fails
+ * Returns: the number of connectors not in @already_connected and currently
+ * found connected.
+ */
+int kms_wait_for_new_connectors(uint32_t **newly_connected,
+				const uint32_t *already_connected,
+				int already_connected_count, int drm_fd)
+{
+	int newly_connected_count;
+	struct timespec start, end;
+
+	igt_assert(newly_connected);
+	igt_assert_fd(drm_fd);
+
+	igt_assert_eq(igt_gettime(&start), 0);
+	do {
+		if (*newly_connected)
+			free(*newly_connected);
+		newly_connected_count = igt_get_connected_connectors(drm_fd, newly_connected);
+		igt_assert_eq(igt_gettime(&end), 0);
+	} while (!get_array_diff(*newly_connected, newly_connected_count,
+			       already_connected, already_connected_count,
+			       NULL) &&
+		 igt_time_elapsed(&start, &end) <= igt_default_display_detect_timeout());
+
+	return newly_connected_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6b3b9c96fab9..02f6f427f1f0 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1300,4 +1300,10 @@ drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_nam
 uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
+int kms_wait_for_new_connectors(uint32_t **newly_connected,
+				const uint32_t *already_connected,
+				int already_connected_count, int drm_fd);
+int
+get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b, int array_b_len,
+	       uint32_t **diff);
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

