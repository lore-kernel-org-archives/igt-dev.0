Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780D289DD8
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 20:55:44 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu,  4 Jun 2020 02:25:06 +0530
Message-Id: <20200603205507.16908-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20200603205507.16908-1-mohammed.khajapasha@intel.com>
References: <20200603205507.16908-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kms: Set pipe enum name to a
 pipe from drm pipe
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
To: suresh.kumar.kurmi@intel.com, kishore.kunche@intel.com, petri.latvala@intel.com, mohammed.khajapasha@freedesktop.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

set the pipe enum name to igt pipe from drm pipe,
in case of non-contiguous pipes in display, the igt pipes cann't
be same as enabled pipes in kernel.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 lib/igt_kms.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index afef5939..a42a44c5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1958,10 +1958,16 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		int p = 1;
 		int j, type;
 		uint8_t last_plane = 0, n_planes = 0;
+		struct drm_i915_get_pipe_from_crtc_id get_pipe;
 
 		pipe->crtc_id = resources->crtcs[i];
 		pipe->display = display;
-		pipe->pipe = i;
+		/* Get right pipe enum from kernel for a pipe */
+		get_pipe.pipe = 0;
+		get_pipe.crtc_id =  pipe->crtc_id;
+		do_ioctl(display->drm_fd,
+				DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID, &get_pipe);
+		pipe->pipe = get_pipe.pipe;
 		pipe->plane_cursor = -1;
 		pipe->plane_primary = -1;
 		pipe->planes = NULL;
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
