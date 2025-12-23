Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA724E6FE23
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 18:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6CA10E2B3;
	Tue, 23 Dec 2025 18:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Y8uiuyEY";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84D110E2B3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 18:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766514768; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Gqgdm0kd9VRvfHsgdi+zWZb25s7eKjQ989OPOU6/mI/oXqNb1120h8DNKvcjeM8jShWgWcICNN1gjfW9UnxD5IHLaakM9RgUnX+JLBWk0KyAh4lI9Ui42rB9GRd4el87C0SurlZbBa/2TZx2OUQlw0v0KiWzL1iDXXsrvoTYm/I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766514768;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Xsgjk2ISMhqxCoaiu1MHDjMuD6BUQ96G0DS1xxTw5p4=; 
 b=kzHb5EQfxW6HbEo/mXQgqpijOzrgBadMbsfORBTzyAh8Ro5qJuPgFIGVWxJOA/z6HwGYYu59Ky44mF3Y0V9kteiZEKGR/hVELIia0I/CyDNeujj20bZeuVqGzsb2yj54EVwVejTT8ylDIy3p6aWb0mZySduilS0wUTPIG0VomkI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766514768; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Xsgjk2ISMhqxCoaiu1MHDjMuD6BUQ96G0DS1xxTw5p4=;
 b=Y8uiuyEYHc34U2NpfgG3T8oO6gIClA4tRdoHkDlqI7hzK+aRfh2x7Rhm9kxQlLWi
 vn2uXmkxYwvKTmkclm6waXR+9nhDP5lUzauzoByGeoq9PBKx0JCDIzLleI1L1BloWFD
 vvzKiLqJOeq6aLlgoN950JPR3y7aaeYcW+ICBCh8=
Received: by mx.zohomail.com with SMTPS id 1766514766842200.36270411960652;
 Tue, 23 Dec 2025 10:32:46 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:31:56 -0300
Subject: [PATCH v2 10/10] tests/kms_properties: Test colorop properties on CRTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-post-blend-colorops-v2-10-f40aca9795bd@collabora.com>
References: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
In-Reply-To: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766514731; l=1846;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=XPqDJ7ocE/TPWooje9D1gFB8UG9VHIel1eExBH9wWYM=;
 b=BremlokAe3yUUNLB533wl8DAuXWFsU7KuBQUsr15wjQ67C0TG272bHkR2cQHNC/SWCF0tGb+5
 1BQbr42EankBdFQeteLqq+PMdBnbCuunhJ9nhOC1FFGzSrNwcVIve9k
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

Extend the colorop_property_tests to also test the colorop properties on
the CRTC, which are used for CRTC (post-blend) color pipelines.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 tests/kms_properties.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 127031e7b..55186f255 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -252,9 +252,28 @@ static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, i
 	igt_colorop_t *colorop;
 	int i;
 	int colorop_id = 0;
+	igt_crtc_t *pipe_obj = &display->pipes[pipe];
 
 	prepare_pipe(display, pipe, output, &fb);
 
+	igt_info("Testing colorop properties on crtc %s (output: %s)\n",
+		 kmstest_pipe_name(pipe), output->name);
+
+	/* iterate over all color pipelines on pipe */
+	for (i = 0; i < pipe_obj->color_pipelines.num_color_pipelines; ++i) {
+		/* iterate over all colorops in pipeline*/
+		colorop = pipe_obj->color_pipelines.color_pipelines[i];
+		while (colorop) {
+			igt_info("Testing colorop properties on %s.#%d (output: %s)\n",
+				 kmstest_pipe_name(pipe), colorop->id, output->name);
+			test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id, atomic, false);
+
+			colorop_id = igt_colorop_get_prop(display, colorop,
+							  IGT_COLOROP_NEXT);
+			colorop = igt_find_colorop(display, colorop_id);
+		}
+	}
+
 	for_each_plane_on_pipe(display, pipe, plane) {
 		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
 			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);

-- 
2.51.0

