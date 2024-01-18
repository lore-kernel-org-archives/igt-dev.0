Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] i915/perf: Fix loop termination logic in two tests
Date: Wed, 17 Jan 2024 20:55:25 -0800
Message-ID: <20240118045525.911523-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org

The code in af9910b3967d ("i915/perf: Check regularly if we are done
reading reports") does not match the commit description. Fix the code to
match the commit description.

Fixes: af9910b3967d ("i915/perf: Check regularly if we are done reading reports")
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 3565d61cc393..94738b8a58b4 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -3052,7 +3052,7 @@ test_buffer_fill(const struct intel_execution_engine2 *e)
 						first_timestamp = oa_timestamp(report, fmt);
 					last_timestamp = oa_timestamp(report, fmt);
 
-					if (((last_timestamp - first_timestamp) * oa_period) < (fill_duration / 2))
+					if (((last_timestamp - first_timestamp) * oa_period) >= (fill_duration / 2))
 						break;
 
 					if (oa_report_is_periodic(oa_exponent, report)) {
@@ -3279,7 +3279,7 @@ test_enable_disable(const struct intel_execution_engine2 *e)
 						  oa_report_is_periodic(oa_exponent, report),
 						  oa_report_get_ctx_id(report));
 
-					if (((last_timestamp - first_timestamp) * oa_period) < (fill_duration / 2))
+					if (((last_timestamp - first_timestamp) * oa_period) >= (fill_duration / 2))
 						break;
 
 					if (oa_report_is_periodic(oa_exponent, report)) {
-- 
2.41.0
