Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3479BFED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DD48961D;
	Fri, 24 Apr 2026 16:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WKU6mf+B";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97664890BE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 891D91A3404;
 Fri, 24 Apr 2026 16:54:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 56165604EB;
 Fri, 24 Apr 2026 16:54:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E4991072089B; 
 Fri, 24 Apr 2026 18:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KtgdguyyMO/fxgWsGQrv+hYXERnJHJu5A39mac+Rh88=;
 b=WKU6mf+BJ/dOX82vZs1s+6SgJHZNASJMQlFa+ugu+Jt5pKcWJqRRjH7WNc1FUwLTla0LW/
 0WST6cFH00ggZhJxKLsmHGBF3xlT0SmGn0M9OV/MWiKLnGUvF+eKxPzMkxoxNM3O0itt70
 69aZH9Pp4WogQvmDBngwqZKSwgm5EWU81yBbqsQBnB5Avnpab/qLFanpZ6BA+7taWRIIso
 9x1hrGs5w621UDmX9typmKwD67rfNrL7WgN95MEHG9Q5Rgcg28iEl0Vd5EnjuMRptjZ/7U
 OEduSvgUV9GL5JGVq8K0vbkW5tu6Ri1b2rU6RWX8wys8cFWyJAE0VLv0eA12sQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:40 +0200
Subject: [PATCH i-g-t v11 05/49] lib/igt_kms: Add helper to wait for new
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-5-0c5f5346ae60@bootlin.com>
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
index 0edc419dafc2..e6b9cfc61b18 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8418,3 +8418,103 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
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
index 1346aea5a6d5..929ee04880ed 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1296,4 +1296,10 @@ drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_nam
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
2.54.0

