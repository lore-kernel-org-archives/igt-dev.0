Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9D610E1C6
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 13:42:47 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 19:10:45 +0530
Message-Id: <20230109134046.85340-6-nidhi1.gupta@intel.com>
In-Reply-To: <20230109134046.85340-1-nidhi1.gupta@intel.com>
References: <20230109134046.85340-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/6] tests/kms_pipe_crc_basic: Restrict the
 execution of subtest to single pipe
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
 tests/kms_pipe_crc_basic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 91a1b8ab..dd846952 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -342,6 +342,8 @@ igt_main
 						test_read_crc(&data, pipe, output, tests[i].flags);
 					}
 				}
+				/*Restrict the execution of the subtest to single pipe*/
+				break;
 			}
 		}
 	}
@@ -352,6 +354,8 @@ igt_main
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_disable_crc_after_crtc(&data, pipe, output);
+			/*Restrict the execution of the subtest to single pipe*/
+			break;
 		}
 	}
 
@@ -360,6 +364,8 @@ igt_main
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_compare_crc(&data, pipe, output);
+			/*Restrict the execution of the subtest to single pipe*/
+			break;
 		}
 	}
 
-- 
2.25.1
