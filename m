Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828CD6E869
 for <igt-dev@lists.freedesktop.org>; Sat,  8 May 2021 08:33:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Sat,  8 May 2021 21:53:01 +0530
Message-Id: <20210508162303.8235-13-bhanuprakash.modem@intel.com>
In-Reply-To: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
References: <20210508162303.8235-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v5 i-g-t 12/14] tests/kms_plane_cursor: Reset the state
 before exiting the test
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
List-ID: <igt-dev@lists.freedesktop.org>

Before starting the next subtest, clean up the states to default
values, those are assumed by other tests.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_cursor.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index bc9d42940..9bda47466 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -93,6 +93,10 @@ static void test_fini(data_t *data)
 {
 	igt_pipe_crc_free(data->pipe_crc);
 	igt_display_reset(&data->display);
+	igt_plane_set_fb(data->primary, NULL);
+	igt_plane_set_fb(data->overlay, NULL);
+	igt_plane_set_fb(data->cursor, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 /* Fills a FB with the solid color given. */
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
