Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9184ACAC583
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 11:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB9410E6A7;
	Tue,  9 Sep 2025 11:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FR1uJmEq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5263610E6A7
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 11:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757417279; x=1788953279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uiIdWIzbHFjqVZQdxbX3PDgVOof48z3Bc+RfGvQsjTY=;
 b=FR1uJmEq8uk9+nks1NHVE61eiwCgV5T8k3WZkJSLkd68l1i9oLTY6IzT
 hgZfNOZXI9BkwKzJmjZkeIVUCoRGqxELSr5sreK7kGC3tdBYLBdb9rX1c
 EiTiqkYqx+7IBpR7T/9Dljjxf2bSQqO34k0tQAQYJQ0+KOrD/lp2HIBUU
 Z33H7143PTiVMuPMZ2AUcoD21Lj+QKjCd4qs45YFNPulXKHQ++DOXXvpd
 OpKZfk1fFWpOSbuGSHTNdhI9ceU6M5lTx959B1lB3ijHuIxnAMbMNcvHk
 zTr1blAgz5vSKcwjeAMRlspCuLGYGf8PBxSS/37g/VhOJsHbp0/YaGJQp A==;
X-CSE-ConnectionGUID: jQhdCzVDRCOkeN80l5rX5A==
X-CSE-MsgGUID: DtJ8k1lDTmyphvRgghWLSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59844182"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59844182"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:27:59 -0700
X-CSE-ConnectionGUID: X8aC13R6RJyFMUFvaW/BBg==
X-CSE-MsgGUID: KTi1RmuURjaiB28wn4a8ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="196731259"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 04:27:57 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v10 2/5] docs: create symlinks for
 NEWS/MAINTAINERS/CONTRIB
Date: Tue,  9 Sep 2025 13:27:37 +0200
Message-ID: <20250909112741.185825-3-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909112741.185825-1-pawel.sikora@intel.com>
References: <20250909112741.185825-1-pawel.sikora@intel.com>
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

