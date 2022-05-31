Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171C811293D
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 05:11:20 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Tue, 31 May 2022 10:44:08 +0530
Message-Id: <20220531051408.13090-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Fix regression in
 test_resolution_with_output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Fix regression caused by commit 14ad49f5b6ed861eda93e9d6b6ed0f3c77d228d1
to skip the subtest if the suitable resolution is not found.

-the test will calculate the high resolution and low resolution supported by
the connector.
-high resolution will be the default highest resolution supported by the connector
and using that test calculates the lower resolution.
-if the lower resolution is not supported by the connector it will assign the
default resolution of 1024x768
-if the default  resolution value is higher than the high resolutin, skip in that
situation to avoid failure of the test.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_concurrent.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index d4536e3b..f3cec242 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -252,7 +252,6 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
 			return igt_memdup(mode, sizeof(*mode));
 	}
 
-	igt_skip_on_f(mode_default->vdisplay < 1024, "No suitable resolution was found\n");
 	return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
 }
 
@@ -273,6 +272,8 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 		mode_hi = igt_output_get_mode(output);
 		mode_lo = get_lowres_mode(data, mode_hi, output);
 
+		igt_skip_on_f(mode_lo->vdisplay > mode_hi->vdisplay, "No suitable resolution was found\n");
+		
 		/* switch to lower resolution */
 		igt_output_override_mode(output, mode_lo);
 		free(mode_lo);
-- 
2.26.2
