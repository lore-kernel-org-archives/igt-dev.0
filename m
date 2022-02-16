Return-path: <SRS0=u8tb=S7=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2377210E62D
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 19:18:25 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Feb 2022 21:18:14 +0200
Message-Id: <20220216191814.10314-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: Fix the crc test
 vblank request
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The test fails to populate the horrible vblank ioctl
flags correctly unless it happens to be running on the
first crtc. Use the helper we have to cook up the
necessary magic flags.

Should make the test work on some CHV machines that have
to use pipe C due to their restricted pipe->port routing
capabilities.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 0c3821339680..5e11cd43610f 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -396,9 +396,10 @@ static void test_init(data_t *data)
 
 static void queue_vblank(data_t *data)
 {
+	int pipe = kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
 	drmVBlank wait_vbl = {
 		.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT |
-			kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id),
+			kmstest_get_vbl_flag(pipe),
 		.request.sequence = 1,
 		.request.signal = (long)data,
 	};
-- 
2.34.1
