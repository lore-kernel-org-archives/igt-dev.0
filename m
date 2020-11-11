Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AA06E049
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 14:18:47 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed, 11 Nov 2020 16:18:39 +0200
Message-Id: <20201111141840.432429-2-mika.kahola@intel.com>
In-Reply-To: <20201111141840.432429-1-mika.kahola@intel.com>
References: <20201111141840.432429-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v8 1/2] tests/kms_ccs: Add debug information
 on format modifier
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
List-ID: <igt-dev@lists.freedesktop.org>

We could benefit on information on what format modifier is in use
when running the test. This in mind, let's add informative string along
with the list of ccs modifiers.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/kms_ccs.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index b60e4908..53abecce 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -81,12 +81,15 @@ static const uint32_t formats[] = {
 	DRM_FORMAT_P016,
 };
 
-static const uint64_t ccs_modifiers[] = {
-	LOCAL_I915_FORMAT_MOD_Y_TILED_CCS,
-	LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS,
-	LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
-	LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC,
-	LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
+static const struct {
+	uint64_t modifier;
+	const char *str;
+} ccs_modifiers[5] = {
+	{LOCAL_I915_FORMAT_MOD_Y_TILED_CCS, "LOCAL_I915_FORMAT_MOD_Y_TILED_CCS"},
+	{LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS, "LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS"},
+	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS"},
+	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC"},
+	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, "LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS"},
 };
 
 static bool check_ccs_planes;
@@ -422,7 +425,8 @@ static int __test_output(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
 		int j;
 
-		data->ccs_modifier = ccs_modifiers[i];
+		data->ccs_modifier = ccs_modifiers[i].modifier;
+		igt_debug("Modifier in use: %s\n", ccs_modifiers[i].str);
 		for (j = 0; j < ARRAY_SIZE(formats); j++) {
 			data->format = formats[j];
 			valid_tests += test_ccs(data);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
