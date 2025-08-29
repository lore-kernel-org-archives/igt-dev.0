Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0D6CA1000
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 07:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEA210E398;
	Mon,  1 Sep 2025 07:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WyXx29az";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349310EBA7
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756470063; x=1788006063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bM7rL2q58PAoWlb7GxrOspCSlhcIk0QW+5gn/VAFO54=;
 b=WyXx29azek7oiZujreau6ev2eWWe7qf0mtBRX2pC7QmRnqmqRlunPPqG
 7SOMgvxYOpnVUehi6iNCJEzbytwSnPVmJmfJqM68RbEGjjLzxMTGqn54B
 cIiH9fTW4JXDdYMAvJgj1oZ5vkD2gRkqq/LOxAa2h+CzOvDQMR22Tmh+p
 xu/B71dYZoR5hSj6PTLq9xrIGNnfdpRrB8OLufUb7/NHvsvZtcE9ax8V7
 htTPo0kCW8yhDnMuApQtG2CE++MwU2w5Phwcf+zt+98Trgshk1+BOZMPc
 6gikKlpHqpDsiwGoUlPmAYx8CORJ1edtTWZ/nJrwubu+ZpUTIXvorHbn7 w==;
X-CSE-ConnectionGUID: WWSHap+RREen3oofVY5EPw==
X-CSE-MsgGUID: IyF2KgdeRH+rt5CSIzXXPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58461290"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58461290"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 05:21:03 -0700
X-CSE-ConnectionGUID: rjTEQvDGSIWaRNePTB0ihw==
X-CSE-MsgGUID: P4TtGY5gQCGklqDgznd2aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169670926"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa010.jf.intel.com with ESMTP; 29 Aug 2025 05:21:01 -0700
From: mallesh.koujalagi@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.Koujalagi@intel.com>
Subject: [PATCH i-g-t 2/2] HAX: Added list of test cases to fastfeedback list
Date: Fri, 29 Aug 2025 17:50:39 +0530
Message-Id: <20250829122039.1896093-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829122039.1896093-1-mallesh.koujalagi@intel.com>
References: <20250829122039.1896093-1-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:23:26 +0000
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

From: Mallesh Koujalagi <mallesh.Koujalagi@intel.com>

List of test cases added to fast feedback list
i915_pm_rps@basic-api
i915_pm_rps@min-max-config-idle
i915_pm_rps@min-max-config-loaded
i915_pm_rps@waitboost
i915_pm_rps@reset

Signed-off-by: Mallesh Koujalagi <mallesh.Koujalagi@intel.com>
---
 tests/intel-ci/i915.fast-feedback.testlist | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/i915.fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
index 2799bbaa5..69e45a597 100644
--- a/tests/intel-ci/i915.fast-feedback.testlist
+++ b/tests/intel-ci/i915.fast-feedback.testlist
@@ -166,6 +166,12 @@ igt@gem_lmem_swapping@random-engines
 igt@gem_lmem_swapping@verify-random
 igt@i915_pm_rpm@module-reload
 
+igt@i915_pm_rps@basic-api
+igt@i915_pm_rps@min-max-config-idle
+igt@i915_pm_rps@min-max-config-loaded
+igt@i915_pm_rps@waitboost
+igt@i915_pm_rps@reset
+
 # Kernel selftests
 igt@i915_selftest@live
 igt@dmabuf@all-tests
-- 
2.34.1

