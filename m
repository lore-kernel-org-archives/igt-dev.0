Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9338910E1E7
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 14:04:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 19:16:53 +0530
Message-Id: <20231129134657.2826744-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231129134657.2826744-1-bhanuprakash.modem@intel.com>
References: <20231129134657.2826744-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/6] tests/kms_vrr: Clear VRR before exit
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

Before exiting the subtest, make sure to clear the VRR.

V2: - New function for cleanup

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index a9098597b..1765991c6 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -469,8 +469,11 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
 		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
+}
 
-	/* Clean-up */
+static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
+{
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
 	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_output_override_mode(output, NULL);
@@ -510,6 +513,9 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), output->name)
 					test(data, pipe, output, flags);
+
+				test_cleanup(data, pipe, output);
+
 				break;
 			}
 		}
-- 
2.40.0
