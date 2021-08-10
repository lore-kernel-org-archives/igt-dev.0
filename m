Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFC989DEA
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:27:27 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:26:09 +0200
Message-Id: <20210810052711.7866-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 03/65] lib/igt_gt: Add passing ahnd as an
 argument to igt_hang
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

Required as spinner is used, see gem_ringfill.c

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_gt.c | 21 ++++++++++++++++++++-
 lib/igt_gt.h |  4 ++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index c049477db..a0ba04cc1 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -269,7 +269,8 @@ static bool has_ctx_exec(int fd, unsigned ring, uint32_t ctx)
  * Returns:
  * Structure with helper internal state for igt_post_hang_ring().
  */
-igt_hang_t igt_hang_ctx(int fd, uint32_t ctx, int ring, unsigned flags)
+static igt_hang_t __igt_hang_ctx(int fd, uint64_t ahnd, uint32_t ctx, int ring,
+				 unsigned flags)
 {
 	struct drm_i915_gem_context_param param;
 	igt_spin_t *spin;
@@ -298,6 +299,7 @@ igt_hang_t igt_hang_ctx(int fd, uint32_t ctx, int ring, unsigned flags)
 		context_set_ban(fd, ctx, 0);
 
 	spin = __igt_spin_new(fd,
+			      .ahnd = ahnd,
 			      .ctx_id = ctx,
 			      .engine = ring,
 			      .flags = IGT_SPIN_NO_PREEMPTION);
@@ -305,6 +307,17 @@ igt_hang_t igt_hang_ctx(int fd, uint32_t ctx, int ring, unsigned flags)
 	return (igt_hang_t){ spin, ctx, ban, flags };
 }
 
+igt_hang_t igt_hang_ctx(int fd, uint32_t ctx, int ring, unsigned flags)
+{
+	return __igt_hang_ctx(fd, 0, ctx, ring, flags);
+}
+
+igt_hang_t igt_hang_ctx_with_ahnd(int fd, uint64_t ahnd, uint32_t ctx, int ring,
+				  unsigned flags)
+{
+	return __igt_hang_ctx(fd, ahnd, ctx, ring, flags);
+}
+
 /**
  * igt_hang_ring:
  * @fd: open i915 drm file descriptor
@@ -322,6 +335,12 @@ igt_hang_t igt_hang_ring(int fd, int ring)
 	return igt_hang_ctx(fd, 0, ring, 0);
 }
 
+igt_hang_t igt_hang_ring_with_ahnd(int fd, int ring, uint64_t ahnd)
+{
+	return igt_hang_ctx_with_ahnd(fd, ahnd, 0, ring, 0);
+}
+
+
 /**
  * igt_post_hang_ring:
  * @fd: open i915 drm file descriptor
diff --git a/lib/igt_gt.h b/lib/igt_gt.h
index d87fae2d3..ceb044b86 100644
--- a/lib/igt_gt.h
+++ b/lib/igt_gt.h
@@ -46,10 +46,14 @@ void igt_disallow_hang(int fd, igt_hang_t arg);
 #define HANG_POISON 0xc5c5c5c5
 
 igt_hang_t igt_hang_ctx(int fd, uint32_t ctx, int ring, unsigned flags);
+igt_hang_t igt_hang_ctx_with_ahnd(int fd, uint64_t ahnd, uint32_t ctx, int ring,
+				  unsigned flags);
+
 #define HANG_ALLOW_BAN 1
 #define HANG_ALLOW_CAPTURE 2
 
 igt_hang_t igt_hang_ring(int fd, int ring);
+igt_hang_t igt_hang_ring_with_ahnd(int fd, int ring, uint64_t ahnd);
 void igt_post_hang_ring(int fd, igt_hang_t arg);
 
 void igt_force_gpu_reset(int fd);
-- 
2.26.0
