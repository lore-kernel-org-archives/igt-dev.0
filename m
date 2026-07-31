Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA8DC55174
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7029310E210;
	Fri, 31 Jul 2026 18:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="a6Oak3tv";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D797210F38E
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:22:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AD09A1A1370
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:22:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8232B6039A;
 Fri, 31 Jul 2026 18:22:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A2D1D11C16C44; 
 Fri, 31 Jul 2026 20:22:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1785522123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qxXW3D30Kx9BttCZKJMRPfy2+sGUbG+bPUEOAxIyql8=;
 b=a6Oak3tvGdR0kiAGfrKLEkL+95X8YroZtApUDs7ws2faxe+BmOfb1HUgMoQrSnFPlae+Vn
 Rjaek+92STVsYMPK0zZCDnbnNPwfZWda+HmAFf2qt2hcgxdvJnpk7zqBuslRQkC+gUpyo8
 x8ROtFD/36gyoTgMlpqoPLepFuDZjy/ZFPPpq7FP7D+1fXry0CKavc2SIm4Inh9PqBPVqZ
 pic3ITuU6SQIibLHMlFU8iOZRUT/CH9q/ZytqlzN81BbSFZq2PabNDbTVOIsVB5tWUGQfB
 VAdQ0xH14VqNuvGdrduUiPAsx/q9xyyWig5pMorwnx9e4JE6e8o4RmyYZG1i6g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 31 Jul 2026 20:21:54 +0200
Subject: [PATCH i-g-t 1/4] tests/kms_content_protection: Avoid using
 internal pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-b4-unigraf-hdcp-v1-1-495df88ebbbd@google.com>
References: <20260731-b4-unigraf-hdcp-v1-0-495df88ebbbd@google.com>
In-Reply-To: <20260731-b4-unigraf-hdcp-v1-0-495df88ebbbd@google.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, thomas.petazzoni@bootlin.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4381; i=fomys@google.com;
 h=from:subject:message-id; bh=zaSn6YGRo2t7klsZdKo/xdNes4keoY0CJadsDOWB9xc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBqbOfEXP2pRibkKeaRNoQshqUGbGalGn4W/3WIp
 19bMWDICy2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCamznxBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOIGIQ/8Cp3w089DOFwk7sMdRwKUddpvCRuH0tr
 Dret+VI1pLCgy8i/aCaoZhKmNichbvAKkpknQMC5Lp0eirWe4Cob90V4U9SS0QDDWfflTEanmmt
 rA+HerJTmBpVKSz+I3cXeUOx8cCvZQYoRT0/7JJrIq2gjTKtGs9MUytBkGzVCCTCMttpVsfz9qC
 oUAcczDEfP8HCtrPOOf2mnkgnF4nfudkVGrlY0yql42XKmTMWOMWCXrBMjRKYRDE3hLdajgtw/F
 zcP/AXI5QH7l8rxR9MKOMX8iAlYk8OQkM9bHFgLUHN+YXauOBJJxeYKD4A0JFmbWF0o4B27VIx1
 mrwz+FHXcK1MXxMtjbcLZvvhZVvS181IHNDBjVQ3ZEkK9F2UT4uhhE0HNko3Ubautl1orSqSFFU
 XogPebD8gVwzXD5yBUImk4QU7JGS838iB2A7/8ST/+rNilGbJ1ABIEu4OkF6QL0C7PFFSW1wmLT
 gT+Ayi3yypBqfVhOUs7bwion2svqF+wuVkOYfRZmtVMz3oBpQ/ZPgA1jGBZAGdKdCOZVyAbGYqJ
 T3skf3ab/69qNcDqxSSFSfUxQBPaNAqbcX3/xuhcUfnFTyTudh+wV0513bCrc4cu4/FjYGVQD++
 AYYrVMUgIBLYsBjU8XjQBgghl6emp1E174xCHONoo8xV2tynK9+g=
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

output->name is an internal pointer. Replace usage of this pointer by the
existing igt_output_name helper.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_content_protection.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index d931ce7682be..133060af3c0a 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -558,7 +558,7 @@ static bool sink_hdcp_capable(igt_output_t *output)
 	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
 	int fd;
 
-	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
+	fd = igt_debugfs_connector_dir(data.drm_fd, igt_output_name(output), O_RDONLY);
 	if (fd < 0)
 		return false;
 
@@ -586,7 +586,7 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
 	int fd;
 
-	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
+	fd = igt_debugfs_connector_dir(data.drm_fd, igt_output_name(output), O_RDONLY);
 	if (fd < 0)
 		return false;
 
@@ -634,11 +634,11 @@ static bool output_hdcp_capable(igt_output_t *output, int content_type)
 
 		if (content_type && !sink_hdcp2_capable(output)) {
 			igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
-				 output->name);
+				 igt_output_name(output));
 			return false;
 		} else if (!sink_hdcp_capable(output)) {
 			igt_info("\tSkip %s (Sink has no HDCP support)\n",
-				 output->name);
+				 igt_output_name(output));
 			return false;
 		}
 
@@ -650,8 +650,8 @@ static void set_i915_force_hdcp14(igt_output_t *output)
 	int fd, ret;
 	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
 
-	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
-	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", output->name);
+	fd = igt_debugfs_connector_dir(data.drm_fd, igt_output_name(output), O_RDONLY);
+	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", igt_output_name(output));
 
 	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf, sizeof(buf));
 	if (ret <= 0) {
@@ -666,7 +666,7 @@ static void set_i915_force_hdcp14(igt_output_t *output)
 	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf, sizeof(buf));
 	igt_assert_f(ret > 0 && strstr(buf, "yes"),
 			 "i915_force_hdcp14 is not set to 'yes' on %s debugfs\n",
-			 output->name);
+			 igt_output_name(output));
 
 	close(fd);
 }
@@ -676,8 +676,8 @@ static void reset_i915_force_hdcp14(igt_output_t *output)
 	int fd, ret;
 	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
 
-	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
-	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", output->name);
+	fd = igt_debugfs_connector_dir(data.drm_fd, igt_output_name(output), O_RDONLY);
+	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", igt_output_name(output));
 
 	ret = igt_sysfs_write(fd, "i915_force_hdcp14", "0", 2);
 	igt_require_f(ret > 0, "i915_force_hdcp14 is not disabled\n");
@@ -747,7 +747,7 @@ static int get_hdcp_outputs(igt_display_t *display, int content_type,
 
 		if (is_output_hdcp_test_exempt(output)) {
 			igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
-				 output->name);
+				 igt_output_name(output));
 			continue;
 		}
 
@@ -796,7 +796,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 				set_i915_force_hdcp14(output);
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
-				      output->name)
+				      igt_output_name(output))
 				test_content_protection_on_output(output,
 								  crtc,
 								  commit_style,
@@ -935,7 +935,7 @@ test_content_protection_mst(int content_type)
 			}
 		}
 
-		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
+		igt_assert_f(pipe_found, "No valid pipe found for %s\n", igt_output_name(output));
 
 		igt_output_set_crtc(output, crtc);
 		prepare_modeset_on_mst_output(output, false);
@@ -1012,7 +1012,7 @@ static void test_content_protection_cleanup(void)
 		if (val == CP_UNDESIRED)
 			continue;
 
-		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
+		igt_info("CP Prop being UNDESIRED on %s\n", igt_output_name(output));
 		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
 

-- 
2.54.0

