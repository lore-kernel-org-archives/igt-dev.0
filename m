Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D35D89FD9
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Aug 2021 12:22:50 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Sun, 22 Aug 2021 17:46:26 +0530
Message-Id: <20210822121626.12150-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_sync: igt_require to check
 availability of engine in list_engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Replaced igt_assert with igt_require in list_engines , to
avoid false failure of test case if engine is not supported
or found .
Test will return Test requirement not met.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_sync.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index 6cb00c40..4ad264a2 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -106,9 +106,9 @@ list_engines(int fd, const intel_ctx_t *ctx, unsigned ring)
 		ied = intel_engine_list_for_ctx_cfg(fd, &ctx->cfg);
 	} else {
 		if (ctx->cfg.num_engines)
-			igt_assert(ring < ctx->cfg.num_engines);
+			igt_require(ring < ctx->cfg.num_engines);
 		else
-			igt_assert(gem_has_ring(fd, ring));
+			igt_require(gem_has_ring(fd, ring));
 
 		ied.engines[ied.nengines].flags = ring;
 		strcpy(ied.engines[ied.nengines].name, " ");
-- 
2.25.1
