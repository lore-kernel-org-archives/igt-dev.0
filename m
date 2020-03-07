Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADF96E260
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Mar 2020 21:19:26 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Sun,  8 Mar 2020 02:47:49 +0530
Message-Id: <20200307211751.22125-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
References: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_kms: Set pipe enum name to a
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

set the pipe enum name to igt pipe from drm pipe,
in case of non-contiguous pipes in display, the igt pipes cann't
be same as enabled pipes in kernel.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 lib/igt_kms.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 54de45e5..849aa346 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1927,10 +1927,16 @@ void igt_display_require(igt_display_t *display, int drm_fd)
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
