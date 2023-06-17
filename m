Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758D210E08C
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jun 2023 09:55:51 +0000 (UTC)
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 17 Jun 2023 15:24:21 +0530
Message-Id: <20230617095421.2031607-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_cursor_legacy: Reducing the
 IOCTL(drm_mode_cursor_ioctl) calls by reducing the timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Garg@freedesktop.org, "Garg, Nemesa" <nemesa.garg@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Due to excessive IOCTL calls in a stress test we are getting
disk limit issue. Hence by reducing the timeout from 20 to 5
the IOCTL call will get reduced.

Checked with different values and found 5 as optimal value.

Signed-off-by: Garg, Nemesa <nemesa.garg@intel.com>
---
 tests/kms_cursor_legacy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index f1e55906..13918345 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1562,12 +1562,12 @@ igt_main
 					errno = 0;
 
 					igt_dynamic_f("pipe-%s", kmstest_pipe_name(n))
-						stress(&display, n, tests[i].ncpus, tests[i].flags, 20);
+						stress(&display, n, tests[i].ncpus, tests[i].flags, 5);
 				}
 
 				errno = 0;
 				igt_dynamic("all-pipes")
-					stress(&display, -1, tests[i].ncpus, tests[i].flags, 20);
+					stress(&display, -1, tests[i].ncpus, tests[i].flags, 5);
 			}
 		}
 	}
-- 
2.25.1
