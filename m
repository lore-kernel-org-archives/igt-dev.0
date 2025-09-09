Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9D5CAC589
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 08:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A28810E663;
	Tue,  9 Sep 2025 08:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJFz9fQu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6108510E663
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757407373; x=1788943373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uiIdWIzbHFjqVZQdxbX3PDgVOof48z3Bc+RfGvQsjTY=;
 b=IJFz9fQuIlKhw5qJJmNSJa3Pud7iFOE/g2d2905cVB91RI8uHqr0p74p
 rgSLxX6kYHAv5TblqsKT7WLw94mEzSaYOdRGuGdHpWNOlzHsIkMC95dQY
 RuNnYfpOymKGOeEqN/sQZFXlaoHOT+dB617wyfoLGosqhClaIAPM+nyLz
 elGrZE1OggmKTlOeTplsI8qb+5ChO8Qa9+QXtlfwGy77wHrWwIA6qcUJb
 VFA8Z8fthyqxi/wqwz18wDFUeAMELVN+bLAUmKhcliiU4fXQ5ga2E6j4+
 LT1Bb+dexUhAam8KHh359n0rPAvXFD6y0E9TEvTiq7WPmEQSRvY4UPQBv A==;
X-CSE-ConnectionGUID: tAYvqk76SKu/aMcMm53N/g==
X-CSE-MsgGUID: 67l5gTq/Qa+zDFEtgngJzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59377656"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59377656"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:42:53 -0700
X-CSE-ConnectionGUID: Ip7FJ/lHST+8PIa+wYaDzQ==
X-CSE-MsgGUID: Tx2Sgg/XQKuO+ocZ4wSPng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="172900252"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:42:51 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v9 2/5] docs: create symlinks for
 NEWS/MAINTAINERS/CONTRIB
Date: Tue,  9 Sep 2025 10:42:28 +0200
Message-ID: <20250909084233.183885-3-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909084233.183885-1-pawel.sikora@intel.com>
References: <20250909084233.183885-1-pawel.sikora@intel.com>
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

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

