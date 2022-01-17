Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E0910E1F6
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jan 2022 13:33:06 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Mon, 17 Jan 2022 15:32:46 +0200
Message-Id: <20220117133246.33810-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] kms_psr2_su: Fix igt_fixture handling
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Igt_fixture is in a loop for different operations. This is causing
display_fini being called at the end of each iteration and
triggering SIGSEGV. Fix this by removing igt_fixture out from
the loop.

Fixes: 6be8feeb148e (tests/kms_psr2_su: add biplanar selective update tests)
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_su.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index d79a1e58..474b1dfd 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -327,10 +327,9 @@ igt_main
 				cleanup(&data);
 			}
 		}
-
-		igt_fixture {
-			close(data.debugfs_fd);
-			display_fini(&data);
-		}
+	}
+	igt_fixture {
+		close(data.debugfs_fd);
+		display_fini(&data);
 	}
 }
-- 
2.34.0
