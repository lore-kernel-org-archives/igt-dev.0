Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962C610E6A1
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 13:21:13 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 18:50:16 +0530
Message-Id: <20230609132019.508947-2-swati2.sharma@intel.com>
In-Reply-To: <20230609132019.508947-1-swati2.sharma@intel.com>
References: <20230609132019.508947-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] i915/kms_busy: Free spinners after use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Avoid leaking GEM objects between subtests, eventually leading to
warnings for leaking kernel resources at exit.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 tests/i915/kms_busy.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index 20d3058f..7c75926e 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -219,7 +219,7 @@ static void test_atomic_commit_hang(igt_display_t *dpy, igt_plane_t *primary,
 
 	igt_assert(read(dpy->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
 
-	igt_spin_end(t);
+	igt_spin_free(dpy->drm_fd, t);
 	put_ahnd(ahnd);
 }
 
@@ -304,9 +304,8 @@ test_pageflip_modeset_hang(igt_display_t *dpy,
 
 	igt_assert(read(dpy->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
 
-	igt_spin_end(t);
 	put_ahnd(ahnd);
-
+	igt_spin_free(dpy->drm_fd, t);
 	igt_remove_fb(dpy->drm_fd, &fb);
 }
 
-- 
2.25.1
