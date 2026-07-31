Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E895C55174
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA26210F39E;
	Fri, 31 Jul 2026 18:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RRGpF05O";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30C310F38E
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:22:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8A46C1A1370
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:22:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 593266039A;
 Fri, 31 Jul 2026 18:22:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 88D5411C16C46; 
 Fri, 31 Jul 2026 20:22:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1785522138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=a2ePCB6024WoRjEyBOzPI1P2Sw0iwDdLvntvylBNR5Q=;
 b=RRGpF05Oh0tEVZKyqlQEuB3CwnJB7kYs4Mgecjz25Nc1gGbbIc0BWrwYuotYv2eg0TZaqO
 g7Jo+SNopDIba7KdLa2ryICYmKoRJORjx+jlkKrCGGWeXP7ekROigDyAaha9kUugcFBoUW
 YhJeajQKQAleHBRWDi+1XyRmkqve7z/CQ2avzwDqTCAp4rj0vKXCxLwSzv3yBk5wI6TQGH
 a8Lu45orQZWT4NXdf/pQqCjtErCcZh9KLvJWffOocKDMtU0hJgoE8BeHClzuBOTVRMUvQL
 zzogt+LF37Yppc8o0ncr1djcmsX3LICQMBjD4XVtvMqRX4tZLRrfCZYbLOWiEg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 31 Jul 2026 20:21:57 +0200
Subject: [PATCH i-g-t 4/4] tests/kms_content_protection: Add test to ensure
 HDCP is properly detected by the DUT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-b4-unigraf-hdcp-v1-4-495df88ebbbd@google.com>
References: <20260731-b4-unigraf-hdcp-v1-0-495df88ebbbd@google.com>
In-Reply-To: <20260731-b4-unigraf-hdcp-v1-0-495df88ebbbd@google.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, thomas.petazzoni@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756; i=fomys@google.com;
 h=from:subject:message-id; bh=4gKK0ZosN6LYmt7hmreIExRdxnzuF/0jM57nLVOuvbQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqbOfEvypif7wOJNG4r2mtSNJQXT39Dpc7HBEoR
 2N/a8yG9caJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCamznxBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOLLBw//YqmVKl4TuDgF6kUcpvDTXnoY6KsBsE+
 LG9qkFaFsd8A/rI1GvD9gahmOlOOG77N5NiAykCjAzXbkbsk7md8MV7PF/mblwuLMFpnkkR9R8E
 FMCDts/bISeNRCTvhq9+fAwqk9dtqjtDSL1uO3BpkhH7+fqvYX2lg+dvxQVRgg9I5dhhUMrdv02
 utL9Zn8Lbb9NOgMgyFHsWYY+GAWhbCdibMpKVHA3Q4RaY8z6kNea5OjH4wUnA4qjYJMu5R3n6mp
 LdTh8iUoSfjGDzXjMdJ0j9o6RfHIIra4u15E+r6G0VtNNsmrUoxLQl1Hg5NHMoJilx3RI3b9zTf
 AUwynoD4qBywHVW63oaEKRjwnPa7MC4FXwl/cx+OfXqv0fa9VAwfFs/kVfrQcrsbAttpz3RzNDQ
 ezBO4UBvoD9gacwRY9t6c+NOSum0bKeDOOgGmMpASsRVPV1ElENSxwdxk9JyicIZsX+KGrEqBRw
 LA9AnqJn+CmJy4T6DGF16bOwl/tg+Mgi+W9vQwiGCZAsA8avNz3i4qTT7fie0ZETuQ0vec9puom
 mdInm6FNkj1VeHrQQhOzNh6pq5IfioOoDWT+4Jq0aT56H/QMJ7HosPOf2BwXKLhBBvAqT60FazC
 IFFUkUQk/qw7yykPCQfVGiW62MDpZgb+j7CAK0OlxdgYMOXrgLyM=
X-Developer-Key: i=fomys@google.com; a=openpgp;
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

Add a tests that ensure that the DUT properly detect an HDCP 2.2 sink.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_content_protection.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 680204981f58..30311f93a959 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -35,6 +35,7 @@
 #include <sys/epoll.h>
 #include <sys/stat.h>
 #include <libudev.h>
+#include <xf86drmMode.h>
 #include "igt.h"
 #include "igt_edid.h"
 #include "igt_sysfs.h"
@@ -89,7 +90,7 @@
  * @legacy-hdcp14:  Test HDCP1.4 content protection with legacy style commit.
  * @atomic-hdcp14:  Test HDCP1.4 content protection with atomic modesetting.
  * @atomic-dpms-hdcp14: Test HDCP1.4 content protection with atomic modesetting and DPMS.
- *
+ * @detection:      content type 1 that can be handled only through HDCP2.2.
  */
 
 /**
@@ -1271,6 +1272,25 @@ int igt_main()
 		}
 	}
 
+#if HAVE_UNIGRAF
+	igt_describe("Check if the HDCP connection is properly detected by the driver");
+	igt_subtest("detection") {
+		drmModeConnectorPtr connector;
+		igt_output_t *output;
+
+		unigraf_require_device(data.drm_fd);
+		connector = unigraf_get_connector(data.drm_fd);
+		output = igt_output_from_connector(&data.display, connector);
+		igt_assert(output);
+
+		unigraf_disable_hdcp();
+		igt_assert(!sink_hdcp2_capable(output));
+		unigraf_enable_hdcp();
+		sleep(igt_default_display_detect_timeout());
+		igt_assert(sink_hdcp2_capable(output));
+	}
+#endif
+
 	igt_fixture() {
 		test_content_protection_cleanup();
 		igt_display_fini(&data.display);

-- 
2.54.0

