Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47726E062
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 02:19:18 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue,  6 Apr 2021 07:59:16 +0530
Message-Id: <20210406022916.31998-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_concurrent : Added test
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added test description.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_concurrent.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 5a269014..c3f29ec7 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -329,6 +329,8 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
 	}
 
+	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
+		     "resolution.");
 	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe))
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			run_test(data, pipe, output);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
