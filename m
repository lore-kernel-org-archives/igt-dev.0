Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2CA8EDF6
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jul 2022 07:17:31 +0000 (UTC)
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Jul 2022 09:17:22 +0200
Message-Id: <20220712071722.212920-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] i915/gem_ctx_persistence: adjust hostile test
 timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

GPU occasionally can hang during hostile test. Detection of such case and
then reset can take up to 5 seconds.

Closes: https://gitlab.freedesktop.org/drm/intel/issues/2410
Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 00dda3a8b52..50196edb19f 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -370,7 +370,7 @@ static void test_nohangcheck_hostile(int i915, const intel_ctx_cfg_t *cfg)
 	igt_require(__enable_hangcheck(dir, false));
 
 	for_each_ctx_cfg_engine(i915, cfg, e) {
-		int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
+		int64_t timeout = 10000 * NSEC_PER_MSEC;
 		const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
 		uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 		igt_spin_t *spin;
-- 
2.25.1
