Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99EAC3DA49
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 17:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7484C10E2A0;
	Fri, 26 Jul 2024 17:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eD3KQ4uh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDCB10E2A0
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722013808; x=1753549808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zehI7W71/l2xIT3WnPR6JMq9k7KPvTwWmQ3rv+yto4g=;
 b=eD3KQ4uhOo+G4R98+4CJeKHWkqJy3bgz+EBftv1lSvnLnWeI+YJrwUZV
 QYGKMOjPDdx+t2Hv/A+q534SPXfJ4VbO55UlP6p789+gHCaQ8EhnMfj5r
 3o6Tzsx2mhuf82lLaAZt8DFhlDgoi2G9RrCe+01DnsF1KFjMjzLQt4wFg
 BuPUqtPKzGvfoQfNHPL8D9+qntNzZ/cRLYOlDX09YSzFoB9CugZP5o58t
 MHPCl/dPtbTmxXANvnBXBDx8G0R7bf4MCyneRojuGq8a4JHopM2/zleAr
 kf64RuQMaARUmzj0tdSkivOgdGYDKFpqYARoj0Ucb2hyoYNK6NYxue/s8 Q==;
X-CSE-ConnectionGUID: 6iQOKAqtTHOa4NnCnWTh3w==
X-CSE-MsgGUID: 36X/ktyUQ22BG7kfsAxTuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="30426466"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="30426466"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 10:10:07 -0700
X-CSE-ConnectionGUID: JqdgIB/hQwKkmSkztOt9/A==
X-CSE-MsgGUID: jZxiRDMBTsWLNi3gj6D2VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="52994126"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.0.122])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 10:10:05 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH v2 i-g-t] tests/intel-ci/xe-sriov-vf.blocklist.txt: Blocklist
 for SR-IOV VF BAT runs
Date: Fri, 26 Jul 2024 19:09:59 +0200
Message-Id: <20240726170959.1378586-1-marcin.bernatowicz@linux.intel.com>
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

V2:
- Reduce blocklist to minimal, favoring SKIPs.
- Demonstrated minimal time impact on ADLP with increased skips.

Before:

summary:
       name: vf_bats_results
       ----  ---------------
       pass:             171
       fail:               0
      crash:               0
       skip:              56
    timeout:               0
       warn:               0
 incomplete:               0
 dmesg-warn:               0
 dmesg-fail:               0
    changes:               0
      fixes:               0
regressions:               0
      total:             227
       time:        00:00:25

After:

summary:
       name: vf_bats_results
       ----  ---------------
       pass:             171
       fail:               0
      crash:               0
       skip:             119
    timeout:               0
       warn:               0
 incomplete:               0
 dmesg-warn:               0
 dmesg-fail:               0
    changes:               0
      fixes:               0
regressions:               0
      total:             290
       time:        00:00:27

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/meson.build               |  1 +
 tests/intel-ci/xe-sriov-vf.blocklist.txt | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
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
index 000000000..870082f5b
--- /dev/null
+++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
@@ -0,0 +1,19 @@
+##################################################################
+# Block list for VF xe-fast-feedback runs
+##################################################################
+# Prevent potential module reloads during tests
+##################################################################
+igt@xe_module_load
+##################################################################
+# Not applicable on VF (requires PF)
+##################################################################
+igt@sriov_basic
+##################################################################
+# Modify tests to SKIP: No interface on VF.
+##################################################################
+igt@xe_gt_freq
+igt@xe_pm_residency
+##################################################################
+# Blocked because of abort
+##################################################################
+igt@xe_debugfs@gt
-- 
2.31.1

