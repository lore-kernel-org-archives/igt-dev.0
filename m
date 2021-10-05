Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A656EAC8
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 23:55:59 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Mon,  4 Oct 2021 17:01:45 -0700
Message-Id: <20211005000145.311228-2-jose.souza@intel.com>
In-Reply-To: <20211005000145.311228-1-jose.souza@intel.com>
References: <20211005000145.311228-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_psr2_su: Skip test when
 necessary
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The whole test needs to skip in display 13 platforms as
PSR2_SU_STATUS is not being updated anymore by HW.
It was not reliable in older display versions and now it is 100% dead.

For display 12 and newer platforms now we have PSR2 selective fetch
enabled default, so software is doing all the tracking of the areas
that needs updates but we still can't do that for frontbuffer
rendering so we are doing full frame fetches for now what will cause
this test to fail, so also skipping it for the frontbuffer subtest.

Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/i915/kms_psr2_su.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 318deefdf..3018bcc6c 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -251,6 +251,9 @@ igt_main
 					       data.debugfs_fd, PSR_MODE_2),
 			      "Sink does not support PSR2\n");
 
+		igt_require_f(intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 13,
+			      "Registers used by this test do not work on display 13\n");
+
 		display_init(&data);
 
 		/* Test if PSR2 can be enabled */
@@ -280,6 +283,21 @@ igt_main
 	for (data.op = PAGE_FLIP; data.op < LAST; data.op++) {
 		igt_describe("Test that selective update works when screen changes");
 		igt_subtest_f("%s", op_str(data.op)) {
+
+			if (data.op == FRONTBUFFER &&
+			    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
+				/*
+				 * FIXME: Display 12+ platforms now have PSR2
+				 * selective fetch enabled by default but we
+				 * still can't properly handle frontbuffer
+				 * rendering, so right it does full frame
+				 * fetches at every frontbuffer rendering.
+				 * So it is expected that this test will fail
+				 * in display 12+ platform fow now.
+				 */
+				igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
+			}
+
 			prepare(&data);
 			run(&data);
 			cleanup(&data);
-- 
2.33.0
