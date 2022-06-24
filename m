Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E382710F72D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jun 2022 04:56:46 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Jun 2022 10:30:00 +0530
Message-Id: <20220624050000.22886-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Fix regression in
 test_resolution_with_output
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

Fix regression caused by commit 14ad49f5b6ed861eda93e9d6b6ed0f3c77d228d1
to skip the subtest if the suitable resolution is not found.

The kms_concurrent is about testing mode setting with
reducing the resolution and then again increasing it,
for this the test will take the high resolution supported
by the connector and then calculate the lowest resolution,
if the calculated resolution is not supported by the connector
it will assign the default resolution of 1024x 768 without
checking.

Added check to skip the subtest if the current mode is smaller
than 1024 mode (igt_skip_on_f(mode_default->hdisplay < 1024))
becuase if the default resolution is greater then the highest
resolution supported by the connector then the test should skip.

Fixes: 14ad49f5b6ed861eda93e9d6b6ed0f3c77d228d1
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_concurrent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index d4536e3b..6f8ffd4a 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -252,7 +252,7 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
 			return igt_memdup(mode, sizeof(*mode));
 	}
 
-	igt_skip_on_f(mode_default->vdisplay < 1024, "No suitable resolution was found\n");
+	igt_skip_on_f(mode_default->hdisplay < 1024, "No suitable resolution was found\n");
 	return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
 }
 
-- 
2.26.2
