Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875B889DF7
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:28:22 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:26:53 +0200
Message-Id: <20210810052711.7866-48-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 47/65] tests/kms_busy: Adopt to use
 allocator
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
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/kms_busy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_busy.c b/tests/kms_busy.c
index a60ff6b05..6cbdfa66a 100644
--- a/tests/kms_busy.c
+++ b/tests/kms_busy.c
@@ -78,11 +78,13 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
 	struct pollfd pfd = { .fd = dpy->drm_fd, .events = POLLIN };
 	struct drm_event_vblank ev;
 	IGT_CORK_FENCE(cork);
+	uint64_t ahnd = get_reloc_ahnd(dpy->drm_fd, 0);
 	igt_spin_t *t;
 	int fence;
 
 	fence = igt_cork_plug(&cork, dpy->drm_fd);
 	t = igt_spin_new(dpy->drm_fd,
+			 .ahnd = ahnd,
 			 .fence = fence,
 			 .dependency = fb->gem_handle,
 			 .flags = IGT_SPIN_FENCE_IN);
@@ -130,6 +132,7 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
 	}
 
 	igt_spin_free(dpy->drm_fd, t);
+	put_ahnd(ahnd);
 }
 
 static void test_flip(igt_display_t *dpy, int pipe, bool modeset)
@@ -183,7 +186,9 @@ static void test_flip(igt_display_t *dpy, int pipe, bool modeset)
 static void test_atomic_commit_hang(igt_display_t *dpy, igt_plane_t *primary,
 				    struct igt_fb *busy_fb)
 {
+	uint64_t ahnd = get_reloc_ahnd(dpy->drm_fd, 0);
 	igt_spin_t *t = igt_spin_new(dpy->drm_fd,
+				     .ahnd = ahnd,
 				     .dependency = busy_fb->gem_handle,
 				     .flags = IGT_SPIN_NO_PREEMPTION);
 	struct pollfd pfd = { .fd = dpy->drm_fd, .events = POLLIN };
@@ -214,6 +219,7 @@ static void test_atomic_commit_hang(igt_display_t *dpy, igt_plane_t *primary,
 	igt_assert(read(dpy->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
 
 	igt_spin_end(t);
+	put_ahnd(ahnd);
 }
 
 static void test_hang(igt_display_t *dpy,
@@ -265,6 +271,7 @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
 	igt_output_t *output;
 	igt_plane_t *primary;
 	igt_spin_t *t;
+	uint64_t ahnd = get_reloc_ahnd(dpy->drm_fd, 0);
 
 	output = set_fb_on_crtc(dpy, pipe, &fb);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -272,6 +279,7 @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
 	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	t = igt_spin_new(dpy->drm_fd,
+			 .ahnd = ahnd,
 			 .dependency = fb.gem_handle,
 			 .flags = IGT_SPIN_NO_PREEMPTION);
 
@@ -285,6 +293,7 @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
 	igt_assert(read(dpy->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
 
 	igt_spin_end(t);
+	put_ahnd(ahnd);
 
 	igt_remove_fb(dpy->drm_fd, &fb);
 }
-- 
2.26.0
