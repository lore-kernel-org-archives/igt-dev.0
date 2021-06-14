Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C0389B95
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 10:49:41 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Mon, 14 Jun 2021 15:57:08 +0530
Message-Id: <20210614102708.10229-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_dp_dsc: Assign the proper
 output
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

Fixes: a1772be7dede ("tests/kms_dp_dsc: Bug fix for DP on Pipe A")
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3494

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
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
