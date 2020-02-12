Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809AC6E104
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 19:06:54 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 13 Feb 2020 00:35:09 +0530
Message-Id: <20200212190509.30369-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20200212190509.30369-1-mohammed.khajapasha@intel.com>
References: <20200212190509.30369-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/kms_big_fb: Set plane position
 and framebuffer dimensions before commit
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

Set the plane position and weight and height for small framebuffer
before committing it in for loop.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_big_fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index eb144da9..6ba96a99 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -286,6 +286,7 @@ static bool test_plane(data_t *data)
 		}
 
 		igt_plane_set_fb(plane, small_fb);
+		igt_plane_set_position(plane, 0, 0);
 		igt_plane_set_size(plane, data->width, data->height);
 
 		/*
@@ -318,6 +319,8 @@ static bool test_plane(data_t *data)
 		copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
 			     small_fb->width, small_fb->height);
 
+		igt_fb_set_size(small_fb, plane, small_fb->width, small_fb->height);
+
 		igt_display_commit2(&data->display, data->display.is_atomic ?
 				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
