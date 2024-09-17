Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381B3C3ABD7
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 05:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C475410E40E;
	Tue, 17 Sep 2024 05:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Il60lGDv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BFE10E40F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2024 05:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726550182; x=1758086182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fwSA1oYJ20AW03zeJQZ78DW6twPKuIhGcuBJaycerNo=;
 b=Il60lGDvNk8tYkghwtcqFGXRyw9GgTfPzG5TylkfGZ1Sz7f0BPaqf/q4
 Bdus0D61dSRBLQCchfdfINvD0P99vVDuY/p5o/R/RhhSxrh9z1SDGYiFz
 LJ/HRbxXSBRYZoKIkK/KCo6WLKnaZZsaMfHXbiVD9Wa2P5KljWdQtmHRb
 gt+0l68ZI5PmT1wqmhlBL6zYkt3Lugc1cs2I0WWFPxb5KiYR8uxZxQ5jE
 1ZhGZZJqQYlQQDnlv5QyzYlec0ylskShGdCEeHhu7zZezHWJwKVlJvDhp
 Cu4wCH2SyKZ+MgGs+vjBKwaApVFCBRbee/wb8981HHZJ4sH1HepYc1mUN g==;
X-CSE-ConnectionGUID: 8wUdMFJ1TA2anOFgG0NlfA==
X-CSE-MsgGUID: RPIXjg6DRFmCC+YrCEpYgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36743900"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="36743900"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 22:16:22 -0700
X-CSE-ConnectionGUID: SinRnZlsTpKE4vz2u4siLw==
X-CSE-MsgGUID: lHAL2coQQUqAxzvYffHG2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="69037541"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa009.jf.intel.com with ESMTP; 16 Sep 2024 22:16:20 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v4 2/2] HAX: Do not merge
Date: Tue, 17 Sep 2024 10:46:39 +0530
Message-Id: <20240917051639.1162160-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917051639.1162160-1-pranay.samala@intel.com>
References: <20240917051639.1162160-1-pranay.samala@intel.com>
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
 tests/intel-ci/fast-feedback.testlist    | 51 ++++++++++++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 51 ++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..6f50c60bb 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,57 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area
+igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb
+igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area
+igt@kms_psr2_sf@psr2-cursor-plane-update-sf
+igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf
+igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area
+igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf
+igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area
+igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf
+igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area
+igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb
+igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area
+igt@kms_psr2_sf@pr-cursor-plane-update-sf
+igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf
+igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@pr-plane-move-sf-dmg-area
+igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf
+igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area
+igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf
+igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf
+igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf
+igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area
+igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf
+igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf
+igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf
+igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf
+igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area
+igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf
+igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..31ad377b4 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,57 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area
+igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb
+igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area
+igt@kms_psr2_sf@psr2-cursor-plane-update-sf
+igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf
+igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area
+igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf
+igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area
+igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf
+igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area
+igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb
+igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area
+igt@kms_psr2_sf@pr-cursor-plane-update-sf
+igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf
+igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@pr-plane-move-sf-dmg-area
+igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf
+igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area
+igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf
+igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf
+igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf
+igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area
+igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf
+igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf
+igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf
+igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf
+igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area
+igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf
+igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf
+igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf
+igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area
+igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.34.1

