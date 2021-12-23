Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F66010E287
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Dec 2021 07:20:08 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu, 23 Dec 2021 12:48:33 +0530
Message-Id: <20211223071833.1600156-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_color: Optimize ctm test execution
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Instead of iterating through all the delta, break the execution
when we found a match. This will optimize the time required to
execute ctm-0-* tests.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 775f35964f..854b8f3c31 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -754,9 +754,11 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 				expected_colors[1].g =
 				expected_colors[2].b =
 				0.25 + delta * (i - 2);
-			success |= test_pipe_ctm(data, primary,
-						 red_green_blue,
-						 expected_colors, ctm);
+			if (test_pipe_ctm(data, primary, red_green_blue,
+					  expected_colors, ctm)) {
+				success = true;
+				break;
+			}
 		}
 		igt_assert(success);
 	}
@@ -776,9 +778,11 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 				expected_colors[1].g =
 				expected_colors[2].b =
 				0.5 + delta * (i - 2);
-			success |= test_pipe_ctm(data, primary,
-						 red_green_blue,
-						 expected_colors, ctm);
+			if (test_pipe_ctm(data, primary, red_green_blue,
+					  expected_colors, ctm)) {
+				success = true;
+				break;
+			}
 		}
 		igt_assert(success);
 	}
@@ -798,9 +802,11 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 				expected_colors[1].g =
 				expected_colors[2].b =
 				0.75 + delta * (i - 3);
-			success |= test_pipe_ctm(data, primary,
-						 red_green_blue,
-						 expected_colors, ctm);
+			if (test_pipe_ctm(data, primary, red_green_blue,
+						expected_colors, ctm)) {
+				success = true;
+				break;
+			}
 		}
 		igt_assert(success);
 	}
-- 
2.32.0
