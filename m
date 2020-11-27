Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C925F6EB85
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2020 17:14:35 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 27 Nov 2020 17:14:27 +0000
Message-Id: <20201127171427.803479-2-chris@chris-wilson.co.uk>
In-Reply-To: <20201127171427.803479-1-chris@chris-wilson.co.uk>
References: <20201127171427.803479-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_cursor_legacy: Check for
 update overruns
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Check around each pipe test whether an update overran its alloted time.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/kms_cursor_legacy.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 9959fe326..5be67a316 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -88,6 +88,7 @@ static void stress(igt_display_t *display,
 			arg.crtc_id = crtc_id[0] = display->pipes[pipe].crtc_id;
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
 		}
+		kmstest_pipe_begin(display->drm_fd, pipe);
 	}
 
 	arg.flags = mode;
@@ -151,6 +152,9 @@ static void stress(igt_display_t *display,
 		igt_info("Total updates %llu\n", (long long)results[0]);
 	}
 
+	if (pipe >= 0)
+		kmstest_pipe_end(display->drm_fd, pipe);
+
 	gem_close(display->drm_fd, arg.handle);
 	munmap(results, PAGE_SIZE);
 }
@@ -418,6 +422,8 @@ static void flip(igt_display_t *display,
 
 	prepare_flip_test(display, mode, flip_pipe, cursor_pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
 
+	kmstest_pipe_begin(display->drm_fd, flip_pipe);
+
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	igt_fork(child, 1) {
@@ -458,6 +464,8 @@ static void flip(igt_display_t *display,
 	}
 	igt_waitchildren();
 
+	kmstest_pipe_end(display->drm_fd, flip_pipe);
+
 	munmap(results, PAGE_SIZE);
 
 	igt_remove_fb(display->drm_fd, &fb_info);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
