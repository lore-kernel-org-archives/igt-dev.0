Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85AC6E0BE
 for <igt-dev@lists.freedesktop.org>; Sat,  1 May 2021 01:50:50 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Sat,  1 May 2021 04:50:44 +0300
Message-Id: <20210501015044.4139096-3-imre.deak@intel.com>
In-Reply-To: <20210501015044.4139096-1-imre.deak@intel.com>
References: <20210501015044.4139096-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_ccs: Test the XYUV8888 format
 as well
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

In addition to the rest of packed YUV formats add a subtest for XYUV8888
as well, for a coverage of calculations for 32bpp YUV formats.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_ccs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 30e0fdb54..35f3904ae 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -80,6 +80,7 @@ static const struct {
 };
 
 static const uint32_t formats[] = {
+	DRM_FORMAT_XYUV8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_YUYV,
 	DRM_FORMAT_NV12,
@@ -90,7 +91,7 @@ static const uint32_t formats[] = {
 static const struct {
 	uint64_t modifier;
 	const char *str;
-} ccs_modifiers[5] = {
+} ccs_modifiers[] = {
 	{LOCAL_I915_FORMAT_MOD_Y_TILED_CCS, "LOCAL_I915_FORMAT_MOD_Y_TILED_CCS"},
 	{LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS, "LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS"},
 	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS"},
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
