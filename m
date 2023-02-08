Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3271D10E68A
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 01:54:12 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Feb 2023 07:29:59 +0530
Message-Id: <20230208015959.24015-5-nidhi1.gupta@intel.com>
In-Reply-To: <20230208015959.24015-1-nidhi1.gupta@intel.com>
References: <20230208015959.24015-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 4/4] tests/i915/kms_frontbuffer_tracking:
 Reduce the execution time on simulation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

With IGT_DRAW_RENDER draw method test is taking lot of time to
complete causing timeout in simulation, to avoid the time out
skipping IGT_DRAW_METHOD only for simulation

Reviewed-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 5b47999e..1d05a916 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -3159,6 +3159,9 @@ static void basic_subtest(const struct test_mode *t)
 	fb1 = params->primary.fb;
 
 	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
+		if (igt_run_in_simulation() && method == IGT_DRAW_RENDER)
+			continue;
+
 		if (method == IGT_DRAW_MMAP_GTT &&
 		    !gem_has_mappable_ggtt(drm.fd))
 			continue;
-- 
2.39.0
