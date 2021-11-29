Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE9E6E1BE
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Nov 2021 21:00:59 +0000 (UTC)
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 29 Nov 2021 13:00:25 -0800
Message-ID: <1638219625-19543-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] lib/igt_fb: fix the plane_size array for
 yuv formats
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
Cc: petri.latvala@intel.com, quic_khsieh@quicinc.com, swboyd@chromium.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

clear_yuv_buffer() checks the size of the plane_size[] to
make sure its greater than the number of planes to avoid
overflows.

The plane_size[] is fixed to two currently.

However some of the formats like YV12 indeed have more than
2 planes in the format_desc[] hence this incorrectly failing
this check.

Increase the size of the plane_size[] to match the correct
max number of planes.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 lib/igt_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 92a0170..e42302d 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1007,7 +1007,7 @@ static void memset64(uint64_t *s, uint64_t c, size_t n)
 static void clear_yuv_buffer(struct igt_fb *fb)
 {
 	bool full_range = fb->color_range == IGT_COLOR_YCBCR_FULL_RANGE;
-	size_t plane_size[2];
+	size_t plane_size[3];
 	void *ptr;
 
 	igt_assert(igt_format_is_yuv(fb->drm_format));
-- 
2.7.4
