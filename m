Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A714ED41C3B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 05:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D1210E794;
	Thu, 14 Nov 2024 05:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chAsLt1L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC1110E794
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 05:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731561488; x=1763097488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FkXxArHK99bpyC/H0mFPukwReEjO0+a55bi0Ox/IUmo=;
 b=chAsLt1LXzkAL+8mLRTP3cUIqC4q3kHK3ZqRzG2Yax/7noDT1r11Kms5
 k2nS4ObtBfyUQGQhpc2IrdmbJ/Xj4HICyGblxGCMg8pNueVguSmyEqVFu
 oPj5nBSCp2T+yVcjYdDNJwR0Y1iRivnEvcFa5XefvaFyU7pcHEdUWtpNG
 g7Xdt4jtDd+bpRibQeyXuuZAXtW/S4S28XgAcIlREa6jM0yqWj/tAYsVg
 jBgp9vwzCyzp6cA1dEyHcSpkqkeb6NKt0Ugp+7FVRIWDI2iiA1jXDyqs2
 08E7lyUWoXjTzxoQga2txRYSRUDQoZwfAYG7lohFd4fP3L80KoT/wdgD8 g==;
X-CSE-ConnectionGUID: EXJktYYTSv6Ixi8Y0xH+DA==
X-CSE-MsgGUID: y64f5AQkRNOOGD4YMx16AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42040905"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42040905"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 21:18:07 -0800
X-CSE-ConnectionGUID: OpT+I2ZhRvqtjRH4ucio6w==
X-CSE-MsgGUID: iWSCFgGETE2eJA2x3W18Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="92555685"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2024 21:18:05 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 swati2.sharma@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 2/2] HAX: Do not merge
Date: Thu, 14 Nov 2024 10:48:35 +0530
Message-Id: <20241114051835.1860727-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114051835.1860727-1-pranay.samala@intel.com>
References: <20241114051835.1860727-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 92 ++++++++++++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 92 ++++++++++++++++++++++++
 2 files changed, 184 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..4f812a45c 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,98 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_flip@nonblocking-read
