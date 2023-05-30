Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B5310E13B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 13:31:15 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2af1822b710so46881631fa.1
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 06:31:15 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 30 May 2023 16:31:09 +0300
Message-Id: <20230530133109.5735-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Fix special handling
 for Intel CHV
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

Match software rendering round to what hardware rendering round did
on Intel CHV.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 3a353a03..61a0d65e 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -253,6 +253,10 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 			igt_assert_crc_equal(hwcrc, &crc_after);
 		}
 	} else {
+		/* If on broken situation on CHV match what hw round did */
+		if (chv_cursor_broken(data, x) && cursor_visible(data, x, y))
+			return;
+
 		/* Now render the same in software and collect crc */
 		swbufidx = (data->primary->drm_plane->fb_id ==
 			    data->primary_fb[SWCOMPARISONBUFFER1].fb_id) ?
-- 
2.25.1
