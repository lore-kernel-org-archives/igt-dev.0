Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B5D6E888
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2020 09:03:02 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Mon, 20 Jan 2020 14:21:57 +0530
Message-Id: <20200120085158.9151-2-anshuman.gupta@intel.com>
In-Reply-To: <20200120085158.9151-1-anshuman.gupta@intel.com>
References: <20200120085158.9151-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] kms_content_protection: add check for
 DPMS off state
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ramalingam C <ramalingam.c@intel.com>

During DPMS off HDCP state should be DESIRED.
Lets add a check for that.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/kms_content_protection.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3b9cedcb..6f896a97 100644
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
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