+igt@kms_flip@wf_vblank-ts-check
+igt@kms_flip@2x-wf_vblank-ts-check
+igt@kms_flip@blocking-wf_vblank
+igt@kms_flip@2x-blocking-wf_vblank
+igt@kms_flip@absolute-wf_vblank
+igt@kms_flip@2x-absolute-wf_vblank
+igt@kms_flip@blocking-absolute-wf_vblank
+igt@kms_flip@2x-blocking-absolute-wf_vblank
+igt@kms_flip@basic-plain-flip
+igt@kms_flip@2x-plain-flip
+igt@kms_flip@busy-flip
+igt@kms_flip@2x-busy-flip
+igt@kms_flip@flip-vs-fences
+igt@kms_flip@2x-flip-vs-fences
+igt@kms_flip@plain-flip-ts-check
+igt@kms_flip@2x-plain-flip-ts-check
+igt@kms_flip@plain-flip-fb-recreate
+igt@kms_flip@2x-plain-flip-fb-recreate
+igt@kms_flip@flip-vs-rmfb
+igt@kms_flip@2x-flip-vs-rmfb
+igt@kms_flip@basic-flip-vs-dpms
+igt@kms_flip@2x-flip-vs-dpms
+igt@kms_flip@flip-vs-panning
+igt@kms_flip@2x-flip-vs-panning
+igt@kms_flip@basic-flip-vs-modeset
+igt@kms_flip@2x-flip-vs-modeset
+igt@kms_flip@flip-vs-expired-vblank
+igt@kms_flip@2x-flip-vs-expired-vblank
+igt@kms_flip@flip-vs-absolute-wf_vblank
+igt@kms_flip@2x-flip-vs-absolute-wf_vblank
+igt@kms_flip@basic-flip-vs-wf_vblank
+igt@kms_flip@2x-flip-vs-wf_vblank
+igt@kms_flip@flip-vs-blocking-wf-vblank
+igt@kms_flip@2x-flip-vs-blocking-wf-vblank
+igt@kms_flip@flip-vs-modeset-vs-hang
+igt@kms_flip@2x-flip-vs-modeset-vs-hang
+igt@kms_flip@flip-vs-panning-vs-hang
+igt@kms_flip@2x-flip-vs-panning-vs-hang
+igt@kms_flip@flip-vs-dpms-off-vs-modeset
+igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset
+igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset
+igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset
+igt@kms_flip@dpms-off-confusion
+igt@kms_flip@nonexisting-fb
+igt@kms_flip@2x-nonexisting-fb
+igt@kms_flip@dpms-vs-vblank-race
+igt@kms_flip@2x-dpms-vs-vblank-race
+igt@kms_flip@modeset-vs-vblank-race
+igt@kms_flip@2x-modeset-vs-vblank-race
+igt@kms_flip@bo-too-big
+igt@kms_flip@flip-vs-suspend
+igt@kms_flip@2x-flip-vs-suspend
+igt@kms_flip@wf_vblank-ts-check-interruptible
+igt@kms_flip@2x-wf_vblank-ts-check-interruptible
+igt@kms_flip@absolute-wf_vblank-interruptible
+igt@kms_flip@2x-absolute-wf_vblank-interruptible
+igt@kms_flip@blocking-absolute-wf_vblank-interruptible
+igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible
+igt@kms_flip@plain-flip-interruptible
+igt@kms_flip@2x-plain-flip-interruptible
+igt@kms_flip@flip-vs-fences-interruptible
+igt@kms_flip@2x-flip-vs-fences-interruptible
+igt@kms_flip@plain-flip-ts-check-interruptible
+igt@kms_flip@2x-plain-flip-ts-check-interruptible
+igt@kms_flip@plain-flip-fb-recreate-interruptible
+igt@kms_flip@2x-plain-flip-fb-recreate-interruptible
+igt@kms_flip@flip-vs-rmfb-interruptible
+igt@kms_flip@2x-flip-vs-rmfb-interruptible
+igt@kms_flip@flip-vs-panning-interruptible
+igt@kms_flip@2x-flip-vs-panning-interruptible
+igt@kms_flip@flip-vs-expired-vblank-interruptible
+igt@kms_flip@2x-flip-vs-expired-vblank-interruptible
+igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible
+igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible
+igt@kms_flip@flip-vs-wf_vblank-interruptible
+igt@kms_flip@2x-flip-vs-wf_vblank-interruptible
+igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@dpms-off-confusion-interruptible
+igt@kms_flip@nonexisting-fb-interruptible
+igt@kms_flip@2x-nonexisting-fb-interruptible
+igt@kms_flip@dpms-vs-vblank-race-interruptible
+igt@kms_flip@2x-dpms-vs-vblank-race-interruptible
+igt@kms_flip@modeset-vs-vblank-race-interruptible
+igt@kms_flip@2x-modeset-vs-vblank-race-interruptible
+igt@kms_flip@bo-too-big-interruptible
+igt@kms_flip@flip-vs-suspend-interruptible
+igt@kms_flip@2x-flip-vs-suspend-interruptible
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..603260508 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -7,6 +7,98 @@ igt@fbdev@nullptr
 igt@fbdev@read
 igt@fbdev@write
 
