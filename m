Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55DEC54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741BC10E3AF;
	Tue, 27 Aug 2024 16:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pdtj0Fbb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA47710E3AF
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724777697; x=1756313697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GcTnTZ3ZKKnyrrUWbfXaZninTHslCZAmVEiK4I6+/v4=;
 b=Pdtj0Fbb3Uqf7l/tXz0QsugQD5//QHbBYbXj7jkFYE2TPS5qdIqVqGz+
 fHTlOCSyUuW1gxH/Qy4Jjsciqwq5V+H8Et4SXisiFbFY+oPmN8r4+aigt
 CwKhMTpYikRIFFT7qJkvTa+ZMn2Fe8u/sBurfYCNM9hO4VNqVcLVjB+y/
 QpNX7CXaZxl9MS4cQa3vmFg/1N+wFCCZQnuT4j8K/XZ1z+kuAhmqPRRJN
 iKllzYx7oqiMf0MqP0cTfarQyfDII3PcJKNNcUZ+aXeTkPTzFL4vgUuDn
 ZkMkDJFSgc87edD6UW1FgkC0J8zBhTRtcjaOWKmxMAIY0bepAX/rtOWpT g==;
X-CSE-ConnectionGUID: t/71lCMNRmurYxb8nbK1HA==
X-CSE-MsgGUID: M+h8rK7KQoKjH1QG6zpXbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45787333"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="45787333"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:56 -0700
X-CSE-ConnectionGUID: kfcXjH/LQvuC96AyaKtFJA==
X-CSE-MsgGUID: XNDtaju1QpeiHGA9h3XHBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63640423"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 05/10] tests/intel/xe_drm_fdinfo: Be strict on == 0
 comparison
Date: Tue, 27 Aug 2024 09:54:44 -0700
Message-ID: <20240827165449.1706784-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827165449.1706784-1-lucas.demarchi@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 1b5980752..68c21925c 100644
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

