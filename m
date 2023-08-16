Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB9E10E2C4
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 05:07:02 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 10:36:53 +0530
Message-Id: <20230816050653.1091989-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2] tests/i915/kms_dsc_helper: s/by_platform/by_source
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

Technically, source is more prominently used instead of platform.
So, rename function name from by_platform to by_source.

v2: -fix subject (Kamil)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_dsc_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
index df999c9bd..44edd5ca9 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/tests/i915/kms_dsc_helper.c
@@ -120,7 +120,7 @@ void force_dsc_output_format(int drmfd, igt_output_t *output,
 }
 
 /* YCbCr420 DSC is supported on display version 14+ with DSC1.2a */
-static bool is_dsc_output_format_supported_by_platform(int disp_ver, enum dsc_output_format output_format)
+static bool is_dsc_output_format_supported_by_source(int disp_ver, enum dsc_output_format output_format)
 {
 	if (disp_ver < 14 && output_format == DSC_FORMAT_YCBCR420) {
 		igt_debug("Output format DSC YCBCR420 not supported on D13 and older platforms\n");
@@ -133,7 +133,7 @@ static bool is_dsc_output_format_supported_by_platform(int disp_ver, enum dsc_ou
 bool is_dsc_output_format_supported(int drmfd, int disp_ver, igt_output_t *output,
 				    enum dsc_output_format output_format)
 {
-	if (!is_dsc_output_format_supported_by_platform(disp_ver, output_format))
+	if (!is_dsc_output_format_supported_by_source(disp_ver, output_format))
 		return false;
 
 	if (!igt_is_dsc_output_format_supported_by_sink(drmfd, output->name, output_format)) {
-- 
2.25.1
