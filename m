Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C78C3DA42
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 15:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C11810E148;
	Wed, 17 Jul 2024 15:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Esba1mnv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3759310E148
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721230271; x=1752766271;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5qEF/wDX0KCy5xWU/lP/11pIjAv4pjBFcn/Jb8znS4k=;
 b=Esba1mnvSRPO+325uC9OZxoXHYEjcv1F32cLKxV2Cwuism+jDI1uAkzx
 GUVcpw4wuN1ESV3t+v0Vef7frrleUxrYfgIw0NKO1zKIQhulB6Ur5BMPU
 Xy3U4aUeKE9WDV42W1fC7nQA+nkz4m/mL2bH/ym/3G5c7jHHcpPrsWCzY
 VhS5/gbbaBGaYEJBttFgp6E/4aEOV2UTg/F0/cX7rP8e0rRgoyJk/6+9W
 hihDsHnvjmH4wzR/0oe33YYP4Cv1WJOJmJSPdTYopo0OBZq+ZOg6tx6we
 AjHgzadG6LoHvxF1FOpzNmaYf6QgdrYCdw6aQ80VTJmD/J7MNd2BST5Ff w==;
X-CSE-ConnectionGUID: 2a7YD7LXSkuvZ1TWAtMB0Q==
X-CSE-MsgGUID: QJt6LlJ2SOa5184XB05ApQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18856297"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18856297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 08:31:03 -0700
X-CSE-ConnectionGUID: 2zmmkRKmQ3aosD4tken2Ug==
X-CSE-MsgGUID: 5Pccnw3vTGeRTt72784Jrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50162457"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 08:31:00 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe-sriov-vf.blocklist.txt: Blocklist for
 SR-IOV VF BAT runs
Date: Wed, 17 Jul 2024 17:30:51 +0200
Message-Id: <20240717153051.1000030-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Blocklist tests not applicable for Virtual Function (VF) BAT runs.
The list extends xe.blocklist.txt to enable xe-fast-feedback.testlist
execution on VF device.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/meson.build               |  1 +
 tests/intel-ci/xe-sriov-vf.blocklist.txt | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 tests/intel-ci/xe-sriov-vf.blocklist.txt

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index f16243cbb..59323eda9 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -11,6 +11,7 @@ intelci_files = [
   'xe.blocklist.txt',
   'xe-fast-feedback.testlist',
   'xe-fast-feedback-chamelium-only.testlist',
+  'xe-sriov-vf.blocklist.txt',
 ]
 
 install_data(sources : intelci_files, install_dir : datadir)
diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
new file mode 100644
index 000000000..dae20bc6c
--- /dev/null
+++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
@@ -0,0 +1,21 @@
+##################################################################
+# Block list for VF xe-fast-feedback runs
+##################################################################
+# The module is already loaded when VF is created
+##################################################################
+igt@xe_module_load
+##################################################################
+# Not applicable on VF
+##################################################################
+igt@fbdev
+igt@sriov_basic
+igt@kms.*
+igt@xe_gt_freq
+igt@xe_live_ktest
+igt@xe_pm_residency
+##################################################################
+# Under investigation
+##################################################################
+igt@xe_debugfs@gt
+igt@xe_evict_ccs@evict-overcommit-simple
+igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
-- 
2.31.1

