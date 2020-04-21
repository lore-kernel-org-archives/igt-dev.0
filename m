Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1D06E116
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2020 18:22:38 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue, 21 Apr 2020 11:22:37 -0700
Message-Id: <20200421182237.7743-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/perf: Fix B0 counter check in
 gen12-mi-rpc
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
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The gen12-mi-rpc test checks for B0 counter to be zero, however,
occassionally the counter reads a non-zero value. To ensure the test
works as expected, we check B0 with the preset value.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/1085
---
 tests/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/perf.c b/tests/perf.c
index b7d5e50e..9d0ed45c 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -3002,7 +3002,7 @@ gen12_test_mi_rpc(void)
 	 */
 	igt_assert_eq(report32[0], REPORT_ID);
 	igt_assert_neq(report32[1], 0);
-	igt_assert_eq(report32[format.b_off >> 2], 0);
+	igt_assert_neq(report32[format.b_off >> 2], 0x80808080);
 	igt_assert_eq(report32[format_size_32], 0x80808080);
 
 	drm_intel_bo_unmap(bo);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
