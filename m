Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C27D2504E
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 08:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C1310E302;
	Mon, 12 Jan 2026 08:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCE4JpAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505A710E302
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 08:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768206338; x=1799742338;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e2CWizI7wpIC0F8c5R0CS8aijRLJpaQ6U1BwzeY4YKM=;
 b=WCE4JpAD7XS8vA1v0OQrAeSWuVD82B8eKxIiAGdni7G32XpqVWkIiBvi
 OJcXl2Po+LF7n8Lf2jipXZKxlSITqt4AUz4LOhpbUMYGHo/5qTUdLLLtV
 Ft94HFh5bOZ7qaIohhF/mei5iDhaFys2fSeB9yggTP9EvDMskMYD7WduQ
 1U2WGWIQIjZQcNrdRPaGRyxd17e86393hV6+bNihj4s+77gYxU7q8/iyz
 9eic0p9Q7lnj/XbPxQpnwmS6YR6FfyVl/C+SkQ8WAYprbdvjsUqQOBQl9
 QDlHgxuoq8rFdggWSQhrlhg31iwM26pCHKvliYca9dUHIJAkoi9S+Zx7x g==;
X-CSE-ConnectionGUID: QcizIUY9Qd6ibn2QkYyhlA==
X-CSE-MsgGUID: 0UKMdfk4QzmE0tx7/Qwt5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="73328440"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="73328440"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:25:38 -0800
X-CSE-ConnectionGUID: hKSCWKzaTPKgByCYQ8Tk9Q==
X-CSE-MsgGUID: u9y9bKcWQza3ne5JylIt1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="203941138"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:25:36 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] intel-ci: Add 3D lut tests to display blocklist
Date: Mon, 12 Jan 2026 13:51:34 +0530
Message-ID: <20260112082134.151464-1-karthik.b.s@intel.com>
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

kms_color_pipeline@plane-lut3d-green-only is valid for NVL+ only.
Blocklist this on older platforms.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/i915.blocklist.txt           | 4 ++++
 tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index dffe464dc..8b47d10cd 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -198,3 +198,7 @@ igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
 igt@kms_writeback@writeback.*
 igt@kms_colorop@.*
 ##################################################################
+# Valid skip : 3D LUT is supported NVL+
+##################################################################
+igt@kms_color_pipeline@plane-lut3d-green-only
+##################################################################
diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index 361da761e..919be620d 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -169,3 +169,7 @@ igt@kms_big_fb@linear-max-hw-stride.*hflip
 #########################################
 igt@kms_pm_dc@dc5-retention-flops
 #########################################
+# Valid skip : 3D LUT is supported NVL+
+########################################
+igt@kms_color_pipeline@plane-lut3d-green-only
+########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index 4151582f6..6cc61b98f 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -179,3 +179,7 @@ igt@kms_frontbuffer_tracking@.*drrs.*
 ########################################
 igt@kms_pm_rpm@package-g7
 ########################################
+# Valid skip : 3D LUT is supported NVL+
+########################################
+igt@kms_color_pipeline@plane-lut3d-green-only
+########################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index ba784140e..a29c515b9 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -177,3 +177,7 @@ igt@kms_frontbuffer_tracking@.*drrs.*
 #########################################
 igt@kms_pm_rpm@package-g7
 #########################################
+# Valid skip : 3D LUT is supported NVL+
+########################################
+igt@kms_color_pipeline@plane-lut3d-green-only
+########################################
-- 
2.43.0

