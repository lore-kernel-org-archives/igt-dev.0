Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BD9C27C53
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6682510E7CF;
	Wed,  5 Jun 2024 14:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="guw/Db0U";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F91A10E53E
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1965D40007;
 Wed,  5 Jun 2024 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ofIvPxtKNa5KmbJVayZKWgxTcuy8Eg3XSMQzsFsXGU=;
 b=guw/Db0UhhGZFjhVMgue+h4Z72PyM4I3VEQyFsj6ezqMRO20Oc8QSXsPpoyI2843hY+4nt
 oulh3XI3a9Evnd5rxXiS0+MPZNNj5V2b7wkwKWKkX3qL0cSN3Gg90++yEjKR0zur4LV6Vb
 XGjXgdIwc9F8Du3otXFUzX4/7egLAxkGQC4RTCgyZCW/e2yooqlze4VlZHfXMCgeu1RNrf
 d03Sn9qD7Oz856vjj1iUSYXrfa+adORb2ugDQakk3FC29YYz/b+kE+xRD5EfosPRdwTvoy
 at62AdksH6h06G8wRaS9wJKux83xebo2kFb4dSnji6gugxvmhzIdrV/FAXot/A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 05 Jun 2024 16:30:22 +0200
Subject: [PATCH i-g-t RFC 10/13] tests/chamelium: Introduce non-4k stress edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dev-remove-static-ports-v1-10-665f25b7a4db@bootlin.com>
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=sJ6tPDVL644HJyoWGlA2QrHhwKc15db/+8nGxApUSRY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ5XqoQ604AU4KkKmIS+5L9FzM34RAi6gQY5
 +AIyQJMpl6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2eQAKCRAgrS7GWxAs
 4rdvEAC/+SCw4FAHcEYVAG3AolJok0MXac1z5Unr4GXiH9nte7J4aYrA4h5JrrWSbyaIYdyNHgt
 wIWQHpSwnXhcgGrniSDV81ltRevDB3rJoV1u1ucKhVteB3eFJycYaEcV0PyiK6mckC4TVzeyr2e
 WQvlugn4HeeGJktBwdDA+ApF1BuKY4Q+YntFyZX5qpPKBUNglaDqdqgcY+WLzoAGG01+YHyLcJW
 r1jlWYkRheIk5woZoPgKvyXMXZWNwFHFNMpqh8BJxGgMyP9PQRe0ZbcYLX7BhkWvi3j09WvxT9U
 qoYKIARCcr5MV+J6cG0Bm2Z1j5F9PvN0shVGUyVINOjOuYzFfmjK6UuNcWtLoPUN5S4o3awQdOq
 qD+m8TpBJbFndNgY2y8dNjVL+p6I4FA8m9woXtVughVM1/gJxc8r2DBzl28Ebjl1G/Xz4gyRqNn
 ZNqi+cAFH9LM9DpgJIjB+/YEOqoe/c6P4XjhgdcBXD3JFJCDLneiiGDHPwt6lFsY30ZETpsE5s5
 o1jUqNzozXGvzVGGuI03yCm1MN0TMpJ0hXXBlVxNjOQIOdnUUfusLZQUVoB93P+nlZzacqnx7kn
 S2TndzIIi41qWDVYqrGGRPyWWJZmQiXdns+wakRHpvzHq5Qz5D/VAOprD/TUrYvNa+q4PLenjKl
 BlJeL93Zea1DmSA==
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

Complement the EDID test to also test non-4k screens. The current database
contains EDID for HDMI and DP ports.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
index 76bdddd81174..836086f2dc13 100644
--- a/tests/chamelium/v3/kms_chamelium_v3_edid.c
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -131,6 +131,34 @@ igt_main {
 		}
 	}
 
+	igt_describe("Read many different non-4k EDID from the chamelium");
+	igt_subtest_with_dynamic("edid-stress-non-4k") {
+		struct chamelium_rpc_port_mapping *port, *tmp;
+
+		igt_list_for_each_entry_safe(port, tmp, chamelium_rpc_get_port_mapping(chamelium),
+					     link) {
+			igt_dynamic_f("port-%d", port->port_id) {
+				drmModeConnectorPtr connector;
+				size_t edid_count;
+				char *name;
+
+				name = chamelium_get_port_name_rpc(chamelium, port->port_id);
+				igt_info("Testing port %s (%s)\n", port->connector_name, name);
+				free(name);
+
+				connector = chamelium_rpc_port_mapping_get_connector(port, drm_fd);
+				igt_assert(connector);
+				edid_stress_resolution(drm_fd, chamelium, port,
+						       get_edid_for_connector_type(connector->connector_type,
+										   &edid_count,
+										   false),
+						       edid_count);
+
+				drmModeFreeConnector(connector);
+			}
+		}
+	}
+
 	igt_fixture {
 		chamelium_rpc_uninit(chamelium);
 		drm_close_driver(drm_fd);

-- 
2.43.2

