Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B67E6E9DE
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Dec 2020 10:27:51 +0000 (UTC)
From: arundhati.hagaragi@intel.com
Date: Wed,  9 Dec 2020 04:46:17 +0530
Message-Id: <20201208231617.1346190-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic_interruptible:add test
 description
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
To: igt-dev@lists.freedesktop.org, arundhati.hagaragi@intel.com, swati2.sharma@intel.com, nidhi1.gupta@intel.com
Cc: Gupta@freedesktop.org, Sharma@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>

Added Test description for test case

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: Sharma, Swati2 <swati2.sharma@intel.com>
---
 tests/kms_atomic_interruptible.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 3ba75089..8410a6d0 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -284,6 +284,7 @@ igt_main
 		igt_require_sw_sync();
 	}
 
+	igt_describe("Tests the properties of default modeset");
 	igt_subtest_with_dynamic("legacy-setmode") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -292,6 +293,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests the properties of specified modeset");
 	igt_subtest_with_dynamic("atomic-setmode") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -300,6 +302,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests the DPMS properties for CRTC");
 	igt_subtest_with_dynamic("legacy-dpms") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -308,6 +311,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests the flipping from user framebuffer to display port");
 	igt_subtest_with_dynamic("legacy-pageflip") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -316,6 +320,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests the cursor properties");
 	igt_subtest_with_dynamic("legacy-cursor") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -324,6 +329,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests plane properties with DRM mode hdisplay,vdisplay");
 	igt_subtest_with_dynamic("universal-setplane-primary") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -332,6 +338,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests plane properties with DRM mode 64, 64");
 	igt_subtest_with_dynamic("universal-setplane-cursor") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
