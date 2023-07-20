Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB79610E60E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 23:18:03 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 16:17:46 -0700
Message-ID: <20230720231756.3464641-11-ashutosh.dixit@intel.com>
In-Reply-To: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
References: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 10/20] tests/i915/perf: Support only
 default_engine_group for xe
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

Engine groups are currently not supported for XE. Support only
default_engine_group.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index ef2d56e319f8..6f10e1d035cb 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5726,6 +5726,9 @@ static struct perf_engine_group *get_engine_groups(int i915, uint32_t *num_group
 	struct perf_engine_group *groups = NULL;
 	uint32_t id = UINT32_MAX, num_grps = 0, i = 0, j;
 
+	if (is_xe_device(drm_fd))
+		return default_engine_group(num_groups);
+
 	qinfo = query_engine_info(i915);
 	if (!qinfo)
 		return default_engine_group(num_groups);
@@ -5996,6 +5999,7 @@ igt_main
 		write_u64_file(i9xe.sysctl_path_max_sample_rate, 100000);
 
 		gt_max_freq_mhz = sysfs_read(RPS_RP0_FREQ_MHZ);
+
 		perf_oa_groups = get_engine_groups(drm_fd, &num_perf_oa_groups);
 		igt_assert(perf_oa_groups && num_perf_oa_groups);
 
-- 
2.41.0
