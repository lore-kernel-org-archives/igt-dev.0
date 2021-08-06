Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EEC6EBF6
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:48:20 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:46:44 +0200
Message-Id: <20210806094649.21162-52-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 51/56] tests/kms_flip: Adopt to use
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

For newer gens kernel will reject relocations returning -EINVAL
so we should just provide the allocator handle to inject the hang.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/kms_flip.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index f2fce8d2a..e87d571a7 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -616,9 +616,9 @@ static void recreate_fb(struct test_output *o)
 	o->fb_info[o->current_fb_id].fb_id = new_fb_id;
 }
 
-static igt_hang_t hang_gpu(int fd)
+static igt_hang_t hang_gpu(int fd, uint64_t ahnd)
 {
-	return igt_hang_ring(fd, I915_EXEC_DEFAULT);
+	return igt_hang_ring_with_ahnd(fd, I915_EXEC_DEFAULT, ahnd);
 }
 
 static void unhang_gpu(int fd, igt_hang_t hang)
@@ -675,6 +675,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 	struct vblank_reply vbl_reply;
 	unsigned int target_seq;
 	igt_hang_t hang;
+	uint64_t ahnd = 0;
 
 	target_seq = o->vblank_state.seq_step;
 	/* Absolute waits only works once we have a frame counter. */
@@ -776,8 +777,11 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 	igt_print_activity();
 
 	memset(&hang, 0, sizeof(hang));
-	if (do_flip && (o->flags & TEST_HANG))
-		hang = hang_gpu(drm_fd);
+	if (do_flip && (o->flags & TEST_HANG)) {
+		if (is_i915_device(drm_fd))
+			ahnd = get_reloc_ahnd(drm_fd, 0);
+		hang = hang_gpu(drm_fd, ahnd);
+	}
 
 	/* try to make sure we can issue two flips during the same frame */
 	if (do_flip && (o->flags & TEST_EBUSY)) {
@@ -847,6 +851,8 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 		igt_assert(do_page_flip(o, new_fb_id, false) == expected_einval);
 
 	unhang_gpu(drm_fd, hang);
+	if (is_i915_device(drm_fd))
+		put_ahnd(ahnd);
 
 	*events = completed_events;
 
-- 
2.26.0
