Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53354C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E335510F884;
	Fri, 22 Mar 2024 12:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6pxeRPh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB7E10F884
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111384; x=1742647384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sg0dD7RjlLC2jiMmDlQDAVPiyHtWPvILuCjMfffMOZs=;
 b=I6pxeRPh5y4lwFu+7owzq4Ro3x7NdDbI33JAvV+TeyKFkaE7Rp8C/gzO
 avKDRd6fkmacccoYPjpf9fb6qVnvhha/RGzx8jmnzLXtPWdGgkyYg90JQ
 z368Se2lh/cxoCd/TVIaUdCC6CyrVX1Y2xPuHS3YxSDFNRT8jSh+UhqpU
 txb5/q4LxVwweo0l3ZbFkONCpwNtsQcluX/LizMAzp/KKZ/c2ImMth4Mr
 gnM53DEP9SBTtEpeD+LYIp2zOCOr9+Sgyq94ur7X/yM3PMzHEvu8jnW/P
 XNWn8maNuYgGH9bTI5n6sEVqClhVhajDX3v/Md/tk5oGjN+kKx5ztRYrX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23645174"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="23645174"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="14994458"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:43:02 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 10/12] tests/intel: Move xe_waitfence test to
 Synchronization sub-category
Date: Fri, 22 Mar 2024 12:41:06 +0000
Message-Id: <20240322124108.1825345-12-katarzyna.piecielska@intel.com>
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

Let's move xe_waitfence test to Synchronization sub-category to align
with i915 test documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel/xe_waitfence.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 5a67148ed..071e67bd6 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -16,7 +16,7 @@
 /**
  * TEST: Check if waitfences work
  * Category: Software building block
- * Sub-category: waitfence
+ * Sub-category: Synchronization
  * Functionality: waitfence
  * Test category: functionality test
  * Description: Test waitfences functionality
@@ -140,7 +140,6 @@ waitfence(int fd, enum waittype wt)
 /**
  * TEST: Negative test for wait ufence ioctl
  * Category: Software building block
- * Sub-category: waitfence
  * Functionality: waitfence
  * Test category: negative test
  *
-- 
2.34.1

