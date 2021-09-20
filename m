Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A4C6E415
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 08:29:02 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Mon, 20 Sep 2021 13:47:02 +0530
Message-Id: <20210920081702.19241-1-vidya.srinivas@intel.com>
In-Reply-To: <20210916141827.17720-1-vidya.srinivas@intel.com>
References: <20210916141827.17720-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Fix regression in
 test_resolution_with_output
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
Cc: Bhanuprakash.Modem@intel.com, markyacoub@google.com, rodrigo.siqueira@amd.com, Vidya Srinivas <vidya.srinivas@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Staring commit fea0e38e690c30c6 "Making the test more generic"
test_resolution_with_output introduced setting igt_output_set_pipe
to PIPE_NONE. This is triggering atomic check failure resulting in
"enabled/connectors mismatch" under drm_atomic_helper_check_modeset.
Patch fixes this issue.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_concurrent.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 25c67eb469d1..47c441a5a3f7 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -268,7 +268,8 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 
 		/* switch to lower resolution */
 		igt_output_override_mode(output, mode_lo);
-		igt_output_set_pipe(output, PIPE_NONE);
+		if (is_amdgpu_device(data->drm_fd))
+			igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		/* switch back to higher resolution */
-- 
2.33.0
