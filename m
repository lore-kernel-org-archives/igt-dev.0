Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1A3C83F1B
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 19:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6373510E94F;
	Thu, 10 Jul 2025 19:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ae8XPYoQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDEE10E955
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 19:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752174052; x=1783710052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JfKfBg3CM+Qd2OPLcVXtJwiVo9cOfcpsPuKQpwdMlHQ=;
 b=Ae8XPYoQtiZvpzHrb+s9+XxxUvry4FHg5++hB7yNRidwqMg+0wYc8aex
 FCKu9VC5ilXUM5vN/mA5ysEI46Z6FaRjuwLp7XShzT58WjUcBwMFdJ8m+
 Jg4rmUX59zeLOwt202UrBrbcmzQeFgQeJLTirfTyDCVjy8ZF+WLhyf1uV
 HXpcYHgWGqtEdFq5u9lTh/494vcNMq53Xk+CC9cNMiSpBd14UGMeoZZ+O
 DE/2QvLrar5oUk4/hEpLR8VFR6loJXI3Ves6D6D900ZLwt2KMh2vS1+sj
 kyhhJjOtG9S5jLXPpBXh5s80Me9sA6EODdO5+ANUq06cbEkxOMqaZwhhP A==;
X-CSE-ConnectionGUID: GzSx6jRlQL+BHNRKk8W5cw==
X-CSE-MsgGUID: 5OtEVwrCRO6qz3u2VlhwgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53685907"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="53685907"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:00:52 -0700
X-CSE-ConnectionGUID: wowv8BkVRBegQwHm//4FnQ==
X-CSE-MsgGUID: kDOTYKaNRLeXWC/C4P0psw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="179865041"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.100])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:00:51 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zlice555@gmail.com,
	Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 3/3] lib/svga/vm_basic_types: fix musl libs
 compilation
Date: Thu, 10 Jul 2025 21:00:16 +0200
Message-ID: <20250710190017.167735-7-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
References: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
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

Fix gcc compilation on Void Linux with musl C libs, where
PAGE_SIZE is already defined.

Reported-by: zlice <zlice555@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/179
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/svga/vm_basic_types.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/svga/vm_basic_types.h b/lib/svga/vm_basic_types.h
index 8fec5b665..ea10a683c 100644
--- a/lib/svga/vm_basic_types.h
+++ b/lib/svga/vm_basic_types.h
@@ -27,7 +27,15 @@
 #define VM_BASIC_TYPES_H
 
 #define PAGE_SHIFT 12
-#define PAGE_SIZE (1 << PAGE_SHIFT)
+
+#ifndef PAGE_SIZE
+# define PAGE_SIZE (1 << PAGE_SHIFT)
+#else
+# if PAGE_SIZE != 4096
+#  error "Unexpected PAGE_SIZE"
+# endif
+#endif
+
 #define PAGE_MASK (~(PAGE_SIZE - 1))
 #define PAGE_ALIGN(addr) (((addr) + PAGE_SIZE - 1) & PAGE_MASK)
 
-- 
2.50.1

