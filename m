Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAB06E7D3
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Apr 2021 10:31:41 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 26 Apr 2021 23:51:32 +0530
Message-Id: <20210426182136.2815-11-bhanuprakash.modem@intel.com>
In-Reply-To: <20210426182136.2815-1-bhanuprakash.modem@intel.com>
References: <20210426182136.2815-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v3 i-g-t 10/14] tests/kms_cursor_edge_walk: Reset the
 state before exiting the test
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
 tests/kms_cursor_edge_walk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 69662afec..d1d8a9143 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -225,6 +225,7 @@ static void cleanup_crtc(data_t *data)
 
 	igt_remove_fb(data->drm_fd, &data->primary_fb);
 	igt_remove_fb(data->drm_fd, &data->fb);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
 static void prepare_crtc(data_t *data)
@@ -268,6 +269,8 @@ static void test_crtc(data_t *data, unsigned int edges)
 	create_cursor_fb(data, data->curw, data->curh);
 
 	test_edges(data, edges);
+
+	cleanup_crtc(data);
 }
 
 static int opt_handler(int opt, int opt_index, void *_data)
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
