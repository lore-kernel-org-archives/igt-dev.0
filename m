Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEAACD13D8
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B6B10E3C1;
	Mon, 10 Nov 2025 13:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Vw0XksZz";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497F810E3BB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3DC7D1A19A8
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 032EE606F5;
 Mon, 10 Nov 2025 13:39:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D343B103718FC; Mon, 10 Nov 2025 14:39:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0OWaRd9ACWBF0p9Bnef2xVA/ZsbBXGHJu7nIkjrjKN0=;
 b=Vw0XksZztL/FYDwbeMS9OUnkLelf4OQ7X3tCsC+PxZIkTsQjdS6d5HCYS7y4apVtGc9yxb
 wviQ1W5o/ULgoCGCmwztYZ7RuwyzY3lFScjqU/B0zs1fLHPTwvPlXOCHb02BgZ4IfggYeA
 h5oIr60gTComxIwI3ke7rO9BtqtnCmEsNqbFhR7awmcJxuM/jLbrI2e8I24rEjOwK18gsz
 xNBC1szk2hkHkN6vvz1Semn00ppdTbaq2Rm422LMOgKAH6jmqC8JL5FuA5v8kAbtX/zMJG
 +gAFfDQTN946hFfCgLjHjh0dpvSissX/rgSBMPQooh+TzgDM8sBvxLGCUz3Lgg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:07 +0000
Subject: [PATCH i-g-t v4 05/46] lib/igt_kms: Add helper to wait for new
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-5-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4074;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=YFQ39JH6gr7hx27aCrmtnKSdEk+4To+FrQmx192QZZE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesMDBlCNN4G28BrObvPtiSkUTW9yMWoFTkjM
 PRhYsFWshuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDAAKCRAgrS7GWxAs
 4qUjD/9feHUK2uKbEDcDTTiw5r4s4tXByOUbCRbPmrXIiiJx2QFG0D4Hnl5lUUyWfgyltXqSM3n
 gOHpMVk75qbD9Fvz1CmORlmQ17y8Eg2d7LTrqefWAg5Lr73rQ/+SqCPwYOlEmBKF0YWjtMnpFh8
 bBDf8MlyrXJpv4PnTzTMRK/0f6LDzMdcm8XXGknFiy2w25sJLiF3rvvoGGZpadkxgOLTqTeCplS
 92BgC8hp+5bVAvKseuhYl8hMEmbgMSQdluLiOyWTRqAXIe7BPjykCNQwx70xZf858FfyObok9a+
 zXp7t6zJ9kzWUb5Q+wRDY6+b9nr7fHECYJDRPHS15pLVeCmkK0fKhbqN2MwytJ9qy7hdCR2ivPz
 2aUbWPhSr/GkzNcPn3RrN5FZfvopXB6AxkTpNATrl8RMAh9DOvNrJke66acN0AkAa92n76vDtid
 e6JbPhPlY7HSmuVt+wC2oFNt/pIwhz9NIry+1Mr6/0O80tFfX5aDTXnrmMysU6X694fEHAXu3+i
 BpaMw38OesEwAjRbcLtSwQcXHpR0TBtKY8P4vP28+m5cUNvL6Gy/tNUbXFeKPrjX/a5sHlR4ZEG
 uZr1LNs5Z9Uqld6KghMvzUWRD+AKH6IMLKDh1YMPC+YkarQd7uK7JG2g2GFCRaYk/TR6wFprigk
 lsmNrE3P2bi7QEQ==
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
index 6f2a8abbaf7d..c77c94d7c437 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7833,3 +7833,96 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
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
index 9b8095376f98..7b1d01efebf2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1309,4 +1309,10 @@ drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_nam
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
2.51.0

