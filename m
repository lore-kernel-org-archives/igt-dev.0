Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B9CC7115B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 08:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6902310E35D;
	Thu, 19 Jun 2025 08:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4xs1cEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB4E10E35D
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 08:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750321477; x=1781857477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eghjY6/3JJhZ5e/6M+aMKHrCs//JKDnCpC3u2cOMZSM=;
 b=d4xs1cEG501x/MZvAqzPAXweZf/2xAImlgzJ4L/EBxkTpWPq5NUyR2RN
 oi1gnlnmcRUHWHdF3azQUSjhFDMDCADisTdG5mvmPofESB7UDrhoyqJRP
 n6py24jCyM55AAC+xPHWtzXMJPIiBwYOZikKahyDOOP6DHCM0jxtwbZr+
 gIaisT/ElJW7hCltlDoo8+os9jnASlT4AkOzZntTIWHjdKnmww7w8neA2
 6tcwwyPR/1nBSVp7+Calf9OrdzOnoMwctSCRRyiKWjIdDVAv/fZ/QFQQr
 eNk7Pu+vJiVhcWf2ML1sojYQb+IJI89WNGEQy/k3KPflY9bmKWMtsqfBs A==;
X-CSE-ConnectionGUID: NIyBtD/0RvuGFJc6TnTO2g==
X-CSE-MsgGUID: 19g70mUWSZ6nnjiu1YIrvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52650141"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="52650141"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 01:24:37 -0700
X-CSE-ConnectionGUID: qfDez9yNQPOeE2vCzpitdw==
X-CSE-MsgGUID: 8jAXfBtHQ0SuOQPqpAb8QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="154522951"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 01:24:35 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/intel-ci: Refine regex to accurately match
 plane downscale factor tests
Date: Thu, 19 Jun 2025 13:54:36 +0530
Message-ID: <20250619082436.56220-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

The previous pattern was overly broad and potentially matched
unintended test cases. The updated regex now accurately targets
the intended downscale factors.

Fixes: a0d787e069ce ("tests/intel-ci: Blocklist unsupported Xe scaling tests")
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index dcdce8b20..1eabd4232 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -82,7 +82,7 @@ igt@kms_pm_rpm@cursor.*
 ##################################################################
 igt@kms_atomic@plane-primary-overlay-mutable-zpos
 igt@kms_plane_scaling@.*downscale-factor-0-25.*
-igt@kms_plane_scaling@planes-downscale-factor-(0-25|0-5|0-75)
+igt@kms_plane_scaling@planes-downscale-factor-(0-2|0-|0-7).$
 igt@kms_plane_scaling@planes-upscale-.*downscale-.*
 igt@kms_prime@.*
 igt@kms_scaling_modes@scaling-mode-none
-- 
2.43.0

