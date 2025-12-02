Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB5CD1171E
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 18:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A362A10E69A;
	Tue,  2 Dec 2025 18:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+TgODHf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3D810E69A
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 18:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764698947; x=1796234947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ztaYG5ZBqa566ifOOURMYKTVEHZcdC/0sO1WqvXVqI0=;
 b=l+TgODHfxYe3az1hoN6zhmp5l5N5gAO7ktBh7SxumQTAmNaYZtQY4ys9
 5qxwoP16N6kDwgPQea7pMC6cA0+eDw3LFlhy++zbrqyWN7HvgtUnfEWnf
 KITNg0vtMB/wMpwHFut2lqOsi0gp5eMqf4vhITXV/CzzoF/eY1M995D9K
 TXzBzkn2rVarhNOtBIQBKBKtgnQbrvtCI37WrQM5RPLqpgPIuYb5aKzt4
 y+jjbiwLs3ErQxVGh+LsvfU3Xx1ZY7Zq9MoXkIzO+R3EsVNOpLMIxX5Iv
 NVJkvh0tQf/dyfE32NkUa5kF6mu/si1kCibf8qIy7HQOE0cDFO0MCqkAB g==;
X-CSE-ConnectionGUID: PT5DX93PQBK2gOKvHcnvBA==
X-CSE-MsgGUID: /hDT2Z5vT6mZ5j8/ijmNZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66570806"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66570806"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:09:07 -0800
X-CSE-ConnectionGUID: mMCsaZWMQsaH4IT4sdgsAg==
X-CSE-MsgGUID: GFiAguR5T2evBL5vF7XYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198914800"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:09:05 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v1 1/3] intel-ci: unify Xe lists naming
Date: Tue,  2 Dec 2025 19:08:49 +0100
Message-ID: <20251202180851.148444-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
References: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
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

