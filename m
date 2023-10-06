Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8E910E1D3
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 04:45:23 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 Oct 2023 10:24:30 +0530
Message-Id: <20231006045430.4968-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Optimize the test for
 simulation
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

Currently the test is blacklisted in simulation due to
taking more than 1200s which is causing timeout.
Restricted the execution of all the subtests to single
pipe to atleast check the basic functionality on
simulation.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_cursor_crc.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 76c01f557..38d591b8d 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -879,6 +879,12 @@ static void run_size_tests(data_t *data, int w, int h)
 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), igt_output_name(data->output))
 					run_test(data, size_tests[i].testfunc, w, h);
+				/*
+				* For simulation env, no need to run
+				* test for each pipe.
+				*/
+				if (igt_run_in_simulation())
+					break;
 			}
 		}
 	}
@@ -915,6 +921,12 @@ static void run_tests_on_pipe(data_t *data)
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
 
@@ -935,6 +947,12 @@ static void run_tests_on_pipe(data_t *data)
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
 
@@ -955,6 +973,12 @@ static void run_tests_on_pipe(data_t *data)
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
 
@@ -979,6 +1003,12 @@ static void run_tests_on_pipe(data_t *data)
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
@@ -1000,6 +1030,12 @@ static void run_tests_on_pipe(data_t *data)
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
