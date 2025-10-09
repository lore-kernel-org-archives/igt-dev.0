Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2EBCCA471
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 06:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7030010E1F4;
	Thu,  9 Oct 2025 06:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIfcA2NR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0695F10E1F4
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 06:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759989915; x=1791525915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bP7ekhhKvH1CFkd+pghKWPrqn+YyY6lkMrQw+YvsG1M=;
 b=WIfcA2NRFijvPlfPfi0k1Z827qkQEL1ENtjf3yd/7DxX7xw9MD9NhmbQ
 m5STOsxr6OZI9ANvZkOUkjy+Mm6Uk0nddwIs5h7j111tpGnD9UnPrjb50
 +VYBsNP+X9qN8NePQ2TOglyHc/+YijDRThz0J6lQ8yzaq+OW0GKsp0feL
 vc2reJzTV52IMS/VfhuwrwtKCRhTv/3rRRQwVR3+plYUZlQpUlrB8F5RL
 WyEE8KTOJkpu8QdY5jGq2GxMuZvn7ADKs82ai7H1DWVSYIj+cNFQnzf4D
 w26k53F4e4kcGJkp5AhcStATdP4m/+kXhsebvLmUcELTN7ulvAW2AQDyU Q==;
X-CSE-ConnectionGUID: kyAQxf+2RPyv7nD3Z9Bc8g==
X-CSE-MsgGUID: P3tzhIYZSCa8MC0OY/PAWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73537728"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="73537728"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 23:05:15 -0700
X-CSE-ConnectionGUID: M2+o6VJXRa2ngoNMhb6x9A==
X-CSE-MsgGUID: zddvQ2LRTQeB5lQD0wiO3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="179880301"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 23:05:12 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] intel-ci: Block DRRS subtests
Date: Thu,  9 Oct 2025 11:34:57 +0530
Message-ID: <20251009060457.1559432-1-jeevan.b@intel.com>
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

Block all DRRS-related subtests as DRRS has been defeatured on LNL+.

Link: https://lore.kernel.org/intel-gfx/20250912135926.18910-1-ville.syrjala@linux.intel.com/
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/xe.lnl.display.blocklist.txt | 7 +++++++
 tests/intel-ci/xe.ptl.display.blocklist.txt | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index 7ae7081da..edde67d75 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -169,3 +169,10 @@ igt@kms_psr2_sf@fbc-pr-.*
 igt@kms_psr2_sf@fbc-psr2.*
 igt@kms_psr@fbc-psr2.*
 igt@kms_psr@fbc-pr.*
+#########################################
+# DRRS not supported on LNL+
+#########################################
+igt@kms_vrr@seamless-rr-switch-drrs
+igt@kms_vrr@seamless-rr-switch-vrr
+igt@kms_dirtyfb@drrs-dirtyfb-ioctl
+igt@kms_frontbuffer_tracking@.*drrs.*
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index 5802c57c5..12219f89a 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -168,3 +168,9 @@ igt@kms_joiner@.*ultra-joiner.*
 ##############################################################################
 igt@kms_pm_dc@deep-pkgc
 ##############################################################################
+# DRRS not supported on LNL+
+#########################################
+igt@kms_vrr@seamless-rr-switch-drrs
+igt@kms_vrr@seamless-rr-switch-vrr
+igt@kms_dirtyfb@drrs-dirtyfb-ioctl
+igt@kms_frontbuffer_tracking@.*drrs.*
-- 
2.43.0

