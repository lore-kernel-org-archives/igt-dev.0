Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B811C2BA15
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 10:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CBF10EA14;
	Thu, 13 Jun 2024 10:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVZ/pBih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D8610EA12
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 10:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718274269; x=1749810269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sm937wT0BQV6HUxNWE385X7m/yGDESz3pizsK12b/GI=;
 b=DVZ/pBihPzHCSfRMeiIXCYicRyMd/6luFSYj7QHztb4xyeqwPetCCpsG
 P6t4U+nfRTG3lLJ5+dvnwQag15JHnw8A+gT1FLtk3/joeXnl/2V+nIPZ0
 NHPhfYqEQoLop4WWW0FmnluiBKD1hs/2DPfM+ohIIWtGb1zcM/LPYQ8Iy
 OUx+tYAhuPiXC0LKetfkcDA1qyUSlOgnmM5WjlHpMAwBZ07ogP58rMLDV
 v8cBVxGfc0mLlyjx5K3rxnfDLptdvKcxfwtv0IO2UTK41GBqnfTp7gz96
 y1kxEt6xkbgWf/cyR8tI7CI/OYnHtCu+tPfw8Hs3YdhvUwOWsWxZ6pnvA A==;
X-CSE-ConnectionGUID: gkMrN52pREaWERhNgvUmzw==
X-CSE-MsgGUID: qM3xieu/RDiJAuTbNVECVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18011154"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18011154"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:24:29 -0700
X-CSE-ConnectionGUID: mCjz5h1rR+qjc51AcDiL5w==
X-CSE-MsgGUID: n8xR9OzYRv2oEYDjwnSfjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40214999"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:24:28 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	mitulkumar.ajitkumar.golani@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V2 4/4] HAX: Run VRR subtests in BAT
Date: Thu, 13 Jun 2024 15:46:33 +0530
Message-ID: <20240613101633.3804434-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240613101633.3804434-1-bhanuprakash.modem@intel.com>
References: <20240613101633.3804434-1-bhanuprakash.modem@intel.com>
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

