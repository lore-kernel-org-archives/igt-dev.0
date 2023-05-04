Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4989F10E45A
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 14:22:58 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>
Date: Thu, 4 May 2023 10:22:51 -0400
Message-ID: <20230504142251.34775-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_hotplug: fix test crash
 signal sigsegv
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

MAX_PIPES is 6 within amd_hotplug. IGT_MAX_PIPES is changed from
6 to 8 by 'commit 3d3a7f1c041d ("lib: Fix igt_kms for drivers with
8 crtc's")'. amd_hotplug loop up to display->n_pipes = 8, this will
exceed range of array and cause crash.
fix this issue with loop using for_each_pipe.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_hotplug.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index 736040a2..c13bf49d 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -109,7 +109,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 	test_init(data);
 
 	/* Setup all outputs */
-	for (i = 0; i < display->n_pipes; i++) {
+	for_each_pipe(&data->display, i) {
 		output = data->output[i];
 		if (!output || !igt_output_is_connected(output))
 			continue;
@@ -122,7 +122,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	/* Collect reference CRCs */
-	for (i = 0; i < display->n_pipes; i++) {
+	for_each_pipe(&data->display, i) {
 		output = data->output[i];
 		if (!output || !igt_output_is_connected(output))
 			continue;
@@ -136,7 +136,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 	}
 
 	/* Trigger hotplug and confirm reference image is the same. */
-	for (i = 0; i < display->n_pipes; i++) {
+	for_each_pipe(&data->display, i) {
 		output = data->output[i];
 		if (!output || !igt_output_is_connected(output))
 			continue;
-- 
2.25.1
