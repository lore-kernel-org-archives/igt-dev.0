Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CF8D2A54D
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E72510E227;
	Thu,  4 Dec 2025 21:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="in1mivS8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7604E10E227
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764884209; x=1796420209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgjHaO+E7hGiipnoyNIb/SwUyC2AovMa/RwMNQGTFVs=;
 b=in1mivS8UQAxdKLrUxNCIrYDD8YNDLFbtond/IdH4rsuMvZvZBq+sD5Q
 By8zlkC5QYPtW4Af1pO1nR0VbR8v7F4sJiwZ1KIusAGEC7ZA2ybrGLJSW
 Zgbr2Na55wClOYhjiduuuf3FvKjlG/Lx9tRLTyGUPOwe9/FdMfDKeNSez
 vhy8AEg4Dz28iKRBWOD+WUjVN1IPkYyJrhyJ0cJUL5ZGjYgWd7p/qyOKo
 EWJLUhUy43dWnpirzW04+zNFQTO/HhQPAu2mYvH+goEyg3Jq0aWKtqHc0
 OF/Fo86HkmH0ovqppzmhgWgCwmimgEJWgrXqdlgkrzbN1SqjtNnk2+ojX Q==;
X-CSE-ConnectionGUID: iCSzHs70TlqOpuK9jMWzqg==
X-CSE-MsgGUID: D6V4FIfeTaan84MuSOVdzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77600849"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="77600849"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:36:49 -0800
X-CSE-ConnectionGUID: rF4W9BbGQOKH/EsNfmGMfg==
X-CSE-MsgGUID: 4JfI1OMURfG8cb+THcBSpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="195207691"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.32])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:36:48 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t v2 2/3] intel-ci: Add symlinks for Xe lists
Date: Thu,  4 Dec 2025 22:36:31 +0100
Message-ID: <20251204213632.155894-3-kamil.konieczny@linux.intel.com>
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

Add symlinks to recently removed Xe lists so Ci will have time
for changing its flow.

v2: add symlinks to meson (Ryszard)

Cc: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/meson.build                              | 4 ++++
 tests/intel-ci/xe-fast-feedback-chamelium-only.testlist | 1 +
 tests/intel-ci/xe-fast-feedback.testlist                | 1 +
 tests/intel-ci/xe-sriov-vf.blocklist.txt                | 1 +
 tests/intel-ci/xe-sriov-vm.blocklist.txt                | 1 +
 5 files changed, 8 insertions(+)
 create mode 120000 tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
 create mode 120000 tests/intel-ci/xe-fast-feedback.testlist
 create mode 120000 tests/intel-ci/xe-sriov-vf.blocklist.txt
 create mode 120000 tests/intel-ci/xe-sriov-vm.blocklist.txt

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 917f18bfe..05ee4f73a 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -19,7 +19,9 @@ intelci_files = [
   'xe.bmg.eudebug.blocklist.txt',
   'xe.eudebug.blocklist.txt',
   'xe.fast-feedback.testlist',
+  'xe-fast-feedback.testlist',
   'xe.fast-feedback-chamelium-only.testlist',
+  'xe-fast-feedback-chamelium-only.testlist',
   'xe.lnl.core.blocklist.txt',
   'xe.lnl.display.blocklist.txt',
   'xe.lnl.eudebug.blocklist.txt',
@@ -27,7 +29,9 @@ intelci_files = [
   'xe.ptl.core.blocklist.txt',
   'xe.ptl.display.blocklist.txt',
   'xe.sriov-vf.blocklist.txt',
+  'xe-sriov-vf.blocklist.txt',
   'xe.sriov-vm.blocklist.txt',
+  'xe-sriov-vm.blocklist.txt',
 ]
 
 if meson.version().version_compare('<1.3.0')
diff --git a/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist b/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
new file mode 120000
index 000000000..5590bb122
--- /dev/null
+++ b/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
@@ -0,0 +1 @@
+xe.fast-feedback-chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
new file mode 120000
index 000000000..18f0b3b89
--- /dev/null
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -0,0 +1 @@
+xe.fast-feedback.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
new file mode 120000
index 000000000..207e941e7
--- /dev/null
+++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
@@ -0,0 +1 @@
+xe.sriov-vf.blocklist.txt
\ No newline at end of file
diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe-sriov-vm.blocklist.txt
new file mode 120000
index 000000000..d07d2b330
--- /dev/null
+++ b/tests/intel-ci/xe-sriov-vm.blocklist.txt
@@ -0,0 +1 @@
+xe.sriov-vm.blocklist.txt
\ No newline at end of file
-- 
2.52.0

