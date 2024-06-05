Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB48C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163CA10E7D9;
	Wed,  5 Jun 2024 14:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hW2oZPK7";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F8910E694
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A51040013;
 Wed,  5 Jun 2024 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wVg+HZqyX83pKDPpk1b2bnKqM8sziyCOrsdiIj6YLyI=;
 b=hW2oZPK7EwF7J/FmqGHJtVoQyKTOyl3WqeSxpY7l3uschcU59UJYMIzjFvR3Os1TLOzaTP
 gAfernshhTGNxrbTLGZdq67/S0Bb1c0XbWQv0KLqupZMEQ+ekfz/bKX+Xl4NNELCFpBola
 kwD7EqL4ZdJw9wRT1HtdDn5L84mpo1gxtkGyX8bUSa7igTrsRVIpA2WmSo/mqifx1GJpMo
 O3MM6l0Tf29R0q+lSR4wwkqPDPIre8tyIGkFjxZrQGAYEb5DVl2CFMXQxUgDLbuXAROySG
 yY58ft2lI53LxgeDN2Vfh0dJSwGQZJFtuMuG1twNMDaatqQTGhLF0t57CQDpAw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 05 Jun 2024 16:30:18 +0200
Subject: [PATCH i-g-t RFC 06/13] lib/chamelium: Introduce a simple
 chamelium v3 test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dev-remove-static-ports-v1-6-665f25b7a4db@bootlin.com>
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=jW7CkRc/CF1KeWWE6/t4EbILB6HFO2fEcHTkxCBXT4A=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ4Bg4sbzyIFq14d32+KoygFV/AM4OwAHGN+
 rtxtCPdW7yJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2eAAKCRAgrS7GWxAs
 4ux2EADLoE/lcRvg8Tujb2FWsEVNox8PKP2tEulNpelcM9qSBr4JftlV1oqH60cxCn9GTF+fIDH
 fD813Fb8qHAsM5qoa1Lvs3v8BaTBT6iUf1kQAtFrIpcbZpE+HAML/q1N5arkM1Pe3ya/TyBGD9N
 Z2za/LkvDoamaiusH5xj6ZX83d6IqmtYa34UVW0yJHU55bv2ve0B0Q1ABKwzp/ABiurRuZPyK3G
 47vMzYHKLl3+pm7f8zhImy9OxsNe9TtCulfQUyvlYb0rY+edun/F4Ty3mqpjFCbYJvHvC7wAbQh
 tIbQHV+XsiisZCgNueqX4HkJg8pfmQpKojk07wt73MfQFT68z/EJd/ZJFFCPkZ3mLzhlaffNsXa
 T+ZrN6fnqpATStRZST6Vxsw895ht7RIEAZzXEiigAj7TED/HDarC+zHABO6A9gv3L3UPdocBUy3
 pU2PAAnt8j5+VZYVCmkazXKjuCa5PWB5giqMeLdoozDeIeFr9qEQUw0uthz3eijszzacJX9eidT
 Qeb+hKV+lVHIrPTYbnBYx4Wm15IeZVzZOhNF8/y+wY/DyNMBORlyUMxUAUby93Cqh/jYu2ZtwSv
 2wzIZ39GH1uePAEas/5PBGE9R743ko3hzXv5CFz2moLvXgF6HTks0KzN8eLYB8c5UNFmHClsili
 GJvxtgSogeL8ssA==
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

Check if the chamelium is accessible

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_basic.c | 30 +++++++++++++++++++++++++++++
 tests/meson.build                           |  1 +
 2 files changed, 31 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_basic.c b/tests/chamelium/v3/kms_chamelium_v3_basic.c
new file mode 100644
index 000000000000..f07106c064cb
--- /dev/null
+++ b/tests/chamelium/v3/kms_chamelium_v3_basic.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: MIT
+
+#include <igt.h>
+#include "chamelium/v3/igt_chamelium.h"
+
+igt_main
+{
+	struct igt_chamelium_rpc *chamelium;
+
+	igt_describe("Test if the chamelium can list all the ports.");
+	igt_subtest("chamelium-list-ports") {
+		chamelium_port_id *ports;
+		int port_count;
+
+		chamelium = chamelium_rpc_init_from_config();
+
+		port_count = chamelium_get_supported_ports_rpc(chamelium, &ports);
+
+		for (int i = 0; i < port_count; i++) {
+			const char *name = chamelium_get_port_name_rpc(chamelium, ports[i]);
+
+			igt_info("Port %d: name: %s\n", ports[i], name);
+			free(name);
+		}
+
+		free(ports);
+
+		chamelium_rpc_uninit(chamelium);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index d7c20e235325..51396548eec9 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -335,6 +335,7 @@ chamelium_v2_progs = [
 ]
 
 chamelium_v3_progs = [
+	'kms_chamelium_v3_basic',
 ]
 
 test_deps = [ igt_deps ]

-- 
2.43.2

