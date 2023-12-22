Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38E310E751
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 06:12:53 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3] tests/kms_cursor_crc: Optimize the test for
 simulation
Date: Fri, 22 Dec 2023 11:53:10 +0530
Message-Id: <20231222062310.8832-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Restricted the execution of all the subtests to single
pipe to atleast check the basic functionality on
simulation.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_cursor_crc.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index f747b919f..b68faf9b3 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -883,6 +883,13 @@ static void run_size_tests(data_t *data, int w, int h)
 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), igt_output_name(data->output))
 					run_test(data, size_tests[i].testfunc, w, h);
+
+				/*
+                                * For simulation env, no need to run
+                                * test for each pipe.
+                                */
+                                if (igt_run_in_simulation())
+                                        break;
 			}
 		}
 	}
@@ -919,6 +926,12 @@ static void run_tests_on_pipe(data_t *data)
 				      data->output->name)
 				run_test(data, test_cursor_size,
 					 data->cursor_max_w, data->cursor_max_h);
+			/*
+			* For simulation env, no need to run
+			* test for each pipe.
+			*/
+			if (igt_run_in_simulation())
+				break;
 		}
 	}
 
@@ -939,6 +952,12 @@ static void run_tests_on_pipe(data_t *data)
 				      data->output->name)
 				run_test(data, test_cursor_opaque,
 					 data->cursor_max_w, data->cursor_max_h);
+			/*
+			* For simulation env, no need to run
+			* test for each pipe.
+			*/
+			if (igt_run_in_simulation())
+				break;
 		}
 	}
 
@@ -959,6 +978,12 @@ static void run_tests_on_pipe(data_t *data)
 				      data->output->name)
 				run_test(data, test_cursor_transparent,
 					 data->cursor_max_w, data->cursor_max_h);
+			/*
+			* For simulation env, no need to run
+			* test for each pipe.
+			*/
+			if (igt_run_in_simulation())
+				break;
 		}
 	}
 
@@ -983,6 +1008,12 @@ static void run_tests_on_pipe(data_t *data)
 				      data->output->name)
 				run_test(data, test_crc_random,
 					 data->cursor_max_w, data->cursor_max_h);
+			/*
+			* For simulation env, no need to run
+			* test for each pipe.
+			*/
+			if (igt_run_in_simulation())
+				break;
 		}
 		data->flags = 0;
 	}
@@ -1004,6 +1035,12 @@ static void run_tests_on_pipe(data_t *data)
 				      data->output->name)
 				run_test(data, test_crc_random,
 					 data->cursor_max_w, data->cursor_max_h);
+			/*
+			* For simulation env, no need to run
+			* test for each pipe.
+			*/
+			if (igt_run_in_simulation())
+				break;
 		}
 		data->flags = 0;
 	}
-- 
2.39.0
