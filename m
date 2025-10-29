Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECA8CCF9E9
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 14:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129CA10E7B7;
	Wed, 29 Oct 2025 14:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCeGVxpj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E51610E7B7
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761747603; x=1793283603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t5H1wek+u28+uDuj5my8HQVzAq2EQYzA9LKqjeTwrYw=;
 b=HCeGVxpjnsh1uGVWmIJgghFdbzBGl6/RwbxXx8mAGtupCVlFb1l1H/ku
 zSbVjUyHP2EHaSXSsYf3D4fRqIbnr5ekLaTJfNoNCHqRuSWiStjjzqjcD
 n+dVgCUcHhyib/3qqxFph0lqltzXb2MY8SyV5fmUJgjiYMzdY/mSVV/fC
 qW+ezMHQ/mFztXLdnTeYScg9EN/q3O/6409R1J6Rr3WENM8UCdzqxT1+M
 zpw42odmr30WCyQp8lR48IUqcv9PE9ms/PEdehw5XIMU7jCuS/PLJn+4g
 RyLXAvMKPBKQK3Cl+8+AklSHmoKLhaQaLCbMmCBIgEc8gEzr9XcuLFEOk A==;
X-CSE-ConnectionGUID: 2JA/gD+yRHCvWJA7p1HCfg==
X-CSE-MsgGUID: 1RByhguiSSWFcviIaYJ7nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74988112"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="74988112"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:20:02 -0700
X-CSE-ConnectionGUID: mWcpmk0qREqp6nHNuKFoSA==
X-CSE-MsgGUID: p9VHYljHSIW0d7DxNiPIKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="222896250"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:20:01 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v13 2/6] docs: Create symlinks for
 NEWS/MAINTAINERS/CONTRIB
Date: Wed, 29 Oct 2025 15:19:41 +0100
Message-ID: <20251029141946.1165010-3-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029141946.1165010-1-pawel.sikora@intel.com>
References: <20251029141946.1165010-1-pawel.sikora@intel.com>
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

