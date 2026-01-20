Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C2AD2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 09:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856B510E18D;
	Tue, 20 Jan 2026 09:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RySXDBcY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9235610E18D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768900001; x=1800436001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EnoYs5ft46uJe7r5Tav7tdd9u0CjCJrJVYYjNPJI4Q0=;
 b=RySXDBcYu25pMRIWlqHXO4hANyt1RUd7kUpmHajwYrYdrgu2vyAgOkN2
 //p2pNUUW56xNY1imiHL2Ny7sQZ5pD6nkPrx/d2/AjHba4r1SR+nCPqSH
 nnHxBfR+zefyG9VltZM4ObqKU+mvCm+KsiuuPcaNlOpHK0bAYMeuawGGC
 /oXzFMW+w2eBmn2hvpaZZ5nZPv6sF0nyjAuWPeFc6HT7BMEqLjwpOu2+R
 2/hxxBU/hUS0R8fvhjRdbK3ybG6d4s2g5D1+lPqYwrX3V2m7sUoZRdVdz
 yw3NvH2s6U8y0BATioowp2+WmWnIjd5JaiNIv1od0QEWh4X7jIlpdIsvc Q==;
X-CSE-ConnectionGUID: et67gNSkRhevBjjii3KwbQ==
X-CSE-MsgGUID: H8DRstv4QH+zTQqZh9FaeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70190588"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70190588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:06:41 -0800
X-CSE-ConnectionGUID: Gv+0rzBVSrqdKSQ4zOmvAw==
X-CSE-MsgGUID: bfc1cYLoRBS5OfP17JP4Mw==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:06:40 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] intel-ci: Update display blocklist
Date: Tue, 20 Jan 2026 14:36:31 +0530
Message-ID: <20260120090632.144336-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
 3 files changed, 12 insertions(+)

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

