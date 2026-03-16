Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5905EF53D70
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF6010E29A;
	Mon, 16 Mar 2026 16:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zPT3L/lf";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF26610E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 69E18C55045
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C58475FC4A;
 Mon, 16 Mar 2026 16:23:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D202710372217; Mon, 16 Mar 2026 17:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678203; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1QiW7MgRMXpHtA86djJ0E1B63shTyf66U5vShvvwSCU=;
 b=zPT3L/lf8FoYec7pbhkJESdXqHThNLA+axZo8nU2gIr10L7omTi56pQ5OQj9u81Lo0CGu6
 55f4Ff0GVNA7aR1onlQCsO1iJ+X+e/vo5tYZZ0q+jaL/FW5XZQ04k6v8tUwlALrmmCHVXt
 rVVHDZ2AhTn7Bigf8c3fq4WV5jcXP1Tqb59OvoX1S3lEbcIOvIgnOtOojZS6KAatusUWrA
 g99EKj2dQeaYBoBnS4nA3dLLQ3NmzqUY6o1EzT0UbJSE8ASkPoGeNzQx2tBc3tlgh8yQ8+
 HBolQM4UaLagY4N2vOu30fip8e1kdtVcIhwti67mQ++k4xcHxH2ylHPJ8Xc8SQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:37 +0100
Subject: [PATCH i-g-t v9 16/49] lib/monitor_edids: Add helper to get an
 EDID by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-16-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FhZgqL+h2FrdX1v4H70Wr6eZwvAN9ozyYPrAdOFd580=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6LLlOkELOOgCUk0pinF9omM9Z05u2BSPF+d
 jl6TWKZKnyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguixsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJ2Pg/9Fj9fu3e2/5Mql2eTK/SZgFMQ3YQYNLl
 7vyqKYrVc0pzwYh2+Z6G5zxnSKxjEFLsEHSbHsM0l0GH3QPFjCz3rtCV5dsZBBarAZ+Mtg2RF0L
 HT0k5QVvNWKgcDzhGSwBavzeF1+9pYgHYBf72E/QlVSJb3txqCgWA12ctHRlwJp/vSQfFMNxf7/
 JtIidvMUYMA/ReW2n9aVkwDSKyfMdwVUWCT9KwrdMM5UOQwN0Xd7sEIxIVTIjtA44BvMS0q1v82
 lOqR2lgnE4GNrDs6pcmtsVEIYW+4Jhq+xQsRyPTYSDnOtklO+B6aqJrzrM0amUi+BnQlq3xTuGx
 G4Vb8XeWZLh1HfR5vdPpXJEW6bItQHOl4Dj5qfkniHgsF3szcdx6/sczBn0OBVNgWrI1GyT0p7V
 CGv18NgZ4vBM4pycDwyreYkf0vgSEoEkjira3Qc4JGNlJUw8cODJk7SRzvMbBtmesY3P3yy4C4D
 dVWuay3tZoOfoU/WVyMlQlLWp3k2/za/1xG6XaMTzj9jxbIMff7CqYjWjg4/mJJuQVEIWi/hgJ3
 MOv98BU62hPi6pd0USh0ZiFOsBdJUFTuUGklZuzoNi6QwwelEykQT/yh6pqkovk2vzX0a8fzGFy
 yhQMpnh4mRvswY9yHRE3wXpNdlZ02Z0lUeJc/mHW3KqbbEsBFvg0=
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

