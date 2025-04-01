Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFA1C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 15:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61F910E5E6;
	Tue,  1 Apr 2025 15:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/eR+lx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844A710E5E6
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743521437; x=1775057437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jA0JmzRi0k27IwgqRZQkLuym80Q2iSHf6pVgJ2O3uxQ=;
 b=L/eR+lx+O1Y+TTVNme74NR175SwcOUZiBMdxglxEfrj1kIMsoQDujWzr
 vVhX2OQyLc3WbF+GN6/zZBzYcJhdRZ9eQeSTY4Y8B1oKBSxuFHyOdVV22
 xtlIKwh96tNir6gxDj1Sf9eXJjnedIl5xg5Bs4GmkpF/anZ2ZIIbehvui
 sgObIlpIXPh08sAFfvBsPN1JdVRgroCi6ZgmIqbzivnsLsrKjUTP1FQeX
 2TmTuPmaBQrlOIjIFI9nUiV6XDjUSbYtJAm3EY6L1aQgE4GUdhcWHTwpi
 +4G5geyd5ZrARavmYcnEsWuaECZf+WiuAw5oI9UfLFhQb9047O1J+o5l9 g==;
X-CSE-ConnectionGUID: vx+Yqt5FRv+b/BrsTxtzQw==
X-CSE-MsgGUID: bWRF1y9hSzOVieuR1GGUkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44735471"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44735471"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:30:36 -0700
X-CSE-ConnectionGUID: f9Pk3pbOTee4jBdKNvbi2A==
X-CSE-MsgGUID: ZrgH3mtuS9mKMgIH92umww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126941834"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.116])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 08:30:35 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v3 1/2] CONTRIBUTING: Add subscription and patchwork info
Date: Tue,  1 Apr 2025 17:30:24 +0200
Message-ID: <20250401153025.48366-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401153025.48366-1-kamil.konieczny@linux.intel.com>
References: <20250401153025.48366-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add guide and link to subscription into mailing list and link
for patchwork.

v3: Added https://lore.kernel.org/igt-dev/ (Ashutosh)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 CONTRIBUTING.md | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 81057a2ad..2927e0ca1 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -63,6 +63,15 @@ Sending Patches
 
   on its first invocation.
 
+- If you plan to contribute regularly, please subscribe to igt-dev mailinglist:
+  https://lists.freedesktop.org/mailman/listinfo/igt-dev
+  When you are not subscribed, please note that your contribution will take
+  more time to reach to mailing list. You could find out if it was delivered or
+  what is a testing status of your patches at page:
+  https://patchwork.freedesktop.org/project/igt/series/
+  and also on
+  https://lore.kernel.org/igt-dev/
+
 - Place relevant prefix in subject, for example when your change is in one
   testfile, use its name without '.c' nor '.h' suffix, like:
   tests/simple_test: short description
-- 
2.49.0

