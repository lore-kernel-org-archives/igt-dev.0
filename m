Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC92DC43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 11:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C04B10E839;
	Mon, 29 Jun 2026 11:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fk5x1UaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23D310E839
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 11:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782734061; x=1814270061;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pW4UYdmzCOvXPjzEVcJPwyvYBuI8PlfsgST3qUup3uU=;
 b=fk5x1UaMhCdNNytJ6SnBy5F8gQ1kO52n1+uckYMmomAkBlh2vvDmXUEo
 kr5POPFfgD6N+dLjtw8BwrLof5pjCmMmhy/7+9PDu1QDbTH3RHS8IgvzT
 p0Q3mxd2xwon02+sAcEUZ7exW06i0bzHnOGqirBtD0dS0036wqN1KMZuo
 7kDyBrdm1tgthumNHiQO9s4VswGuaQx9d1WjjOez78xuXa6vZxRwk2ZAN
 cZmkY1cPc6xz+YCrMERC9+3PXn81njmdxPY7tGjqr+mKPF6NOoVyAJlBP
 gX5nmNPoXUGoZVT7axG9UjZX5IEGEYOdNUs+sYrBoL2yGNYEcOuSaq7ez A==;
X-CSE-ConnectionGUID: B7yq3tw5RhymG+fRKHPzUQ==
X-CSE-MsgGUID: rfl91mWjRgKKYgVlgGC3uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83509377"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="83509377"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 04:54:21 -0700
X-CSE-ConnectionGUID: oIsBkrOCTuOLROQz7NpEVQ==
X-CSE-MsgGUID: OgDFvoETQru73zNVTL1kfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="256859236"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 04:54:18 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t] lib/igt_hook: Fix realloc size to avoid memory
 overwriting
Date: Mon, 29 Jun 2026 13:54:09 +0200
Message-ID: <20260629115408.158220-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.54.0
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

Doubling test name size might be not enough for realloc if target name
length is larger than test/subtest name size.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/igt_hook.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_hook.c b/lib/igt_hook.c
index b8f25b6c7a..a44b852da1 100644
--- a/lib/igt_hook.c
+++ b/lib/igt_hook.c
@@ -300,7 +300,7 @@ static void igt_hook_update_test_name_pre_call(struct igt_hook *igt_hook, struct
 	if (len + 1 > *size_ptr) {
 		size_t fullname_size;
 
-		*size_ptr *= 2;
+		*size_ptr += len + 1;
 		*name_ptr = realloc(*name_ptr, *size_ptr);
 
 		fullname_size = igt_hook_calc_test_fullname_size(igt_hook);
-- 
2.54.0

