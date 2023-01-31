Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE0C10E322
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jan 2023 12:06:53 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 Jan 2023 14:06:41 +0200
Message-Id: <20230131120646.27434-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/6] tests/kms_async_flips: Add missing
 igt_put_cairo_ctx()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Remeber to call igt_put_cairo_ctx() after rendering to make
sure the results actually end up in the framebuffer (in case
the rendering happens to a temporary buffer and there needs
to be a copy back at the end).

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 7cb71f6b441a..89e431ac32e2 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -134,6 +134,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 
 	cr = igt_get_cairo_ctx(data->drm_fd, fb);
 	igt_paint_color_rand(cr, rec_width * 2 + rec_width * index, height / 4, rec_width, height / 2);
+	igt_put_cairo_ctx(cr);
 }
 
 static void require_monotonic_timestamp(int fd)
-- 
2.39.1
