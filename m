Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A0710EC67
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 18:37:43 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id h14so6030409lfl.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Apr 2022 11:37:43 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Apr 2022 21:37:33 +0300
Message-Id: <20220407183733.7329-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220407183733.7329-1-juhapekka.heikkila@gmail.com>
References: <20220407183733.7329-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/kms_big_fb: Don't fill small
 fb during test setup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Change small fb not to be filled with green color, this will never
show anywhere and just take time while setting up test.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_big_fb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index b7bcc3401..7a8504017 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -420,9 +420,8 @@ static bool test_pipe(data_t *data)
 	if (igt_rotation_90_or_270(data->rotation))
 		igt_swap(width, height);
 
-	igt_create_color_fb(data->drm_fd, width, height,
-			    data->format, data->modifier,
-			    0, 1, 0, &data->small_fb);
+	igt_create_fb(data->drm_fd, width, height,
+		      data->format, data->modifier, &data->small_fb);
 
 	igt_output_set_pipe(data->output, data->pipe);
 
-- 
2.28.0
