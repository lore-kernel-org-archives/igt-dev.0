Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0D36E1B6
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2020 10:39:15 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Fri,  3 Jan 2020 16:00:22 +0530
Message-Id: <20200103103022.13889-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH RFC i-g-t] kms_content_protection: use delay for
 few panels which don't respond for AKE cert read.
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
Cc: Suresh Kumar Kurmi <suresh.kumar.kurmi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

While running HDCP igt tests with some panels like Accer CB281HK,
panel state machine enters to bad state such that they won't respond
to AKE cert read request properly until unless they are being
power cycle off/on.
These panels doesn't seems to handle back to back HDCP authentication
request, using a delay of 1 seconds before enabling HDCP reduced the
reproduction rate. Using 100ms delay in i915 driver before AKE cert read
also fixes this issue, it is safer to use delay in IGT for HDCP tests
for these panels.

CC: Ramalingam C <ramalingam.c@intel.com>
Suggested-by: Suresh Kumar Kurmi <suresh.kumar.kurmi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/kms_content_protection.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3b9cedcb..9bef5278 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -475,6 +475,12 @@ static void test_content_protection_on_output(igt_output_t *output,
 			continue;
 
 		modeset_with_fb(pipe, output, s);
+
+		/*
+		 * Sleep for 1 seconds for some panels which don't respond
+		 * for AKE Cert Read.
+		 */
+		sleep(1);
 		test_cp_enable_with_retry(output, s, 3, content_type, false,
 					  false);
 
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
