Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16360E7DEF3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E4110E4D2;
	Mon,  2 Feb 2026 14:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BurRcfJ7";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2E410E4D2
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C6A034E423C9;
 Mon,  2 Feb 2026 14:32:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9C85360767;
 Mon,  2 Feb 2026 14:32:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 51D4C119A8888; Mon,  2 Feb 2026 15:32:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Z5GMt4Qr94oR003+ti95oIUkWH0RujK8ygieF+4uEV0=;
 b=BurRcfJ7O+o1THOKS602lNMzAWbIboKZw8U7XthAmMIHYlRmnC4xAyQlAKPQTWI6fx3FXy
 GitJPMnhainkHAXL0kwhvqgbzitVEKF87ip+OhpxLZH80sdDn+4oOvQBg0y76xwjU/Cl1g
 0jztKwc5Ylu0O2N6z2M2zffCv4EVYuR+1ns1oYdDABjXtTYB//rLN+MgYR+TuRw4izOI92
 hEeu3D/nAbx1McFJh8Bk4DzXJdJm7Fd+1kvLgS1rlt9Cmu1H+XGmn20S85ZKln/K5ScHMo
 mZQ/hVvkE9mAHnYfr+sLfESAWOiBwpiQWmii9nulhSPwCUmURH59TEuJD8aDQw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:44 +0100
Subject: [PATCH i-g-t v6 05/48] lib/igt_kms: Add helper to wait for new
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-5-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4282;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vTV5Zdc8Mm3KyR/11zBqwNdqP8O8klL6JxHtppcYIWo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWPbdECR/61tIUB+4SvkUJq+bRmF9p11aITY
 7CGQ8gm56mJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJLWhAAluPS5tIz1pbc7lexWMpYZWS/qvf8h97
 Ks9NqFhAykF3qSJXThWPZ24zyBBw4BPoEHffFmv9ub+c+x85xzJMrIO7utgMzkQ5ntITMDlHHdh
 OW10N2DMah4NjrF2ZeEFhgDA0MbmLWcJs7NL7XBDAUaLlcXHLVwp6Ruma7wnO6SDEdZBFqEvAVD
 eTcWnH8q7UC2+Y9qqwMUndHLtPz8s6+LlHGW6xMBHGINRo4bC37J/mJ2KL+P6ClFm6EVCMazbdS
 KATH3K5/D9wzNJU3vJm3BpXtAnAjSEGdImmQ9R3JliHBgL8DwX0xLiUFUiyJe3EaZYzqgurtjyq
 2rrcaXjx0Ykf8CKE2FostmyRH/Kz1ToQ2xvtaBkaVKF/cAuuliJVO9EanpzYvnY6BXRGOCHcKEr
 9jZW0JKEBHdi3E4KqQrKzJnyz7Ls3r/cOxJxUn5iKuLxx7sUXLpDMxnHg6N6T8MIVRrKk+K1nKO
 /1qN9fvXZcHKErc7JopN6t0cCjvAu3gQORs4e4OMQxus45xKYTv3PlVRx9XRiPdvoDPtCfXCKGS
 nTUaiFFZm8piKMch0FAkm+aa80ETBqx8udPMRGEqARWRGXZq8IkcT9aD+QfsSAe5A6wi/tywPiU
 wb/8kV6Q0q+QnbYeI+Q+Eqt2hsLgqskdCi5f2pMd3L4qfPIxdap0=
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
index 2d39f1cafc2c..6122de8d877f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8229,3 +8229,99 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
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
index 16324e5dfbc8..6843b6ae2e96 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1323,4 +1323,10 @@ drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_nam
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

