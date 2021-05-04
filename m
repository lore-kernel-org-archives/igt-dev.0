Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42F76E123
 for <igt-dev@lists.freedesktop.org>; Mon,  3 May 2021 16:53:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue,  4 May 2021 06:13:08 +0530
Message-Id: <20210504004313.28804-10-bhanuprakash.modem@intel.com>
In-Reply-To: <20210504004313.28804-1-bhanuprakash.modem@intel.com>
References: <20210504004313.28804-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v4 i-g-t 09/14] tests/kms_plane_alpha_blend: Reset the
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
values, those are assumed by other tests. This patch will also fix
few redundant checks.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_alpha_blend.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 5e80ae36e..a37cb27c7 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -237,8 +237,6 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 	}
 
 	igt_plane_set_fb(primary, &data->black_fb);
-	/* reset alpha property to default */
-	reset_alpha(display, pipe);
 }
 
 static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t *plane)
@@ -507,6 +505,9 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, bool blend,
 		igt_plane_set_fb(plane, NULL);
 	}
 
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
 	igt_require_f(found, "No planes with %s property found\n",
 		      blend ? "pixel blending mode" : "alpha");
 	igt_require_f(multiply, "Multiplied (plane x pixel) alpha not available\n");
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
