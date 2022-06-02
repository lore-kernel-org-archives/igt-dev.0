Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1745112BC6
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jun 2022 08:22:45 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Thu,  2 Jun 2022 10:22:24 +0200
Message-Id: <20220602082224.387953-4-ryszard.knop@intel.com>
In-Reply-To: <20220602082224.387953-1-ryszard.knop@intel.com>
References: <20220602082224.387953-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/i915/gem_eio: Fix use after free
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

ctx is freed right before that line, use dir instead.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tests/i915/gem_eio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 913a21f9..135217e2 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -273,7 +273,7 @@ static void hang_handler(union sigval arg)
 	free(ctx);
 
 	/* flush any excess work before we start timing our reset */
-	igt_assert(igt_sysfs_printf(ctx->debugfs, "i915_drop_caches",
+	igt_assert(igt_sysfs_printf(dir, "i915_drop_caches",
 				    "%d", DROP_RCU));
 
 	igt_nsec_elapsed(ts);
-- 
2.36.1
