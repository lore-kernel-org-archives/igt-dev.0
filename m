Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9CFC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 15:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BE910E14B;
	Thu,  1 Aug 2024 15:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXJxelNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F4610E14B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722524878; x=1754060878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QKh+mD2dJKREazCCsuJvzmzyK76rjFil1+cpR62R/24=;
 b=dXJxelNppjKswhe72g3nLyV5rZFgv8TmNYub3PnwgbT5KA7O9iDGZqc0
 IaSgfPtUtZRSU/nfN/cLmqu0eDkczz8Zh+bTn+hGqzArGIWzClqenne5k
 9HLIC4WWwQRv9PMkwav+ZzuGpXc3AdBbXwZRlaXlzw+EfdhVAhRBHr35z
 bxPKEH90OGyJq9sODEC0L/1uoGl/hUXYxLGF5t5FVdpHz52lXeEqqhuuz
 6tqZPpZT1pDzaJ00EjKQOU8GClGNukHyMJg2QatfRFYEYZHarn5HaUuzu
 wo74BAh0ZLUDD6FrAc4PqdSOzYhTIgPGys0qBqjuEaAM87fLK2jbSb5O2 Q==;
X-CSE-ConnectionGUID: GqHk3EYGTJiZFmZ9SBAUzw==
X-CSE-MsgGUID: 8gWJUy9SQqik4o9C49lEsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20327046"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20327046"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:07:30 -0700
X-CSE-ConnectionGUID: lXqfXbj7Q1akqOjH3pC9Yg==
X-CSE-MsgGUID: BZCR7r14SJO6FLzVyJZjzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55026569"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:07:21 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, katarzyna.piecielska@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH v4 i-g-t] tests/intel-ci/xe-sriov-vf.blocklist.txt: Blocklist
 for SR-IOV VF runs
Date: Thu,  1 Aug 2024 17:06:35 +0200
Message-Id: <20240801150635.512586-1-marcin.bernatowicz@linux.intel.com>
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

Blocklist tests not applicable for Virtual Function (VF) runs.
The list extends xe.blocklist.txt to enable execution on VF device,
with BAT (xe-fast-feedback.testlist) runs to be enabled first.

V2:
- Reduce blocklist to minimal, favoring SKIPs.
- Demonstrated minimal time impact on ADLP with increased skips.

V3:
- Update comment to reflect blocklist not restricted to BAT runs (Michal)
- Move summary results after --- mark (Michal)
- Removed igt@sriov_basic from the list (Michal)
- Reduce decorations in blocklist file (Michal)

V4:
- Removed igt@xe_gt_freq and igt@xe_pm_residency tests,
  corrected to SKIP.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/meson.build               |  1 +
 tests/intel-ci/xe-sriov-vf.blocklist.txt | 11 +++++++++++
 2 files changed, 12 insertions(+)
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
index 000000000..0c5bc631a
--- /dev/null
+++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
@@ -0,0 +1,11 @@
+##################################################################
+# Block list for VF runs
+##################################################################
+#
+# Prevent potential module reloads during tests
+#
+igt@xe_module_load
+#
+# Blocked because of abort
+#
+igt@xe_debugfs@gt
-- 
2.31.1

