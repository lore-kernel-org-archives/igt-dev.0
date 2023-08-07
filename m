Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C790510E1D8
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 09:19:01 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 14:45:38 +0530
Message-Id: <20230807091538.3172571-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc_helper.c: Fix helper to
 check dsc with output_format
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

Fix the condition that checks whether DSC is supported with given
output format in is_dsc_output_format_supported.

Fixes: c365922f01c12 (tests/i915/kms_dsc: Enable validation for VDSC output formats)
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Jouni H_gander <jouni.hogander@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/i915/kms_dsc_helper.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
index ae59edb6bec9..160364cd28bf 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/tests/i915/kms_dsc_helper.c
@@ -133,13 +133,12 @@ static bool is_dsc_output_format_supported_by_platform(int disp_ver, enum dsc_ou
 bool is_dsc_output_format_supported(int drmfd, int disp_ver, igt_output_t *output,
 				    enum dsc_output_format output_format)
 {
-	if (!(igt_is_dsc_output_format_supported_by_sink(drmfd, output->name, output_format)) &&
-	     (is_dsc_output_format_supported_by_platform(disp_ver, output_format))) {
-		    igt_debug("DSC %s output format not supported on connector %s\n",
-			       kmstest_dsc_output_format_str(output_format),
-			       output->name);
-			return false;
-		}
+	if (is_dsc_output_format_supported_by_platform(disp_ver, output_format) &&
+	    igt_is_dsc_output_format_supported_by_sink(drmfd, output->name, output_format))
+		return true;
 
-	return true;
+	igt_debug("DSC %s output format not supported on connector %s\n",
+		  kmstest_dsc_output_format_str(output_format), output->name);
+
+	return false;
 }
-- 
2.40.1
