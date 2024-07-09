Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FA1C3DA47
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70E710E5B8;
	Tue,  9 Jul 2024 15:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FD70XPt0";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D5D10E5C7
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75A7420008;
 Tue,  9 Jul 2024 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kA1rxzs6MGaNOIaZ/FyCFn66cqeGfFosracnRhxK+gg=;
 b=FD70XPt0XlCf3ugk/6t+B+0EV1zZ/oV3tSoklPQqZrF2QP5SQ+CAnXgK6vLmn9BX7vgiXl
 TbSNFci8BaQfJigm/PMiNlgHYfAawK2OvY4BD8yBUGTg9xGZNguRfqjz9oHvdbHydoQcgo
 GuSUZc1OIiY7f8DdGneWZ8nNGSBuct+1pIyAUvjVVBl45z2U9R9FieThe13ODFsm2rlopk
 qmQb0F5QZTFZrA1O7N8po3P0YrJ4KQQbxKhjPZGIP8MPZptyDxubIH5jeRHNmLE7U9YEWa
 T+yA7khbeadJzwHGnb5t9NXYhohlXdzVaLwLsmi6ym0gsTkTgslyB0C6lpgqkQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:46 +0200
Subject: [PATCH i-g-t v2 30/39] lib/chamelium/v3: Add save option to avoid
 doing autodetection every time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-30-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=A2Xpukjm+B27/BIfICljSnw2613LMq8gvEILdkZ6AkA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViZWQseve+Ovp/LsrDTWlFBGNcAKNq1A0+11
 Z18bDNBLMaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmQAKCRAgrS7GWxAs
 4qXgEACf19l/tJDY+8ca0ioFTVYjyDXFwbc3TfX/ziYNl2W5c56zq18HPKOZwhaEy9LCIHj/E+6
 oZtwdYH1zIa3HLWvE3uGJko6u+3zar6BSdTiycLBdFudPoa69j9seLAnZaeeaZanX1G0GYGZPXQ
 E5hiRVj4kMEM7jEDBYm/cj+J0oeMkiWRKLloWidr+BQR/xT4Gu0yXLo/XLzZDZeVSeFa4M9LKTX
 egg3BnCOIY3kQwbb1jlugPjd1ZI3jaNg2trT3WfoFyms/VD3+5zibC6qaulgKe5NHN9N/5Iwdiu
 a623q/I8k+HV7grEwqRpOOYJX4nIfQa+UwyOsQbIV2qtBcDEF/ndLpv3EIkJoW6WsmQ0p6dmfrN
 7sJN6PTF3lSQudJ5/zrn0lhP9fJXFFyYqbVzI0XLV0KfpqdragPMUKsKbF8qMF9J4pBJ9XSkU3n
 iDYaopeP2r+eJolRFe/3Kz0WFYdZjoxDE76id+CFLPRIYlGwd8D+SiSRMOnhQxlZmDMkL7tKEJl
 mCm0xZXYj+yKeCz34ONIjHgqJKENZj4TC+nrxeoEsp5rBK1QFk4ys2Uob8RWSGcecjysCmWvLvD
 xTFnyPw1AjImMs2vX6z61m8wlbxJD1eOZvEYpxt0ieNgmDQr3Zvn8zTW4Bv3YBIg2oimegl1Htd
 lXSILCrTvpyrTYw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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

Autodetection algorithm is slow. To help writing configuration files, add
an option save the configuration after an autodetection.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 49 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index e5810e06dbc6..cf9eb330efe4 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -666,6 +666,43 @@ chamelium_v3_autodetect_mst_port(struct igt_chamelium_v3 *chamelium, int drm_fd,
 	free(port_name);
 }
 
+static void chamelium_v3_save_mapping(struct igt_chamelium_v3 *chamelium)
+{
+	struct chamelium_v3_port_mapping *tmp, *pos;
+	char *key_file_loc = NULL;
+	char *key_file_env = NULL;
+
+	igt_assert(chamelium);
+	igt_assert(igt_key_file);
+
+	igt_list_for_each_entry_safe(pos, tmp, &chamelium->port_mapping, link) {
+		char *section_name = NULL;
+
+		asprintf(&section_name, CHAMELIUM_CONFIG_SECTION ":%d", pos->port_id);
+		igt_assert(section_name);
+
+		if (pos->mst_path) {
+			g_key_file_set_string(igt_key_file, section_name,
+					      CHAMELIUM_V3_CONFIG_MST_PATH, pos->mst_path);
+			g_key_file_set_integer(igt_key_file, section_name,
+					       CHAMELIUM_V3_CONFIG_PARENT_ID, pos->parent_id);
+		} else {
+			g_key_file_set_string(igt_key_file, section_name,
+					      CHAMELIUM_V3_CONFIG_PORT_NAME, pos->connector_name);
+		}
+	}
+
+	key_file_env = getenv("IGT_CONFIG_PATH");
+	if (key_file_env) {
+		key_file_loc = key_file_env;
+	} else {
+		key_file_loc = malloc(100);
+		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
+	}
+
+	g_key_file_save_to_file(igt_key_file, key_file_loc, NULL);
+}
+
 /**
  * chamelium_v3_fill_port_mapping() - Read the configuration file and fill the port_mapping
  *	structure.
@@ -705,6 +742,18 @@ void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium, int drm_
 	}
 
 	chamelium_v3_port_mapping_info_list(&chamelium->port_mapping);
+
+	if (igt_key_file) {
+		if (g_key_file_get_boolean(igt_key_file, CHAMELIUM_CONFIG_SECTION, CHAMELIUM_V3_CONFIG_AUTODETECT_SAVE, NULL)) {
+			/*
+			 * Delete this option to avoid rewriting again the same configuration over
+			 * existing config file
+			 */
+			g_key_file_set_boolean(igt_key_file, CHAMELIUM_CONFIG_SECTION,
+					       CHAMELIUM_V3_CONFIG_AUTODETECT_SAVE, false);
+			chamelium_v3_save_mapping(chamelium);
+		}
+	}
 }
 
 /**

-- 
2.44.2

