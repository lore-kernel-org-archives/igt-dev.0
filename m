Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A795910E259
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 10:03:43 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.31.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 24E6D580E33
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 03:03:36 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qpn6s-001eFs-0O
 for igt-dev@lists.freedesktop.org; Mon, 09 Oct 2023 12:03:34 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Oct 2023 12:01:41 +0200
Message-ID: <20231009100332.392968-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20231009100332.392968-1-mauro.chehab@linux.intel.com>
References: <20231009100332.392968-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] intel/kms_frontbuffer_tracking.c:
 remove fbc-slowdraw test
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The slowdraw test is defined to run only for two features:

	if ((t.feature & FEATURE_PSR) || (t.feature & FEATURE_DRRS))
		igt_subtest_f("%s-slowdraw", feature_str(t.feature)) {
			igt_require(igt_draw_supports_method(drm.fd, t.method));
			slow_draw_subtest(&t);
		}

As it won't be reported for FBC, remove documentation for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/kms_frontbuffer_tracking.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 6526e1c3cffa..f90d09f9f06d 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -3025,13 +3025,6 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: fbc-slowdraw
- * Description: Sleep a little bit between drawing operations with FBC
- * Driver requirement: i915, xe
- * Functionality: fbc, fbt, kms_core
- * Mega feature: General Display Features
- * Test category: functionality test
- *
  * SUBTEST: psr-slowdraw
  * Description: Sleep a little bit between drawing operations with PSR
  * Driver requirement: i915, xe
-- 
2.41.0
