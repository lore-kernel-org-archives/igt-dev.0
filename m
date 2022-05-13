Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570010E27E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 May 2022 06:08:55 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 May 2022 11:06:15 +0530
Message-Id: <20220513053615.3194-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_dp_tiled_display: Close fd after
 igt_display_fini
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunal1.joshi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Close fd after igt_display_fini to avoid bad fd failure.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_dp_tiled_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
index f030254d..8f503e40 100644
--- a/tests/kms_dp_tiled_display.c
+++ b/tests/kms_dp_tiled_display.c
@@ -497,8 +497,8 @@ igt_main
 	#endif
 	igt_fixture {
 		free(data.conns);
-		close(data.drm_fd);
 		kmstest_restore_vt_mode();
 		igt_display_fini(data.display);
+		close(data.drm_fd);
 	}
 }
-- 
2.22.0
