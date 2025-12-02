Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572EAD116F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 13:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E286210E635;
	Tue,  2 Dec 2025 13:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQlXApJA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD4110E635
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764680605; x=1796216605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LgNuNzpS6NI1Arh0kX0lqeTOKCiav3IHUIiwq5JoocI=;
 b=QQlXApJAFM43zVWaJ5eeg8AaPdWiy1a2p1fXUNlkV/4qTxY/asyraSES
 UPe64hCz6XrYzc8SmfhMuPpy52nOUvyNJ2bXWRlhEip5mXWzx7opgmniB
 EzDaME3f62HW0BV1Qb/aIE0ALFY/Rd8IOpR5ZGo8f56qooIVQ9ORQ48t9
 o7awUFusGUr44Aq5iHzO6ykOiOHLR+ex1WTRUB2A5ssjJFy4U/OgH6KK7
 uDQqUgSLUdh4BeObyuNcud1KTs412j/QTf8hfO0y3k9dOOLBxIiCf06gf
 NMWL/pj7GljS7s20q2TsTh8ajcP4SDrpBBfkgWOL82VFDGY0rFTVkZa/7 A==;
X-CSE-ConnectionGUID: oVh3GgjAS1qW5kMpJNLobg==
X-CSE-MsgGUID: JnSGakG/S1KxflpB18uCIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65832345"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="65832345"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:03:25 -0800
X-CSE-ConnectionGUID: QXHsz7TWS+C5LMl2mHNubg==
X-CSE-MsgGUID: k/raFXegTRmWIbtOR8K6kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="199309598"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:03:24 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t] intel-ci: remove symlinks
Date: Tue,  2 Dec 2025 14:03:16 +0100
Message-ID: <20251202130316.62780-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Remove symlinks to i915 testlists and blocklists.

Cc: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/blacklist-pre-merge.txt               | 1 -
 tests/intel-ci/blacklist.txt                         | 1 -
 tests/intel-ci/chamelium-only.testlist               | 1 -
 tests/intel-ci/fast-feedback-chamelium-only.testlist | 1 -
 tests/intel-ci/fast-feedback.testlist                | 1 -
 tests/intel-ci/meson.build                           | 5 -----
 6 files changed, 10 deletions(-)
 delete mode 120000 tests/intel-ci/blacklist-pre-merge.txt
 delete mode 120000 tests/intel-ci/blacklist.txt
 delete mode 120000 tests/intel-ci/chamelium-only.testlist
 delete mode 120000 tests/intel-ci/fast-feedback-chamelium-only.testlist
 delete mode 120000 tests/intel-ci/fast-feedback.testlist

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
deleted file mode 120000
index 124a31dbf..000000000
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ /dev/null
@@ -1 +0,0 @@
-i915.blocklist-pre-merge.txt
\ No newline at end of file
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
deleted file mode 120000
index ffa658927..000000000
--- a/tests/intel-ci/blacklist.txt
+++ /dev/null
@@ -1 +0,0 @@
-i915.blocklist.txt
\ No newline at end of file
diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
deleted file mode 120000
index 3715a9469..000000000
--- a/tests/intel-ci/chamelium-only.testlist
+++ /dev/null
@@ -1 +0,0 @@
-i915.chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/fast-feedback-chamelium-only.testlist b/tests/intel-ci/fast-feedback-chamelium-only.testlist
deleted file mode 120000
index 44d83f366..000000000
--- a/tests/intel-ci/fast-feedback-chamelium-only.testlist
+++ /dev/null
@@ -1 +0,0 @@
-i915.fast-feedback-chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
deleted file mode 120000
index 88e9d80e0..000000000
--- a/tests/intel-ci/fast-feedback.testlist
+++ /dev/null
@@ -1 +0,0 @@
-i915.fast-feedback.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 0c3b79d51..9b12a8b9b 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -2,11 +2,6 @@
 
 intelci_files = [
   'README',
-  'blacklist.txt',
-  'blacklist-pre-merge.txt',
-  'chamelium-only.testlist',
-  'fast-feedback.testlist',
-  'fast-feedback-chamelium-only.testlist',
   'i915.blocklist.txt',
   'i915.blocklist-pre-merge.txt',
   'i915.chamelium-only.testlist',
-- 
2.52.0

