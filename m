Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED882C44501
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 02:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E0410E10D;
	Fri, 10 Jul 2026 02:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UueMKhdY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1680C10E10D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 02:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783649674; x=1815185674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fag6w3ZtsQh8R3I8MlUPNivsp3qrEF5fyPyfH06tfi4=;
 b=UueMKhdYTNRfxrrQLpfx3ncB39WSg5g9gN+ryP/MaNNRs/AZneX1brJw
 ZTzol1NwMcNOZYX38yr2zMZVXkq5ulOUDJCDcNww2QIWRZ7C//cm87Tkb
 TCUaTKqhIaT0bcl4s5PIX6j3cl6qzmzpuTCjPxvdEpH/UKuArdL1lwU1s
 7hRTGFmnsJD/J5srofOqB3MHRrYHki5JopLH+NTs5pGEWfpdlxZA30qXm
 3LOTvL96b1qx1dDT83BuDa3wLPxBoQnHyAWfBzaSrkUKj7ei3D48Hnc6v
 4SjfNtzcx46cPzQYAYHH74UW2yejFdm3qm/USerATY1f3cI0xas+DmQD9 w==;
X-CSE-ConnectionGUID: FKgq+m+0TmqGdw47EQOQbA==
X-CSE-MsgGUID: xBdmLjoCQSi0Tb46COBN1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109892154"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="109892154"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 19:14:34 -0700
X-CSE-ConnectionGUID: TAkcn3QzS3+nY98w9SrcUw==
X-CSE-MsgGUID: ILuiK8S6S8en97YJv0SySg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="248388530"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 19:14:32 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v4 2/2] intel-ci: Blocklist lud3d for display_ver < 35
Date: Fri, 10 Jul 2026 07:57:41 +0530
Message-ID: <20260710022741.89883-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710022741.89883-1-pranay.samala@intel.com>
References: <20260710022741.89883-1-pranay.samala@intel.com>
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

Add chamelium test to BMG, LNL, PTL blocklists.
This is a valid skip for display version < 35.

v2:
- Add NVL specific test in other blocklists (Swati)

v3:
- Split the patches (Kamil)

v4:
- Update the subject (Swati)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index 4c2a7390a..3e30e5772 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -181,3 +181,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
 igt@kms_pm_dc@dc3co-.*
 igt@kms_vrr@lobf-dc3co
 ########################################
+# Valid skip :- For display ver < 35
+########################################
+igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
+########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index 1dbb24ae3..7462294aa 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -191,3 +191,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
 igt@kms_pm_dc@dc3co-.*
 igt@kms_vrr@lobf-dc3co
 ########################################
+# Valid skip :- For display ver < 35
+########################################
+igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
+########################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index 1041931a1..c46312d1e 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -182,3 +182,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
 igt@kms_pm_dc@dc3co-.*
 igt@kms_vrr@lobf-dc3co
 ########################################
+# Valid skip :- For display ver < 35
+########################################
+igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
+########################################
-- 
2.53.0

