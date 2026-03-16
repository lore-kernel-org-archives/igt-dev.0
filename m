Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EB5F46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EC410E252;
	Mon, 16 Mar 2026 10:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ubGfhJT6";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8740210E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6C3F84E426C1
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 427BF5FC4A;
 Mon, 16 Mar 2026 10:23:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 077A810369977; Mon, 16 Mar 2026 11:23:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zfQ86c0QJ1VqKgS7EVi69tc4GtQhY0CKp1R4zNT4ed0=;
 b=ubGfhJT6M8XDBjdYTHdb0kD5I5gPUT/DQgvlfj8TBpbUqNqDWd+FwzoAVJ/0vYgUsDMavz
 kvs/f2Cp+vbGuTBFupNpD9LbUiUW3MZksZzNaOkCsCkU4Lz6oFxeXum6FU8ec64/bcorJB
 LXmDYNp+AxhUtGCIjVogMAT+uWW5WgEw9Th/pHh+Pi0MyKq6QF+SsqxVGWXFzw9QcLW+hB
 Kv8I3/WnOPj9Bxv/hSmbub22OpwqwNivlDPHQEZDiP69Sy9b3/bM7WQdp8F5sIFcvzZ3rw
 ubX3jb+9TQUzfIYfu6ghU+gCaQDNptXg/AmkZk33XpmRRHuGx5xZ87AlGix9kA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:13 +0100
Subject: [PATCH i-g-t v8 05/49] lib/igt_kms: Add helper to wait for new
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-5-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4277;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PdqVm/6TaQABD5PEWWSY48D4+l+klkTNj53jD/qtCK8=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pO7xizBsI6Ufx9Np2mlu2RIH8iSMay0rmnK
 l84NUXqYFSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaThsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIcnBAAwgGj4xH/iVJ6e22c7n73/7ZJohA8xfm
 32HRStOWsiOFNV5PVWj6rruEZGslt8n0jLjYjkT61gW6Cb3tueUEsVqM1+zey3DfRl8B0JD2tct
 udgmzwbvjszNPTtk6l4+3Q8AzJaM2z2azu+yxoDszJs9XVSQjZISkn/cfxgVtF32KBCNf3QCdap
 9egx0GP8lQ0MsoHa9Vq6pe73DhkjJpbC/AXrcAIK23ynawRgmj2/pzkAdC2wpG3vLJpL7YWs15u
 EICGm/VgJPqHwvIJkUiwz5dLGWwxWlwOMKYhoJqr+zRVL3pJR+t4YV12wXGEU2RGysKPagGg2ml
 pOc5flPSGYYQUWkasApFCBBMuQwsDHxdM06fCDfXBO8f/3nUWOrJRZFmbX8vgaIxk4B1sOsgOUm
 q+rHyYbt0NjwtzhdAgxXerj7m0y/yM77SXyjsFu/S7d53NrW6K16btiE+E/k/zHjCIpCL16qy3l
 hex7n2E1mhvyO+R8WacFTcYUCUHmP79nL5ql6loSPwpRlHiFjA9DRCu6FLItUmBroiBkUiD+MV8
 ha36XbnNvWFSPjUsG6trbQL0lfgHbDtwSnZS4cbh8LmAKOX8nZA8e5i0+64tjecznzVM04K2PqC
 5wYB18Gfnq0yLzr8caMp2+/1msAOJ2wctvpLFJIGxh81A6trn5is=
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
---
 lib/igt_kms.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  6 ++++
 2 files changed, 103 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f0f27ccda9d8..b220de419a70 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8322,3 +8322,100 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
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
+ *                   found connected
+ * @already_connected: Input pointer to array of connectors previously
+ *                     connected
+ * @already_connected_count: Length of @already_connected
+ * @drm_fd: DRM file descriptor
+ *
+ * Returns the number of connectors not in @already_connected and currently
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
+	igt_assert(drm_fd);
+
+	igt_assert_eq(igt_gettime(&start), 0);
+	igt_assert_eq(igt_gettime(&end), 0);
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
index 0095d9610e42..c6aae034b5b9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1308,4 +1308,10 @@ drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_nam
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

