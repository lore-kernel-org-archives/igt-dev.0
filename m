Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416128862C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 10:07:54 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Thu,  8 Jul 2021 15:38:32 +0530
Message-Id: <20210708100832.799-1-jeevan.b@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_psr: Skip h/w tracking PSR2 tests
 for ADL-P
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
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

Currently, PSR2 functionality has not been tested on ADL-P.
Add ADL-P platform specific check to skip PSR2 hw tracking tests.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_psr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_psr.c b/tests/kms_psr.c
index a80abf19..cc713e27 100644
--- a/tests/kms_psr.c
+++ b/tests/kms_psr.c
@@ -416,6 +416,11 @@ static void test_setup(data_t *data)
 	igt_require_f(data->mode,
 		      "No available mode found on %s\n",
 		      data->output->name);
+
+	if (data->op_psr_mode == PSR_MODE_2)
+		igt_require_f(intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 13,
+			      "Intentionally not testing this on Display 13+, Kernel change required to enable testing\n");
+
 	if (data->op_psr_mode == PSR_MODE_2)
 		igt_require(data->supports_psr2);
 
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
