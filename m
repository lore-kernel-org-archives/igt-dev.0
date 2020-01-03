Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24F86E191
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2020 08:11:42 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri,  3 Jan 2020 13:41:07 +0530
Message-Id: <20200103081107.28144-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] kms_content_protection: add check for DPMS
 off state
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

During DPMS off HDCP state should be DESIRED.
Lets add a check for that.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/kms_content_protection.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 8b361fdefb2e..eb6cd9ec50b1 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -513,6 +513,11 @@ static void test_content_protection_on_output(igt_output_t *output,
 						IGT_CRTC_ACTIVE, 0);
 			igt_display_commit2(display, s);
 
+			/* Wait for HDCP to be disabled, before crtc off */
+			ret = wait_for_prop_value(output, CP_DESIRED,
+						  KERNEL_DISABLE_TIME_ALLOWED_MSEC);
+			igt_assert_f(ret, "Content Protection not cleared\n");
+
 			igt_pipe_set_prop_value(display, pipe,
 						IGT_CRTC_ACTIVE, 1);
 			igt_display_commit2(display, s);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
