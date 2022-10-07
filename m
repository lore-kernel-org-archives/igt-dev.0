Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3818710E95D
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 13:40:32 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Oct 2022 16:40:27 +0300
Message-Id: <20221007134029.3188-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] Revert "kms_invalid_mode: Close device
 before exit"
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

This reverts commit 544fe3ab351e26b39c2db4a8bc9ac2b5032566c4.

Collateral damage.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_invalid_mode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index f1c38669860d..0ae98a31fcc2 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -306,6 +306,5 @@ igt_main
 	igt_fixture {
 		igt_display_fini(&data.display);
 		igt_reset_connectors();
-		close(data.drm_fd);
 	}
 }
-- 
2.35.1
