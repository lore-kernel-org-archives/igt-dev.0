Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135BF6E20E
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2020 09:24:23 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 24 Feb 2020 11:24:18 +0200
Message-Id: <20200224092418.1450732-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200224092418.1450732-1-lionel.g.landwerlin@intel.com>
References: <20200224092418.1450732-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/perf: debug trace when
 configuration loading fails
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Helps debugging.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/perf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/perf.c b/tests/perf.c
index 4c77f558..d9bac561 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -898,8 +898,10 @@ init_sys_info(void)
 
 	intel_perf_load_perf_configs(intel_perf, drm_fd);
 
-	if (test_set->perf_oa_metrics_set == 0)
+	if (test_set->perf_oa_metrics_set == 0) {
+		igt_debug("Unable to load configurations\n");
 		return false;
+	}
 
 	oa_exp_1_millisec = max_oa_exponent_for_period_lte(1000000);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
