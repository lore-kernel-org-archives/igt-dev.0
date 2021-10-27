Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DAB6E7EA
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Oct 2021 18:24:13 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id bm16so3305333qkb.11
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Oct 2021 11:24:13 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 27 Oct 2021 14:24:04 -0400
Message-Id: <20211027182404.2189964-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_plane_cursor: igt_require_pipe_crc for
 test_init
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: seanpaul@chromium.org, petri.latvala@intel.com, arek@hiler.eu, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, Mark Yacoub <markyacoub@google.com>, Mark Yacoub <markyacoub@chromium.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
test_init uses CRC in debugfs which is not supported by some drivers.

[How]
igt_require_pipe_crc before igt_pipe_crc_new is called.

Test: igt@kms_plane_cursor@pipe-A-overlay-size-64 on ChromeOS Jacuzzi
(MTK)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_plane_cursor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 9bda4746..73085cc8 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -76,6 +76,7 @@ static void test_init(data_t *data, enum pipe pipe_id)
 	data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
 	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
+	igt_require_pipe_crc(data->drm_fd);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
 
-- 
2.33.0.1079.g6e70778dc9-goog
