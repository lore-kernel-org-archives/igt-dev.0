Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39DC10E19D
 for <igt-dev@lists.freedesktop.org>; Tue, 24 May 2022 11:49:57 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 May 2022 17:14:36 +0530
Message-Id: <20220524114437.1755739-2-ananya.sharma@intel.com>
In-Reply-To: <20220524114437.1755739-1-ananya.sharma@intel.com>
References: <20220524114437.1755739-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_universal_plane:Convert
 tests to dynamic
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

Modified kms_universal_plane to include dynamic test cases.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_universal_plane.c | 40 +++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 3cb6d704..2bc722d2 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -762,35 +762,45 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
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
