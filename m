Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7750C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB91510E5B5;
	Tue,  9 Jul 2024 15:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Iva7xjUr";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57AC10E5BE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43DE120003;
 Tue,  9 Jul 2024 15:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lp5luzN/XHWSFsmc4LAeOnY7IQ67q2r+syvFeLqrSZw=;
 b=Iva7xjUr691z6oYHrWa7KFQFtTMrxxptCAiOGDbt7LiOpFyAnTnOZ/U1y7bcaTzkLmuPb3
 UMdfJj4OJeb8tNTKp0j78xb4GqDhiYW7t/eV39DzPt7d2EN7h94qrwObEftTM4K//l11M/
 w2l4hcXxjCoCJAjywjWP0UQ5NqTFK7eYEeQUNOrmEDdwcrxQTUTVtokBu+/NbIW2bOJkS1
 bWy1A3qweGq/jcXaEccdEJO8DNyLHs+7ryXNkL4phWibxwrGgoloJf5wmWkNq5vGcIhEcx
 u9HPGbXVyvgrYPs+6PjLkVCsxORqzlHeCZCs2ekrsUmRN6QrtSqQPjuXkZE95A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:53 +0200
Subject: [PATCH i-g-t v2 37/39] tests/chamelium/v3: Add test for display
 change detection during sleep
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-37-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3397;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=DLwOv/tibB6SNQHpTO/hsP89f+c3E9WujsgEkjcTHAQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjVia3yvUQrqErKXj6rq3hAhTknyLnfG9+IOgO
 fvRTUHVoG2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmgAKCRAgrS7GWxAs
 4pxzD/wIMi/wYdAbWMi7F8o3OclI/uOxQgtlnM3nfI4jMKNQQBwapoLPah2EKhIseTAuyJACKzk
 nX5NSS2KXqzlFbshvKfRQVwUfDFYoAGt9/jbtJdjdM2KWdAaGHTovLuAjeT9qJfXMa8jZwQ1EDP
 tfG7BchoXd8QltXexEbEWkWATJSF9j2ODaBmPpSa9yHgen7a+Z4aOASN1HCp6AbFoIuhwCSjUvj
 CqS3u5zZ2ZcQm+NTSdhkgKf72R4B1tT3P7yoWgZi4Zsp5BkLsQ9Ht6RveBr6XzpbR0ojH7emXoy
 WHSorhunIwd0FeEeuS6NMDBQC+Tf/ndLQDbZuVXt7vXJjnUYV9plPaxCDx6gUIYuSHjTSC1rfku
 H64i+s+we9z6+mfRjq3jGBZqoaXWiAaJEi9Mp++Ru8igAeLukpOTAi7f/iiE5YU1r4sPztt7SJ8
 q28uLGrtKfhS/Uzur4D8TEOQxXUdbgG7UnBfVehKinkiKTxRajR/TS1ErqiygElKg4r3JteDYps
 CErK7o3pxtvobJ+OuCHmMiIsJG+o0bMvCO7+fwYGY+bbpOn9l+no7D2Al6IVToRrB6vIaFM6SGo
 xXelZMXkibF5d9egia1L7M0o+BQwboVzK+r9iPvksDnhNeavntCx2yMNURzB7+7PrHnzSk5vSCN
 vopd8KB30468xSg==
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

This commit introduces a new test for the Chameleon V3 display adapter to
ensure that it properly detects display changes during sleep. The test
verifies that if the display is disconnected/reconnected while the
device is in sleep mode, the new display is correctly detected upon waking
up.

This test is inspired by a similar test in the Chameleon V2 version.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 59 ++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
index c03829b43aca..a73875214915 100644
--- a/tests/chamelium/v3/kms_chamelium_v3_edid.c
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -153,6 +153,43 @@ static void edid_resolution_list(int drm_fd, struct igt_chamelium_v3 *chamelium,
 	drmModeFreeConnector(connector);
 }
 
+static void test_suspend_resume_edid_change(int drm_fd, struct igt_chamelium_v3 *chamelium,
+					    struct chamelium_v3_port_mapping *port_mapping,
+					    enum igt_suspend_state state,
+					    enum igt_suspend_test test)
+{
+	chamelium_edid_id base_edid, alt_edid;
+	uint32_t connector_id;
+
+	chamelium_v3_reset(chamelium);
+
+	base_edid = chamelium_v3_create_edid(chamelium, igt_kms_get_base_edid());
+	igt_assert(base_edid);
+	alt_edid = chamelium_v3_create_edid(chamelium, igt_kms_get_alt_edid());
+	igt_assert(alt_edid);
+
+	chamelium_v3_apply_edid(chamelium, port_mapping->port_id, base_edid);
+	chamelium_v3_plug(chamelium, port_mapping->port_id);
+	connector_id = chamelium_v3_port_mapping_get_connector_id(port_mapping, drm_fd);
+	igt_assert(igt_wait_for_connector_status(drm_fd, connector_id, 10.0,
+						 DRM_MODE_CONNECTED));
+	collect_and_compare_edid(drm_fd, port_mapping, igt_kms_get_base_edid());
+
+	chamelium_v3_apply_edid(chamelium, port_mapping->port_id, alt_edid);
+
+	// Schedule the hpd pulse during the sleep state
+	chamelium_v3_schedule_hpd_toggle(chamelium, port_mapping->port_id,
+					 igt_get_autoresume_delay(state) * 1000 / 2,
+					 true);
+	igt_system_suspend_autoresume(state, test);
+
+	connector_id = chamelium_v3_port_mapping_get_connector_id(port_mapping, drm_fd);
+	igt_assert(igt_wait_for_connector_status(drm_fd, connector_id, 10.0,
+						 DRM_MODE_CONNECTED));
+
+	collect_and_compare_edid(drm_fd, port_mapping, igt_kms_get_alt_edid());
+}
+
 igt_main
 {
 	struct igt_chamelium_v3 *chamelium;
@@ -267,6 +304,28 @@ igt_main
 		}
 	}
 
+	igt_describe("Check if hotplug during sleeping are correctly handled");
+	igt_subtest_with_dynamic("edid-edid-suspend-mem") {
+		struct chamelium_v3_port_mapping *port, *tmp;
+
+		igt_list_for_each_entry_safe(port, tmp, chamelium_v3_get_port_mapping(chamelium),
+					     link) {
+			igt_dynamic_f("port-%d", port->port_id) {
+				char *name;
+
+				igt_require(!chamelium_v3_is_mst(chamelium, port->port_id));
+
+				name = chamelium_v3_get_port_name(chamelium, port->port_id);
+				igt_info("Testing port %s (%s)\n", port->connector_name, name);
+				free(name);
+
+				test_suspend_resume_edid_change(drm_fd, chamelium, port,
+								SUSPEND_STATE_MEM,
+								SUSPEND_TEST_NONE);
+			}
+		}
+	}
+
 	igt_fixture {
 		chamelium_v3_uninit(chamelium);
 		drm_close_driver(drm_fd);

-- 
2.44.2

