Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ED6C27C55
	for <igt-dev@archiver.kernel.org>; Thu,  6 Jun 2024 05:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D06510E84B;
	Thu,  6 Jun 2024 05:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGOjFAnb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0C110E84B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jun 2024 05:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717653593; x=1749189593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sm937wT0BQV6HUxNWE385X7m/yGDESz3pizsK12b/GI=;
 b=AGOjFAnb7CQSH48fHaO774ZnlaPqDF97zyHcSp4YuShaQyhMlb5BqIiC
 MLvZ3/r3ivQn+zavwVO+0MAtQwcXH1bIczwpd4TLWamE7O2NsW2PVmWh/
 toNNdv6f8X25YXdg9fUt2RWcM+YPUoM9b4pwAyZ9b1cToiQXN838k74Xr
 F4czPKtHbJIDJkd9SfmWkQd9NJi77+g5xPD6hTvPjUOlSBY7Gi93DF+LO
 IRnOtX0QOrBVtM2x5uZQQDDLH0/3Cm6t/6ofgia62qHNvZX9aPUtTP31D
 Z7n6LnCt/g7HiKU8JI6QJgHwX6lIyClx3ASSGxfaWq5MxoBpeLLAMminv Q==;
X-CSE-ConnectionGUID: MY9IV1FaTZK7PjJeygImTA==
X-CSE-MsgGUID: N07RokM2QUCBh1OsDZsdDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25698760"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="25698760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:59:53 -0700
X-CSE-ConnectionGUID: kmG1+6PcTJWLfqzPWi4q/g==
X-CSE-MsgGUID: ceCCs0+kSSqRKOlxtbtVKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="61050737"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:59:52 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 3/3] HAX: Run VRR subtests in BAT
Date: Thu,  6 Jun 2024 11:22:05 +0530
Message-ID: <20240606055205.3296434-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240606055205.3296434-1-bhanuprakash.modem@intel.com>
References: <20240606055205.3296434-1-bhanuprakash.modem@intel.com>
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 4 ++++
 tests/intel-ci/xe-fast-feedback.testlist | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..fd750684a 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -129,6 +129,10 @@ igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
 igt@kms_psr@psr-primary-mmap-gtt
 igt@kms_setmode@basic-clone-single-crtc
+igt@kms_vrr@flipline
+igt@kms_vrr@seamless-rr-switch-drrs
+igt@kms_vrr@seamless-rr-switch-virtual
+igt@kms_vrr@seamless-rr-switch-vrr
 igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index aa98b37e6..f52feba7c 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -65,6 +65,10 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+igt@kms_vrr@flipline
+igt@kms_vrr@seamless-rr-switch-drrs
+igt@kms_vrr@seamless-rr-switch-virtual
+igt@kms_vrr@seamless-rr-switch-vrr
 igt@xe_compute@compute-square
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
-- 
2.43.2

