Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9195410E0B8
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 04:51:12 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 10:17:47 +0530
Message-Id: <20230808044747.3274795-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc_helper: Fix helper to
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

Fix the condition that checks for DSC support by platform and the
sink in the helper is_dsc_output_format_supported.

v2:
-Fix commit message (Swati).
-Add closes tag. (Swati).
-Add debug message only for sink check (Ankit).

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9062
Fixes: c365922f01c12 (tests/i915/kms_dsc: Enable validation for VDSC output formats)
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Jouni H_gander <jouni.hogander@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
Tested-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc_helper.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
index ae59edb6bec9..df999c9bde62 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/tests/i915/kms_dsc_helper.c
@@ -133,13 +133,14 @@ static bool is_dsc_output_format_supported_by_platform(int disp_ver, enum dsc_ou
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
+	if (!is_dsc_output_format_supported_by_platform(disp_ver, output_format))
+		return false;
+
+	if (!igt_is_dsc_output_format_supported_by_sink(drmfd, output->name, output_format)) {
+		igt_debug("DSC %s output format not supported on connector %s\n",
+			  kmstest_dsc_output_format_str(output_format), output->name);
+		return false;
+	}
 
 	return true;
 }
-- 
2.40.1
