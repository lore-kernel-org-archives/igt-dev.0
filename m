Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4A810E625
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:37:35 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oTdpR-0016Uo-Iz
 for igt-dev@lists.freedesktop.org; Thu, 01 Sep 2022 08:37:29 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:36:57 +0200
Message-Id: <20220901063722.261828-50-mauro.chehab@linux.intel.com>
In-Reply-To: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
References: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 49/74] kms_panel_fitting: Close device
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
Acked-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/kms_panel_fitting.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 478c16bd5f37..2d0590da2ec6 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -280,6 +280,8 @@ igt_main
 	igt_subtest_with_dynamic("atomic-fastset")
 		test_panel_fitting(&data, TEST_ATOMIC);
 
-	igt_fixture
+	igt_fixture {
 		igt_display_fini(&data.display);
+		close(data.drm_fd);
+	}
 }
-- 
2.37.2
