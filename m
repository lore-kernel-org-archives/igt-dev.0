Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4CA8985A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 08:50:30 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Mon, 14 Jun 2021 13:57:46 +0530
Message-Id: <20210614082746.7951-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_dp_dsc: Assign the proper output
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
Cc: kunal1.joshi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Use 'output' here rather than 'data->output' as it is still not populated.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/3494

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_dp_dsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index 2446fd82..12180b19 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -228,7 +228,7 @@ static void run_test(data_t *data, igt_output_t *output,
 {
 	enum pipe pipe;
 
-	data->mode = igt_output_get_mode(data->output);
+	data->mode = igt_output_get_mode(output);
 	igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay,
 			      data->mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
