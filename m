Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5C2CAC582
	for <igt-dev@archiver.kernel.org>; Sat, 13 Sep 2025 00:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C746710E055;
	Sat, 13 Sep 2025 00:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="O+z33Ec5";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705B010E055
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Sep 2025 00:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757721835;
 bh=5111/UQeF7wMdB8kZXdl6smKP35xnfgZkYWxf2OySE4=;
 h=From:Subject:Date:To:Cc:From;
 b=O+z33Ec5B9F2E49721OIvh/9ihZwD3v6EAl4/ODC+F8ZW8pf5b5TdseKKOX1ZC18Q
 iohtNvKshfTpAaDAMIG0Z6DNyUqnBfw5+U4lSoMTsLRIDTJlAun4F8luAUYlPUM9kH
 cxLpN1hsAgHy36LelU3PLBd984ViBzhBzOdKGf2+YQgNk0qN20uWsYjgnh9awJQ1BQ
 dOCss2wLfuGGgITGVEwcHxK1qb0bHcU6t6fefkzdKQ032MrMk2lnfc6ucat+/OuDkU
 o0vcldzxredrj0Jet1pwScWEny/ZyYxMG9gCCr/ZbRMuxOm0YySj4yrCOIfJR2cDb7
 6yVAcDvW0gwTg==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B059D17E1091;
 Sat, 13 Sep 2025 02:03:53 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/9] Support post-blend color pipeline API
Date: Fri, 12 Sep 2025 20:02:52 -0400
Message-Id: <20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKy0xGgC/x3MSwqAMAwA0atI1gZsxe9VxIXWqAFpSiMiiHe3u
 HyLmQeUIpNCnz0Q6WJl8Qkmz8Dtk98IeUkGW9iq6IzFIHrifJBf0MkhUYLiTK6rS9u0k2khlSH
 Syvd/Hcb3/QB2YSWTZQAAAA==
X-Change-ID: 20250912-post-blend-colorops-bec963278a18
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

This series introduces support for the KMS post-blend color pipeline
API, which is currently under review as an RFC [1], and extends the test
coverage for it.

This series is based on the pre-blend color pipeline API IGT series [2].

Tested on VKMS. At the moment the post-blend color pipeline support in
VKMS is only available at the development branch [3], but it will be
added to the kernel patch series submission for v2.

Caveats:

* The new tests

  kms_colorop@xr24-xr24-plane-ctm_3x4_bt709_dec-crtc-ctm_3x4_bt709_enc
  kms_colorop@xr24-xr24-plane-ctm_3x4_bt709_enc-crtc-ctm_3x4_bt709_dec

  fail when running on the VKMS driver due to clamping to u16 happening
  in-between pre- and post-blend pipelines.

* The tests

  kms_color@gamma
  kms_color@invalid-gamma-lut-sizes
  kms_color@legacy-gamma-reset

  now get skipped since DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE is set
  in the common igt_display_require(), hiding the now deprecated color
  properties (GAMMA_LUT, DEGAMMA_LUT, CTM) required for those tests.

[1] https://lore.kernel.org/dri-devel/20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com/
[2] https://lore.kernel.org/igt-dev/20250815040659.3321102-1-alex.hung@amd.com/
[3] https://gitlab.collabora.com/nfraprado/linux/-/commits/b4/mtk-post-blend-color-pipeline

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (9):
      include/drm-uapi: Sync with drm-next
      lib/igt_kms: Store pointer to display instead of plane in colorop
      lib/igt_kms: Move color pipeline properties in igt_plane_t to struct
      lib/igt_kms: Support post-blend colorops
      tests/kms_colorop: Check for colorop unique id in CRTCs as well
      tests/kms_colorop: Allow specifying post-blend colorops
      tests/kms_colorop: Add tests for post-blend color pipeline
      tests/kms_properties: Ignore color properties in CRTC based on pipeline
      tests/kms_properties: Test colorop properties on CRTC

 include/drm-uapi/drm.h |  16 ++++
 lib/igt_kms.c          | 111 +++++++++++++++++++-------
 lib/igt_kms.h          |  23 ++++--
 tests/kms_colorop.c    | 207 ++++++++++++++++++++++++++++++++++---------------
 tests/kms_properties.c |  39 +++++++++-
 5 files changed, 296 insertions(+), 100 deletions(-)
---
base-commit: 302ff647cccb615f32942cdbe0e8084fe462cd05
change-id: 20250912-post-blend-colorops-bec963278a18

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

