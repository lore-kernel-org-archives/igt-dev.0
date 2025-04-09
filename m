Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F0EC369A1
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 14:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B047B10E92D;
	Wed,  9 Apr 2025 14:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ep4b/wiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCB410E92D
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744210519; x=1775746519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HEIkAIQz5x1tLQGu2n/FLx4DObTcqnTG2pA9HmeZ7Y0=;
 b=ep4b/wiv2WeWOwp+1TSikavcAkcq7CRdjNYi3EYpuoE/5Q9zIa1+P543
 pAEDPER/gH1q3HPXFXXQUY1ufX3CEtlh3v0wsEkpB7iZR6GhsaWxSck5X
 X4zQODR1TX2mGMvA2/212fS28t0Ayxks3h7ffq11dJyeQHDt3Dpw8EK/K
 Gn2R1ixDe3gvIDdEjkfUwVGFSIf8rYfhUpfGwG+Vu9btqhOD/2afmmlry
 AHOADY/GZKL7z1LY6WW923oQ/bfKdmWSe5LFy0NyCwBGUoSnC5owuJ5BR
 bh7Ihu0L3vP/4jr2FAccBor3+xBZnhtSjgIZlIYpyQ5g1YrUHjD7KTXE5 g==;
X-CSE-ConnectionGUID: 5Nfc9gFoTKSOm47y3bmwdQ==
X-CSE-MsgGUID: SfeU+2MEQl2Nr96pw4kKRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="57062055"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="57062055"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 07:55:19 -0700
X-CSE-ConnectionGUID: saoUtw02S+6nqbMn+w5rog==
X-CSE-MsgGUID: GmeFWqI3T5SUOQyWTw+F5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="151785154"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 07:55:17 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,v4,2/2] HAX: Add rc6-idle tests to fast feedback list
Date: Wed,  9 Apr 2025 20:21:03 +0530
Message-Id: <20250409145103.456797-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409145103.456797-1-sk.anirban@intel.com>
References: <20250409145103.456797-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Add pm_rc6_residency-rc6@idle to i915-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..f37dbf769 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -51,6 +51,7 @@ igt@gem_tiled_fence_blits@basic
 igt@gem_tiled_pread_basic
 igt@gem_wait@busy@all-engines
 igt@gem_wait@wait@all-engines
+igt@i915_pm_rc6_residency@rc6-idle
 igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
-- 
2.34.1

