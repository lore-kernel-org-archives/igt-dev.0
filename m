Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBB5D2CDFF
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 16:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F63410E6CC;
	Tue, 22 Oct 2024 16:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bYEJSlen";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613A310E6CC
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 16:32:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B992CE000B;
 Tue, 22 Oct 2024 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729614720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpzYtTZv15ocwW+zkciOptXxUgO+I81b53vaiu2kmOY=;
 b=bYEJSlentX+YNnexN7PHvpPvx4m1/W8WIBM60MTO0gZNdZXsfvEZG9kW4EgkrkHKqvo8U0
 6rgCeuThUrXQQt5AXooo9Itt/tfW5aIdUVxtA+uwedexL6+OrTGY+apQFoJtn6rEFyTyRR
 eV6BY8UjQLsS8sj473u+qup/nJA9dd3OyGb8e6Ygl27SpZWkWaeZud5dgWg8GYKTu1o4Cc
 4LxnaKWwI2WtubeAeVb7fzKM8hEF2QhaBZAUKnlX98NmELEq98GCzYH7/fMJzJ02pTA5Ae
 M3xmJpsKK3vVEumfSnG9kbxDT+eqxHnoOuGOm5Iru3ce6dcRiVz2vNO7wd+vXw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 18:31:54 +0200
Subject: [PATCH i-g-t v3 5/5] tests/chamelium/v3: Implement a basic
 Chamelium v3 accessibility test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dev-remove-static-ports-v3-5-bfbc7b2a83b9@bootlin.com>
References: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
In-Reply-To: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com, 
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com, 
 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9W6cj2Q4ssSOMGOCGiZE1AyaeiC3Q3ioaHGsmheTTm0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF9N84oCNSNVcHrqSeabqXAfMOWJuIbQg+VQhD
 uSMcPEKYQaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxfTfAAKCRAgrS7GWxAs
 4l4SD/4t3NC935sJKcXweYbZFrVxp3RG70U5GXme81U1p6LCcU4BDbKvAKnhUadrTk/0JG2mhnd
 No+Co5M/qu+UlntK0I02UnjBq85I2Hku6UJXdeG6wtlMHbsp5kK2+uQMeSrvv4RDyDGuKI7EwVV
 gAO8yM2pYHDFOZvyab6qFjs/PyYU1SW97FhnUANXv7yNtLV6PkRTkGqEPN7lcq1dfUa8Hsn8pr2
 X9xBiFt18WlOpA7wreuYvSxj964mnCW+zbWKx8z3QYKv19VwTxc8Uy/GfBiPqgStQMPjFmyfY2c
 XK24YhzMI5G5PjvK5UCNASagDx+DJPzYSI759t5tse/ToZb07FaaPGF/CieQ/U/6eyUrmvQQN1Y
 qPuHYEnw+23kXnKkuk2PSFLxHeCJh/iRdXIDPnTmGOa77ktti7hi43qTtH2qhPhQ93b/M1tA6M1
 3zFKzFxWU14GnYfmiioBFxPyNf0LJd+M1nPxxPaCoERkKxj3el378tkBAL1n9z8kCra6dC5cy+6
 m6JU5EejD1RoLRhgK4DXnCi7jw0ca8m5XCoOpaJipaeziJ1XOGjHOF2NVBBkq26vwgEfVlrOHeT
 gC8uBxQdNJNpoNHQYa5edVjjh0RLC4Nq/wPj4tMNkc/tvqSwNFJdxUfV1yoaPCHKnD1ZosNCLSh
 Znp14HETQmaTSQQ==
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

Utilizing the RPC calls introduced earlier, this commit adds a simple test
to verify if the Chamelium v3 device is accessible.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_basic.c | 30 +++++++++++++++++++++++++++++
 tests/meson.build                           |  1 +
 2 files changed, 31 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_basic.c b/tests/chamelium/v3/kms_chamelium_v3_basic.c
new file mode 100644
index 000000000000..4d48e68e2936
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
+	struct igt_chamelium_v3 *chamelium;
+
+	igt_describe("Test if the chamelium can list all the ports.");
+	igt_subtest("chamelium-list-ports") {
+		chamelium_v3_port_id *ports;
+		int port_count;
+
+		chamelium = chamelium_v3_init_from_config();
+
+		port_count = chamelium_v3_get_supported_ports(chamelium, &ports);
+
+		for (int i = 0; i < port_count; i++) {
+			char *name = chamelium_v3_get_port_name(chamelium, ports[i]);
+
+			igt_info("Port %d: name: %s\n", ports[i], name);
+			free(name);
+		}
+
+		free(ports);
+
+		chamelium_v3_uninit(chamelium);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 861101c2534e..9ddf906723e8 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -341,6 +341,7 @@ chamelium_v2_progs = [
 ]
 
 chamelium_v3_progs = [
+	'kms_chamelium_v3_basic',
 ]
 
 test_deps = [ igt_deps ]

-- 
2.46.2

