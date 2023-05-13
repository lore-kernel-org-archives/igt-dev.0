Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE5510E09E
 for <igt-dev@lists.freedesktop.org>; Sat, 13 May 2023 02:22:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 12 May 2023 19:22:30 -0700
Message-Id: <20230513022234.2832233-12-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
References: <20230513022234.2832233-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/15] intel_gpu_top: Bump up size of groups
 to accomodate multi-gt
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

Create more space in groups to add gt specific freq and rc6 groups.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 63ce9fade..87d869802 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1929,7 +1929,13 @@ print_header(const struct igt_device_card *card,
 		.display_name = "Power W",
 		.items = power_items,
 	};
-	struct cnt_group *groups[] = {
+	/*
+	 * Array size calculation:
+	 * One group each for period, irq, power, NULL = 4
+	 * One group per gt for freq = MAX_GTS
+	 * One group per gt for rc6  = MAX_GTS
+	 */
+	struct cnt_group *groups[4 + MAX_GTS + MAX_GTS] = {
 		&period_group,
 		&freq_group,
 		&irq_group,
-- 
2.36.1
