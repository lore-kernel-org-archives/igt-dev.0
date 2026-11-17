Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532A1606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 08:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BD910E740;
	Wed, 18 Nov 2026 08:01:44 +0000 (UTC)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6627810E052
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 10:34:01 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.23])
 by APP-03 (Coremail) with SMTP id rQCowADX4JGWLfxq28o5AQ--.12364S2;
 Tue, 17 Nov 2026 18:33:59 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH i-g-t] lib/igt_kms: Try all blend modes when resetting it
Date: Tue, 17 Nov 2026 18:33:56 +0800
Message-ID: <20261117103356.303340-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADX4JGWLfxq28o5AQ--.12364S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF45KFWDJFWxGw4rAryxKrg_yoW8Aw17pw
 4UAFWjyF15ZF97tFZ7Jw1Iqa93ua1fGr1qvr4akw42vw4YqFyfCr1IyFn3uF1UXry8C3yj
 gw10kan8Wr1agFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
 MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
 v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
 xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Mailman-Approved-At: Wed, 18 Nov 2026 08:00:41 +0000
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since Linux 7.3, the pixel blend mode property of planes would be
present (and required when the plane supports formats w/ alpha) even
when Pre-multiplied isn't supported, which leads to assertion failure in
igt_plane_reset().

Add logic to try all possible values for this property mimicking the
logic of kernel deciding the default value.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 lib/igt_kms.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 915c6a8a2..789da08b3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2644,6 +2644,22 @@ static int get_drm_plane_type(int drm_fd, uint32_t plane_id)
 	return DRM_PLANE_TYPE_OVERLAY;
 }
 
+static void igt_plane_reset_blend_mode(igt_plane_t *plane)
+{
+	bool result;
+
+	result = igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Pre-multiplied");
+	if (result)
+		return;
+
+	result = igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
+	if (result)
+		return;
+
+	result = igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "None");
+	igt_assert(result);
+}
+
 static void igt_plane_reset(igt_plane_t *plane)
 {
 	igt_display_t *display = plane->crtc->display;
@@ -2679,7 +2695,7 @@ static void igt_plane_reset(igt_plane_t *plane)
 		igt_plane_set_prop_value(plane, IGT_PLANE_ROTATION, IGT_ROTATION_0);
 
 	if (igt_plane_has_prop(plane, IGT_PLANE_PIXEL_BLEND_MODE))
-		igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Pre-multiplied");
+		igt_plane_reset_blend_mode(plane);
 
 	if (igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0xffff);
-- 
2.56.0

