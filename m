Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2006E067
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 09:16:24 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 12 May 2021 22:35:33 +0530
Message-Id: <20210512170536.4778-12-bhanuprakash.modem@intel.com>
In-Reply-To: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v6 i-g-t 11/14] tests/kms_plane_lowres: Reset the state
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
values, those are assumed by other tests. This patch will also fix
few redundant checks.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_lowres.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 5cfe53c8b..95346e289 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -270,16 +270,13 @@ test_planes_on_pipe(data_t *data, uint64_t modifier)
 	igt_info("Testing connector %s using pipe %s\n",
 		 igt_output_name(data->output), kmstest_pipe_name(data->pipe));
 
-	for_each_plane_on_pipe(&data->display, data->pipe, plane) {
-		data->output = igt_get_single_output_for_pipe(&data->display, data->pipe);
-		igt_require(data->output);
-
+	for_each_plane_on_pipe(&data->display, data->pipe, plane)
 		tested += test_planes_on_pipe_with_output(data, plane, modifier);
-	}
 
-	igt_assert(tested > 0);
 	igt_output_set_pipe(data->output, PIPE_NONE);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	igt_assert(tested > 0);
 }
 
 igt_main
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
