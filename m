Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B903010E283
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 19:24:32 +0000 (UTC)
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 12 Dec 2022 14:24:25 -0500
Message-ID: <20221212192425.387971-3-harry.wentland@amd.com>
In-Reply-To: <20221212192425.387971-1-harry.wentland@amd.com>
References: <20221212192425.387971-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/kms_hdr: Add suspend and DPMS
 Colorspace tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

These test that Colorspace settings aren't lost over a
DPMS or suspend cycle.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Hung <Alex.Hung@amd.com>
---
 tests/kms_hdr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index b656dc7a7ed5..1c7c04191df4 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -336,6 +336,13 @@ static void test_colorspace_switch_on_output(data_t *data, enum pipe pipe,
 			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 			/* get and check current colorspace */
 			igt_assert_output_colorspace_equal(data->fd, pipe, colorspaces[i]);
+			/* test suspend only once since it's slow */
+			if (flags & TEST_SUSPEND) {
+				test_cycle_flags(data, flags);
+				igt_assert_output_colorspace_equal(data->fd, pipe, colorspaces[i]);
+				break;
+			}
+
 		}
 	}
 
@@ -741,6 +748,12 @@ igt_main
 	igt_describe("Tests switching Colorspace property, .i.e., the display colorimetry");
 	igt_subtest_with_dynamic("colorspace-switch")
 		test_colorspace_switch(&data, TEST_NONE);
+	igt_describe("Tests Colorspace switch with DPMS");
+	igt_subtest_with_dynamic("colorspace-switch-dpms")
+		test_colorspace_switch(&data, TEST_DPMS);
+	igt_describe("Tests Colorspace switch with suspend");
+	igt_subtest_with_dynamic("colorspace-switch-suspend")
+		test_colorspace_switch(&data, TEST_SUSPEND);
 
 	igt_describe("Tests entering and exiting HDR mode");
 	igt_subtest_with_dynamic("static-toggle")
-- 
2.38.1
