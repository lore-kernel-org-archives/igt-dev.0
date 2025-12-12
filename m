Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE18D4922B
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 14:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2C810E835;
	Fri, 12 Dec 2025 14:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdtebgRV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D4610E835
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 14:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765549095; x=1797085095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vOBqygbMVfPzv90mk3M9PY9Z5/beexlCkA0E2OaPoGE=;
 b=cdtebgRVvdXZNR53qES/09wZk47wz3JwlpP+YJ7NdLK72w7X/tFabrk1
 XJJwAvV7452BMa8UND5mi59Enk8Z8O1aLX2NO92TvvPZLMepSLEv1JOCJ
 mkjT0i/mHx4bihs1MW7jgsnR0fwgaf8JnwVh7GD6uVEKF7IH1BKmotkOP
 M74zgneK7/pM2YNqxO38kaUd+UI4c0CQ/ToG4DJITzp8UicBJPP9c22WM
 FzRm5b6PX+HJgO6atMkscwuDkTpCVdwQ0sAFwMq8Fc6pPDmrygF45jeQD
 k+bhPgFqUyyY2yA5Uv34Bgh126Dl36hPh5D/S5lEpjyBTxbz29vbjCrLv g==;
X-CSE-ConnectionGUID: 83ECqhyZSC2DqOxJW++6rw==
X-CSE-MsgGUID: FJaKaTLyQouHvvVHUsN5SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67624307"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67624307"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 06:18:15 -0800
X-CSE-ConnectionGUID: sxqEWPC0Q2eSVeiIWcjH2A==
X-CSE-MsgGUID: aidg7+g2S4+URrIJZ+ZIVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197002925"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.156])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 06:18:14 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t] intel-ci: remove few i915 symlinks
Date: Fri, 12 Dec 2025 15:18:08 +0100
Message-ID: <20251212141808.65453-1-kamil.konieczny@linux.intel.com>
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

Remove symlinks to i915 blocklists.

Cc: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/blacklist-pre-merge.txt | 1 -
 tests/intel-ci/blacklist.txt           | 1 -
 tests/intel-ci/meson.build             | 2 --
 3 files changed, 4 deletions(-)
 delete mode 120000 tests/intel-ci/blacklist-pre-merge.txt
 delete mode 120000 tests/intel-ci/blacklist.txt

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
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index baca20ba1..906bf5351 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -2,8 +2,6 @@
 
 intelci_files = [
   'README',
-  'blacklist.txt',
-  'blacklist-pre-merge.txt',
   'chamelium-only.testlist',
   'fast-feedback.testlist',
   'fast-feedback-chamelium-only.testlist',
-- 
2.52.0

