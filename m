Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A78D1D88B
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 17:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7E210E5D0;
	Tue, 15 Oct 2024 17:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA2FtOYC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A93710E5CD
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 17:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729012704; x=1760548704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PIzYwk0ixLgDUkG7E2v7gRDLJFQVpsW35QHkda27Jb8=;
 b=CA2FtOYCw2GjGk5XC9W+YKDTbWGL29sZK9n7C8VzftLKjg26hBd9zdWc
 RfTqUBt4tpgjWKy9XVkTa5AcxWbN9uaQHlD+r2nspyLE9x9KJ/+a1CzZ1
 GzLgXvnOg+0ETa8dHs5cn+HS9l5cKxVi7z2uCUruLbcNMty7LTADPt7U5
 /NxtEKAl0lFEGmzgZEei6QdujQ/p2OLkymJvL4aDAQa84s3ttbnIXWc1p
 wg/qpwNe2Fh1OkZqGDb8hSOf/qIiIc0ygnCQ6wv+vOnklaYJpwDTvzk/F
 +yf5J7dolb8Ctc+hzm0Ha7CMJuAuiNgeumEa4Cjanjn4C1HZzBMjS6PjR g==;
X-CSE-ConnectionGUID: EqEPNNDCQ4SSkTMVfWvBRw==
X-CSE-MsgGUID: pLx1chbpSqmHIbOvZlFUlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28516938"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28516938"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 10:18:24 -0700
X-CSE-ConnectionGUID: CnoAlC1ZTnSl95b3/x9MoA==
X-CSE-MsgGUID: kLPXRhT6T/utzVc6teaxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="82765431"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa003.jf.intel.com with ESMTP; 15 Oct 2024 10:18:22 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 2/2]  HAX: Do not merge
Date: Tue, 15 Oct 2024 22:48:49 +0530
Message-Id: <20241015171849.1733664-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015171849.1733664-1-pranay.samala@intel.com>
References: <20241015171849.1733664-1-pranay.samala@intel.com>
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
 tests/intel-ci/fast-feedback.testlist    | 44 ++++++++++++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 44 ++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..c9e478b75 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,50 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_flip@2x-wf_vblank-ts-check
+igt@kms_flip@2x-blocking-wf_vblank
+igt@kms_flip@2x-absolute-wf_vblank
+igt@kms_flip@2x-blocking-absolute-wf_vblank
+igt@kms_flip@2x-plain-flip
+igt@kms_flip@2x-busy-flip
+igt@kms_flip@2x-flip-vs-fences
+igt@kms_flip@2x-plain-flip-ts-check
+igt@kms_flip@2x-plain-flip-fb-recreate
+igt@kms_flip@2x-flip-vs-rmfb
+igt@kms_flip@2x-flip-vs-dpms
+igt@kms_flip@2x-flip-vs-panning
+igt@kms_flip@2x-flip-vs-modeset
+igt@kms_flip@2x-flip-vs-expired-vblank
+igt@kms_flip@2x-flip-vs-absolute-wf_vblank
+igt@kms_flip@2x-flip-vs-wf_vblank
+igt@kms_flip@2x-flip-vs-blocking-wf-vblank
+igt@kms_flip@2x-flip-vs-modeset-vs-hang
+igt@kms_flip@2x-flip-vs-panning-vs-hang
+igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset
+igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset
+igt@kms_flip@2x-nonexisting-fb
+igt@kms_flip@2x-dpms-vs-vblank-race
+igt@kms_flip@2x-modeset-vs-vblank-race
+igt@kms_flip@2x-flip-vs-suspend
+igt@kms_flip@2x-wf_vblank-ts-check-interruptible
+igt@kms_flip@2x-absolute-wf_vblank-interruptible
+igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible
+igt@kms_flip@2x-plain-flip-interruptible
+igt@kms_flip@2x-flip-vs-fences-interruptible
+igt@kms_flip@2x-plain-flip-ts-check-interruptible
+igt@kms_flip@2x-plain-flip-fb-recreate-interruptible
+igt@kms_flip@2x-flip-vs-rmfb-interruptible
+igt@kms_flip@2x-flip-vs-panning-interruptible
+igt@kms_flip@2x-flip-vs-expired-vblank-interruptible
+igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible
+igt@kms_flip@2x-flip-vs-wf_vblank-interruptible
+igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@2x-nonexisting-fb-interruptible
+igt@kms_flip@2x-dpms-vs-vblank-race-interruptible
+igt@kms_flip@2x-modeset-vs-vblank-race-interruptible
+igt@kms_flip@2x-flip-vs-suspend-interruptible
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..cfc7afdee 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -7,6 +7,50 @@ igt@fbdev@nullptr
 igt@fbdev@read
 igt@fbdev@write
 
+igt@kms_flip@2x-wf_vblank-ts-check
+igt@kms_flip@2x-blocking-wf_vblank
+igt@kms_flip@2x-absolute-wf_vblank
+igt@kms_flip@2x-blocking-absolute-wf_vblank
+igt@kms_flip@2x-plain-flip
+igt@kms_flip@2x-busy-flip
+igt@kms_flip@2x-flip-vs-fences
+igt@kms_flip@2x-plain-flip-ts-check
+igt@kms_flip@2x-plain-flip-fb-recreate
+igt@kms_flip@2x-flip-vs-rmfb
+igt@kms_flip@2x-flip-vs-dpms
+igt@kms_flip@2x-flip-vs-panning
+igt@kms_flip@2x-flip-vs-modeset
+igt@kms_flip@2x-flip-vs-expired-vblank
+igt@kms_flip@2x-flip-vs-absolute-wf_vblank
+igt@kms_flip@2x-flip-vs-wf_vblank
+igt@kms_flip@2x-flip-vs-blocking-wf-vblank
+igt@kms_flip@2x-flip-vs-modeset-vs-hang
+igt@kms_flip@2x-flip-vs-panning-vs-hang
+igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset
+igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset
+igt@kms_flip@2x-nonexisting-fb
+igt@kms_flip@2x-dpms-vs-vblank-race
+igt@kms_flip@2x-modeset-vs-vblank-race
+igt@kms_flip@2x-flip-vs-suspend
+igt@kms_flip@2x-wf_vblank-ts-check-interruptible
+igt@kms_flip@2x-absolute-wf_vblank-interruptible
+igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible
+igt@kms_flip@2x-plain-flip-interruptible
+igt@kms_flip@2x-flip-vs-fences-interruptible
+igt@kms_flip@2x-plain-flip-ts-check-interruptible
+igt@kms_flip@2x-plain-flip-fb-recreate-interruptible
+igt@kms_flip@2x-flip-vs-rmfb-interruptible
+igt@kms_flip@2x-flip-vs-panning-interruptible
+igt@kms_flip@2x-flip-vs-expired-vblank-interruptible
+igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible
+igt@kms_flip@2x-flip-vs-wf_vblank-interruptible
+igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible
+igt@kms_flip@2x-nonexisting-fb-interruptible
+igt@kms_flip@2x-dpms-vs-vblank-race-interruptible
+igt@kms_flip@2x-modeset-vs-vblank-race-interruptible
+igt@kms_flip@2x-flip-vs-suspend-interruptible
+
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
-- 
2.34.1

