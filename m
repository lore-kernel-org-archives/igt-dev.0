Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A186E167
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Nov 2021 06:50:11 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  4 Nov 2021 08:48:48 +0200
Message-Id: <20211104064848.15968-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/kms_cursor_legacy: Fix build
 warning
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

../tests/kms_cursor_legacy.c: In function ‘flip_vs_cursor_busy_crc’:
../tests/kms_cursor_legacy.c:1337:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
 1337 |  uint64_t ahnd = get_reloc_ahnd(display->drm_fd, 0);
       |  ^~~~~~~~

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/kms_cursor_legacy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index e48cdf6c..cd2f8498 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1333,8 +1333,10 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	igt_pipe_t *pipe_connected = &display->pipes[pipe];
 	igt_plane_t *plane_primary = igt_pipe_get_plane_type(pipe_connected, DRM_PLANE_TYPE_PRIMARY);
 	igt_crc_t crcs[2], test_crc;
+	uint64_t ahnd;
+
 	igt_require_intel(display->drm_fd);
-	uint64_t ahnd = get_reloc_ahnd(display->drm_fd, 0);
+	ahnd = get_reloc_ahnd(display->drm_fd, 0);
 
 	if (atomic)
 		igt_require(display->is_atomic);
-- 
2.29.2
