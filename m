Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Wed,  7 Jun 2023 11:06:14 -0700
Message-Id: <20230607180614.333109-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 i-g-t] tests/gem_ctx_persistence: Skip hang
 subtest with GuC
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

Hang scenarios are not supported with persistent contexts
when GuC submission is enabled.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index df9b1c491..d2558354e 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -577,6 +577,8 @@ static void test_nohangcheck_hang(int i915, const intel_ctx_cfg_t *cfg)
 	int testable_engines = 0;
 	int dir;
 
+	igt_require(!gem_using_guc_submission(i915));
+
 	cleanup(i915);
 
 	/*
-- 
2.38.1
