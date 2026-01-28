Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25D7D25B5B
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6967510E6DD;
	Wed, 28 Jan 2026 13:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="S8ogKPJf";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9116B10E6D2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D69D3C211E8;
 Wed, 28 Jan 2026 13:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 58FE96071F;
 Wed, 28 Jan 2026 13:14:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 696D9119A8801; Wed, 28 Jan 2026 14:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606073; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fNNPoLAkJzJtfjQbuFRcr8GaKvv8kBy+BjXqXPZ/LpA=;
 b=S8ogKPJfbgMGl9gfmjPhL3MDuv7QabHyCuAxiV/tJeltBnQPrOVQrdX6lRiTM6Ibs1jZ8E
 r9E8eJG0eYDuQbc2UlA6N2zzxFa9JQA0FIvl1rrd8DpED7WNsmYvDkmYqF3lBCYWkmF7Kj
 5xa4RyydEAcizz3h4ibcxBu2VlHlegMRtSt6LN7AX5PaP8rWag3qe2T1cFDjTcVJ7xPzBc
 z/GE3J6a98icf+hDy78vwtXj4fsu8xuGvNL1iTP7pN9Gp6MwBxHhXlSmSH54imhQwdiKZB
 qkscNThxwvljvuy2FrL6LGNId22c+hHGJixzA1A8l8LGkhJpkgCc+3k7kC7okg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:36 +0100
Subject: [PATCH i-g-t v5 05/48] lib/igt_kms: Add helper to wait for new
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-5-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4282;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jJ5bczVNluBBvEzcpyIZ85Q8bMfuy2ztUG0I/jydTtw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvHuw8yZjB3csWSO/7J5Ipg1668T4vlbVEAc
 fNHZJpfRKWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLxxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJ3vQ//QNFGQkdfk/wper91PUPWFxX/39GKDlW
 YTKLodXLo+BpsW2DpKJN3APXnnwBYyxahgMJXvEckPR9yzTgXkPbGVRY/WP5v4uOK3QvoaHLgik
 xjgqIp/8bSRR3zv3GxI7DqPcRo9k0EETi/dU8HOmYdcZwk024MgvVggBuHCJOw+eD80OkF+0tGX
 ymHLRANOUzlri8E3BPlu+FTOHt8w1odyEf6BXpwywRVF94iaDoqtx1mjdt7xe0WLC932khMnFMy
 F7trTUgUw2vGH0l8FwU/sDHWPavc53lOR/MeXSOCQesgRB+l+3edSrfYDnViZ4l4eSHMelJhYHt
 P8MbxqOMBYe4n9e12cI5yuYvmX3PxpjmEUe5UXzbM6XvEWequS9E1oBoHQcIieOlqbx5GwLrIXM
 fFX2KAEj1khQiZXkA2OegG+qw+weNwqFG1xif1tW+0/EBUeAGaS9DMIMeAYxVS6tzFJGtPHhoak
 fSSfm54mi/0BH7fpwJJdE6Mfub/XGVMYzQaD+bS+HsD8UCGwRFTz2LSIlShjyVdIbj7zmKf1nOp
 jxqRVJe3RWi4+Sq49ERH9u5aYOKtp3XcXSbIYJGvA9Etab74inDtBGECYfwE2ik92d18VdecLT9
 wlR2KouPyTDg5eFB1Go+v018LIrIahdt8hWK2vL0u2MEQzmwJze4=
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
index 93a24719f12e..0574e4614e8a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8237,3 +8237,99 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
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
index 5dc3d8555ce3..b78c83856351 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1319,4 +1319,10 @@ drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_nam
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

