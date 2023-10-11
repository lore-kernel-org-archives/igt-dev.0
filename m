Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8106310E43A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 04:40:08 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 10:10:52 +0530
Message-Id: <20231011044052.53282-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/kms_big_fb: skip if rendercopy
 support is not present
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

Skip test if rendercopy support is not present.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_big_fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 2c7b24fca..5d93d8d0d 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -1072,6 +1072,8 @@ igt_main
 		if (intel_display_ver(data.devid) >= 4)
 			data.render_copy = igt_get_render_copyfunc(data.devid);
 
+		igt_skip_on(!data.render_copy);
+
 		data.bops = buf_ops_create(data.drm_fd);
 
 		data.planeclearrgb[0] = 0.0;
-- 
2.25.1
