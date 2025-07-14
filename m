Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC1CC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 16:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318D110E4D4;
	Mon, 14 Jul 2025 16:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AI9iKwOv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09E810E4D0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752508825; x=1784044825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7NQ30PuAt6rrwWmKDCdnlcHdzdVIzkaOWPKSjGqCbs8=;
 b=AI9iKwOvNacla6hw22HfOzWByU6jXDUURi+glkUVNeH3w3YQ5jtwqjca
 iGRcCw6G+VGinYlRC+akcmclI1XVfKpKNqj4KfAYB3offdGJF2nUL4vUq
 lI71exoqPgkJOi94+rEtp7Wj/wZLlWPhoxWY+eAdjs7k5uQF8K4m0jJwx
 KoV15CXPZEjXUZ+toRmRljdLyVpabuAx7CPjpoaFMyOu7mAmtZkGY3dnv
 Y5EtnLZs8wmRFD5uIIZlfN/QlDmIr56opCZOfda8qZBXitbDcT9mg3h2o
 4zZ+FKfqz5zpWOpj/n0MvW+MpEUtz7s37deIEH4DFTHhBsLb5xijRvRKP w==;
X-CSE-ConnectionGUID: TeSwxohcRJ6k1VYGgOsh7g==
X-CSE-MsgGUID: cxCVWfGFRGOl4SSINR2LDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65406043"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="65406043"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:00:25 -0700
X-CSE-ConnectionGUID: 7Y3nAMLuR9Cj+sXQk0HcQQ==
X-CSE-MsgGUID: JoeDKNRVT/akzrZJ4KFz6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="187955231"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:00:23 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v5 3/5] intel-ci: Add symlinks for old i915 blocklists
Date: Mon, 14 Jul 2025 17:59:52 +0200
Message-ID: <20250714155954.110858-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714155954.110858-1-kamil.konieczny@linux.intel.com>
References: <20250714155954.110858-1-kamil.konieczny@linux.intel.com>
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

Add symlinks to make a transition easier for CI.

v5: add symlinks to meson (Michal)

Cc: Michal Czaplinski <michal.czaplinski@intel.com>
Suggested-by: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel-ci/blacklist-pre-merge.txt | 1 +
 tests/intel-ci/blacklist.txt           | 1 +
 tests/intel-ci/meson.build             | 2 ++
 3 files changed, 4 insertions(+)
 create mode 120000 tests/intel-ci/blacklist-pre-merge.txt
 create mode 120000 tests/intel-ci/blacklist.txt

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
new file mode 120000
index 000000000..124a31dbf
--- /dev/null
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -0,0 +1 @@
+i915.blocklist-pre-merge.txt
\ No newline at end of file
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
new file mode 120000
index 000000000..ffa658927
--- /dev/null
+++ b/tests/intel-ci/blacklist.txt
@@ -0,0 +1 @@
+i915.blocklist.txt
\ No newline at end of file
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index d18170402..1588d5197 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -2,6 +2,8 @@
 
 intelci_files = [
   'README',
+  'blacklist.txt',
+  'blacklist-pre-merge.txt',
   'i915.blocklist.txt',
   'i915.blocklist-pre-merge.txt',
   'chamelium-only.testlist',
-- 
2.50.1