+igt@kms_flip@nonblocking-read
+igt@kms_flip@wf_vblank-ts-check
+igt@kms_flip@2x-wf_vblank-ts-check
+igt@kms_flip@blocking-wf_vblank
+igt@kms_flip@2x-blocking-wf_vblank
+igt@kms_flip@absolute-wf_vblank
+igt@kms_flip@2x-absolute-wf_vblank
+igt@kms_flip@blocking-absolute-wf_vblank
+igt@kms_flip@2x-blocking-absolute-wf_vblank
+igt@kms_flip@basic-plain-flip
+igt@kms_flip@2x-plain-flip
+igt@kms_flip@busy-flip
+igt@kms_flip@2x-busy-flip
+igt@kms_flip@flip-vs-fences
+igt@kms_flip@2x-flip-vs-fences
+igt@kms_flip@plain-flip-ts-check
+igt@kms_flip@2x-plain-flip-ts-check
+igt@kms_flip@plain-flip-fb-recreate
+igt@kms_flip@2x-plain-flip-fb-recreate
+igt@kms_flip@flip-vs-rmfb
+igt@kms_flip@2x-flip-vs-rmfb
+igt@kms_flip@basic-flip-vs-dpms
+igt@kms_flip@2x-flip-vs-dpms
+igt@kms_flip@flip-vs-panning
+igt@kms_flip@2x-flip-vs-panning
+igt@kms_flip@basic-flip-vs-modeset
+igt@kms_flip@2x-flip-vs-modeset
+igt@kms_flip@flip-vs-expired-vblank
+igt@kms_flip@2x-flip-vs-expired-vblank
+igt@kms_flip@flip-vs-absolute-wf_vblank
+igt@kms_flip@2x-flip-vs-absolute-wf_vblank
+igt@kms_flip@basic-flip-vs-wf_vblank
+igt@kms_flip@2x-flip-vs-wf_vblank
+igt@kms_flip@flip-vs-blocking-wf-vblank
+igt@kms_flip@2x-flip-vs-blocking-wf-vblank
+igt@kms_flip@flip-vs-modeset-vs-hang
+igt@kms_flip@2x-flip-vs-modeset-vs-hang
+igt@kms_flip@flip-vs-panning-vs-hang
+igt@kms_flip@2x-flip-vs-panning-vs-hang
+igt@kms_flip@flip-vs-dpms-off-vs-modeset
+igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset
+igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset
+igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset
+igt@kms_flip@dpms-off-confusion
+igt@kms_flip@nonexisting-fb
+igt@kms_flip@2x-nonexisting-fb
+igt@kms_flip@dpms-vs-vblank-race
+igt@kms_flip@2x-dpms-vs-vblank-race
+igt@kms_flip@modeset-vs-vblank-race
+igt@kms_flip@2x-modeset-vs-vblank-race
+igt@kms_flip@bo-too-big
+igt@kms_flip@flip-vs-suspend
+igt@kms_flip@2x-flip-vs-suspend
+igt@kms_flip@wf_vblank-ts-check-interruptible
+igt@kms_flip@2x-wf_vblank-ts-check-interruptible
+igt@kms_flip@absolute-wf_vblank-interruptible
+igt@kms_flip@2x-absolute-wf_vblank-interruptible
+igt@kms_flip@blocking-absolute-wf_vblank-interruptible
+igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible
+igt@kms_flip@plain-flip-interruptible
+igt@kms_flip@2x-plain-flip-interruptible
+igt@kms_flip@flip-vs-fences-interruptible
+igt@kms_flip@2x-flip-vs-fences-interruptible
+igt@kms_flip@plain-flip-ts-check-interruptible
+igt@kms_flip@2x-plain-flip-ts-check-interruptible
+igt@kms_flip@plain-flip-fb-recreate-interruptible
+igt@kms_flip@2x-plain-flip-fb-recreate-interruptible
+igt@kms_flip@flip-vs-rmfb-interruptible
+igt@kms_flip@2x-flip-vs-rmfb-interruptible
+igt@kms_flip@flip-vs-panning-interruptible
+igt@kms_flip@2x-flip-vs-panning-interruptible
+igt@kms_flip@flip-vs-expired-vblank-interruptible
+igt@kms_flip@2x-flip-vs-expired-vblank-interruptible
+igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible
+igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible
+igt@kms_flip@flip-vs-wf_vblank-interruptible
+igt@kms_flip@2x-flip-vs-wf_vblank-interruptible
+igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@dpms-off-confusion-interruptible
+igt@kms_flip@nonexisting-fb-interruptible
+igt@kms_flip@2x-nonexisting-fb-interruptible
+igt@kms_flip@dpms-vs-vblank-race-interruptible
+igt@kms_flip@2x-dpms-vs-vblank-race-interruptible
+igt@kms_flip@modeset-vs-vblank-race-interruptible
+igt@kms_flip@2x-modeset-vs-vblank-race-interruptible
+igt@kms_flip@bo-too-big-interruptible
+igt@kms_flip@flip-vs-suspend-interruptible
+igt@kms_flip@2x-flip-vs-suspend-interruptible
+
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
-- 
2.34.1

