Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE47EE6FE23
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 18:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913EA10E2B7;
	Tue, 23 Dec 2025 18:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="NT80VXeE";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDB610E2BB
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 18:32:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766514762; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=djrwrSeNZPXHpHGqthCXoSZ+D1tENjvQO8jCWRNLk1FsZNdpZOlIkkSUILdaOA4NUuxGLsA5JyKfPUCW5ELzknqmrpJZEqquVruD31LAaBmUT5FtAMHsR9l+KT9mGwNOTmCpp/iaZtdGimx771AWwJwGZ9AHrJUb0XwjHcUGzmg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766514762;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sg4xVe58ItzPCzRX0lwfKfqrrhB7qkBIXiGePtWk1s4=; 
 b=TTV9FlAF/vqjs24kE24BhMJ3L+GjrOuSDPcjn4hJzQlxq3YCE7rmdSrP+hOIddb3Uqyz0pgv7HkCxeU/UeC/aKmE6qWmzM6GMXEys7wpG47vTKJfpRTu+AV6Ohh6w8nrL6DBKKlvMvoCWuXaAKbWeBoaUzlrgNEhL+QtFd+r6As=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766514762; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=sg4xVe58ItzPCzRX0lwfKfqrrhB7qkBIXiGePtWk1s4=;
 b=NT80VXeEWbtsETWcDj8wmGccsiY8IjN3vELLEO/USh/f1mnKWhVfHufWP4Y2Q7G8
 +zl72H3JhIyQdL4WxgsNS+VCMZceg/+G1HNIpsJqWj0LvZsBDyYiUgCxdbbZvlN1O+N
 Cd2tw8YA1cAN/+vjGatiTZx32ltEaKR8jTjVnolA=
Received: by mx.zohomail.com with SMTPS id 1766514760668307.7961288100473;
 Tue, 23 Dec 2025 10:32:40 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:31:54 -0300
Subject: [PATCH v2 08/10] tests/kms_colorop: Add tests for CRTC
 (post-blend) color pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-post-blend-colorops-v2-8-f40aca9795bd@collabora.com>
References: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
In-Reply-To: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766514731; l=3569;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=O/Jn32XTY8vxPDXOZiFflDOyLdQo1jC3ItpQemV4Ohc=;
 b=C6L6bfS5VLfPbPCs4YQ2GJRhCRyKbHSipF0BvQCiouK6P9EY+Nbv9+fUArC+FqWL6sbAlRG4C
 zIDKaZFE+unDTa1HdWZk5yFqJvrmWL37QokZjVudUKjtLRp1mgYCrUY
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Add additional tests that set colorops on the CRTC (post-blend) color
pipeline, as well as tests that set both the plane (pre-blend) and the
CRTC (post-blend) color pipelines.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 tests/kms_colorop.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 5315ede93..170142e54 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -33,6 +33,7 @@
  * arg[2]:
  *
  * @bypass:					Bypass Color Pipeline
+ *
  * @plane-srgb_eotf:				sRGB EOTF
  * @plane-srgb_inv_eotf:			sRGB Inverse EOTF
  * @plane-srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
@@ -63,6 +64,20 @@
  * @plane-multiply_inv_125:			Multiplier by inverse of 125
  * @plane-3dlut_17_12_rgb:			3D LUT with length 17, color depth 12, and traversal order = RGB
  *
+ * @crtc-srgb_eotf:				sRGB EOTF
+ * @crtc-srgb_inv_eotf:				sRGB Inverse EOTF
+ * @crtc-srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
+ * @crtc-ctm_3x4_50_desat:			3x4 matrix doing a 50% desaturation
+ * @crtc-ctm_3x4_overdrive:			3x4 matrix overdring all values by 50%
+ * @crtc-ctm_3x4_oversaturate:			3x4 matrix oversaturating values
+ * @crtc-ctm_3x4_bt709_enc:			BT709 encoding matrix
+ * @crtc-ctm_3x4_bt709_dec:			BT709 decoding matrix
+ * @crtc-ctm_3x4_bt709_enc_dec:			BT709 encoding matrix, followed by decoding matrix
+ * @crtc-ctm_3x4_bt709_dec_enc:			BT709 decoding matrix, followed by encoding matrix
+ *
+ * @plane-srgb_eotf-crtc-srgb_inv_eotf:		Plane sRGB EOTF, followed by CRTC sRGB Inverse EOTF
+ * @plane-ctm_3x4_bt709_enc-crtc-ctm_3x4_bt709_dec: Plane BT709 encoding matrix, followed by CRTC BT709 decoding matrix
+ *
  */
 
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
@@ -660,6 +675,18 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		{ { &kms_colorop_multiply_125, NULL }, { NULL }, "plane-multiply_125" },
 		{ { &kms_colorop_multiply_inv_125, NULL }, { NULL }, "plane-multiply_inv_125" },
 		{ { &kms_colorop_3dlut_17_12_rgb, NULL }, { NULL }, "plane-3dlut_17_12_rgb" },
+		{ { NULL }, { &kms_colorop_srgb_eotf, NULL }, "crtc-srgb_eotf" },
+		{ { NULL }, { &kms_colorop_srgb_inv_eotf, NULL }, "crtc-srgb_inv_eotf" },
+		{ { NULL }, { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "crtc-srgb_eotf-srgb_inv_eotf" },
+		{ { NULL }, { &kms_colorop_ctm_3x4_50_desat, NULL }, "crtc-ctm_3x4_50_desat" },
+		{ { NULL }, { &kms_colorop_ctm_3x4_overdrive, NULL }, "crtc-ctm_3x4_overdrive" },
+		{ { NULL }, { &kms_colorop_ctm_3x4_oversaturate, NULL }, "crtc-ctm_3x4_oversaturate" },
+		{ { NULL }, { &kms_colorop_ctm_3x4_bt709_enc, NULL }, "crtc-ctm_3x4_bt709_enc" },
+		{ { NULL }, { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "crtc-ctm_3x4_bt709_dec" },
+		{ { NULL }, { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "crtc-ctm_3x4_bt709_enc_dec" },
+		{ { NULL }, { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "crtc-ctm_3x4_bt709_dec_enc" },
+		{ { &kms_colorop_srgb_eotf, NULL }, { &kms_colorop_srgb_inv_eotf, NULL }, "plane-srgb_eotf-crtc-srgb_inv_eotf" },
+		{ { &kms_colorop_ctm_3x4_bt709_enc, NULL }, { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "plane-ctm_3x4_bt709_enc-crtc-ctm_3x4_bt709_dec" },
 	};
 
 	struct {

-- 
2.51.0

