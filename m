Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBA7CAC593
	for <igt-dev@archiver.kernel.org>; Sat, 13 Sep 2025 00:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE48410ECF3;
	Sat, 13 Sep 2025 00:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fsl9bMJR";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9921010ECF1
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Sep 2025 00:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757721845;
 bh=zZXDKhi+8n8hUpHk875H3WdE4wWEZBUZYjMYS9zcEqM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fsl9bMJR+rjEYT2p3CP0HPy+5wOGM0x7BeBTPNSxUwwVg+j3rnQYn0teMtXNU+8ke
 6GyHI/CQWvPUS0+ZYdK9h8LsYAw1/xpr3kJkYFv/2MctLBmijc2xRyHavVe6hOAPCO
 +KsIBeLBqgdG1JStswXvFcBTZ8e6lTl2/Cmll8DQpCmkq0755O8qhnNbRGPskzqBbJ
 lEK3wb1+VTq6qS9xW3mmsC/55OoYFcXgHX09hVe72qApHgn7De5ytXSv3bow4jlUa6
 L/JS0ZC/GLJ1QXTzFftKiMfalrn4m0uf3pbzwS2TMi/5B7/ovljVjClr2oeARQYFtR
 EcSiyn6XCS2sw==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EFEFF17E1091;
 Sat, 13 Sep 2025 02:04:03 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 12 Sep 2025 20:02:59 -0400
Subject: [PATCH 7/9] tests/kms_colorop: Add tests for post-blend color pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250912-post-blend-colorops-v1-7-83fc62420cba@collabora.com>
References: <20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com>
In-Reply-To: <20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Alex Hung <alex.hung@amd.com>, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
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

Add additional tests that set colorops on the post-blend color pipeline,
as well as tests that set both the pre-blend and the post-blend color
pipelines.

Note: The tests with BT709 encoding/decoding split across pre- and
post-blend color pipelines fail on VKMS due to u16 clamping between the
pre- and post-blend color pipelines transformations.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 tests/kms_colorop.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index a19b1a19314d08491eab9977227a98605a26f915..e68a6e5d9cd57b57b66d99782fe76d841aa74fec 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -682,6 +682,19 @@ igt_main
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
+		{ { NULL }, { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "crtc-ctm_3x4_bt709_enc-ctm_3x4_bt709_dec" },
+		{ { NULL }, { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "crtc-ctm_3x4_bt709_dec-ctm_3x4_bt709_enc" },
+		{ { &kms_colorop_srgb_eotf, NULL }, { &kms_colorop_srgb_inv_eotf, NULL }, "plane-srgb_eotf-crtc-srgb_inv_eotf" },
+		{ { &kms_colorop_ctm_3x4_bt709_enc, NULL }, { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "plane-ctm_3x4_bt709_enc-crtc-ctm_3x4_bt709_dec" },
+		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, { &kms_colorop_ctm_3x4_bt709_enc, NULL }, "plane-ctm_3x4_bt709_dec-crtc-ctm_3x4_bt709_enc" },
 	};
 
 	struct {

-- 
2.50.1

