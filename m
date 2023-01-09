Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1381810E0B0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 13:42:43 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 19:10:42 +0530
Message-Id: <20230109134046.85340-3-nidhi1.gupta@intel.com>
In-Reply-To: <20230109134046.85340-1-nidhi1.gupta@intel.com>
References: <20230109134046.85340-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] tests/kms_plane_alpha_blend: Restrict
 the execution of subtest to single pipe
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
 tests/kms_plane_alpha_blend.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index ccf1d657..25e6c985 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -621,9 +621,12 @@ static void run_subtests(data_t *data)
 				if (!pipe_check(data, pipe, subtests[i].blend, subtests[i].must_multiply))
 					continue;
 
-				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
 					run_test_on_pipe_planes(data, pipe, output, subtests[i].blend,
 								subtests[i].must_multiply, subtests[i].test);
+				}
+				/*once is enough*/
+				break;
 			}
 		}
 	}
-- 
2.25.1
