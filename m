Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76732C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 15:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EF410E90F;
	Thu, 27 Mar 2025 15:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OouwGsiD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C2210E90F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743089517; x=1774625517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A5xDXdnfRVq89jKD+6520lnxv1d0LqxPdw5IXkjMcM8=;
 b=OouwGsiDHxacBs6xKSMMR8wuyZmeiWHt9hXKNEs9u00GDTJGOLo2Ns10
 pdfbe2jnMkzw4aQSZEQY+i8WBqNnGebc2KD/X9fjRTSyIRvrI2cYl6f0s
 FCUz/PoYO4XeUfseAWXFLbwNstBdi3XDZqWTPxafS74xMoBVqsZvmShWz
 uYa8OrHGnH/aoxRNs7Nzb6dYvDbJM86iRV9eRt+2nV4uiBner7N1d8ap2
 K42LsMC29fPo+UWi0jjrJR2TALRAB2iCiRe2daOUWOlVd+NZgtziFN0Bl
 T226U9LVB8gUkphZ4AWkOKEZvJJZ+6ZLBU7d6gfDJ/9DlN6UNI15YO8rn A==;
X-CSE-ConnectionGUID: Mv/K0ZYUQ9em2OJpcrKnvA==
X-CSE-MsgGUID: 0rE8MtKGSiutYFsh0IKksg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55079410"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55079410"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:31:53 -0700
X-CSE-ConnectionGUID: HgjqxQ65TXqtRY4KmMDPYw==
X-CSE-MsgGUID: YFdwOoJcRL+1MleX0v4QjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="130241185"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 08:31:52 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/2] CONTRIBUTING: Add subscription and patchwork info
Date: Thu, 27 Mar 2025 16:31:29 +0100
Message-ID: <20250327153139.37746-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
References: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
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

Add guide and link to subscription into mailing list and link
for patchwork.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 CONTRIBUTING.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 81057a2ad..b571b5e68 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -63,6 +63,13 @@ Sending Patches
 
   on its first invocation.
 
+- If you plan contribute regularly please subscribe to igt-dev mailinglist:
+  https://lists.freedesktop.org/mailman/listinfo/igt-dev
+  When you are not subscribed, please note that your contribution will take
+  more time to reach to mailing list. You could find out if it was delivered or
+  what is a testing status of your patches at patchwork page:
+  https://patchwork.freedesktop.org/project/igt/series/
+
 - Place relevant prefix in subject, for example when your change is in one
   testfile, use its name without '.c' nor '.h' suffix, like:
   tests/simple_test: short description
-- 
2.49.0

