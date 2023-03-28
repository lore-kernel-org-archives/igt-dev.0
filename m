Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7A310E8B4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 12:36:17 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 ankit.k.nautiyal@intel.com, karthik.b.s@intel.com
Date: Tue, 28 Mar 2023 18:02:08 +0530
Message-Id: <20230328123210.3781976-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230328123210.3781976-1-bhanuprakash.modem@intel.com>
References: <20230328123210.3781976-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 4/6] tests/kms_invalid_mode: Use helpers from
 IGT lib
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

Instead of writing own logic at test level, use existing IGT
helper to read the max dot clock.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_invalid_mode.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 86f529e88b1..ec048305567 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -213,27 +213,6 @@ test_output(data_t *data)
 	igt_remove_fb(data->drm_fd, &fb);
 }
 
-static int i915_max_dotclock(data_t *data)
-{
-	char buf[4096];
-	char *s;
-	int max_dotclock = 0;
-
-	if (!is_i915_device(data->drm_fd))
-		return 0;
-
-	igt_debugfs_read(data->drm_fd, "i915_frequency_info", buf);
-	s = strstr(buf, "Max pixel clock frequency:");
-	igt_assert(s);
-	igt_assert_eq(sscanf(s, "Max pixel clock frequency: %d kHz", &max_dotclock), 1);
-
-	/* 100 Mhz to 5 GHz seem like reasonable values to expect */
-	igt_assert_lt(max_dotclock, 5000000);
-	igt_assert_lt(100000, max_dotclock);
-
-	return max_dotclock;
-}
-
 static const struct {
 	const char *name;
 	bool (*adjust_mode)(data_t *data, drmModeModeInfoPtr mode);
@@ -293,7 +272,7 @@ igt_main
 		data.res = drmModeGetResources(data.drm_fd);
 		igt_assert(data.res);
 
-		data.max_dotclock = i915_max_dotclock(&data);
+		data.max_dotclock = igt_get_max_dotclock(data.drm_fd);
 		igt_info("Max dotclock: %d kHz\n", data.max_dotclock);
 	}
 
-- 
2.40.0
