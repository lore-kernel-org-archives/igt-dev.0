Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14714D2A550
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58D010E220;
	Thu,  4 Dec 2025 21:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9L3+0ue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D579C10E220
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764884206; x=1796420206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E1ft2gHBftGMt0Q9SyVhXMTOgh29ejBIwFB4k8gjBZY=;
 b=E9L3+0ueHScE0DW+rvUaxnEFZLvoStWbnEhgAxV68xSqlzGEENcODtjo
 kqKYNkZ/iqfOdZSP3OQzwuzI876UQZBek40t/jDOPRW+AVatQyOItI4ug
 qArzh/St3jFwcP7uihsavvK5XkPf3hSm0ih8MUIhPDMPwk+Di+fJ9QEH2
 sKY/QrLkg+oqD9RahQvmc3TrQws0XRwF4izFI5rJu6PCGSWehRET5GcKx
 3rnBIu4gPSEb9EX71xSpvjKqBeWHTDvVxkURXmxgDRlCn/ueV4FbMWk7A
 2cTxmA/PbBCj5TcdmVqT7WTjafKAADh9OD0BjSTLIP4t/UAMbQCRqpmbI w==;
X-CSE-ConnectionGUID: R3TnVopYQOasvj4jRqHXlg==
X-CSE-MsgGUID: kZ9kwnc5QRy+NOhN/0x+Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77600846"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="77600846"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:36:45 -0800
X-CSE-ConnectionGUID: vWbe1VDSTpyZVHSZ92aexw==
X-CSE-MsgGUID: FVX4E+9tQiSW2PbLNx9BSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="195207677"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.32])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:36:43 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v2 1/3] intel-ci: unify Xe lists naming
Date: Thu,  4 Dec 2025 22:36:30 +0100
Message-ID: <20251204213632.155894-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204213632.155894-1-kamil.konieczny@linux.intel.com>
References: <20251204213632.155894-1-kamil.konieczny@linux.intel.com>
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

Use uniform naming xe.blocklist or xe.testlist and rename few
Xe lists.

Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tests/intel-ci/meson.build                                | 8 ++++----
 ....testlist => xe.fast-feedback-chamelium-only.testlist} | 0
 ...e-fast-feedback.testlist => xe.fast-feedback.testlist} | 0
 ...e-sriov-vf.blocklist.txt => xe.sriov-vf.blocklist.txt} | 0
 ...e-sriov-vm.blocklist.txt => xe.sriov-vm.blocklist.txt} | 0
 tests/intel/kms_test_config.json                          | 4 ++--
 tests/intel/xe_test_config.json                           | 6 +++---
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename tests/intel-ci/{xe-fast-feedback-chamelium-only.testlist => xe.fast-feedback-chamelium-only.testlist} (100%)
 rename tests/intel-ci/{xe-fast-feedback.testlist => xe.fast-feedback.testlist} (100%)
 rename tests/intel-ci/{xe-sriov-vf.blocklist.txt => xe.sriov-vf.blocklist.txt} (100%)
 rename tests/intel-ci/{xe-sriov-vm.blocklist.txt => xe.sriov-vm.blocklist.txt} (100%)

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 0c3b79d51..917f18bfe 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -18,16 +18,16 @@ intelci_files = [
   'xe.bmg.display.blocklist.txt',
   'xe.bmg.eudebug.blocklist.txt',
   'xe.eudebug.blocklist.txt',
+  'xe.fast-feedback.testlist',
+  'xe.fast-feedback-chamelium-only.testlist',
   'xe.lnl.core.blocklist.txt',
   'xe.lnl.display.blocklist.txt',
   'xe.lnl.eudebug.blocklist.txt',
   'xe.multigpu.blocklist.txt',
   'xe.ptl.core.blocklist.txt',
   'xe.ptl.display.blocklist.txt',
-  'xe-fast-feedback.testlist',
-  'xe-fast-feedback-chamelium-only.testlist',
-  'xe-sriov-vf.blocklist.txt',
-  'xe-sriov-vm.blocklist.txt',
+  'xe.sriov-vf.blocklist.txt',
+  'xe.sriov-vm.blocklist.txt',
 ]
 
 if meson.version().version_compare('<1.3.0')
diff --git a/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist b/tests/intel-ci/xe.fast-feedback-chamelium-only.testlist
similarity index 100%
rename from tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
rename to tests/intel-ci/xe.fast-feedback-chamelium-only.testlist
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
similarity index 100%
rename from tests/intel-ci/xe-fast-feedback.testlist
rename to tests/intel-ci/xe.fast-feedback.testlist
diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
similarity index 100%
rename from tests/intel-ci/xe-sriov-vf.blocklist.txt
rename to tests/intel-ci/xe.sriov-vf.blocklist.txt
diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe.sriov-vm.blocklist.txt
similarity index 100%
rename from tests/intel-ci/xe-sriov-vm.blocklist.txt
rename to tests/intel-ci/xe.sriov-vm.blocklist.txt
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 02fb32534..559d46b4d 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -17,8 +17,8 @@
                         { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
                         { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
 
-                        { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
-                        { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
+                        { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
+                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
                     ],
                     "exclude": [
                         { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index df7e6dcf0..65e685470 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -13,12 +13,12 @@
                     "exclude-type": "regex-ignorecase",
                     "append-value-if-not-excluded": "Xe FULL, Xe FULL VM",
                     "include": [
-                        { "Xe BAT, Xe BAT VF, Xe BAT VM": "../intel-ci/xe-fast-feedback.testlist" }
+                        { "Xe BAT, Xe BAT VF, Xe BAT VM": "../intel-ci/xe.fast-feedback.testlist" }
                     ],
                     "exclude": [
                         { "Xe BAT, Xe BAT VF, Xe BAT VM, Xe FULL, Xe FULL VM": "../intel-ci/xe.blocklist.txt" },
-                        { "Xe BAT VF": "../intel-ci/xe-sriov-vf.blocklist.txt"},
-                        { "Xe BAT VM, Xe FULL VM": "../intel-ci/xe-sriov-vm.blocklist.txt"}
+                        { "Xe BAT VF": "../intel-ci/xe.sriov-vf.blocklist.txt"},
+                        { "Xe BAT VM, Xe FULL VM": "../intel-ci/xe.sriov-vm.blocklist.txt"}
                     ]
                 },
                 "order": [
-- 
2.52.0

