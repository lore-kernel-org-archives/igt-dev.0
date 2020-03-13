Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4486E29A
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2020 13:20:39 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Fri, 13 Mar 2020 18:55:56 +0530
Message-Id: <20200313132556.26038-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Made debug info more evident
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

In present scenario, whenever subtest gets SKIPPED we get debug info
"connector property not found or panel is non-HDR" which is quite vague.
Added igt_info() stating the actual reason of skip. This will help in
bug assessment too.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 677936c6..71372556 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -285,7 +285,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 		valid_tests++;
 	}
 
-	igt_require_f(valid_tests, "No connector found with MAX BPC connector property\n");
+	igt_require_f(valid_tests, "No connector found with max_bpc connector property\n");
 }
 
 static bool cta_block(const char *edid_ext)
@@ -609,24 +609,26 @@ static void test_hdr(data_t *data, const char *test_name, uint32_t flags)
 		 * set MAX_BPC property to 10bpc prior to setting
 		 * HDR metadata property. Therefore, checking.
 		 */
-		if (!has_max_bpc(output))
-			continue;
-
-		if (!has_hdr(output))
+		if (!has_max_bpc(output) || !has_hdr(output)) {
+			igt_info("%s connector not found with HDR metadata/max_bpc connector property\n", output->name);
 			continue;
+		}
 
-		if (!is_panel_hdr(data, output))
+		if (!is_panel_hdr(data, output)) {
+			igt_info("Panel attached via %s connector is non-HDR\n", output->name);
 			continue;
+		}
 
 		igt_info("HDR %s test execution on %s\n", test_name, output->name);
 		if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
 			test_static_toggle(data, output, flags);
 		if (flags & TEST_SWAP)
 			test_static_swap(data, output);
+
 		valid_tests++;
 	}
 
-	igt_require_f(valid_tests, "No connector found with HDR metadata/MAX BPC connector property (or) panel is Non-HDR\n");
+	igt_require_f(valid_tests, "No connector found with HDR metadata/max_bpc connector property (or) panel is non-HDR\n");
 }
 
 igt_main
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
