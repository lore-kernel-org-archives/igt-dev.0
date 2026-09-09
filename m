Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141B1C79F82
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 00:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B2210ECCD;
	Wed,  9 Sep 2026 00:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUEGDdZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183B010E183
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 00:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788913631; x=1820449631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dtpnlJHRV3BkoVH/OASU7l7/I8OVu1oypCA0xlmNvZ4=;
 b=VUEGDdZDDRefC3i+rija3MFj+B06LqEEzt4+U1MJRWUlvz4QZGq6WMW2
 QT9KpqH1kN+bKSH3PCsrt6KJl7X/i6vmmh5ekMV29bLsXKOtq3tP/1HVb
 /9MARVD5hfscFX65lEp81buFB+LLpPrH3A/0A9pJYAqJZYzZQqiLHP1qx
 UsLfx2D1FY7FEKg2GXKNoagpAgOmcsNqdxwGQk8FxVU8ZRxcJxjlJv6o4
 HSfNevtGQ4hCGGKZa1+j3cTg1gUrDLnku9f2oLEv7LjS92KpQhvlxIRkS
 /gsuAAAlYc0Mm1EFIei6tvE/titylESufnbFc3HcG/BbOI9Tcs6DYnRY/ g==;
X-CSE-ConnectionGUID: 520Wkq5KSpyFbJTCsDHetQ==
X-CSE-MsgGUID: aUosmtZ/RNGSDQhGkq0HLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88265125"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="88265125"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 17:27:11 -0700
X-CSE-ConnectionGUID: wVyWSJ59TEioEMUn0ela3A==
X-CSE-MsgGUID: DrOIQYRORZSqoP61PWGymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="267905634"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2026 17:27:11 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/intel-ci: Add a subset of pxp tests into
 xe-fast-feedback
Date: Tue,  8 Sep 2026 17:27:05 -0700
Message-ID: <20260909002705.431136-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909002705.431136-5-alan.previn.teres.alexis@intel.com>
References: <20260909002705.431136-5-alan.previn.teres.alexis@intel.com>
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

Add only bo/queue allocation pxp subtests into BAT coverage
since this subtests cover both positive and negative testing
depending on the platform's support.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index ecd2c568f..59d1cff2e 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -203,6 +203,8 @@ igt@xe_pm_residency@gt-c6-on-idle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
+igt@xe_pxp@pxp-bo-alloc
+igt@xe_pxp@pxp-queue-alloc
 igt@xe_query@query-engines
 igt@xe_query@query-mem-usage
 igt@xe_query@query-gt-list
-- 
2.43.0

