Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3489DC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 16:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC77110E4DE;
	Mon, 14 Jul 2025 16:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h42W3sJz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D10710E4DE
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752510296; x=1784046296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7NQ30PuAt6rrwWmKDCdnlcHdzdVIzkaOWPKSjGqCbs8=;
 b=h42W3sJzNfP9izz9lHnVov/M7LI98wYv7cAaP3RM6NlZyGL5wzWKWn1U
 okNmkjQecHt+HxC+H5YCAm/MclyAmddw8M31DRP4slxArkQxp0lecl+Cf
 G9DjG6HbypfiFIyAKwV05Mu7dzxU9+z4e1CYD/suZgkqhQGIme/54FJi2
 cVVngIJWIRde9KJ8QfSc+xeGpifpp/jPQ92qdAY5c+RXCA8mLBRNgpJZ7
 O8tgon1XY7eb0i1+CTmEp5R/gklGcMnaRR7HNTgL4PJq0eEmyeQqe56CE
 6JYDdgaSDip1AWuJ+dGwbEJXYyRgeAnbwbB2yZeYZ8MlYqZTi3JEhVMRm g==;
X-CSE-ConnectionGUID: te+DwHh6QvaxioEu21oz6w==
X-CSE-MsgGUID: u6k2yykiS/+JKfz9ADcy4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54564329"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54564329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:24:54 -0700
X-CSE-ConnectionGUID: FzKrt7fIRM+CCZue1xCG3Q==
X-CSE-MsgGUID: C01leYZFS5eKvYXtkY7OBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161522509"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.1])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 09:24:52 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v6 3/5] intel-ci: Add symlinks for old i915 blocklists
Date: Mon, 14 Jul 2025 18:24:33 +0200
Message-ID: <20250714162435.112599-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714162435.112599-1-kamil.konieczny@linux.intel.com>
References: <20250714162435.112599-1-kamil.konieczny@linux.intel.com>
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

