Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E9D10EAE2
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 06:07:26 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 May 2022 09:07:01 +0300
Message-Id: <20220530060701.406219-5-jouni.hogander@intel.com>
In-Reply-To: <20220530060701.406219-1-jouni.hogander@intel.com>
References: <20220530060701.406219-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/i915/kms_psr2_sf: Fix setting
 wrong fb size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Current code is improperly setting over framebuffer size. Fix this
by setting primary framebuffer size instead.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 47a431b6..6612587c 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -367,7 +367,7 @@ static void prepare(data_t *data)
 
 	igt_plane_set_fb(primary, &data->fb_primary);
 	igt_fb_set_position(&data->fb_primary, primary, x, y);
-	igt_fb_set_size(&data->fb_overlay, primary, view_w,
+	igt_fb_set_size(&data->fb_primary, primary, view_w,
 			view_h);
 	igt_plane_set_size(primary, view_w, view_h);
 	igt_plane_set_position(primary, 0, 0);
-- 
2.25.1
