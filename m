Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC405E6FE23
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 18:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E90010E2A9;
	Tue, 23 Dec 2025 18:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="AlXYrQ3Q";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9EE10E2A9
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 18:32:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766514738; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fTfQvFdHQUsVn8wllDamCo2aFFvfTuOyUpTQrs3kD1k6jFyKFyceyd8+YkPmDTHfCLByQbWK1TiHxUEgZ9qMHh66Fics/EoYnHsn6122cUemlNN/7W5Zpubkr24/e87Ole9jm3CuPXg5ST1Z19MR/bgKgup9+opneUPvQBsLIWw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766514738;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tXMtfEJI2vxhySgJdmNo1etuA3xo4HGYlQEPDjhjKBQ=; 
 b=oAPNkAdKa7PM2uVbyVoE96teDPu+mCDa5AUyMb32LlU03+AhxtslRomeX/ONzO1SQ6tHMOT+ZR4PSvcBq1JuJZaJVps3XoljiYl6K/LoZSiif6uY9NclGMo7+B8SDJIPGdHXVpvlwaWS9QbD9ZA2NB9OQdh5e/iIEeb0uKS2FNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766514737; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=tXMtfEJI2vxhySgJdmNo1etuA3xo4HGYlQEPDjhjKBQ=;
 b=AlXYrQ3QSaVGzizDczSEIu6wdaaItk8BLCL1A8xn9pkcPYPQx0aSZeCEZ20mFPU0
 5dLzQemxHoHzGY1FL742tZbzf771Hwjc//466gQdPpR38eade7TyWh6rsZQ+YpBqi7J
 ijFyfyGoRr+FoHGraH8YT/s8CK/ZzMzA9nO4FwDM=
Received: by mx.zohomail.com with SMTPS id 1766514735212708.1312404445943;
 Tue, 23 Dec 2025 10:32:15 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v2 00/10] Support CRTC (post-blend) color pipeline API
Date: Tue, 23 Dec 2025 15:31:46 -0300
Message-Id: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABLgSmkC/yWMQQqDMBAAvyJ7biDuVmP6leJhE9c2oMYmthTEv
 zfU4wzM7JAlBclwq3ZI8gk5xKUAXirwT14eosJQGFBjo22Nao15U26SZVA+TjHFNSsn3raEpuO
 6g1KuScbw/V/v/clJXu8y304JjrOUfp7DdqtG4ywbJO2xsV1NRjQzMQmP9uobHnxLpMVAfxw/X
 RzlHbEAAAA=
X-Change-ID: 20250912-post-blend-colorops-bec963278a18
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766514731; l=2805;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=2wDRAbp6RWCzDxY4AT9g/6/pnlKe5CWBNYRaNDEvRk4=;
 b=m9jx6wO9m9nxLWoHGoJqdXIQ6B/F89Q6t76JJDmasMI+9tfaUkR/mmI2+YSDofXN4JhCSw6NI
 DPLl+9AB7KICjHkxi/niOylGh9Z2+MIja3F3Y7hOh/VeL7xOph66QRF
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

This series introduces support for the KMS CRTC (post-blend) color
pipeline API, which is currently under review [1], and extends the test
coverage for it.

This series is based on the plane (pre-blend) color pipeline API IGT
series [2], already merged. Tested on VKMS.

Test @plane-ctm_3x4_bt709_enc-crtc-ctm_3x4_bt709_dec ("Plane BT709
encoding matrix, followed by CRTC BT709 decoding matrix") introduced by
this series, requires VKMS kernel patch [3] to fix a bug in the matrix
offset component multiplication.

[1] https://lore.kernel.org/all/20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com/#t
[2] https://lore.kernel.org/igt-dev/20251115001841.3563993-1-alex.hung@amd.com/
[3] https://lore.kernel.org/all/20251223-vkms-composer-fix-matrix-v1-1-10a979e06209@collabora.com/

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
Changes in v2:
- Aligned terminology between plane (pre-blend) and crtc (post-blend)
  color pipeline. Replaced all naming s/post-blend/crtc
- Fixed BT.709 test failure on VKMS due to 16-bit UNORM clamping.
- Fixed kms_color tests by properly checking CRTC color pipeline
  capabilities as test requirement.
- Link to v1: https://lore.kernel.org/igt-dev/20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com

---
Ariel D'Alessandro (1):
      lib/igt_color: Use BT.709 Y'Cb'Cr' color space matrix

Nícolas F. R. A. Prado (9):
      drm-uapi/drm: Sync with CRTC (post-blend) color pipeline commit
      lib/igt_kms: Store pointer to display instead of plane in colorop
      lib/igt_kms: Move color pipeline properties in igt_plane_t to struct
      lib/igt_kms: Support CRTC (post-blend) colorops
      tests/kms_colorop: Check for colorop unique id in CRTCs as well
      tests/kms_colorop: Allow specifying CRTC (post-blend) colorops
      tests/kms_colorop: Add tests for CRTC (post-blend) color pipeline
      tests/kms_properties: Ignore color properties in CRTC based on pipeline
      tests/kms_properties: Test colorop properties on CRTC

 include/drm-uapi/drm.h   |  19 +++
 lib/igt_color.h          |  12 +-
 lib/igt_kms.c            | 113 ++++++++++++-----
 lib/igt_kms.h            |  23 ++--
 tests/kms_color.c        |   7 ++
 tests/kms_color_helper.c |   3 +
 tests/kms_colorop.c      | 312 +++++++++++++++++++++++++++++++----------------
 tests/kms_properties.c   |  39 +++++-
 8 files changed, 378 insertions(+), 150 deletions(-)
---
base-commit: f7b9a7230c2598137e0aa3a3eaf94c5adc6330e7
change-id: 20250912-post-blend-colorops-bec963278a18

Best regards,
-- 
Ariel D'Alessandro <ariel.dalessandro@collabora.com>

