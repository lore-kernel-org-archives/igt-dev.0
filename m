Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6690210E335
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jan 2023 12:06:56 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 Jan 2023 14:06:42 +0200
Message-Id: <20230131120646.27434-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] tests/kms_async_flips: Render the bars
 full height
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

Make the colored bars full height so that we can actually see
the async flip activity on every scanline, as opposed to just
being able to see it in the middle of the screen.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 89e431ac32e2..55be0bd874ad 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -133,7 +133,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 	}
 
 	cr = igt_get_cairo_ctx(data->drm_fd, fb);
-	igt_paint_color_rand(cr, rec_width * 2 + rec_width * index, height / 4, rec_width, height / 2);
+	igt_paint_color_rand(cr, rec_width * 2 + rec_width * index, 0, rec_width, height);
 	igt_put_cairo_ctx(cr);
 }
 
-- 
2.39.1
