Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E65610E0B8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 13:42:44 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 19:10:43 +0530
Message-Id: <20230109134046.85340-4-nidhi1.gupta@intel.com>
In-Reply-To: <20230109134046.85340-1-nidhi1.gupta@intel.com>
References: <20230109134046.85340-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] tests/kms_color: Restrict the execution
 of subtests to single pipe
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

To reduce the overall execution time of the test, now
all the subtests will be executed on single pipe instead
of all the pipes.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_color.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index e0c6a8bf..98900eb3 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -904,6 +904,9 @@ run_invalid_tests_for_pipe(data_t *data)
 
 				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
 					tests[i].test_t(data, pipe);
+
+				/*Restrict the execution on single pipe*/
+				break;
 			}
 		}
 	}
@@ -1012,6 +1015,8 @@ run_tests_for_pipe(data_t *data)
 			for_each_pipe(&data->display, pipe) {
 				run_gamma_degamma_tests_for_pipe(data, pipe,
 								 gamma_degamma_tests[i].test_t);
+				/*Restrict the execution on single pipe*/
+				break;
 			}
 		}
 	}
@@ -1024,6 +1029,8 @@ run_tests_for_pipe(data_t *data)
 						       ctm_tests[i].colors,
 						       ctm_tests[i].ctm,
 						       ctm_tests[i].iter);
+				/*Restrict the execution on single pipe*/
+				break;
 			}
 		}
 	}
@@ -1035,6 +1042,8 @@ run_tests_for_pipe(data_t *data)
 	igt_subtest_with_dynamic("deep-color") {
 		for_each_pipe(&data->display, pipe) {
 			run_deep_color_tests_for_pipe(data, pipe);
+			/*Restrict the execution on single pipe*/
+			break;
 		}
 	}
 }
-- 
2.25.1
