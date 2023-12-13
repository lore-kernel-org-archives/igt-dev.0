Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A90A10E6D6
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 04:48:29 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t V8 2/7] tests/kms_vrr: Clear VRR before exit
Date: Wed, 13 Dec 2023 10:07:36 +0530
Message-Id: <20231213043741.3640374-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231213043741.3640374-1-bhanuprakash.modem@intel.com>
References: <20231213043741.3640374-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Before exiting the subtest, make sure to clear the VRR.

V2: - New function for cleanup

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 tests/kms_vrr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index bbdb54682..13e7f3ca6 100644
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
