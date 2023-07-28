Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD69D10E67A
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 07:49:29 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Jul 2023 13:19:07 +0530
Message-Id: <20230728074913.939188-5-swati2.sharma@intel.com>
In-Reply-To: <20230728074913.939188-1-swati2.sharma@intel.com>
References: <20230728074913.939188-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 04/10] tests/i915/kms_dsc: update if condition
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

Check is_dsc_output_format_supported() iff test flag is set to
OUTPUT_FORMAT.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 7b9bae91a..266918f74 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -238,8 +238,9 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		if (!is_dsc_supported_by_sink(data->drm_fd, data->output))
 			continue;
 
-		if (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
-						    data->output, data->output_format))
+		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
+		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
+						     data->output, data->output_format)))
 			continue;
 
 		if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
-- 
2.25.1
