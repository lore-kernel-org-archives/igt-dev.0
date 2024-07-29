Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D84C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 10:31:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0A410E387;
	Mon, 29 Jul 2024 10:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7LFlL6a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4286A10E387
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 10:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722249070; x=1753785070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ckj6pFqSVoP+nQb3rkGQknR7cqX2nvpVY1V1HC6lxgg=;
 b=h7LFlL6a20Bd96eMNRyOQyjtT31HmwhYBRa5zeZBjjUDEULvq/eK6tF6
 Jc5xEhzRu39i/CfKxTRJsNt4ou3hxx5rxOw2O09yfXXXsAaopRJz9gkCc
 IJPLZDESHOsrn1P+GdfFMxiIMMjq18rN5qw5fxcaFD99Kn8jBPBQF9p8n
 ecEJ5MLRVT9JOAXYzAJVtG5t+htXw6E/gj1/k76PXqv/TSOsrj//oFz/0
 8WLngEGmiNK7wce/JMqQPEU+e0pjPUZBsEsnTOk6c0pVvhQLzGe4NPJ4G
 czLXVvQrV9MVXDEwI+NHagNhrT/bmWf1xzfQ93RJMIALZWqtKID/eGjGk g==;
X-CSE-ConnectionGUID: iyOvA0KbRr+NCx40cDvv1Q==
X-CSE-MsgGUID: EC9t5o5ASEqX2rmjjAyeJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="31405035"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="31405035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 03:31:10 -0700
X-CSE-ConnectionGUID: KIW6aOEXQFKQNmQSUe0frw==
X-CSE-MsgGUID: jiGxLGkuR8Cfg8NUKU2POw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="54733814"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 03:31:07 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, katarzyna.piecielska@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH v3 i-g-t] tests/intel-ci/xe-sriov-vf.blocklist.txt: Blocklist
 for SR-IOV VF runs
Date: Mon, 29 Jul 2024 12:31:01 +0200
Message-Id: <20240729103101.1460568-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240726170959.1378586-1-marcin.bernatowicz@linux.intel.com>
References: <20240726170959.1378586-1-marcin.bernatowicz@linux.intel.com>
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

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---

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
       skip:             121
    timeout:               0
       warn:               0
 incomplete:               0
 dmesg-warn:               0
 dmesg-fail:               0
    changes:               0
      fixes:               0
regressions:               0
      total:             292
       time:        00:00:27

 tests/intel-ci/meson.build               |  1 +
 tests/intel-ci/xe-sriov-vf.blocklist.txt | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
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
index 000000000..5df897000
--- /dev/null
+++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
@@ -0,0 +1,16 @@
+##################################################################
+# Block list for VF runs
+##################################################################
+#
+# Prevent potential module reloads during tests
+#
+igt@xe_module_load
+#
+# Modify tests to SKIP: No interface on VF.
+#
+igt@xe_gt_freq
+igt@xe_pm_residency
+#
+# Blocked because of abort
+#
+igt@xe_debugfs@gt
-- 
2.31.1

