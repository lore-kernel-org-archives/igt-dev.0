Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1F5D2E010
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 05:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E4410E730;
	Wed, 23 Oct 2024 05:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C87dUScd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AE910E72E
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 05:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729659929; x=1761195929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TkMn1e4HGF/iQ5+nsP5dwxZd9Mp6YwyMz6av3JqK6wU=;
 b=C87dUScdtc/hw58iH948mvkHjaK1tTAjjUG8/en986ZkKg4MiTmEjplM
 krL/oN1rAKsyy3dh0nv0b6kV7q1SlvOmhaO1FeaxTCNkD5P4mdcvD4OFY
 fjePlsbZ0K4IglKQvCR1kkQqsD8uk/964RiF9HSoHe9w6ikzGk+Xf4OXh
 6BekkW46tEzwmPflpbTiwFcDva3sQFyaSiEkiKyM1kHFLjTNNyWfTy9wa
 T2G+rZpRfhLvgCEgN0R8/yPjRroBvrXar81GnWrGfCPj2Hb4n7SZnAf07
 8S47IDSeWgYjfi4nXQDRP6yD0cj7+pQnGnWOMg++YU8qHmmb79IFlubm+ g==;
X-CSE-ConnectionGUID: eBStkyGdRU6bHqdS/OcLHw==
X-CSE-MsgGUID: FfLdDgzPQaSrHJznUiTT8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="16849312"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="16849312"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 22:05:28 -0700
X-CSE-ConnectionGUID: S2ldFTVXQl2DmVJc+Y8luw==
X-CSE-MsgGUID: n7hPiP2rT62m55LwAb8oXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="84871450"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 22:05:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/perf_pmu: Migrate to unbind + unload
Date: Tue, 22 Oct 2024 22:05:02 -0700
Message-ID: <20241023050502.3049664-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023050502.3049664-1-lucas.demarchi@intel.com>
References: <20241023050502.3049664-1-lucas.demarchi@intel.com>
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

There isn't much point in testing we can't remove the module directly
after removing *some* known dependencies. The point in this test is to
make sure that if the HW vanishes, driver still behaves. That is
currently not true, as it will cause perf to explode.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/perf_pmu.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index bfa2d501a..6eb4f09d1 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -2282,7 +2282,6 @@ static void test_unload(unsigned int num_engines)
 		int fd[4 + num_engines * 3], i;
 		uint64_t *buf;
 		int count = 0, ret;
-		char *who = NULL;
 		int i915;
 
 		i915 = __drm_open_driver(DRIVER_INTEL);
@@ -2337,23 +2336,26 @@ static void test_unload(unsigned int num_engines)
 
 		igt_debug("Read %d events from perf and trial unload\n", count);
 		pmu_read_multi(fd[0], count, buf);
-		ret = __igt_i915_driver_unload(&who);
-		igt_debug("__igt_i915_driver_unload: ret %d who %s\n", ret, who);
-		igt_assert(ret != 0 && !strcmp(who, "i915"));
-		free(who);
-		pmu_read_multi(fd[0], count, buf);
 
-		igt_debug("Close perf\n");
+		/*
+		 * We can't unload the module with perf event registered, but
+		 * we can make the HW go away by unbinding it from the driver.
+		 */
+		ret = igt_kmod_unbind("i915");
+		igt_assert_eq(ret, 0);
 
+		igt_debug("Close perf\n");
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

