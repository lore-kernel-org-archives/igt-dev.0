Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A49F4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C9210E263;
	Mon, 16 Mar 2026 10:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RrhHVbfv";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2382410E258
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 757D2C40411;
 Mon, 16 Mar 2026 10:24:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ED81C5FC4A;
 Mon, 16 Mar 2026 10:24:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E98EB10369F43; Mon, 16 Mar 2026 11:23:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1QiW7MgRMXpHtA86djJ0E1B63shTyf66U5vShvvwSCU=;
 b=RrhHVbfvILsiR3aq+jlOeOBXfJMz0n5V7OaTf6PIX9tXuJUntM6DH9sjBg4PNDqysJji/6
 9mkS2joDK5GW4cKGmxU/gvCH9GnD+tyP7xYHHBqY5/7EOiYmXy8mQsujYUZHMQc7/oKwU2
 OW2G74NxFH0iQF82PvvLPbG26dP0r9OpbWKUB5jzlSQW8778d/T6FVB++l9NN6oEo6kEw6
 xBpZzITedZt1N6XeauVdI16HoK0yP72A6AT6YGJcrWYgoLQLhwtPVmrECyIFshcjgOn72c
 ouM8qSFmHH7iKm82OKu6c+a+g49inCP66OEN/8gApUT5udiIyecx01CQ6srWow==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:24 +0100
Subject: [PATCH i-g-t v8 16/49] lib/monitor_edids: Add helper to get an
 EDID by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-16-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FhZgqL+h2FrdX1v4H70Wr6eZwvAN9ozyYPrAdOFd580=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pQ6DFbUrIDs/K/EzFEN0+1vdFdiIjwB6NTu
 ZGSS0GQWu6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJ1fw//fRfHW3vwA2c5IGzOFIGzWCd0Fn7g9II
 aeOb/ulE/2C96Ex9vcIL/q0eR6lV/mHpXPafgbk94IMEXr+onXJxCWyFYjIvtq3iQj0WZWLlDaQ
 HaM1lwzox1NpsibxiOZXL2B+r2M9u4QwYn4VASpiqT/SLKGB/ePAUYyrh6OXnQqKCir0T8Y42Xg
 LS8OLKQho1mCcr7FGXvSJcuyat94e8hJvnm7u6PlYGRh+/nEMW/oV2wg32GExm7MEq/I5u37i92
 U9Z7znEGarVtmAZnwbkYk0p6NM5+aBA471VCK8LCcACYAVVE2KpaUbuMEpFVTni+Dg1kxVwV1hi
 C+ZmfxqcQlO9NxNHpEA40kSGPknAkO8shicX+FuLQZSia4LLjnaxhcywfSdrhcC/e4tncRzcgxw
 hTvseL4x3NMwTstQhpWT8o0PtBzztQ2ZmYS2vjSH8vO/nR0Z6stY/TUwq3cL647b0XZuSs71Grp
 asDW3z8yZcMFHx9+yz4ZA9JTB8UY1VgResbMrNE2C4xlJiF4JmvA18DvdedzWPob32DpelMCZyk
 VLXVNccVXibYp73KwZqAz85OZxBpEtWJXe/WeLN+XBGlnO4wASs2OdtQfGoaSUr5S3+I22FZh0u
 DsQO8sUwE+uCg/SvQWp6LLdlQW5OdjRwQlAfVgcl67uWzP2QgvTM=
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

For testing specific EDID, it is useful to be able to retrieve an EDID by
a verbose name.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/monitor_edids_helper.c | 30 ++++++++++++++++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 6043e7a084b3..34446066346e 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -20,6 +20,16 @@
 #include "drmtest.h"
 #include "hdmi_edids.h"
 
+struct {
+	struct monitor_edid *edid_list;
+	int list_size;
+} ALL_EDIDS[] = {
+	{DP_EDIDS_NON_4K,	DP_EDIDS_NON_4K_COUNT},
+	{DP_EDIDS_4K,		DP_EDIDS_4K_COUNT},
+	{HDMI_EDIDS_NON_4K,	HDMI_EDIDS_NON_4K_COUNT},
+	{HDMI_EDIDS_4K,		HDMI_EDIDS_4K_COUNT},
+};
+
 static uint8_t convert_hex_char_to_byte(char c)
 {
 	if (c >= '0' && c <= '9')
@@ -170,3 +180,23 @@ struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count,
 		}
 	}
 }
+
+/**
+ * get_edid_by_name:
+ * @name: Name to search in available EDIDs
+ *
+ * Return the struct edid associated with a specific name. As with edid_from_monitor_edid, the
+ * caller must ensure to free the EDID after use. If no EDID with the exact name is found, returns
+ * NULL.
+ */
+struct edid *get_edid_by_name(const char *name)
+{
+	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
+		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
+			if (strncmp(ALL_EDIDS[i].edid_list[j].name, name, EDID_NAME_MAX_LEN) == 0)
+				return edid_from_monitor_edid(&ALL_EDIDS[i].edid_list[j]);
+		}
+	}
+
+	return NULL;
+}
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index e5069868683d..6d9e3fc89592 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 
 struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
 struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
+struct edid *get_edid_by_name(const char *name);
 
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */

-- 
2.52.0

