Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AD0EA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB09D10E37F;
	Mon, 23 Feb 2026 12:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ibbf5Ja7";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA2010E37F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 60DB34E41031
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 17A6E5FD43;
 Mon, 23 Feb 2026 12:08:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D395F10368F70; Mon, 23 Feb 2026 13:08:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NkV875OxL1a+qnE9rXMFiXqRFxf09UFq7tpii5oGkEU=;
 b=Ibbf5Ja7pVfZ6psO7z2qm1NFthH9YhGJ0y9FZ97dH7A2UJ0d7qlMluV7xkJ012jlqKv1k+
 3SKwZauX/qNKgHy3iHCjU5OP1lYdwVHsk5XAujbFcFd7WzBgdEt8ooDb1/tjU2wEgmJqwF
 A4vGJLoBWomjQFTm82VgCXypStiNnUjKD/XpDMQv3aYurWjCg0I6NN82xP9jDWdAygprhG
 40fbkj41Lzp/kUR73C6vaTdR8ENdyXXPX+EJGtp4wWPkfQi4Msxm6XWP8dOGQ+dZ66TSZL
 vr2Svf11qXCFUepv8wEWhLxjHetg9jAwZYnA+SQmxp/pkZfPCf9hS9mNwEA/Uw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:12 +0100
Subject: [PATCH i-g-t v7 05/48] lib/igt_kms: Add helper to wait for new
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-5-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4282;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BpT71lYWMoU074Dru+nJMpd/Z5wc9Sz6i2MsxVxSmDk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENnc723pqjCCkmpQA89Ped/52Xn/xPo3rXey
 MES9LYgOx+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDZxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLXCQ//cVm8d3DvOzsIaPgbEr1g9hn2u6gdl7o
 ke5rb05F0xTXuSCz0YoPtS9BYVTWQkGEK1dz+pphKxDYtpNVKS/eqkYJVwDtIpTk2LZkJNXse/1
 XL2Z2I6WscS6AWq1GKCMedLm+UeYn0knXlf5xkVpbnJsaO6v3XIin110a/erqmkWTuihONwmOi+
 ieD7Ww/+bTUzRb1juSm1LYaXQc7kJVFRQCiz91F3keCWuJ+527g7xwU3m0ii96xu4h1V+Owm+qS
 74TfIbFNo/fJ2bsLqmdejltmiDjhzdv52owpnLrlbhMGebHHY0c5gl6gQRFTx8PxWmZNOejcjYm
 QBXlxCZ11CABsZ6U7Re1KGkzY0T+0Dkw5L4OEUHryM7vVGNEaSc4PuQsFrIuW7rSs1uA4aYSZNp
 vFoslzzPKJkPO5t8TnDH6Dwr4KC6sVl1gobCXYcYhaCpXVW3iiLFCwY8SL/TkGOPz5KbCTBVy0r
 tgBH6WDir70wlBR3jApSof7ru0NiawTYOWzcm0zUDhd3IhPbjGn2uWnQbmHyqOTjdR6+1lyuzgQ
 4wkcIt3YNkOlRBM1Qp/WCEsjCMRBXdGR+yqBpvO2RUt9J+x5YCOApDWWuy1yrKmQjqiHPcq5DgO
 7IvvWCaQ2Z2C0L3yE6E/Qrb7pOASVFHeOjBZuC9jjwlsycPMgHOk=
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
 lib/igt_kms.c | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  6 ++++
 2 files changed, 102 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8876ee8a11f7..514d905fe1fe 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8170,3 +8170,99 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
 	return 0;
 }
+
+/**
+ * list_contains() - Search an element in the list
+ *
+ * @list: Pointer to the list to search into
+ * @list_len: Length of the list
+ * @value: Value to search in the list
+ *
+ * Returns true if @list contains @value
+ */
+static bool list_contains(const uint32_t *list, int list_len, uint32_t value)
+{
+	igt_assert((!list && list_len == 0) || list);
+	for (int i = 0; i < list_len; i++) {
+		if (list[i] == value)
+			return true;
+	}
+	return false;
+}
+
+/**
+ * get_list_diff() - Compute and return the set difference between two lists
+ *
+ * @list_a: Pointer to the first list to compare
+ * @list_a_len: Length of the first list
+ * @list_b: Pointer to the second list to compare
+ * @list_b_len: Length of the second list
+ * @diff: Out pointer returning a list of items in list_a but not
+ *        in list_b. Can be NULL to only count the elements.
+ *
+ * Returns the number of element which are in @list_a but not in @list_b.
+ */
+int
+get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
+	      uint32_t **diff)
+{
+	int diff_len = 0;
+
+	igt_assert((!list_a && list_a_len == 0) || list_a);
+	igt_assert((!list_b && list_b_len == 0) || list_b);
+
+	if (diff)
+		*diff = malloc(sizeof(**diff));
+
+	for (int i = 0; i < list_a_len; i++) {
+		if (!list_contains(list_b, list_b_len, list_a[i])) {
+			if (diff) {
+				*diff = reallocarray(*diff, diff_len + 1, sizeof(**diff));
+				igt_assert(*diff);
+				(*diff)[diff_len] = list_a[i];
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
+ * @newly_connected: Out pointer returning the list of connectors currently
+ *                   found connected
+ * @already_connected: Input pointer to list of connectors previously
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
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	clock_gettime(CLOCK_MONOTONIC, &end);
+	do {
+		if (*newly_connected)
+			free(*newly_connected);
+		newly_connected_count = igt_get_connected_connectors(drm_fd, newly_connected);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	} while (get_list_diff(*newly_connected, newly_connected_count,
+			       already_connected, already_connected_count,
+			       NULL) == 0 &&
+		 igt_time_elapsed(&start, &end) <= igt_default_display_detect_timeout());
+
+	return newly_connected_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 52b62252683b..a0b36efd8ebb 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1326,4 +1326,10 @@ drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_nam
 uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
+int kms_wait_for_new_connectors(uint32_t **newly_connected,
+				const uint32_t *already_connected,
+				int already_connected_count, int drm_fd);
+int
+get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
+	      uint32_t **diff);
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

