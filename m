Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E678BD3B7E2
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 11:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0FC10E16C;
	Mon,  8 Dec 2025 11:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iire2+LK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1370D10E16C
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765193146; x=1796729146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pem0/BSIhIln/daQOhGVO+UT00XHhwqWxx9me+kd54s=;
 b=iire2+LKGpEcYxzb3ADi2AbXL6RHr13Bua++wcS5/tfjmrzRxt9ECeYl
 fnXksY03a0P5s35xGqLx/J/ChG2zixMKbXIMYXVS6ijFXmedIelEsHLKl
 w22eTPWJpYKLZSezl+QTt5AJmABarNnG3hJZ0ZeTVTmBGIWp5P5IO2qc/
 wrToFU+X7LCV6fzPfuQGsKG+eO6OT0UEmrOuO5mUET/JblhcQ3M/MG3RF
 LeJYa/jG+Y0WWTMXnEyC4UUB1r6bwaKrJ4L44JDkMHIaQj2Px2p8+us5b
 CQwvOL3PtziFdxQrqqVaNM9WNknwBYB4u7WOTyTH65G9Ho+7ut7ln7wVJ A==;
X-CSE-ConnectionGUID: Jq85ZQAySkCxujx8Fb7/nw==
X-CSE-MsgGUID: OvT+fwsrQ4+ayh96Kjs5Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="70750179"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="70750179"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 03:25:46 -0800
X-CSE-ConnectionGUID: PN15amcoRXCScMRyvFtgDQ==
X-CSE-MsgGUID: Y2VNYsy2SGmb0gagWHjE9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195533228"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 03:25:38 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borrah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] intel-ci: Blocklist kms_colorop tests on i915/xe due to
 missing writeback support
Date: Mon,  8 Dec 2025 17:02:43 +0530
Message-Id: <20251208113243.1242127-1-swati2.sharma@intel.com>
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

Colorop tests rely on KMS writeback functionality, which is not yet supported
on i915/xe. Add the relevant kms_colorop entries to the blocklists alongside
existing writeback exclusions.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/i915.blocklist.txt | 6 ++++++
 tests/intel-ci/xe.blocklist.txt   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index 96d69ca79..dffe464dc 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -192,3 +192,9 @@ igt@kms_sysfs_edid_timing
 # boards (which support 4K @ 60Hz) are available in the test environment.
 ##################################################################
 igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
+##################################################################
+# KMS: Yet to add/missing i915 support
+##################################################################
+igt@kms_writeback@writeback.*
+igt@kms_colorop@.*
+##################################################################
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 63f969416..bd08aa594 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -89,6 +89,7 @@ igt@kms_plane_scaling@.*downscale-factor-0-25.*
 igt@kms_prime@.*
 igt@kms_scaling_modes@scaling-mode-none
 igt@kms_writeback@writeback.*
+igt@kms_colorop@.*
 ##################################################################
 # KMS: Test was written with the idea that edid read shouldn't take an
 # unreasonable amount of time. The timeout is an arbitrary value
-- 
2.25.1

