Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BA9CCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 08:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7C110E0DB;
	Fri, 24 Oct 2025 08:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Siw8W9GM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D6410E240
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761294410; x=1792830410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t5H1wek+u28+uDuj5my8HQVzAq2EQYzA9LKqjeTwrYw=;
 b=Siw8W9GMmod6rUnSzqFqYL1W1XY8AxJR7YZ4BFEXVuOsQyeqhY9DmPIG
 iramKzA+If30tYgY/fMe8FotF2fiBnZ2/EzgJSZawt3sZvcABs13YxXXD
 qJw2N+U7l+BFlaVqZhVeFw0D44GcCaQV6YtnzVQokKFWkHj6kKacBBYiR
 HoUhpLlVPFe0sWWvDWfIL94TlpfJwiYkRvrEEGLSN85veqxcg10sxzgwf
 UPLQN7nB8IsSBNWff6pA8F0gsz0KLBDlhtnpi6aacxhCpQTxOCtidPo7N
 kvpYptxehkEoNDlGUhgbYE4GHN0KDvbR0vyV+uwX0FXI1gAt1RHccXMT8 g==;
X-CSE-ConnectionGUID: gJSWea98RXGdODjhz9NO2g==
X-CSE-MsgGUID: t598lWrLQ7+Ugbk6Ps9oPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67340488"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="67340488"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:26:50 -0700
X-CSE-ConnectionGUID: 9IEZXpidSeCuBJc7YZik/g==
X-CSE-MsgGUID: GiziieyxTDOcQ1o/4yMTcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="188669450"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.85])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:26:49 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v12 2/6] docs: Create symlinks for
 NEWS/MAINTAINERS/CONTRIB
Date: Fri, 24 Oct 2025 10:26:21 +0200
Message-ID: <20251024082628.1118783-3-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024082628.1118783-1-pawel.sikora@intel.com>
References: <20251024082628.1118783-1-pawel.sikora@intel.com>
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

