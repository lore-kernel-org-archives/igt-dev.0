Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D52D1CA39
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2133C10E524;
	Tue,  5 Nov 2024 06:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DM4+LPry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78E110E51C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730787557; x=1762323557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=96N6+IT8hPhSlJlXGxJkfIb+BjQTGMn6PgKz83vChFY=;
 b=DM4+LPryLcAAWtiYkHTgwF0795aLqP+2zJx9l0qyoPLpDOJuAHrjEJNu
 HvL1+yD2CmY2N5QLPsQbeWlay1oUNIfoNkKqiO/xkfn2yZwKUIDzd2h7B
 n1oRCxzLXDX9kjzRSiFtEUFiNkeEdlq79T/UdcTyKXf3Ycs06QpcppUP8
 6ApB04jmhaqfqRcgjELiVetg9+36yI+CAPW58da0Lhe2PT3cMQaWuZnC3
 0+2Jz1iAO4WzCsvB8ykwkBu2+24VJSGvchpQkWpxVW49ZnnbF85l7pOU8
 Exx30M5kVSXJOfETq5K8l2NR62Vxergpd1CpySi76H9uHtj8uckVjhfsM g==;
X-CSE-ConnectionGUID: JWrfoppVSLWjpRaSCz6x9g==
X-CSE-MsgGUID: r+ScfAIuQAuyKp7sbUg30g==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18133565"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="18133565"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
X-CSE-ConnectionGUID: JkpARNrjQq2PVD59nYAdrA==
X-CSE-MsgGUID: MYG46B26QFO90MQ8/U1HLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83781724"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/9] tests/intel/perf_pmu: Remove trial unload
Date: Mon,  4 Nov 2024 22:18:38 -0800
Message-ID: <20241105061845.2486557-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105061845.2486557-1-lucas.demarchi@intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
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

Remove the trial module so there are no more users of
__igt_i915_driver_unload() and thus i915 can start sharing the xe logic.
Later when perf_pmu_unregister() is fixed in the kernel, a new check can
be added for trying to unbind the device while still having open events.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/perf_pmu.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index bfa2d501a..f916ded53 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -2282,7 +2282,6 @@ static void test_unload(unsigned int num_engines)
 		int fd[4 + num_engines * 3], i;
 		uint64_t *buf;
 		int count = 0, ret;
-		char *who = NULL;
 		int i915;
 
 		i915 = __drm_open_driver(DRIVER_INTEL);
@@ -2337,23 +2336,19 @@ static void test_unload(unsigned int num_engines)
 
 		igt_debug("Read %d events from perf and trial unload\n", count);
 		pmu_read_multi(fd[0], count, buf);
-		ret = __igt_i915_driver_unload(&who);
-		igt_debug("__igt_i915_driver_unload: ret %d who %s\n", ret, who);
-		igt_assert(ret != 0 && !strcmp(who, "i915"));
-		free(who);
-		pmu_read_multi(fd[0], count, buf);
 
 		igt_debug("Close perf\n");
-
 		for (i = 0; i < count; i++)
 			close(fd[i]);
 
+		igt_debug("Final unload\n");
+		/* After perf is closed, we should be able to remove the module */
+		ret = igt_i915_driver_unload();
+		igt_assert_eq(ret, 0);
+
 		free(buf);
 	}
 	igt_waitchildren();
-
-	igt_debug("Final unload\n");
-	igt_assert_eq(__igt_i915_driver_unload(NULL), 0);
 }
 
 static void pmu_read(int i915)
-- 
2.47.0

