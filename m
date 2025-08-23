Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9561DCA0FE8
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB7C10E191;
	Sat, 23 Aug 2025 02:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="sXDMBMxj";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6A210E189
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B7E674E40C20;
 Sat, 23 Aug 2025 02:11:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 91A84606A7;
 Sat, 23 Aug 2025 02:11:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CEC441C22D355; 
 Sat, 23 Aug 2025 04:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DvIXOcAkCDAim3xMXOaR/1SV7OXRO25F+cWo3gPDM5o=;
 b=sXDMBMxjIjbI0+zt2y7unWELJNb0iPSJWd6abn1A27jsgily7XoKrGsz5lf0tf40VbMUTg
 /NHrXCWQGsvfYXp3gnCCF5TkY6C1kH3iuliObkrLl8vcLD6ox5nCluKV9mXCOU1u3CNf9T
 /ukNBCGDxLmKEmSM3CrK3lnSBehotCyuv089px76Rw6vRfEYK/l/lt+ZWZplccCekLJUIX
 fKVtAcME0WnIjGQ4rILUd+FsOvoesdwEL2Z38IxJVzSZwY+UxFUUeYzCtMRYwDUDpQHf9s
 igOhs8J4CUAFjselaVOQY6+eDPivdnOjfyxg1K4D261UrfwqnsCGjiGKQ977zA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:25 +0200
Subject: [PATCH i-g-t v3 05/29] lib/igt_kms: Add helper to wait for new
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-5-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4186;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=njDQNPnUHOLJBi18VFi1qVaM0eyrknqPnnc7f8TE3AA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNTnwHfK9dLyiwXvIa7Xvm+ZYpe1y3vvDCut
 w1tTpyBUUiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjUwAKCRAgrS7GWxAs
 4jXtD/0TuMCMpoheLKZXV0TzlCcRRBvUuG2RNEpa8JwSadJTs67sS3jDkj3yhxjRmS/UY0r5luy
 b/MBuFCXsDYr1tLarKo0Fx8BW2Q948vYFWXdvJquEfhu1P1z9uQ3uWI2p28HMboKsZoI9iIs90P
 ZQmkoB1P8Pr177ru6SBaHIop8i1vo9y5BIkl9GcmMFPpXEp50QOco3xlCt+AdUiRzXjapXr51ZC
 +wUT8yQ3hJdMK0QlpJCGFIuqi2/DH8s6dHixFXY+ga0I70Lq3xMVKNaG/ikNF3QBs0HjYHCVLMT
 KqS57X9A8e2Rcg7WEouhrulhGLHni4g6SdiVMGyUPeJqkp6Wo/fORK9VXUEjhXM4AGi99INwzOL
 StVnHf2WV4PW1QfZtatntUSyVARkLYiX5GpzGn8JToNtoNd3/FeeawTn16JjBv9F5CbDPdW5RNT
 VaiJ87k0XrsXYecMbjG9S/19AvdVFm1rD6lCWgYRZ03OEt1OjclKVoJUVKj1zXN7lXEgfKXcywB
 iCPBFMi2dl69OZXvdSQn6u5xp8Dj+e79iVaPCaHYDwEEqUX8svGX01Dgb0LS5BNW636wLM7IDdW
 ji0jBMXjSIanwXWvxeCRJRXtgF3lL13HBBdnei5gm53rWOyLSpveHLicvRJKC03wJEoEstZKPCA
 PORoQ2oB7irtMtQ==
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
---
 lib/igt_kms.c | 93 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  6 ++++
 2 files changed, 99 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f560fa5d540c5d610fe59a89001f3373d0a6ae47..843924e79eae1e21542b0dd916bd92627f7a8473 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7785,3 +7785,96 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
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
+ * get_list_diff() - Compute and return the difference between two lists
+ *
+ * @list_a: Pointer to the first list to compare
+ * @list_a_len: Length of the first list
+ * @list_b: Pointer to the second list to compare
+ * @list_b_len: Length of the second list
+ * @diff: Out pointer for the difference. Can be null to only count new elements.
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
+ * @list_a: Pointer to the first list to compare
+ * @list_a_len: Length of the first list
+ * @list_b: Pointer to the second list to compare
+ * @list_b_len: Length of the second list
+ * @diff: Out pointer for the difference. Can be null.
+ *
+ * Returns the number of element which differ between the two lists.
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
index 1d89061d80f07d11e5fb8d91265b8c38b27a0c2c..94e9b4dec45603b26568c82cfa253c30e403b90c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1306,4 +1306,10 @@ drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_nam
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
2.50.1

