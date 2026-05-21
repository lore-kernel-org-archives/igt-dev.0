Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46426CD4F3C
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 07:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D629E10F236;
	Thu, 21 May 2026 07:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiOcFr/C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97F510E127
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779348346; x=1810884346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cvf2jwqpZEX0Pbw+RavwjENw6v+XaxfK14e+GPchAMk=;
 b=BiOcFr/CY8fqfMPrCnLhQLDsfobo5KZc+bLGxeWoPJpRQSA0OZOP/3eu
 uPaTA/R9p9fhFaoxAPnTiypX1x5x4Q5vTFNxMn46kGWxOEgU8cSEbxjQx
 LBNK3n3cINtHbs0T7cS1z2dGNH+4rWBmkZcOuve/d6UqmYppW999hA7zt
 fqceHTWWGJAg2WBdKz62klpv0wKveO/MQ4gW3AkfxrFZwjcWLYwaf3KSj
 cqev119aOlX5QuIzWpD4IlLr/nZPtMRWIQ+djfQM3Zw0sDq31oxbKVL0E
 g3/wULNR6FEykW8UNXum5I4/UOaM4LNz0kKSgopofK2MStcbxG4eFtWO8 Q==;
X-CSE-ConnectionGUID: /D9UWUoGTh2IOqO+2901Aw==
X-CSE-MsgGUID: UmTI9LaqT+mMjVgizCypQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79409540"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="79409540"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 00:25:46 -0700
X-CSE-ConnectionGUID: ArtEOxuDRrm9wdryHKha2w==
X-CSE-MsgGUID: lRUJjuBrTbyGINmS8iyPEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="244444687"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 00:25:45 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/xe_compute: Skip SVM tests on platforms
 without fault mode vm
Date: Thu, 21 May 2026 09:25:38 +0200
Message-ID: <20260521072536.796712-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521072536.796712-4-zbigniew.kempczynski@intel.com>
References: <20260521072536.796712-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Group SVM tests and skip them if platform on which they are executed
doesn't support fault mode vm.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_compute.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 406d708bcd..2f70f22910 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -688,14 +688,19 @@ int igt_main()
 	igt_subtest("compute-square-userenv-large-buffer")
 		test_compute_square_userenv(xe, LARGE_BUFFER);
 
-	igt_subtest("compute-square-userenv-isvm")
-		test_compute_square_userenv(xe, INPUT_IN_SVM);
+	igt_subtest_group() {
+		igt_fixture() {
+			igt_require(!xe_supports_faults(xe));
+		}
+		igt_subtest("compute-square-userenv-isvm")
+			test_compute_square_userenv(xe, INPUT_IN_SVM);
 
-	igt_subtest("compute-square-userenv-osvm")
-		test_compute_square_userenv(xe, OUTPUT_IN_SVM);
+		igt_subtest("compute-square-userenv-osvm")
+			test_compute_square_userenv(xe, OUTPUT_IN_SVM);
 
-	igt_subtest("compute-square-userenv-iosvm")
-		test_compute_square_userenv(xe, INPUT_IN_SVM | OUTPUT_IN_SVM);
+		igt_subtest("compute-square-userenv-iosvm")
+			test_compute_square_userenv(xe, INPUT_IN_SVM | OUTPUT_IN_SVM);
+	}
 
 	igt_fixture()
 		drm_close_driver(xe);
-- 
2.43.0

