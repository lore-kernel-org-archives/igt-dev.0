Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD6B89C1F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Mar 2021 10:36:00 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Mon, 15 Mar 2021 16:05:47 +0530
Message-Id: <20210315103547.17115-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20210315103547.17115-1-mohammed.khajapasha@intel.com>
References: <20210315103547.17115-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/kms_cursor_crc: Add vblank wait
 for restore image
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add igt_wait_for_vblank() once restore image is done and
frontbuffer mark as dirty.

Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Kahola, Mika <mika.kahola@intel.com>
Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_cursor_crc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 0be8f7f8..3541ea06 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -147,6 +147,7 @@ static bool cursor_visible(data_t *data, int x, int y)
 static void restore_image(data_t *data)
 {
 	cairo_t *cr;
+	igt_display_t *display = &data->display;
 
 	/* rendercopy stripped in igt using cairo */
 	cr = igt_get_cairo_ctx(data->drm_fd,
@@ -157,6 +158,8 @@ static void restore_image(data_t *data)
 	cairo_fill(cr);
 	igt_put_cairo_ctx(cr);
 	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[data->pipe].crtc_offset);
 }
 
 static void do_single_test(data_t *data, int x, int y)
-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
