Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9C6C282DE
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 17:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBCD10E028;
	Wed,  5 Mar 2025 17:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRuW6JRC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7FB10E071
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 17:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741196784; x=1772732784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FH31V33Pme4fP2TeYmTTMqQuq0WUxsCf4Dwl2APW2s0=;
 b=fRuW6JRCrFRdU50BtTwPYLfWQ7nXfoLixEe/DR2j53N+zPaXzVXeOTLd
 pNqX6muQmMcHbj7e6KaoLNMm9y1kO67pbMCb8LBORwApe8sZYXvxzoBMG
 t+MvMMNzfZ/RPgz6V4zS4EFPTqHLIClKUlzeaqpvmJrf5GPKQa0mnVg0i
 uT4KxIRo//KOeaIylOoKmuKdKLs+YPkwMJ9AcpKqH4OeA58hVZbEIGGuY
 qaP/KibhEr6uJVzf/I8+dc5h5eb+iRtiIqUqU02Rtd9LfQPWwevViR3AE
 FHiZTIv9gD/eWDe4+J+K258TV+UJJS0mHDaogpB3aKBAGTjQvIL2QDWbj A==;
X-CSE-ConnectionGUID: wG/QQzwpQ2y1OKrQcbOcwQ==
X-CSE-MsgGUID: MgLLwmyqTkqDlH+W54tLIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42082014"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="42082014"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 09:46:24 -0800
X-CSE-ConnectionGUID: BsA8ZBT1RtCoaLiYwCoyDQ==
X-CSE-MsgGUID: qbHCa1ksSP6lDj/MG3XNMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="119259652"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 09:46:23 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sk.anirban@intel.com
Subject: [i-g-t,v2,2/2] HAX: Add rc6-idle tests to fast feedback list
Date: Wed,  5 Mar 2025 23:14:44 +0530
Message-Id: <20250305174444.2516705-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305174444.2516705-1-sk.anirban@intel.com>
References: <20250305174444.2516705-1-sk.anirban@intel.com>
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

