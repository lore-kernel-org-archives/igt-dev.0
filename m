Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4038C6EBED
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:48:19 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:46:43 +0200
Message-Id: <20210806094649.21162-51-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 50/56] tests/kms_cursor_legacy: Adopt to
 use allocator
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Petri Latvala <petri.latvala@intel.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

v2: Don't query i915 for relocations on AMD devices (Rodrigo)

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 tests/kms_cursor_legacy.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 75a822c4e..0f0df951b 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -517,6 +517,7 @@ static void basic_flip_cursor(igt_display_t *display,
 	struct igt_fb fb_info, cursor_fb, cursor_fb2, argb_fb;
 	unsigned vblank_start;
 	enum pipe pipe = find_connected_pipe(display, false);
+	uint64_t ahnd = (flags & BASIC_BUSY) ? get_reloc_ahnd(display->drm_fd, 0) : 0;
 	igt_spin_t *spin;
 	int i, miss1 = 0, miss2 = 0, delta;
 
@@ -548,6 +549,7 @@ static void basic_flip_cursor(igt_display_t *display,
 		spin = NULL;
 		if (flags & BASIC_BUSY)
 			spin = igt_spin_new(display->drm_fd,
+					    .ahnd = ahnd,
 					    .dependency = fb_info.gem_handle);
 
 		/* Start with a synchronous query to align with the vblank */
@@ -631,6 +633,7 @@ static void basic_flip_cursor(igt_display_t *display,
 		igt_remove_fb(display->drm_fd, &argb_fb);
 	if (cursor_fb2.gem_handle)
 		igt_remove_fb(display->drm_fd, &cursor_fb2);
+	put_ahnd(ahnd);
 }
 
 static int
@@ -1319,6 +1322,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	igt_pipe_t *pipe_connected = &display->pipes[pipe];
 	igt_plane_t *plane_primary = igt_pipe_get_plane_type(pipe_connected, DRM_PLANE_TYPE_PRIMARY);
 	igt_crc_t crcs[2], test_crc;
+	uint64_t ahnd = get_reloc_ahnd(display->drm_fd, 0);
 
 	if (atomic)
 		igt_require(display->is_atomic);
@@ -1366,6 +1370,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 		igt_spin_t *spin;
 
 		spin = igt_spin_new(display->drm_fd,
+				    .ahnd = ahnd,
 				    .dependency = fb_info[1].gem_handle);
 
 		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
@@ -1394,6 +1399,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	igt_remove_fb(display->drm_fd, &fb_info[1]);
 	igt_remove_fb(display->drm_fd, &fb_info[0]);
 	igt_remove_fb(display->drm_fd, &cursor_fb);
+	put_ahnd(ahnd);
 }
 
 igt_main
-- 
2.26.0
