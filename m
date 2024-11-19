Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B84BD591A6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1507F10E143;
	Tue, 19 Nov 2024 05:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHmYFLbk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3D210E143
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994824; x=1763530824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4NtcN9pG4wyQAUWtLWboXG0wPdVzrKl1hxeZCQT+ad4=;
 b=WHmYFLbkoaZygUtexWm7mmzqMOr00xiT9lmUqLUcKoJzNzfDHEEN/bqz
 39wSn4slBKwV/a3gBdxSRe1ijT1vI7B+U9PcSAiGDz3A+ipM9hpGiOIh3
 US9z+dPs879AteaPw3uH83wdH6HmnlgYSajYrY0O50NhHZg0AeQM4Btjq
 XVFwGs3pouOSrFkCLqmq1WtKawErGz4QFmYVHeQuQuiAYSxKm0+RmEcvn
 4y794Mnf0ZcehPlsOQMNLIIEqoOtjGw7Ao4d3NG4VLUpOVCBnGDC2mjD8
 /HQ3RR60K5AJ0g19TPik4TLEhFa75em+M9I7HEqZbcIY+npap6G1f4Ate w==;
X-CSE-ConnectionGUID: dEWPCpGOS5WlG2ckgmoDIA==
X-CSE-MsgGUID: wdLwLjDxRQyZpx9LfE+PDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19588152"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19588152"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
X-CSE-ConnectionGUID: zdsZwKJ3SPGuoT434FW0kA==
X-CSE-MsgGUID: q4Rb2GeRRPiqvBNIPxYHqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89222408"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [CI 2/9] tests/intel/perf_pmu: Remove trial unload
Date: Mon, 18 Nov 2024 21:40:01 -0800
Message-ID: <20241119054008.2001984-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119054008.2001984-1-lucas.demarchi@intel.com>
References: <20241119054008.2001984-1-lucas.demarchi@intel.com>
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

