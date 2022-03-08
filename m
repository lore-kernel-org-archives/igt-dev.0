Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4716910E4D2
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 15:22:00 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Mar 2022 16:21:41 +0100
Message-Id: <20220308152141.2457841-9-maxime@cerno.tech>
In-Reply-To: <20220308152141.2457841-1-maxime@cerno.tech>
References: <20220308152141.2457841-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 8/8] tests/kms_writeback: Use a garbage X
 value to create fill our test buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Since we use buffers in XRGB8888, whatever value we have in X should be
ignored by the drivers and the hardware. However, since we always use
0xff in our test, whether that is the case or not cannot be determined.

Let's use a garbage value (but consistent across test runs) to make sure
it doesn't have any impact on the writeback output.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 tests/kms_writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 2366692865b7..4efd99713479 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -293,7 +293,7 @@ static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
 				igt_fb_t *in_fb, igt_fb_t *out_fbs[], int n_commits)
 {
 	int i = 0;
-	uint32_t in_fb_colors[2] = { 0xffff0000, 0xff00ff00 };
+	uint32_t in_fb_colors[2] = { 0x42ff0000, 0x4200ff00 };
 	uint32_t clear_color = 0xffffffff;
 
 	igt_crc_t cleared_crc, out_expected;
-- 
2.35.1
