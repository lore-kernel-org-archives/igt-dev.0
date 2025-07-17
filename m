Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEE4C83F3E
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE21910E890;
	Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hzyMykaK";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEAD10E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39F7F442BA;
 Thu, 17 Jul 2025 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tHCH1UsBusSYy8LeOF7wQNX1vFqdZxIE4t/sRt1YjNw=;
 b=hzyMykaKxIh7vxh4AU2OjtVXDns5AE7Zr+lWd//ie6yh5BsmEEe4GltoDAAhZzK9vzQWeV
 6IwbZafRg6V0vJAjRA8s1XJwx41p5tLAJ/V3pKW/R5gOoqm9jG9h/biDJ21Uc01Pe/0gm8
 62t4hA4v+H56sSFKy5K8wXBgZfGD59oKJfhaouAjH1AQ6aAHlH8AfSasQxjIbglx3A961h
 3npgngZAVBuUSREZe9ZSRb+6dNhM90h8X545UZKUX63uvG0f+zzjIyGTTXwJVBTHxxtB0R
 l3k53S4vmFXhyeMXNE03pnsgvjsNwXehnYrUF0yUVBFb0x3Khr/at80hwftzXg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:25 +0200
Subject: [PATCH i-g-t v2 05/26] lib/igt_kms: Add helper to wait for new
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-5-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4138;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XanAdjVLDW9K3YCKWfu+EoO4xfX3Ho9l0+aof6VB2mc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUINBYbFJxmGRo2p/OgKNE8yvufHrCJXIu6h
 AE3tp6DWCaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFCAAKCRAgrS7GWxAs
 4rLZEACTv8cFfttjOY30ipsUZmJHVQW15GKNV9EWoAv+K64KduobIARlMwaZR6kpt5sPXsSK1tC
 PQK6iYfM0nBZaqhIrDj2IWDsk1bSC0c8z5H4KFeiyoL+qE7b3GTksRRGDTY60Cy+J8e4g0CIgfW
 3u85VADlOOfOiznj4pECmLZuMADTFm62XGpZtTVqx/3c74YVpM028ajBxKX0pOU4/vXMdXilURL
 FNcCU4VYyjGYzgWQcohE8acy/ERfZufDG0b1Qj0ol7Y5yHXiSNHRKrV89gkmhDIW9R7K1ERX3P+
 NxZvIYgrl5CZ17EoX+Qpfh3QdoTZ3MmgVP8OSVFP9H8XTjOhf5sVZDkMLbxe7jeMh48e05T8EKe
 KIPU8xEu1+BqVleddVQ/4A15GL+VxrSB6F173BXjx2pOlQtp35OCZ6i0vbHbchFEk6rwLG83C4c
 NuhR06z/paQbc5Cbl2zD+HjQj2Tg4dbCF+/eBNklWm+GYhWQlr5HS+ccU6LgnaGYfvNgkPkjeGu
 vPVDLEQtfa5yzikvQtkoaga68PdcRHhjZXkksHER1awBgnlQGxJg95cho32TrgzPSRoKih2dkU6
 l5aDSyZl89UeT7QNhli5ZANTfKUm/MuZk0JRC5SlKhWHY3Bl2faWTe5KQmfXwDHnBDFmOb9wOlN
 BREf3CtWgue8YTQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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
---
 lib/igt_kms.c | 93 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  6 ++++
 2 files changed, 99 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 27326eec49047bc521eadf39b9f25671ff1e9e26..c79f9b946ca84c7c374ca514c05def2c34f81383 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7722,3 +7722,96 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
 
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
+	igt_assert((list == NULL && list_len == 0) || list);
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
+	igt_assert((list_a == NULL && list_a_len == 0) || list_a);
+	igt_assert((list_b == NULL && list_b_len == 0) || list_b);
+
+	if (diff)
+		*diff = malloc(0);
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
+					const uint32_t *already_connected,
+					int already_connected_count, int drm_fd)
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
index 8939ed84bd016ab03b6f165621b62664039bca9e..2149dbbb85f44edeb2c7da2baf2d57cb2d890554 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1298,4 +1298,10 @@ drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_nam
 uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
 uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
 
+int kms_wait_for_new_connectors(uint32_t **newly_connected,
+					const uint32_t *already_connected,
+					int already_connected_count, int drm_fd);
+int
+get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
+	      uint32_t **diff);
 #endif /* __IGT_KMS_H__ */

-- 
2.50.0

