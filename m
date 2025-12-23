Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50623E6FE23
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 18:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF55E10E2AF;
	Tue, 23 Dec 2025 18:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="QkVPfTei";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE1C10E2B3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 18:32:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766514766; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=R4TlQODQnml73aQ7Eg8wA8SdVUBUAfKAfhi6fj0qqzVceOBGOUlAoE2fqL0xfT63Op+0whQRSjyQRSJZWgqwwYUtE87aCpvxZWlLxLdpiJXksmqV5Qmf+C+QHSNs5CcDmvuaMb1N5MqCDlePZsd+JlSETue3slfJrQI5iJSBdDE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766514766;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=R5+hy5UdhQ7GHCDc6C3hdvpgLlV1JPwwM0yolGKZ6WY=; 
 b=Rlz8KGk5lmbRNG+9GKka71scvKoYcUVkCUqLUpDkDem5+1RKlB4pV3FKny+4z8Wq7WEyLR40KP1ku2a2HCBFsLeCbRQ7QOj2KTHTxCjbavx2uTP/gyOT/4oZgMTvXOVpt7bPOy1nHeWtq9nO+Epq4Qa1Irk774+oJb8e5IlAZys=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766514766; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=R5+hy5UdhQ7GHCDc6C3hdvpgLlV1JPwwM0yolGKZ6WY=;
 b=QkVPfTeiylvTyD7X+x0rpx7L77VuhLLiQjTqlFnpqngpMyHCIKoP5TRABQIaKxrj
 qrsAvgBGO6773BUZSTVdYFIY1z2F40L9ZsaGSXDA6LjG9vzIwwS4gmxq8syOcCR9vm/
 KAGz2AvI7getZL/RptJ6xoRMmZQVi3QWZ4K8TKxo=
Received: by mx.zohomail.com with SMTPS id 1766514763666933.036323872383;
 Tue, 23 Dec 2025 10:32:43 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:31:55 -0300
Subject: [PATCH v2 09/10] tests/kms_properties: Ignore color properties in
 CRTC based on pipeline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-post-blend-colorops-v2-9-f40aca9795bd@collabora.com>
References: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
In-Reply-To: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766514731; l=1541;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=BGr/g77YvCGc7HStz52NMJByLgUFyNoS/4DdBAXYUr8=;
 b=h2fSLWTW278Uo5wBfAwn/WURHE92sSsWTpm964AIRdJW5UzcStJ1M3jkxiidFMtVY7LJ/KZyR
 U9DpC313cDuCaKBKgqFwS2IOJaATc4PSueu1AcoQ7rhvJSU4Jq7prhX
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

Ignore color-related properties -the new COLOR_PIPELINE and now legacy
gamma and ctm properties- in the CRTC based on the status of the color
pipeline client cap.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 tests/kms_properties.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 41f4e4145..127031e7b 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -122,6 +122,20 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
 		if (has_color_pipeline && !strcmp(name, "COLOR_ENCODING"))
 			return true;
 
+		break;
+	case DRM_MODE_OBJECT_CRTC:
+		if (!has_color_pipeline && !strcmp(name, "COLOR_PIPELINE"))
+			return true;
+
+		if (has_color_pipeline && !strcmp(name, "GAMMA_LUT"))
+			return true;
+
+		if (has_color_pipeline && !strcmp(name, "DEGAMMA_LUT"))
+			return true;
+
+		if (has_color_pipeline && !strcmp(name, "CTM"))
+			return true;
+
 		break;
 	default:
 		break;
@@ -293,7 +307,7 @@ static void run_crtc_property_tests(igt_display_t *display, enum pipe pipe, igt_
 
 	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC,
 			igt_crtc_for_pipe(display, pipe)->crtc_id, atomic,
-			false);
+			display->has_crtc_color_pipeline);
 
 	cleanup_pipe(display, pipe, output, &fb);
 }

-- 
2.51.0

