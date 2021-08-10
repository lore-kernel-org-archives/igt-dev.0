Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC69B6E029
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 10:54:07 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 12:53:00 +0200
Message-Id: <20210810105323.31375-32-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
References: <20210810105323.31375-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 31/54] tests/gem_request_retire: Add
 allocator support
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

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

When relocations are not available tests must assign addresses to objects
by themselves instead of relying on the driver. We use allocator for
that purpose.

Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_request_retire.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_request_retire.c b/tests/i915/gem_request_retire.c
index 3df54f2a5..da9d405ed 100644
--- a/tests/i915/gem_request_retire.c
+++ b/tests/i915/gem_request_retire.c
@@ -63,21 +63,29 @@ test_retire_vma_not_inactive(int fd)
 {
 	struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd, ahndN;
 	igt_spin_t *bg = NULL;
 
 	ctx = intel_ctx_create_all_physical(fd);
+	ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	for_each_ctx_engine(fd, ctx, e) {
 		igt_spin_t *spin;
 		const intel_ctx_t *spin_ctx;
 
 		if (!bg) {
-			bg = igt_spin_new(fd, .ctx = ctx, .engine = e->flags);
+			bg = igt_spin_new(fd,
+					  .ahnd = ahnd,
+					  .ctx = ctx,
+					  .engine = e->flags);
 			continue;
 		}
 
 		spin_ctx = intel_ctx_create(fd, &ctx->cfg);
-		spin = igt_spin_new(fd, .ctx = spin_ctx,
+		ahndN = get_reloc_ahnd(fd, spin_ctx->id);
+		spin = igt_spin_new(fd,
+				    .ahnd = ahndN,
+				    .ctx = spin_ctx,
 				    .engine = e->flags,
 				    .dependency = bg->handle,
 				    .flags = IGT_SPIN_SOFTDEP);
@@ -86,11 +94,13 @@ test_retire_vma_not_inactive(int fd)
 
 		gem_sync(fd, spin->handle);
 		igt_spin_free(fd, spin);
+		put_ahnd(ahndN);
 	}
 
 	igt_drop_caches_set(fd, DROP_RETIRE);
 	igt_spin_free(fd, bg);
 	intel_ctx_destroy(fd, ctx);
+	put_ahnd(ahnd);
 }
 
 int fd;
-- 
2.26.0
