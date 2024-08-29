Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DD9C87FD3
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 19:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286AC10E770;
	Thu, 29 Aug 2024 19:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KkJHV3MJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E5210E656
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724958253; x=1756494253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N3Tk+gCnfm10ZtqqseMyzdwvCn7dpA5Ps5nquNfmp7o=;
 b=KkJHV3MJV+JFcLwgCqMrdUxKfFThcbZUbOysBbfGTMnFaf5ugsAxzTsL
 Eyfc4g+o+cxpW4hPQOf/XDMwqEmaeG5auHU6NgDaA31uYZJ0x98V+VPf3
 snfh8DUWwuZT0pzvZJFnqA/X43GnsAp0oXkweR3D+nd5FuXrAKvWGG9Nq
 aEx7n23hqYbr6rs4r01OoX0ZGDJKy7j+AvsEUohJfdOS+wvMLi4F7d7sE
 bEQxxTbZEO2fsURob/iXWFuOGv7moaHW0348el6l9dCN5tkA1k85unI8Q
 B5Y6GpxMMqNRMGgGcuJwGBtU4HBNYJcDNoXtOfI4qRPwzbyQ4SUv5nCie A==;
X-CSE-ConnectionGUID: 8Rf9nLXlQ32cOJkbN1wcqQ==
X-CSE-MsgGUID: nXEz5CiBRImgOuN12ierWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26473920"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="26473920"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 12:03:53 -0700
X-CSE-ConnectionGUID: WVz7K/INRPuC7946DAvzSQ==
X-CSE-MsgGUID: xQiWGdzlRbe/TT8MlRL4sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="63365394"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 12:03:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [CI i-g-t 1/3] tests/intel/xe_drm_fdinfo: Be strict on == 0 comparison
Date: Thu, 29 Aug 2024 12:03:39 -0700
Message-ID: <20240829190341.1943839-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Do not compare the percent to 0, just make sure there's not a single
tick in those cycles.

v2: separate numerator and denominator calculation and check
    numerator. It's not guaranteed cycles start from 0.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index de8a2dbce..46c96dbe0 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -474,14 +474,16 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 	      int class, unsigned int flags)
 {
 	double percent;
+	u64 den, num;
 
 	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
 		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
 	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
 		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
 
-	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
-		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
+	num = s2[class].cycles - s1[class].cycles;
+	den = s2[class].total_cycles - s1[class].total_cycles;
+	percent = (num * 100.0) / (den + 1);
 
 	igt_debug("%s: percent: %f\n", engine_map[class], percent);
 
@@ -489,7 +491,7 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 		igt_assert_lt_double(95.0, percent);
 		igt_assert_lt_double(percent, 105.0);
 	} else {
-		igt_assert(!percent);
+		igt_assert_eq(num, 0);
 	}
 }
 
-- 
2.43.0

