Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCC06EA83
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jan 2021 07:49:16 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Fri, 29 Jan 2021 13:19:17 +0530
Message-Id: <20210129074917.2480118-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_universal_plane:Added subtest
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
Cc: Kunal1 <kunal1.joshi@intel.com>, Joshi@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>

v2: removed extra bracket and semicolon.
---
 tests/kms_universal_plane.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 46d6d180..aae3fc52 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -758,26 +758,32 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
 	}
 
+	igt_describe("Check the switching between different primary plane fbs with CRTC off");
 	igt_subtest_f("universal-plane-pipe-%s-functional",
 		      kmstest_pipe_name(pipe))
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			functional_test_pipe(data, pipe, output);
 
+	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
 	igt_subtest_f("universal-plane-pipe-%s-sanity",
 		      kmstest_pipe_name(pipe))
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			sanity_test_pipe(data, pipe, output);
 
+	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
+			" and pageflip execution");
 	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
 		      kmstest_pipe_name(pipe))
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			pageflip_test_pipe(data, pipe, output);
 
+	igt_describe("Check for cursor leaks after performing cursor operations");
 	igt_subtest_f("cursor-fb-leak-pipe-%s",
 		      kmstest_pipe_name(pipe))
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			cursor_leak_test_pipe(data, pipe, output);
 
+	igt_describe("Check if pageflip succeeds in windowed setting");
 	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
 		      kmstest_pipe_name(pipe))
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
