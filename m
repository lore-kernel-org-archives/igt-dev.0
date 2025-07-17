Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C7DC83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC14910E88F;
	Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="l7wUAYyL";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392EC10E883
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1287442D9;
 Thu, 17 Jul 2025 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d8ejnseLbmE4sWyV0bFnnFLZDU+KA3zE/1/WyvTMNEQ=;
 b=l7wUAYyLyZNLReEwX2rA+JIOkyCavNiBcQoqw4kz5nTOAdyK3+NvOHV6ungt8FtJxhmR3f
 XTnmUjfKSj8h1aMEcvb8Cwt8VG68n9z3cMLFV0NteHiBSvp85Aj0twNWLQcdoUTyiMvJG5
 jDWKNGHJm/wHdKRjEe/TKDkFi3abnf6O2uImRAe5mKQGMJt0TrtW8U7MeqBzzi6gxGrq4S
 P7etyVb9XRCm82YocXQn7U0I/khwy5WP3yTd/Rv9qHyEaDXbwM4TUmnbed7GFJqq2Xn6Qz
 QXCEpamikpzwQbuVwnIvromjtPcLiG4Va5oJoJwt4060KM0qcTogbV+jM2x3QA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:42 +0200
Subject: [PATCH i-g-t v2 22/26] lib/unigraf: Add edid configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-22-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2831;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=TRN6ywMNVoo56LEee7XuUrpWFllW32QWOoxYxWZI+Zs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUNBAB/ceonB2nfV5IZaULFfovH8drF7oS2D
 ppV+17LiNuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFDQAKCRAgrS7GWxAs
 4p9kD/4/F3UqC6Yb0LNLoSxjvga5A/zNBfrcMq10yVdlpCTpVYqsV6orVm7TiZJXYcMbHWzK+gg
 h16rRRnX8Svf8IWFkDImx9MYHtW3yXqmHm5yl/VIEQMPUYRaR3a2M1qoBiqHHEKGgVxQ+jHwOe0
 QunMTuM3khfQdIyvm3CiCZHiXnW9ef6gIJQeNjpgbvJg+sg5Lvx8pYkmjChH0uXWlKU/cyxCEBJ
 njsWImWBDh0/s/ies6sZUep8VGPTZM37v5XOXouPP0cPi49snsBVJZOIh4N3KHgd9l1sTu8cuFX
 VaEsvs3hzcGtcBdnKwkJNZDql8KQ5UPNdhExEtKELiI7wbEFvZyHrUgQz3p9dOffgr1FQfDL685
 BmG245+g+bDZPW/6prHoBKJA52ZutFz767JX+11TYaxDynzDzUUjD5e2pNrbXmEeMZxyDKoUl25
 5LKgmLQBtzvrYvFl4LlxXaD/QH7rOjcdF/EAYMuaxQdvsXHsl+MV+Idr37WVZi+IoSCL/P5K1Mj
 sa1GgBK5YcrLs/c+kV0s2dGEjCDjLcvIXyNio3HyaAumZDTdRx/WQmrxCmSZLsUHxOa2/zNlx8t
 wFn5felQxiM8i0+0gd1P8yjTbDQ0O2HnmEwQfpCuYPRlC2SouZdpYpDKQ9eYeJ6RI/CUFz0TdPO
 pfSZyCS0zvXG5bA==
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

As unigraf could be used as a simple screen for all tests, add a default
EDID configuration to connect the unigraf by default on every tests using
this EDID.
---
 lib/unigraf/unigraf.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 10f8c5ab671d0e8ccf27d333f6ea66c8219b0892..add5d5b2b1379bb34ff73505ee917e51398f4b66 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -10,8 +10,10 @@
 #include "unigraf.h"
 #include "TSI_types.h"
 #include "TSI.h"
+#include "igt_edid.h"
 #include "igt_kms.h"
 #include "igt_rc.h"
+#include "monitor_edids/monitor_edids_helper.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device,##__VA_ARGS__)
 
@@ -50,6 +52,11 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_CONNECTOR_NAME "Connector"
 
+/**
+ * UNIGRAF_CONFIG_EDID_NAME - Key of the EDID name in the configuration file
+ */
+#define UNIGRAF_CONFIG_EDID_NAME "EDID"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
@@ -165,6 +172,17 @@ static int unigraf_find_input(char *request) {
 	return chosen_input;
 }
 
+static void unigraf_load_default_edid(void)
+{
+	struct edid *edid = get_edid_by_name(unigraf_default_edid);
+	if (edid) {
+		unigraf_write_edid(0, edid, edid_get_size(edid));
+	} else {
+		igt_warn("Impossible to find an edid named \"%s\"", unigraf_default_edid);
+		list_edid_names(IGT_LOG_WARN);
+	}
+}
+
 static void unigraf_autodetect_connector(int drm_fd)
 {
 	int newly_connected_count, already_connected_count, diff_len;
@@ -228,6 +246,7 @@ bool unigraf_open_device(void)
 	char *cfg_device = NULL;
 	char *cfg_role = NULL;
 	char *cfg_input = NULL;
+	char *cfg_edid_name = NULL;
 	int device_count;
 	int chosen_device;
 	int chosen_role;
@@ -283,6 +302,13 @@ bool unigraf_open_device(void)
 			unigraf_debug("No connector name configured, will autodetect.\n");
 			unigraf_connector_name = NULL;
 		}
+
+		cfg_error = NULL;
+		cfg_edid_name = g_key_file_get_string(igt_key_file, cfg_group, UNIGRAF_CONFIG_EDID_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No default EDID set, use IGT default.\n");
+			unigraf_connector_name = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -341,6 +367,14 @@ bool unigraf_open_device(void)
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 
+	if (cfg_edid_name == NULL) {
+		cfg_edid_name = strdup("DEL_16543_DELL_P2314T_DP");
+	}
+	unigraf_default_edid = cfg_edid_name;
+
+	unigraf_set_sst();
+	unigraf_load_default_edid();
+
 	return true;
 }
 

-- 
2.50.0

