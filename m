Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AD2916D4
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 17:01:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 juhapekka.heikkila@gmail.com
Date: Tue,  9 Aug 2022 22:28:32 +0530
Message-Id: <20220809165832.1717990-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_cursor_crc: Add max-size test back
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

This patch reverts the max-size test but keeps the clean-up
part of the original commit.

This reverts commit 5a8fa05a824032aab4c8980727a075f71065e27c.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_crc.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 14d4c4ca..cf8d4b68 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -693,7 +693,24 @@ static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
 	char name[32];
 	enum pipe pipe;
 
-	snprintf(name, sizeof(name), "%dx%d", w, h);
+	if (w == 0 && h == 0)
+		strcpy(name, "max-size");
+	else
+		snprintf(name, sizeof(name), "%dx%d", w, h);
+
+	if (w == 0 && h == 0) {
+		w = data->cursor_max_w;
+		h = data->cursor_max_h;
+		/*
+		 * No point in doing the "max-size" test if
+		 * it was already covered by the other tests.
+		 */
+		if ((w == h) && (w <= 512) && (h <= 512) &&
+		    is_power_of_two(w) && is_power_of_two(h)) {
+			igt_debug("Cursor max size %dx%d already covered by other tests\n", w, h);
+			return;
+		}
+	}
 
 	create_cursor_fb(data, w, h);
 	if (require_cursor_size(data, w, h)) {
@@ -855,6 +872,9 @@ static void run_tests_on_pipe(data_t *data)
 					igt_subtest_group
 						run_size_tests(data, size_tests[i].testfunc, w, h);
 				}
+
+				igt_subtest_group
+					run_size_tests(data, size_tests[i].testfunc, 0, 0);
 			}
 		}
 	}
-- 
2.35.1
