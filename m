Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9528210F465
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 09:04:41 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 May 2022 14:37:17 +0530
Message-Id: <20220520090717.25767-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_concurrent: Skip the subtest
 if the resolution is not supported
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

Added check to skip the subtest if the current mode is smaller
than 1024 mode (igt_skip_on_f(mode_default->vdisplay < 1024))
becuase if the default resolution is greater then the highest
resolution supported by the connector then the test should skip.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_concurrent.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index c334194b..d4536e3b 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -252,6 +252,7 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
 			return igt_memdup(mode, sizeof(*mode));
 	}
 
+	igt_skip_on_f(mode_default->vdisplay < 1024, "No suitable resolution was found\n");
 	return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
 }
 
-- 
2.26.2
