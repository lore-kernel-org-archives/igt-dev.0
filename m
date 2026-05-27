Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA4ACD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 20:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76A710EA13;
	Wed, 27 May 2026 20:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVjFqPju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D4710EA10
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 20:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915435; x=1811451435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YDMOcD8OcHVoS/t7RdB4vLPWuxlbpGPMafp9X8gLqvk=;
 b=GVjFqPjurGj8jDCYVtIRzD+qcTupcrXX6b+6Wjn5dYc6/Q6VrvjiX4/H
 D3o30iN9rsnWMlHShuSfb9QOhBU5Szqaai8hbygHU6MyOdffULPMDp/CV
 kRnaxPtcgzXExerUewLiSwJBUlBHLzUyy13twtwhH+HtHfbEBD0+AZ7OF
 ngguCJGiZY0vIwnc3+Y+M28Bzbk6Qmf/GtAgrIPXOpHVwntuiF1lktF7i
 bxHc+PtuhVfeXM3IG6vO+JfTYl1+iGpaBTjvw+gbNOFCQPu8GJNHeG4jg
 AelwSGsWmRj2Ucz1x5ff60nbAansVh4qa6fWj/IE+1Fx344GYUqHiNkRE A==;
X-CSE-ConnectionGUID: 0RQ8tF+6SQ2y8tlizDoHHg==
X-CSE-MsgGUID: vMgHgCGJRaC4NBSo9cPgOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84383441"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="84383441"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:15 -0700
X-CSE-ConnectionGUID: 7aulnE/lQ+KXLfEOk5TrSQ==
X-CSE-MsgGUID: U3BDaCJSShuFTeI87KVykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="239347241"
Received: from kpleskax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.94.249.221])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:13 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 5/8] tests/intel/xe_sriov_scheduling: Raise min exec
 quantum to 2ms
Date: Wed, 27 May 2026 22:56:38 +0200
Message-ID: <20260527205644.2801165-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
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

Increase MIN_EXEC_QUANTUM_MS from 1 to 2 to reduce PMU active/total ratio
noise and avoid false positives.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 6d8b7640d..9550c8e58 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -519,7 +519,7 @@ static void log_sample_values(char *id, struct subm_stats *stats,
 }
 
 #define MIN_NUM_REPEATS 25
-#define MIN_EXEC_QUANTUM_MS 1
+#define MIN_EXEC_QUANTUM_MS 2
 #define MAX_EXEC_QUANTUM_MS 32
 #define MIN_JOB_DURATION_MS 2
 #define MAX_TOTAL_DURATION_MS 15000
-- 
2.43.0

