Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B056510E1D4
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 21:03:59 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c62d61dc96so2141455ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 14:03:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 14:03:52 -0700
Message-ID: <20231011210352.671199-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_plane: Fix skips/fails vs CRC cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Helen Koike <helen.koike@collabora.com>,
 Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

test_fini() isn't necessarily called if a subtest skips/fails, leaving
the kernel drm_crtc_crc still in the open state, causing further
attempts to open/configure the crc to fail.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 9a515559c9b0..b3d6043496b1 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -84,6 +84,8 @@ static color_t blue  = { 0.0f, 0.0f, 1.0f };
 static void test_init(data_t *data, enum pipe pipe)
 {
 	igt_require(data->display.pipes[pipe].n_planes > 0);
+	if (data->pipe_crc)
+		igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_display_reset(&data->display);
@@ -92,6 +94,7 @@ static void test_init(data_t *data, enum pipe pipe)
 static void test_fini(data_t *data)
 {
 	igt_pipe_crc_free(data->pipe_crc);
+	data->pipe_crc = NULL;
 }
 
 enum {
-- 
2.41.0
