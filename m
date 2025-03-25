Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F41C35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 13:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4765B10E398;
	Tue, 25 Mar 2025 13:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUHWsFIq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0770C10E398
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742911155; x=1774447155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fvk6rMNOq0y2+m2nTQRDxv8MMn2Pl/vgEE7ABjz9sww=;
 b=FUHWsFIqlITh80pIL2ge67UYvNlDeKL+OXqsaZh5/KXhYkNC24s/6ppw
 pfMfPZv7iuEFgTzTzLixSElShoj/3VuHKOXVeQ6hypc0B8SbDBGcVL5Jp
 E0Yo94uGfl+xCcoREzxGyuzCjeb5EL0/pzgGPQTVdaxXfDDTes89g3a7o
 lcvMX4ugIxCPbfxip3hWFo6oL0ODi2napWBQtAdhnJlxEOZYJWZWZzvGE
 wW5px7XA9tlHMHuVyIvoO2r8BDXG2Uzx2KqnuKqdYcP6TU4mQETeSHKyu
 BUFzNpwvqpU8pgAHysgWUGPwsx9aV9qx0354RSzKaUBZNqyIX9cDB2paY A==;
X-CSE-ConnectionGUID: U+TmSIM/TNmmHfoYKq0LIA==
X-CSE-MsgGUID: 2CNKDBnBQbqsr+5pCF17kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44281041"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44281041"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:59:15 -0700
X-CSE-ConnectionGUID: 0ugSt8bLRCiEc/1NRWWlzQ==
X-CSE-MsgGUID: GPysDa88TI6cluDJUV4aug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124358440"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:59:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/perf_pmu: Remove invalid_init test for cpu
Date: Tue, 25 Mar 2025 06:59:06 -0700
Message-ID: <20250325135906.755368-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.49.0
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

Passing a CPU other than the cpumask should not be considered invalid.
Since our perf-pmu has a system-wide event, it can actually be read from
any CPU in the system, not only the one advertised in the cpumask.

See https://lore.kernel.org/all/25bc2cb3-f0ab-4e64-b331-98f52cce9a99@linux.intel.com/
and https://lore.kernel.org/all/20240802151643.1691631-3-kan.liang@linux.intel.com/.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/perf_pmu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index a5e67ce73..bf43da8db 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1313,10 +1313,6 @@ do { \
 	ATTR_INIT();
 	igt_assert_eq(perf_event_open(&attr, 0, 0, -1, 0), -1);
 	igt_assert_eq(errno, EINVAL);
-
-	ATTR_INIT();
-	igt_assert_eq(perf_event_open(&attr, -1, 1, -1, 0), -1);
-	igt_assert_eq(errno, EINVAL);
 }
 
 static void open_invalid(int i915)
-- 
2.49.0

