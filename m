Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F392C41513
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142AF10E5B9;
	Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="asxW1xx9";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5500910E5B0
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3BA820005;
 Tue,  9 Jul 2024 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Y0E12z8VVLX4ibM7sRArXfPA+cEHwltsAn7azAiKvU=;
 b=asxW1xx9XfAfYGpypokcIk0g7MEX5Na9ER/eZxu0Dov8xMw9/9xqxM8Owug6CS+0VmVlh1
 A7KfA0SU2eOyWMSM6i6p91SpIaHQcNlHrSVoN/V0NF+Xio80qIt9JAerSelRQASCXPQ4Jh
 QIgMOWrj1HuEKRMEkuuSAz2sxfOt0F6vETjIjiFkNfyhWZiHL+W4qeBsW2hOwxUlKcwX7q
 8rfdDprl+rvE73CIxNk08Iw7joXb1AUwnJOOB+hYF9mIlAvcQfVzobkFOehVsYhD6luDEq
 qeLHqMVipyrAKsIhm/9FZnjz1zW3r49pjv8gqeYC2EerS3jF+oRSaxwbTFtKdA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:34 +0200
Subject: [PATCH i-g-t v2 18/39] tests/chamelium/v3: Implement a basic
 Chamelium v3 accessibility test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-18-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xLSDpDZ4AgLx6S2+kC505Yi7zi0mrch7wzDCoXu1KLM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViYcpW00YcPmV/BWp08LUhMV/nJjElQM1obn
 luXd1XsU0OJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmAAKCRAgrS7GWxAs
 4rKGD/921khjcrcbl1udH8cp/2hQDKSQW5lgE28qdCWYMMwyLIm5VAr0bQwRP0WTClJI/2GWjd6
 oke4Fbf7ILuiB18S92/B66kH9M1RPs0eHpz7v2iNPTf3BeWBh7jEbTn8Uef/NlUxqELtuxKbHjx
 lZai02JMK4nasgwlYy/jSHW/e9xIcCzGQUksLJQW0Zv81FdxBAmE6lm1gVd8AC+XYai5XbixeLg
 fplfoVHh4MlqCvt+wd6pM1fmVlaemqXfiqc+X5XH/ji637kwvVtzvaQXhNxiwcDI54FVscYRnlm
 KmRiU8h5ZVQsad/wOUJLlk+DRKaKzYgNoeVZ+iOVq6hM5L+F6zXkcw9uj1VqwnxBGOxK8HFL8ny
 cSjwStR8dr8HiwPZU6N3/cbJtjPeMPnITd2MtU0LQJAjpS8NVkZFbt5RJD+aEjkSHt5J296wByK
 fLt3/pmYl8lI2uVC7Wd9g7Cn/p7BDCyDRw65b/+vtdtT/bj203fKUF6kQzVr2o955aiwjzKTGyH
 MjPMDHZGcatlGaIkcofWkTqGw9A0UNvuarob0IG97la/Gk3kL7KTYSxFwKNcjMIOz+9drRhacwx
 7JgbJCiC1X2+D6huvT9UUI28A5+d6WbbpHD0P1R4P+0uVNA7qCrMcjMRzZSa5rTmXPomwTVhN1b
 Q88jXjBnMVuQ/fA==
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
index 6a736d1defd1..e36ae9b18ffc 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -325,6 +325,7 @@ chamelium_v2_progs = [
 ]
 
 chamelium_v3_progs = [
+	'kms_chamelium_v3_basic',
 ]
 
 test_deps = [ igt_deps ]

-- 
2.44.2

