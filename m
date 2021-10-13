Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CA46EA1B
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 11:03:42 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Wed, 13 Oct 2021 16:27:44 +0530
Message-Id: <20211013105744.2869089-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5] tests/i915/i915_pm_dc: Fix condition in
 dc9-test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: jigar.bhatt@intel.com, petri.latvala@intel.com, nischal.varide@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

1.Inside dc9_wait_entry, we do not have DC9 counter,
so we rely on dc5/dc6 counter reset
to check if display engine was in DC9.
Test is passed if live counter is less
than the previous counter. Correcting condition
igt_wait(read_dc_counter(debugfs_fd, dc_target) <
			prev_dc, seconds, 100);

2.Moving prev_dc = read_dc_counter(data->debugfs_fd,
dc_target); before setup_dc9_dpms avoid 0 reading.

3.Add sleep(1) after dpms_off waiting for reset counters.

Fixes: 2f4e6430a97f04284d1cafb1479e7c1b0b2d596a ("tests/i915/i915_pm_dc: Fix DC9 test")
Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/i915_pm_dc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 3a7ce5bf..4ebeb3eb 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -410,7 +410,7 @@ static bool dc9_wait_entry(uint32_t debugfs_fd, int dc_target, int prev_dc, int
 	 * since we do not have DC9 counter,
 	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
 	 */
-	return igt_wait(read_dc_counter(debugfs_fd, dc_target) >
+	return igt_wait(read_dc_counter(debugfs_fd, dc_target) <
 			prev_dc, seconds, 100);
 }
 
@@ -444,9 +444,10 @@ static void test_dc9_dpms(data_t *data)
 
 	require_dc_counter(data->debugfs_fd, CHECK_DC5);
 	dc_target = support_dc6(data->debugfs_fd) ? CHECK_DC6 : CHECK_DC5;
-	setup_dc9_dpms(data, dc_target);
 	prev_dc = read_dc_counter(data->debugfs_fd, dc_target);
+	setup_dc9_dpms(data, dc_target);
 	dpms_off(data);
+	sleep(1); /* wait for counters reset*/
 	check_dc9(data, dc_target, prev_dc);
 	dpms_on(data);
 }
-- 
2.25.1
