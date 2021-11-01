Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECFB6E1ED
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Nov 2021 16:37:35 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id v4so1923818qtw.8
 for <igt-dev@lists.freedesktop.org>; Mon, 01 Nov 2021 09:37:35 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon,  1 Nov 2021 12:37:30 -0400
Message-Id: <20211101163730.2769897-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_cursor_legacy: igt_require_pipe_crc for
 flip_vs_cursor_crc
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
Cc: chunkuang.hu@kernel.org, petri.latvala@intel.com, seanpaul@chromium.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
test_init uses CRC in debugfs which is not supported by some drivers.

[How]
igt_require_pipe_crc before igt_pipe_crc_new is called.

Test: igt@kms_cursor_legacy@flip-vs-cursor-crc-{atomic,legacy} on
ChromeOS Jacuzzi (MTK)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_cursor_legacy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 81362807..b006e566 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1281,6 +1281,7 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
+	igt_require_pipe_crc(display->drm_fd);
 	pipe_crc = igt_pipe_crc_new(display->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
 
 	set_cursor_on_pipe(display, pipe, &cursor_fb);
-- 
2.33.1.1089.g2158813163f-goog
