Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3325CA0EFC
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7022510E187;
	Sat, 23 Aug 2025 02:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pYQdwgnm";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAFC10E189
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 14905C8EC78;
 Sat, 23 Aug 2025 02:11:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EF87C606A7;
 Sat, 23 Aug 2025 02:12:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4788E1C22C887; 
 Sat, 23 Aug 2025 04:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YUAQyAmAZNo60fLvGE05nVuBgavjTgZRnwM04FC/XLc=;
 b=pYQdwgnmDpXbdLyDZs0yVs3jV6YSvOw7CB8LykLrPECc7nwrNlMiWxIxFiWil71oP6G3r5
 ndLCjlp19pUC4P9ZO5hNcdQy0df6mbVxjGJs58ylXOXgPXk9yuzxhQ/D4KMl8jFLtBRwHI
 8CS3rrHzmM1reV77oI6M6ekkmxHy5XyhuPjypU1imOLRJvYmrYvc2gSP4nahIdGT9QXIXf
 rcBqSVByRmKq6syGGiITJ/K87Gs06GUBHK+XbeFGfnOAX0kCMYsuX3Z9LRMdwUG2dyUTxL
 E1uvzOAmbHYT/EKW9PuuHXcDvTO7p0iNMPv7BtOS02jHfSP95gBioX/J49IWfA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:42 +0200
Subject: [PATCH i-g-t v3 22/29] lib/unigraf: Add connector autodetection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-22-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3283;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=6yZgujdtVaZqxUNgwsjV9oWYBxRcCUHaiM6gvPw9beI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNXKsGWTODFUbnMCCIzUvn2jR1So63zcPJrt
 Wmyyrm1h0CJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVwAKCRAgrS7GWxAs
 4piQEADHo1kn6t64L43/gGSIWskJU28UIAEsVAYwp+K1pvBF5Ajg9QPSTesQvm7K5yd5QZTbFl+
 SX6JP+Tm26cl4fcF+d89sh2GH4tQZoHUEwwNVt4XYesLyihulIyVFe2WssSghuuvft8OQgKzRBj
 gfGtqw7GzUWjcefHEm5w10AVKLqnSo+miE40MZ5GXTpVLcCx2iM33Tr1LS4W12LdGuKsxaKX6Iq
 d4OsDSYcrTqtB7TsNiZZxx4TFx+ClhX3l7gQSqmhJMUXkp6IUfi3yAfkGqCAmhf0022xGqlc3QA
 dvjJxfQZ90hiC5AwElt8TwGKpovFfzpn7nswH2+PklWZ/rYMYth1aVd+lSccNp7dkcjDwToVSCd
 QaTunMdGTTwvM78kz4Xzvpj2k6z4azsUAuk/DOvvOSQIyE4G/s5fNUnTvAS7uarYANI8ZipJs42
 W6OHCzOXM1Hi4aZnaCXBTjvAZs1mUr+yAlT+n55iYVUTSI5k3a2lno55k8IHfr8Q1IL/35v/eG1
 3omkMQbPw/VZ7+3wYGfHv3DQSQxb5O0KFfdHYRU3MzW/exIdV4RBMlqRaJW/qJcVPOr52E1U4QB
 ozES2AFZA8dxHiqUqewZV9wqOqhKUPrz0QBRaJ+seE05WDqmrmzc7suTR+xA/h/E2gSnVGLaoer
 ycIMnkCOJ9v7GiA==
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

In order to avoid writing custom configuration for each DUT, add a simple
autodetection algorithm.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 41c1015aa942ccaf9c93890656d403997b19e661..b90025425d232bd5269adfe9f17f2813eac7754d 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -176,8 +176,58 @@ static int unigraf_find_input(const char *request)
 	return chosen_input;
 }
 
+static void unigraf_autodetect_connector(int drm_fd)
+{
+	int newly_connected_count, already_connected_count, diff_len;
+	uint32_t *newly_connected = NULL, *already_connected = NULL;
+	drmModeConnectorPtr connector;
+	uint32_t *diff = NULL;
+
+	igt_assert(drm_fd);
+	unigraf_set_sst();
+	unigraf_hpd_deassert();
+
+	/*
+	 * Hard sleep is required here as we don't know how long it will take for the device under
+	 * test to properly detect the port disconnection.
+	 */
+	sleep(igt_default_display_detect_timeout());
+
+	already_connected_count = igt_get_connected_connectors(drm_fd, &already_connected);
+
+	unigraf_hpd_assert();
+
+	newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
+							    already_connected,
+							    already_connected_count,
+							    drm_fd);
+
+	diff_len = get_list_diff(newly_connected, newly_connected_count,
+				 already_connected, already_connected_count, &diff);
+
+	if (diff_len == 0) {
+		unigraf_debug("No newly connected connector, assuming that the unigraf is not connected.\n");
+	} else if (diff_len > 1) {
+		unigraf_debug("More than one new connectors connected, this is not supported by autodetection.\n");
+	} else {
+		unigraf_debug("Found one connector (%d) connected to the Unigraf\n", diff[0]);
+		connector = drmModeGetConnector(drm_fd, diff[0]);
+		igt_assert(connector);
+		igt_assert(asprintf(&unigraf_connector_name, "%s-%u",
+				    kmstest_connector_type_str(connector->connector_type),
+				    connector->connector_type_id) != -1);
+		drmModeFreeConnector(connector);
+	}
+
+	free(already_connected);
+	free(newly_connected);
+	free(diff);
+}
+
 drmModeConnectorPtr unigraf_get_connector(int drm_fd)
 {
+	if (!unigraf_connector_name)
+		unigraf_autodetect_connector(drm_fd);
 	return igt_get_connector_from_name(drm_fd, unigraf_connector_name);
 }
 
@@ -197,7 +247,7 @@ bool unigraf_open_device(int drm_fd)
 	assert(igt_can_fail());
 
 	if (unigraf_device)
-		return true;
+		return unigraf_connector_name != NULL;
 
 	unigraf_init();
 
@@ -316,7 +366,19 @@ bool unigraf_open_device(int drm_fd)
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 
-	return true;
+	if (!unigraf_connector_name) {
+		unigraf_hpd_deassert();
+		unigraf_set_sst();
+		unigraf_hpd_assert();
+		sleep(1);
+		unigraf_autodetect_connector(drm_fd);
+	}
+
+	unigraf_hpd_deassert();
+	unigraf_set_sst();
+	unigraf_hpd_assert();
+	sleep(1);
+	return unigraf_connector_name != NULL;
 }
 
 void unigraf_require_device(int drm_fd)

-- 
2.50.1

