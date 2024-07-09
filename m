Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FB2C3DA4C
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869A310E5CD;
	Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AfHjSnJG";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542E510E5B8
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6DAA2001E;
 Tue,  9 Jul 2024 15:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3XfzBoo6EARH9YFDtdcRJXSBvnnhDjVIEIpsoMb4yQ=;
 b=AfHjSnJGgLy+MGYRfOdTGLsYH7/pS2zubL48+oD8v/9MQzPdIh7qB0q9XcoCzUQ/aLX5S9
 3cjTqjnQtLmt8BEs/i6ZCt8Rmxi+cmaqwIqkyBSgENSnHn8FoOvJXvxKSRDmU9CFGzZ4Zn
 8DByTfcWxkdU7WtfsBbgtrCdAgZKc6sJcXx0BCkr5PoQhyydgr7NabUorE7+FKNA1wsd7J
 f44858IiDjHYZeeqqkROahdPMTzMdg/+fbSNbs4isQZYVH5g0BdBcp/6LJpI5GeVYYS4gB
 MTlzIXbQyLHFBEc+44UibKkOip+eQQmiZKjhSs1/p1+Gdd86Ly+9g734YXX/bQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:49 +0200
Subject: [PATCH i-g-t v2 33/39] tests/chamelium/v3: Implement non-4K EDID
 stress test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-33-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1718;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cPqaqc1qiTlEvZTMK3PAbBHovpjLJGnX22eo+a+Jc/Q=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjVianEyHBiMEJ9vDmSqovjWI2vmcziUIAjzO/
 31Lkjvc+pSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmgAKCRAgrS7GWxAs
 4sM8D/94XCLG5gPmuPvRCcLnFlJAlch/P2lx11wYou5i2VCtF/v1DC3yoyk+gh91gjbXwRQH165
 9UMTZeTn+Q5ZlOKuRjMmUIXL/pAmxx+UBaBEYWXpz3fXEp9KnlrJW+jNFAfqqpWjFrOHmYUFv98
 g7xuy79wcFZ5CHtjQI3cwx+GYaMDVJ1muN/9scs4s41qMXTn6ZEhuAYNmSZ9d2YyEXg/Vog0qpG
 vKjSIMf9REUuGFDiph5YJo9TwTcR2CoWeX9bTcoumvQVp4GTCR9PgPO9wlw93XP4H5M5mvUiojZ
 W/u98LbOC69IEukrZFA1t8xpVgZK8A+6pM3wmVXnrlXtpMZTWiNusaYyngvzLbWRu3h1iS3py3S
 racAyvl7HIZkdQ4YW5sGiyixNhNx0Gp7S8XnVfodPlZ+pdyfLMTNsAvFcN0F4GQnIC5AULFwqCi
 UkDuBO06IaKgZtJS6D3IwqMNvKueDLa45VFUQsOjAfzEjB2GNAROo/xhgfiSWxy7r7S/jeNlfW0
 lbYPwnsnufcVgsDB3O8k/B4FHtYxa0eVK4UB9ugEDlQFbHWfL1OMALdlDCj4ALtV1ZBKhXfCnbW
 lP/RZ1QlEEX1UuYPqnUa2piewsuSreayIXFS5hBf4soT1lU7hMYebpCGZFBrkSyJZdTbzdNSI1z
 JW35iqP4omqsPGQ==
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

The existing EDID test has been enhanced to also test non-4K screens. The
current EDID database includes entries for HDMI and DP ports.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
index deef04d97bec..b6660769897f 100644
--- a/tests/chamelium/v3/kms_chamelium_v3_edid.c
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -134,6 +134,35 @@ igt_main
 		}
 	}
 
+	igt_describe("Read many different non-4k EDID from the chamelium");
+	igt_subtest_with_dynamic("edid-stress-non-4k") {
+		struct chamelium_v3_port_mapping *port, *tmp;
+
+		igt_list_for_each_entry_safe(port, tmp, chamelium_v3_get_port_mapping(chamelium),
+					     link) {
+			igt_dynamic_f("port-%d", port->port_id) {
+				drmModeConnectorPtr connector;
+				size_t edid_count = 0;
+				char *name;
+
+				igt_require(!chamelium_v3_is_mst(chamelium, port->port_id));
+
+				name = chamelium_v3_get_port_name(chamelium, port->port_id);
+				igt_info("Testing port %s (%s)\n", port->connector_name, name);
+				free(name);
+
+				connector = chamelium_v3_port_mapping_get_connector(port, drm_fd);
+				igt_assert(connector);
+				edid_stress_resolution(drm_fd, chamelium, port,
+						       get_edids_for_connector_type(connector->connector_type,
+										    &edid_count,
+										    false),
+						       edid_count);
+				drmModeFreeConnector(connector);
+			}
+		}
+	}
+
 	igt_fixture {
 		chamelium_v3_uninit(chamelium);
 		drm_close_driver(drm_fd);

-- 
2.44.2

