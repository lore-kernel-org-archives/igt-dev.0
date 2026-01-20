Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B28D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 09:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9A310E179;
	Tue, 20 Jan 2026 09:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnM9pAFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D046510E3B1
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768901365; x=1800437365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TZB5y2Bx2ak0Ow8qi36bzyERMd8nqIk1jFNVWq48q+E=;
 b=OnM9pAFIPEHpSd7VwVauV00z88DgY05k115hLmXi6zU2QePaJkBU3Qkj
 xgWOVDE5Q3gc12q3jXV/fKph/pLYz3VxvMebPGqJwCJvxmXSFnpg0Y4rJ
 aIrFoVbpUZreIQdNMRjIdq1JvtCBUJpIvjCNCOEE4nEssw3/ex5Nw/Gug
 nN/R5YRih2Jfp9ecI+k2uJkrKNYs1W706NubYbva8H8kpM7LrRdT16Z+U
 lHQwl2fYYWeadNL/AnVLENkV80XKjXUFewfwaeBY0Xt/iHWPD95XKLLVF
 fUSbgRgiOzjyo0VPIRX//sYrPbqCAjfVIl/KljIRMkuoasy/rrnCSPhuR Q==;
X-CSE-ConnectionGUID: uSi/Web9RRy5f3cqOfSi0Q==
X-CSE-MsgGUID: EwobHIXHQ2qjJ28UWnjF2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81214385"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="81214385"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:29:24 -0800
X-CSE-ConnectionGUID: lvYUH4qPQASZPhniAnhP9g==
X-CSE-MsgGUID: WmDOaWXWRyOhZOJBRpTBvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205325028"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:29:23 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] intel-ci: Update argb161616f format tests in display
 blocklist
Date: Tue, 20 Jan 2026 14:59:14 +0530
Message-ID: <20260120092914.144780-1-jeevan.b@intel.com>
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

Add tests using argb161616f format, as this pixel format
is only supported from display version 35 onwards.

v2: Update subject and add test in i915 blocklist.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/i915.blocklist.txt           | 4 ++++
 tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index 8b47d10cd..583df28e3 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -202,3 +202,7 @@ igt@kms_colorop@.*
 ##################################################################
 igt@kms_color_pipeline@plane-lut3d-green-only
 ##################################################################
+# Valid skip :- For display ver >= 35
+##################################################################
+igt@kms_frontbuffer_tracking@.*argb161616f.*
+##################################################################
diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index 919be620d..2c0c4a0e8 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -173,3 +173,7 @@ igt@kms_pm_dc@dc5-retention-flops
 ########################################
 igt@kms_color_pipeline@plane-lut3d-green-only
 ########################################
+# Valid skip :- For display ver >= 35
+########################################
+igt@kms_frontbuffer_tracking@.*argb161616f.*
+########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index 6cc61b98f..d92e12d64 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -183,3 +183,7 @@ igt@kms_pm_rpm@package-g7
 ########################################
 igt@kms_color_pipeline@plane-lut3d-green-only
 ########################################
+# Valid skip :- For display ver >= 35
+########################################
+igt@kms_frontbuffer_tracking@.*argb161616f.*
+########################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index a29c515b9..e9d0775e7 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -181,3 +181,7 @@ igt@kms_pm_rpm@package-g7
 ########################################
 igt@kms_color_pipeline@plane-lut3d-green-only
 ########################################
+# Valid skip :- For display ver >= 35
+########################################
+igt@kms_frontbuffer_tracking@.*argb161616f.*
+########################################
-- 
2.43.0

