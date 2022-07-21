Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A7A8F9F3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jul 2022 11:33:29 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Jul 2022 17:07:11 +0530
Message-Id: <20220721113711.6892-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5] tests/kms_concurrent: Fix regression in
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

Use hdisplay to check the resolution of the connector
instead of vdisplay. This fixes the regression caused
by the commit 14ad49f5b6ed.

Fixes: 14ad49f5b6ed (tests/kms_concurrent: Skip the subtest if the resolution is not supported)
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
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
