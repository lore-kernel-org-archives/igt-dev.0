Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B135BE6FE23
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 18:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580BF10E2C3;
	Tue, 23 Dec 2025 18:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="ClYYBfrf";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4357F10E2D4
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 18:32:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766514760; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jVUMOjRvohsv55XcYJTxQb7wQLwmKEEbPBRTr4Ld33a8pifRTHRtvzYOqQxh1ASUsVKj7uW5tFH1Zx3C5Y65JG/KOmefUibtaLwcEtqpzyJTanSs/7ETudM7Ov73GlIgkSGuHac0IbcHbnfbcs4GclH97PYg3l0Zl4m+4M0RUK8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766514760;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Q5NlnwDydl1pxF8/1dQwGcq1lbTq86uCbjXUg5W8Wmw=; 
 b=e/fpPkkflcAjQiQxLXDGhtO2LjjKYanW/rnPefr57fcNIuKx2wkKI/Jup8bwG5NkyIN2dnpB9sp/rnCz1gdukjS5Sk0FjiH5VdwHZ1ffwtqwLwPj1jC52VGON7ejJBSwm/sMePysFYv+couZwMlxsIs+BUVJ4fSjok3ooX+8qec=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766514760; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Q5NlnwDydl1pxF8/1dQwGcq1lbTq86uCbjXUg5W8Wmw=;
 b=ClYYBfrf0QeUDTydwFWsO3YXrDbaXD4tzFz2qYxWNXimzpqqEC4Qojmuke/dJl/1
 a03kjdLZvi/39fHYC+57OQCGBhkRcTBbtwrg00Dync7EZ65w3XDhccg4Se50r8mcquD
 pNWAu4dAR26FB3IWYypcfDmySMwJKI9uv5bt5M40=
Received: by mx.zohomail.com with SMTPS id 1766514757491357.81231125043723;
 Tue, 23 Dec 2025 10:32:37 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:31:53 -0300
Subject: [PATCH v2 07/10] lib/igt_color: Use BT.709 Y'Cb'Cr' color space matrix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-post-blend-colorops-v2-7-f40aca9795bd@collabora.com>
References: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
In-Reply-To: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766514731; l=2234;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=6UWqJKwM1jF91X1aNBM57nTS32kiYCyfbPUXsglJnkA=;
 b=4WAq8/zF1+m1kPUU8ISDJ1yWKWopFksNyNlsHk/l+0N7Q3Of/uK3gxnL8VTHadUAOzPQZZRpo
 J9fbNQgOaG+DRcqQZM+ZswDy4yP1QY9UWakXPha3q5M6m6TNS8dO8Fm
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

In order to test with BT709 encoding/decoding split across plane
(pre-blend) and CRTC (post-blend) color pipelines, a different encoding
matrix needs to be used.

On the kernel side, the vkms_composer will clamp pixel values to fit
16-bit UNORM between the pre- and post-blend color pipelines. Note that
this doesn't happen if the encoding/decoding is run on the same color
pipeline.

Currently, the BT.709 encoding matrix maps pixel components (from the
range [0x0, 0xffff]) into possible negative values, which then get
clamped, producing a bad result.

The BT.709 standard [0] defines an alternative representation of colors
by three coordinates Y'Cb'Cr' which are linear combinations of the
(non-linear) RGB coordinates.

According to these formulas, if RGB varies between [0.0, 1.0], then Y'
will vary between [0.0, 1.0], while Cb' and Cr' will vary between
[-0.5, 0.5].

Use BT.709 Y'Cb'Cr' color space matrix, adding the proper 0.5 offset to
the Cb' and Cr' components in the 3x4 encoding matrix. The resulting
pixel values then fits the 16-bit UNORM, fixing the clamping issue.

[0] https://www.itu.int/rec/R-REC-BT.709-6-201506-I/en

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 lib/igt_color.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/igt_color.h b/lib/igt_color.h
index 9fa8262af..947f79cc1 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -81,15 +81,15 @@ const igt_matrix_3x4_t igt_matrix_3x4_oversaturate = { {
 } };
 
 const igt_matrix_3x4_t igt_matrix_3x4_bt709_enc = { {
-	 0.2126,   0.7152,   0.0722,  0.0,
-	-0.09991, -0.33609,  0.436,   0.0,
-	 0.615,   -0.55861, -0.05639, 0.0
+	0.2126,   0.7152,   0.0722,   0.0,
+	-0.11457, -0.38543, 0.5,      0.5,
+	0.5,      -0.45415, -0.04585, 0.5,
 } };
 
 const igt_matrix_3x4_t igt_matrix_3x4_bt709_dec = { {
-	1.0,  0.0,      1.28033, 0.0,
-	1.0, -0.21482, -0.38059, 0.0,
-	1.0,  2.12798,  0.0,     0.0
+	1.0,     0.0,      1.57480,  -0.78740,
+	1.0,     -0.18732, -0.46812, 0.32772 ,
+	1.0,     1.85559,  0.0,      -0.92779,
 } };
 
 bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down);

-- 
2.51.0

