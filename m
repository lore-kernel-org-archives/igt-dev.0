Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF05C10E7D3
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 10:21:23 +0000 (UTC)
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 15:59:46 +0530
Message-Id: <20231124102946.2650848-3-badal.nilawar@intel.com>
In-Reply-To: <20231124102946.2650848-1-badal.nilawar@intel.com>
References: <20231124102946.2650848-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] test/intel/xe_guc_pc: Fix freq_low_max
 test
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

freq_low_max test is intended to validate GuC PC (SLPC) behaviour
when max freq set to less than min freq. As workloads are not being
run validating cur freq is enough.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_guc_pc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index c23017501..70548ba0e 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -220,7 +220,6 @@ static void test_freq_low_max(int fd, int gt_id)
 	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
 	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
-	igt_assert(get_freq(fd, gt_id, "act") == rpe);
 }
 
 /**
-- 
2.25.1
