Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F1DCAC582
	for <igt-dev@archiver.kernel.org>; Sat, 13 Sep 2025 00:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E494810E055;
	Sat, 13 Sep 2025 00:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bfhpOX8F";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7156010ECF6
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Sep 2025 00:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757721848;
 bh=BHlxVd/bqgz78haYF4+qaSjZ/IGW0XP+P3ac9KmpqHU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bfhpOX8F1I3UhKKYU1hYuvgI3QPcnoCkNdLXU+PLgnwOzN7Rf0zjr3fgFOcyv9KNg
 5HDkBJ8epmuo6e9tL5QeCUW1pa2EyGE02fxZH3DBqojpYBHgpyXqy9wybu92wIuCSB
 t0TFYhrUVGFAonpE1y5XORbPDem7/o4z++ezQ9xZT8lkp5/HYssfpBCpwe59T0jpCH
 +lS+P3f9NCmOuiszyg3cf6axJyxnt+eDsXVYj3eN+8rEXS8TVN6BvUj5jqVuQarTVc
 RB3FAWctm6OBStX9LWEl5AFCVuwmO7uuWWThJPfGAu7g/Rp9nj+MMi0QQPqJzbtDH/
 EiMsW6+vtHGFA==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 050F417E12B8;
 Sat, 13 Sep 2025 02:04:06 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 12 Sep 2025 20:03:01 -0400
Subject: [PATCH 9/9] tests/kms_properties: Test colorop properties on CRTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250912-post-blend-colorops-v1-9-83fc62420cba@collabora.com>
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

Extend the colorop_property_tests to also test the colorop properties on
the CRTC, which are used for post-blend color pipelines.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 tests/kms_properties.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index e005ee6b35436a9305dbc3fa7de8460234091601..2d3bf9c85d0433e493e6f5f693fd56359ea32012 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -252,9 +252,28 @@ static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, i
 	igt_colorop_t *colorop;
 	int i;
 	int colorop_id = 0;
+	igt_pipe_t *pipe_obj = &display->pipes[pipe];
 
 	prepare_pipe(display, pipe, output, &fb);
 
+	igt_info("Testing colorop properties on crtc %s (output: %s)\n",
+			kmstest_pipe_name(pipe), output->name);
+
+	/* iterate over all color pipelines on pipe */
+	for (i = 0; i < pipe_obj->color_pipelines.num_color_pipelines; ++i) {
+		/* iterate over all colorops in pipeline*/
+		colorop = pipe_obj->color_pipelines.color_pipelines[i];
+		while (colorop) {
+			igt_info("Testing colorop properties on %s.#%d (output: %s)\n",
+				kmstest_pipe_name(pipe), colorop->id, output->name);
+			test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id, atomic, false);
+
+			colorop_id = igt_colorop_get_prop(display, colorop,
+							IGT_COLOROP_NEXT);
+			colorop = igt_find_colorop(display, colorop_id);
+		}
+	}
+
 	for_each_plane_on_pipe(display, pipe, plane) {
 		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
 			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);

-- 
2.50.1

