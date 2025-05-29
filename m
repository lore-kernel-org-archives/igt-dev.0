Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5495EC5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 09:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EA710E727;
	Thu, 29 May 2025 09:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0WR8Fqy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB8B10E725
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748510178; x=1780046178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zpaXNDrRLel7pQcFfsDZ1DUybINd0KQSon15449zTCc=;
 b=n0WR8FqyzUwHuzOvXqk5nkCl+p4VSd/wnFq5C2K33ZpNLmFkOdHOiOoa
 CZ9YN+G4VdL1hj0CY4S8WW9VqCOrsUsuizpg6QdUXmhHaT1Vgk4zfOybL
 T1tPEXVFKllQzTid6eB7/lWW35QBk+/UXmQ8PlBKQyq9UOJctmZ+reVyN
 7rEWsjJtsA2ZsRH8MOTzLc/cKmATKbrKA4InNX+dhUteyl5+P4tJGoE3B
 Ot58BbCImiAUjdrfMAkvexHYJK3y+ky7jiTZ+4f39O9pXLAh+CGTAGXD3
 jvtlyNoKWUV5fTRuH/VK5Q6MaxZvbX1gappBfQBjPy1WWeAoNrij5s1QL A==;
X-CSE-ConnectionGUID: C492kTeEQLqT/wlqb6Z1Nw==
X-CSE-MsgGUID: aniEN99sTqqggjRPgVQmsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54360231"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="54360231"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 02:16:18 -0700
X-CSE-ConnectionGUID: Pp9CdfUVQnel5qSFI0AIDA==
X-CSE-MsgGUID: oO4iQb4NRfWqCF0tZHopow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="143974147"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 02:16:16 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v7 2/2] HAX: Add rc6-idle tests to fast feedback list
Date: Thu, 29 May 2025 14:38:41 +0530
Message-Id: <20250529090841.4177513-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529090841.4177513-1-sk.anirban@intel.com>
References: <20250529090841.4177513-1-sk.anirban@intel.com>
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

Add pm_rc6_residency-rc6@idle to i915-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 82395e7ea..c34caed55 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -48,6 +48,7 @@ igt@gem_tiled_fence_blits@basic
 igt@gem_tiled_pread_basic
 igt@gem_wait@busy@all-engines
 igt@gem_wait@wait@all-engines
+igt@i915_pm_rc6_residency@rc6-idle
 igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
-- 
2.34.1

