Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6A87360C
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Nov 2021 14:59:14 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id k29so3144760qve.6
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Nov 2021 07:59:14 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed,  3 Nov 2021 10:59:09 -0400
Message-Id: <20211103145909.3106317-1-markyacoub@chromium.org>
In-Reply-To: <20211101163730.2769897-1-markyacoub@chromium.org>
References: <20211101163730.2769897-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2] tests/kms_cursor_legacy: igt_require_pipe_crc
 for flip-vs-cursor{-busy}-crc
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
flip_vs_cursor_crc and flip_vs_cursor_busy_crc use CRC in debugfs which is
not supported by some drivers.

[How]
igt_require_pipe_crc in igt_fixture before the subtests start.

Test: igt@kms_cursor_legacy@flip-vs-cursor{-busy}-crc-{atomic,legacy} on
ChromeOS Jacuzzi (MTK)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_cursor_legacy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 81362807..28e89fa6 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1516,6 +1516,8 @@ igt_main
 	/*Test description for cursor-crc tests*/
 	igt_describe("Test will first does a page flip and then cursor update");
 	igt_subtest_group {
+		igt_fixture
+			igt_require_pipe_crc(display.drm_fd);
 
 		igt_subtest("flip-vs-cursor-crc-legacy")
 			flip_vs_cursor_crc(&display, false);
@@ -1527,6 +1529,8 @@ igt_main
 	/*Test description for busy-crc tests*/
 	igt_describe("this test perform a busy bo update followed by a cursor update");
 	igt_subtest_group {
+		igt_fixture
+			igt_require_pipe_crc(display.drm_fd);
 
 		igt_subtest("flip-vs-cursor-busy-crc-legacy")
 			flip_vs_cursor_busy_crc(&display, false);
-- 
2.34.0.rc0.344.g81b53c2807-goog
