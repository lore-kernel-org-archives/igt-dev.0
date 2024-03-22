Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F6EC47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F8410F7FF;
	Fri, 22 Mar 2024 12:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6jZvJwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4609D10F7FF
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111358; x=1742647358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VhLe83gRnA4m9xvfuIh3Rssd7wrm4t1WqmA+YpGtU3Y=;
 b=H6jZvJwOqmm4A6t94du2JwS6CpgiMR2KbM5hL26LdRIZzdhxXApkJp7/
 TAmk6lZ5qW0Zz+nTiq20ZRj6Ua9qheOsr3kj4CJQnlfrbUDvLIT3BFYxa
 q5heeLp8m4Zy6ewFAju3X2UiS+JRtp5R1DqkyiWcw/mHfVn5k/RM7ZGPl
 LsbnIWgOekxc3hSFIDYs07uhv6YL2WYouuYQahC81VxMbBbEhqn+8buoN
 6czs9a5BcsRQ4tpDQdqIC6h7P2qO1dlLM1ni75G3fanGpf0fluMu5P4Ty
 W5qA4cWqnmHksz1MmrSVUfFoKkEWMtIRhY7XPnno+BgdHY8oyL/4NFtwe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23645151"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="23645151"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="14994397"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:36 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 07/12] tests/intel: Move xe_mmap to Memory management
 Sub-category
Date: Fri, 22 Mar 2024 12:41:03 +0000
Message-Id: <20240322124108.1825345-9-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
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

It looks like Memory management is more suitable Sub-category for
xe_mmap test.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel/xe_mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index e96192d23..dcd36a50d 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Test if the driver is capable of doing mmap on different memory regions
  * Category: Software building block
- * Sub-category: VMA
+ * Sub-category: Memory management
  * Functionality: mmap
  */
 
-- 
2.34.1

