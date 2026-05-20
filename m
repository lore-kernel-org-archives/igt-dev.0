Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C13FCD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 09:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD4510EF8D;
	Wed, 20 May 2026 09:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WonPeZHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B497710E10C
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779267642; x=1810803642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RPOEDdc+WGmbCid4mGaH5+V7jSvXu866b9fBDWBiXKA=;
 b=WonPeZHZ9Hgd0XhS7HTFMJ/FqWV2e3ulJ3Voq6P6lUvphaea9LaKx9Vp
 1LajcU04qEApEwIJLrdN6rfBWyiQul0wZtBOUa3BeEHAid0qqNHF6rWoS
 QdOmB6e5jaFcjlPs07Iq11h46R4bKghzTp7gSVEuCsLuORhed+8etKPmA
 xYd3dHI7/dgmcyX1IyWknSsSVcoMb4ZSo/Ct3oUXyOAKST0uiQp1r5NbZ
 L2J+1Tpm1ZO0+urRP9D75pSVPA62pkIIN1jjifSXA/ac6Xrns8Hpz1+ED
 8WPjREI1MdpXNwnhx9o7cYy22M047SbI2eLZLM7E9DrEUNanHqTzHTOoA A==;
X-CSE-ConnectionGUID: KHAdy7rUQziu5WbwoTAing==
X-CSE-MsgGUID: B+tA5sMMTSqXaV0C+L8LEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90856619"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="90856619"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:00:42 -0700
X-CSE-ConnectionGUID: yyKxgs8qTSO3MaL3sHh2Tg==
X-CSE-MsgGUID: JSkxML9kQa+jPksTDKfLzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="240346330"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:00:42 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/2] tests/xe_compute: Skip SVM tests on platforms
 without fault mode vm
Date: Wed, 20 May 2026 11:00:36 +0200
Message-ID: <20260520090034.463367-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520090034.463367-4-zbigniew.kempczynski@intel.com>
References: <20260520090034.463367-4-zbigniew.kempczynski@intel.com>
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

