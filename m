Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCC210EDA3
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 11:59:07 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 May 2022 17:31:32 +0530
Message-Id: <20220509120132.5769-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Skip the subtest if
 the resolution is not supported
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The kms_concurrent is about testing mode setting with
reducing the resolution and then again increasing it,
for this the test will take the high resolution supported
by the connector and then calculate the lowest resolution,
if the calculated resolution is not supported by the connector
it will assign the default resolution of 1024x 768 without
checking.

Added check to skip the subtest if the default resolution is not supported
by the connector, to achieve that we are skipping if,
"mode_lo->vdisplay  > mode_hi->vdisplay".

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_concurrent.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 82b2021e..e7f8d85c 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -272,6 +272,8 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 		mode_hi = igt_output_get_mode(output);
 		mode_lo = get_lowres_mode(data, mode_hi, output);
 
+		igt_skip_on_f(mode_lo->vdisplay > mode_hi->vdisplay, "No suitable resolution was found\n");
+
 		/* switch to lower resolution */
 		igt_output_override_mode(output, mode_lo);
 		free(mode_lo);
-- 
2.26.2
