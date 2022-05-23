Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AABC10F57A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 May 2022 18:15:11 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 May 2022 23:39:54 +0530
Message-Id: <20220523180954.1717810-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms: Convert subtest to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

tests/kms_universal_plane: Convert test to dynamic tests

Converting the existing subtests to dynamic subtests.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_universal_plane.c | 40 +++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 1a6502a4..d22d04ca 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -767,35 +767,45 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 	}
 
 	igt_describe("Check the switching between different primary plane fbs with CRTC off");
-	igt_subtest_f("universal-plane-pipe-%s-functional",
-		      kmstest_pipe_name(pipe))
+	igt_subtest_with_dynamic_f("universal-plane-pipe-%s-functional",
+		      kmstest_pipe_name(pipe)){
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			functional_test_pipe(data, pipe, output);
+			igt_dynamic_f("%s", igt_output_name(output))
+				functional_test_pipe(data, pipe, output);
+	}
 
 	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
-	igt_subtest_f("universal-plane-pipe-%s-sanity",
-		      kmstest_pipe_name(pipe))
+	igt_subtest_with_dynamic_f("universal-plane-pipe-%s-sanity",
+		      kmstest_pipe_name(pipe)){
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			sanity_test_pipe(data, pipe, output);
+			igt_dynamic_f("%s" ,igt_output_name(output))
+				sanity_test_pipe(data, pipe, output);
+	}
 
 	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
 			" and pageflip execution");
-	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
-		      kmstest_pipe_name(pipe))
+	igt_subtest_with_dynamic_f("disable-primary-vs-flip-pipe-%s",
+		      kmstest_pipe_name(pipe)){
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			pageflip_test_pipe(data, pipe, output);
+			igt_dynamic_f("%s", igt_output_name(output))
+				pageflip_test_pipe(data, pipe, output);
+	}
 
 	igt_describe("Check for cursor leaks after performing cursor operations");
-	igt_subtest_f("cursor-fb-leak-pipe-%s",
-		      kmstest_pipe_name(pipe))
+	igt_subtest_with_dynamic_f("cursor-fb-leak-pipe-%s",
+		      kmstest_pipe_name(pipe)){
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			cursor_leak_test_pipe(data, pipe, output);
+			igt_dynamic_f("%s", igt_output_name(output))
+				cursor_leak_test_pipe(data, pipe, output);
+	}
 
 	igt_describe("Check if pageflip succeeds in windowed setting");
-	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
-		      kmstest_pipe_name(pipe))
+	igt_subtest_with_dynamic_f("universal-plane-gen9-features-pipe-%s",
+		      kmstest_pipe_name(pipe)){
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			gen9_test_pipe(data, pipe, output);
+			igt_dynamic_f("%s", igt_output_name(output))
+				gen9_test_pipe(data, pipe, output);
+	}
 }
 
 static data_t data;
-- 
2.25.1
