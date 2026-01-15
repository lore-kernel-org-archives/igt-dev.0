Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E865BD4114B
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 09:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BBA10E711;
	Thu, 15 Jan 2026 09:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIM0AonB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6BF10E711
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768468925; x=1800004925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CajCNSrbHyAghama9jZat+KNVzsCvwfe8dJbKO8R6OY=;
 b=GIM0AonBdVgJHdkuyO4bHMs0rH2yDZt7uEFVwanhZuvTHDqq+vzSqsIV
 V137TWJ8ZqXefjpK9Ozmc3AlC7pzTP2fzkJQNLGsD4uFymBi4DbKCMaSa
 kLDf1vde618jxYoONmJLGL14tIXPjYiNkWZtK4ZH/Uo2WqgFWvorSkmHM
 jwAP7Gk3BYaoELysIY/+p4s+H38RJe1pYzDBgMfYDY1zO+U/byVvO5rcs
 GZMtaUg7qgg5PEvEXrdFPD01HMQ/4Dq9+vTwCkJ8Gw8mEgwH3v0Irw9Pa
 FhIMXl+HSE/55fieXkLheRRGrnm2YR/Prnv/2d2rt7BgKG3NvdPWSCGAk Q==;
X-CSE-ConnectionGUID: 1WWuwr3RTzqeS3SVLvo1ag==
X-CSE-MsgGUID: tLLg9rC/RoSNfJwkQJZscA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92442599"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="92442599"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 01:22:05 -0800
X-CSE-ConnectionGUID: SQJVQCgPSd2kA2oxyX/Bgg==
X-CSE-MsgGUID: SbEmwTTrS5mUz6ez8m2YYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204936229"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 01:22:04 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Jan=20Ma=C5=9Blak?= <jan.maslak@intel.com>
Subject: [PATCH i-g-t 1/2] tests/xe_render_copy: Skip if platform doesn't
 support flatccs
Date: Thu, 15 Jan 2026 10:21:57 +0100
Message-ID: <20260115092155.114781-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115092155.114781-4-zbigniew.kempczynski@intel.com>
References: <20260115092155.114781-4-zbigniew.kempczynski@intel.com>
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

If device doesn't support flatccs skip the test, otherwise we fail
during buffer creation which rely on this flag.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Jan Maślak <jan.maslak@intel.com>
---
 tests/intel/xe_render_copy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index e2e752e28b..861daec971 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -710,6 +710,8 @@ int igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 	for (int id = 0; id <= COPY_FULL_COMPRESSED; id++) {
 		igt_subtest_with_dynamic_f("render-%s", testname[id]) {
 			igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
+			if (id == COPY_FULL_COMPRESSED)
+				igt_require(HAS_FLATCCS(buf_ops_get_devid(bops)));
 
 			for_each_tiling(tiling) {
 				if (!render_supports_tiling(xe, tiling,
-- 
2.43.0

