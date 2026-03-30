Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849C41061B12
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396C710E6B9;
	Mon, 30 Mar 2026 15:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZzUsKsAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBDC10E5A4
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774885584; x=1806421584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LW+MXcFMmNjq8pFDFDDQjs/A41GdvAEBs2koRJktruI=;
 b=ZzUsKsAFDg33cKSdEH28CVJTVDCY8N6e+xM7zDPILAtd+hDRqinLJ47D
 V0y268TF4Iz+EzcdJiq4rrMbEjnwXLzyjJNdXjyVqjPaOqCI7usbMd/1O
 QiAQLdqAwbiZmELpId4BLnmivkawa1wqU5qVRLO5c9mxJb/VaOIICch2c
 y7YNsasMN4wGUpTvZjn7aJk8vyJIIXcASaywp8tEtEm/TiVZbDxBylvW7
 fMmUT+L37pGlUL0l6BlCYfvJcOAKudFuBWflpHnLGco0DECauWoE0gdjy
 Jt0nl0fg/n8JujnnxLvTiin4RZwBi8ixPQkiwfn93tDRuxfD81WAtY6hh w==;
X-CSE-ConnectionGUID: qmpjeO/5STSSWTF8oBBfdg==
X-CSE-MsgGUID: YPYh/m0VRjOxYX5JpmDzuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75946190"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75946190"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:46:24 -0700
X-CSE-ConnectionGUID: 07w9AseKTtK/595pbEiuDQ==
X-CSE-MsgGUID: jaGL9Qh2TV6g49whVqCZ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="256593505"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:46:21 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v1 3/3] HAX: Add engine accuracy tests to
 xe-fast-feedback.testlist
Date: Mon, 30 Mar 2026 21:09:16 +0530
Message-Id: <20260330153916.2474178-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330153916.2474178-1-soham.purkait@intel.com>
References: <20260330153916.2474178-1-soham.purkait@intel.com>
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

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..4ab07db77 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -163,6 +163,9 @@ igt@xe_mmap@cpu-caching
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
+igt@xe_pmu@engine-activity-accuracy-2
+igt@xe_pmu@engine-activity-accuracy-50
+igt@xe_pmu@engine-activity-accuracy-90
 igt@xe_pm_residency@gt-c6-on-idle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
-- 
2.43.0

