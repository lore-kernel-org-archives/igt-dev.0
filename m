Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0EE897D7
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2020 05:02:36 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Tue, 10 Nov 2020 10:33:34 +0530
Message-Id: <20201110050334.2747067-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_color_chamelium: time optimization
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Instead of going through all the delta even if we got success with one,
now breaking when we pass, thus saving some time and decreasing load on
chamelium for capturing the rest of the frames.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_color_chamelium.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 310c021a..43bbe1f2 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -610,9 +610,9 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 				expected_colors[1].g =
 				expected_colors[2].b =
 				0.25 + delta * (i - 2);
-			success |= test_pipe_ctm(data, primary,
-						 red_green_blue,
-						 expected_colors, ctm);
+			if(test_pipe_ctm(data, primary, red_green_blue,
+					 expected_colors, ctm))
+				break;
 		}
 		igt_assert(success);
 	}
@@ -632,9 +632,9 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 				expected_colors[1].g =
 				expected_colors[2].b =
 				0.5 + delta * (i - 2);
-			success |= test_pipe_ctm(data, primary,
-						 red_green_blue,
-						 expected_colors, ctm);
+			if(test_pipe_ctm(data, primary, red_green_blue,
+					 expected_colors, ctm))
+				break;
 		}
 		igt_assert(success);
 	}
@@ -654,9 +654,9 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 				expected_colors[1].g =
 				expected_colors[2].b =
 				0.75 + delta * (i - 3);
-			success |= test_pipe_ctm(data, primary,
-						 red_green_blue,
-						 expected_colors, ctm);
+			if(test_pipe_ctm(data, primary, red_green_blue,
+					 expected_colors, ctm))
+				break;
 		}
 		igt_assert(success);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
