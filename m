Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1848F10E5AE
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 16:16:16 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 19:15:51 +0300
Message-Id: <20230411161555.10001-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
References: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 6/9] tests/kms_color: Add and additional
 "signed" subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

i915 CHV CSC code has a bug where it treats the hardware
CSC coefficient as sign-magnitude instead of the two's
complement value that it is. None of the current tests
manage to notice this.

Add a testcase that uses suitable negative coefficients
to catch the issue. With CHV's s4.12 coefficients the
-0.25 ends up as -7.75 and the results won't match.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index d430ee12aaa3..35083122dfbf 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -959,6 +959,11 @@ run_tests_for_pipe(data_t *data)
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 },
 	};
+	static const color_t colors_cmy[] = {
+		{ 0.0, 1.0, 1.0 },
+		{ 1.0, 0.0, 1.0 },
+		{ 1.0, 1.0, 0.0 }
+	};
 	static const struct {
 		const char *name;
 		int iter;
@@ -1040,6 +1045,16 @@ run_tests_for_pipe(data_t *data)
 		  },
 		  .desc = "Check the color transformation for 0.75 transparency",
 		},
+		{ .name = "ctm-signed",
+		  .fb_colors = colors_cmy,
+		  .iter = 3,
+		  .ctm = {
+			  -0.25,  0.75,  0.75,
+			   0.75, -0.25,  0.75,
+			   0.75,  0.75, -0.25,
+		  },
+		  .desc = "Check the color transformation for correct signed handling",
+		},
 	};
 	int i;
 
-- 
2.39.2
