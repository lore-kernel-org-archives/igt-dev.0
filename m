Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DAF10E0CA
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 01:03:37 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 06:28:19 +0530
Message-Id: <20220922005819.25253-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220922005819.25253-1-nidhi1.gupta@intel.com>
References: <20220922005819.25253-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/kms_writeback: Test cleanup
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

Sanitize the system state before starting the subtest.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_writeback.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 3781fa34..5149e302 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -521,6 +521,8 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 
 		kmstest_set_vt_graphics_mode();
 
+		igt_display_reset(display);
+
 		igt_display_require(&display, display.drm_fd);
 
 		igt_require(display.is_atomic);
-- 
2.36.0
