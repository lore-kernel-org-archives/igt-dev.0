Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F279ACA1013
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 10:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27C910EB7E;
	Fri,  5 Sep 2025 10:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g88ZVkX+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE3110EB7E
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 10:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757068651; x=1788604651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=83XeUdssGY/5XEh+ISpfBBazZRLfhaP5EaF7K/wAg5g=;
 b=g88ZVkX+DFvNMqLo26BbkBpyY9iAj5b2OjCwQhpMam5z5Q57gOJtAInw
 M3zaPLzTdLxnS34vpUl7J3n1BFF6xl8ov9GbQWFTmJ4B+aNdB2xeMOXFm
 ma/kTmC8u+dIDUKXbDCHu9W9RcwYtx/VWMfCJB10J/tS6+9qhBKDdvNDL
 OpOBw2H7tHfJpLEpzsKXu6lpVS9kfzSrlP9+ClMdzrSIH0ShIqL1KvN/7
 uROxP10I+K40L8OWj9vm9BCNn/+FVWGblB3CKL8/OAr8v8bDdg6fLKW6M
 tutPnaCd/M8SHF0VYwx/VHUug3ikZr1a14ybJiMoAkwfft8rboIAzBIye g==;
X-CSE-ConnectionGUID: hub136F6T82hy3nbMgcrvQ==
X-CSE-MsgGUID: wWvfaGUgQOmQ78E8Yxgzrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="84852490"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="84852490"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 03:37:30 -0700
X-CSE-ConnectionGUID: PlXrafwvTcm1XHyieJHGzw==
X-CSE-MsgGUID: 6zy3aXlISnigsk7K40M80g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; d="scan'208";a="171700055"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.226])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 03:37:28 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v6 2/4] docs: create symlinks for
 NEWS/MAINTAINERS/CONTRIB
Date: Fri,  5 Sep 2025 12:37:05 +0200
Message-ID: <20250905103708.128862-3-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905103708.128862-1-pawel.sikora@intel.com>
References: <20250905103708.128862-1-pawel.sikora@intel.com>
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

Some files needs to appear in the documentation and they are
needed in the 'docs' directory.

Creating symbolic links in the 'docs' directory for:

* docs/CONTRIBUTING -> CONTRIBUTING.md
* docs/NEWS.md -> NEWS
* docs/MAINTAINERS.md -> MAINTAINERS

This allows a legacy way of using those files from the root
directory of the project and for a new format and usage
by the mkdocs tool.

v4:
 - Add symlinks instead of moving files into docs dir (Kamil)

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 docs/CONTRIBUTING.md | 1 +
 docs/MAINTAINERS.md  | 1 +
 docs/NEWS.md         | 1 +
 3 files changed, 3 insertions(+)
 create mode 120000 docs/CONTRIBUTING.md
 create mode 120000 docs/MAINTAINERS.md
 create mode 120000 docs/NEWS.md

diff --git a/docs/CONTRIBUTING.md b/docs/CONTRIBUTING.md
new file mode 120000
index 000000000..44fcc6343
--- /dev/null
+++ b/docs/CONTRIBUTING.md
@@ -0,0 +1 @@
+../CONTRIBUTING.md
\ No newline at end of file
diff --git a/docs/MAINTAINERS.md b/docs/MAINTAINERS.md
new file mode 120000
index 000000000..67231b1e1
--- /dev/null
+++ b/docs/MAINTAINERS.md
@@ -0,0 +1 @@
+../MAINTAINERS
\ No newline at end of file
diff --git a/docs/NEWS.md b/docs/NEWS.md
new file mode 120000
index 000000000..0fae0f802
--- /dev/null
+++ b/docs/NEWS.md
@@ -0,0 +1 @@
+../NEWS
\ No newline at end of file
-- 
2.51.0

