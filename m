Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE63AC624DE
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 21:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C4C10E535;
	Thu,  3 Sep 2026 21:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4Tvhk2x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB1610E094
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788472162; x=1820008162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d1v+U57Ns5+8Kf/r9OGALLDcxXoYfTsSY4+MV+L7s9o=;
 b=O4Tvhk2xtEcxBsnsthLNS5WZatu/M2NSb+oOWWgF0YaK9odagm0DB1X6
 jASd8v6rwgme9xsfFcSmtuJPgjMWTrgbVen1bV/IrNgcUfSN0LMuvod3B
 YIUQHDd4w9Sje3SMD+iY7Fh/spbkI2RmHOsipWiPVbK2rY3DBpDHJSCMi
 9FRyBRNrt1PxPutY8Cvfs/vrrQwe+YPl3ekdZyDtUNU1AVyz1yD0L+HnW
 rXkMaCjQLJoQ52z7EhjGIVkJmQvV9E9sb4vPAK6p+K7IFfFRPwp4soOAk
 /Rhc5idNT3ggttlaVR9XPr8IpUvNaUD7Zrj4PjCjUKNDNHq/J3Ul8cKRu A==;
X-CSE-ConnectionGUID: xk4Pe5BGSNmmaTl8/356vg==
X-CSE-MsgGUID: BavR6XdeSMmnWI8J58wyBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89003167"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="89003167"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 14:49:22 -0700
X-CSE-ConnectionGUID: zfRxbRKzSTue+5QLOMcf6w==
X-CSE-MsgGUID: 9xsLiKKsRqOngKPQCKEZbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="299707528"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by orviesa002.jf.intel.com with ESMTP; 03 Sep 2026 14:49:22 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel-ci: Add a subset of pxp tests into
 xe-fast-feedback
Date: Thu,  3 Sep 2026 14:49:19 -0700
Message-ID: <20260903214919.1005742-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903214919.1005742-5-alan.previn.teres.alexis@intel.com>
References: <20260903214919.1005742-5-alan.previn.teres.alexis@intel.com>
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

Add a minimal set of pxp testing as part of BAT coverage.
BAT

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index ecd2c568f..1a6b3c258 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -203,6 +203,9 @@ igt@xe_pm_residency@gt-c6-on-idle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
+igt@xe_pxp@regular-src-to-pxp-dest-rendercopy
+igt@xe_pxp@pxp-termination-key-update-post-termination-irq
+igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq
 igt@xe_query@query-engines
 igt@xe_query@query-mem-usage
 igt@xe_query@query-gt-list
-- 
2.43.0

