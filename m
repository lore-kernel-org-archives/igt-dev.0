Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C7B6EABE
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 23:55:59 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Mon,  4 Oct 2021 17:01:44 -0700
Message-Id: <20211005000145.311228-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] Revert "tests/kms_psr: Skip h/w
 tracking PSR2 tests for ADL-P"
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

PSR2 is now working on Alderlake-P so we can revert this patch.
This reverts commit b5c6b973e7f7d33e7521825e39ddd380e80af01a.

Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/i915/kms_psr.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
index 270d31504..c65b3c806 100644
--- a/tests/i915/kms_psr.c
+++ b/tests/i915/kms_psr.c
@@ -441,11 +441,6 @@ static void test_setup(data_t *data)
 	igt_require_f(data->mode,
 		      "No available mode found on %s\n",
 		      data->output->name);
-
-	if (data->op_psr_mode == PSR_MODE_2)
-		igt_require_f(intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 13,
-			      "Intentionally not testing this on Display 13+, Kernel change required to enable testing\n");
-
 	if (data->op_psr_mode == PSR_MODE_2)
 		igt_require(data->supports_psr2);
 
-- 
2.33.0
