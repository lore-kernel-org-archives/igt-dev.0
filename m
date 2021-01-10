Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E128789B83
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Jan 2021 07:16:53 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Mon, 11 Jan 2021 01:34:07 +0530
Message-Id: <20210110200407.4137105-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_atomic_interruptible:add test
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
To: igt-dev@lists.freedesktop.org
Cc: Gupta@freedesktop.org, B@freedesktop.org, Nidhi1 <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added Test description for test case

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: B, Jeevan <Jeevan.B@intel.com>

v2: modified description to be more specific. (Jeevan)
---
 tests/kms_atomic_interruptible.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 3ba75089..9d19055c 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -284,6 +284,7 @@ igt_main
 		igt_require_sw_sync();
 	}
 
+	igt_describe("Tests the interrupt properties of legacy modeset");
 	igt_subtest_with_dynamic("legacy-setmode") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -292,6 +293,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests the interrupt properties of atomic modeset");
 	igt_subtest_with_dynamic("atomic-setmode") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -300,6 +302,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests the interrupt properties for DPMS");
 	igt_subtest_with_dynamic("legacy-dpms") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -308,6 +311,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests the interrupt properties for pageflip");
 	igt_subtest_with_dynamic("legacy-pageflip") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -316,6 +320,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests the interrupt properties for cursor");
 	igt_subtest_with_dynamic("legacy-cursor") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -324,6 +329,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests the interrupt properties for primary plane");
 	igt_subtest_with_dynamic("universal-setplane-primary") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -332,6 +338,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests the interrupt properties for cursor plane");
 	igt_subtest_with_dynamic("universal-setplane-cursor") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
