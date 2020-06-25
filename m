Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ED16E217
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 06:24:45 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 25 Jun 2020 11:53:18 +0530
Message-Id: <20200625062318.26368-8-mohammed.khajapasha@intel.com>
In-Reply-To: <20200625062318.26368-1-mohammed.khajapasha@intel.com>
References: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
 <20200625062318.26368-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 7/7] tests/kms_atomic_transition: Set
 modeset for enable pipes only
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Set the modeset for enable pipes only by using max iteration
from enable pipe count.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_atomic_transition.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 754a4969..8c1c1d93 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -737,8 +737,8 @@ static void collect_crcs_mask(igt_pipe_crc_t **pipe_crcs, unsigned mask, igt_crc
 static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblocking, bool fencing)
 {
 	struct igt_fb fbs[2];
-	int i, j;
-	unsigned iter_max = 1 << display->n_pipes;
+	int i, j = 0;
+	unsigned iter_max;
 	igt_pipe_crc_t *pipe_crcs[IGT_MAX_PIPES] = { 0 };
 	igt_output_t *output;
 	unsigned width = 0, height = 0;
@@ -762,6 +762,9 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
 		igt_plane_t *plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
 
+		/* count enable pipes to set max iteration */
+		j += 1;
+
 		if (is_i915_device(display->drm_fd))
 			pipe_crcs[i] = igt_pipe_crc_new(display->drm_fd, i, INTEL_PIPE_CRC_SOURCE_AUTO);
 
@@ -785,6 +788,8 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
 			igt_plane_set_fb(plane, NULL);
 	}
 
+	iter_max = 1 << j;
+
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	for (i = 0; i < iter_max; i++) {
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
