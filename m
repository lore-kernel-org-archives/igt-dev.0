Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C456E182
 for <igt-dev@lists.freedesktop.org>; Sun, 16 Feb 2020 18:01:02 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Sun, 16 Feb 2020 23:21:12 +0530
Message-Id: <20200216175113.14240-2-anshuman.gupta@intel.com>
In-Reply-To: <20200216175113.14240-1-anshuman.gupta@intel.com>
References: <20200216175113.14240-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915_pm_dc: Dump
 power_domain_info on DC test failures
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

Dump i915_power_domain_info debugfs attribute on DC state
test failures, it will help to identify culprit, which
causes non zero refcount for "DC off" power well.

Cc: Animesh Manna <animesh.manna@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_dc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index afcc10bc..4bca8559 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -206,11 +206,13 @@ static bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count)
 static void check_dc_counter(int debugfs_fd, int dc_flag, uint32_t prev_dc_count)
 {
 	char tmp[64];
+	char file[64] = "i915_power_domain_info";
 
 	snprintf(tmp, sizeof(tmp), "%s", dc_flag & CHECK_DC3CO ? "DC3CO" :
 		(dc_flag & CHECK_DC5 ? "DC5" : "DC6"));
 	igt_assert_f(dc_state_wait_entry(debugfs_fd, dc_flag, prev_dc_count),
-		     "%s state is not achieved\n", tmp);
+		     "%s state is not achieved\n%s:\n%s\n",
+		     tmp, file, igt_sysfs_get(debugfs_fd, file));
 }
 
 static void setup_videoplayback(data_t *data)
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
