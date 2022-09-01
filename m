Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56E710E633
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:37:36 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oTdpS-0016W0-5w
 for igt-dev@lists.freedesktop.org; Thu, 01 Sep 2022 08:37:30 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:37:15 +0200
Message-Id: <20220901063722.261828-68-mauro.chehab@linux.intel.com>
In-Reply-To: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
References: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 67/74] kms_scaling_modes: Close device
 before exit
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

From: Chris Wilson <chris.p.wilson@intel.com>

Close the device fd before we check for leaks during the atexit
handlers.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/kms_scaling_modes.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 8e80189ac6bb..039e4a8d9303 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -132,6 +132,8 @@ igt_main
 	igt_subtest_with_dynamic("scaling-mode-none")
 		test_scaling_mode(&data, DRM_MODE_SCALE_NONE);
 
-	igt_fixture
+	igt_fixture {
 		igt_display_fini(&data.display);
+		close(data.drm_fd);
+	}
 }
-- 
2.37.2
