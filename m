Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B84CC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 11:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4959210E002;
	Thu, 29 May 2025 11:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pi0NntzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCE210E002
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 11:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748517758; x=1780053758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4pkKwICR7e3PHKu2XD38Qi7VFp79lybaesdpbS69KB8=;
 b=Pi0NntzFTliUEoTQ3WwCqMeXSTEylbALpDKv3LxDEPcGa20G+wzbMbd3
 fGNMjRF35tCQsU645QACAST2EIXcuQr4MjzSpcq3NU188pUlJlNITp+wh
 MISoZFpMsJp6BhMtBp2g+R5SXp5qCWYqQ9akO0csgjSRzW2laxnERqG2D
 rGp3OJxIitAHbSIxtujkqtCQo/IJOD9U0cbI1Jg+qSYRql9JU5Ct6ZGcZ
 qFxNq3DfWeZAgiEKYjZGWTa3Ks7039Osb3rTHnzDobKv5r6AwoS7Zzlgq
 0Cl1QJF1dIqKPlNv+eJL/R2nLvVjt1fGluhORpNr+akYy4/rn3RIj4nl+ g==;
X-CSE-ConnectionGUID: 0ZpdVKFES7+k5ae7P7sEDA==
X-CSE-MsgGUID: eV62Hz2NRfuWjT5qy1ARkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50457650"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="50457650"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 04:22:37 -0700
X-CSE-ConnectionGUID: Ms8rRNkRSeuswr5X4NeqyA==
X-CSE-MsgGUID: igVKXbfEQAGxARHaCAfvOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="166708157"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 04:22:36 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci: Update xe blocklist
Date: Thu, 29 May 2025 16:58:11 +0530
Message-Id: <20250529112811.1433740-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Update xe CI blocklist with KMS tests which are either missing
driver support or are i915 specific.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 3cb10296d..52866795f 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -76,10 +76,15 @@ igt@kms_pm_lpsp@screens-disabled
 igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
 igt@kms_pm_rpm@.*pc8-residency.*
 igt@kms_pm_rpm@cursor.*
+igt@kms_cursor_legacy@basic-busy-flip-before-cursor-(atomic|legacy|varying-size)
 ##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
 igt@kms_prime@.*
+igt@kms_writeback@writeback.*
+igt@kms_scaling_modes@scaling-mode-none
+igt@kms_atomic@plane-primary-overlay-mutable-zpos
+igt@kms_plane_scaling@.*downscale-factor-0-25.*
 ##################################################################
 # KMS: Test was written with the idea that edid read shouldn't take an
 # unreasonable amount of time. The timeout is an arbitrary value
-- 
2.25.1

