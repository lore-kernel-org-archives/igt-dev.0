Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8498C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 22:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C8410E25D;
	Wed, 19 Mar 2025 22:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPZU5oY1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F53510E266
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742423159; x=1773959159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uG0RzewHzw7JQSYqrYWfDCJdQnPw71V2vQAb+9Llgyk=;
 b=kPZU5oY1vzSmmSpSIrbLPMczU1X5UuWPmyGI7vD7cCwCiQsL2Mi2YjTZ
 tkocpCmM1W8HdgNcwkfzI2S299Zj1+w0E06mutom+0O60NyIYu9kvtdVX
 uTgFKm2/zs0Uzu6esS1AAmK7p2XPUav3bkCxbAS8KQhoBrJfEN4fOgF2+
 BrBIHdSxvyNd8rDKtRpf/5AEmbRNW8Z/6COrAmlJXKI/7CchtQzcJ0z3X
 jVjB0gaStnUbNFAUz5AGwvHrsNTSN2aIt8a+Ed4neZaLqtEWTu7XGLBKr
 Dbu6gWyd0UudiaSe3jDl0ECPu83EfCjLBi6mAmCM3Sn1wnaARjDiKBBfq w==;
X-CSE-ConnectionGUID: ODNF8rilSkqAjqwAi5TMBA==
X-CSE-MsgGUID: ySrZl/UjQS2UeKxD3W1Omw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43510775"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43510775"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:25:58 -0700
X-CSE-ConnectionGUID: cK7ZByNtRUylW4/0kVyjMA==
X-CSE-MsgGUID: jNRcpeDbR7mnFpJBcl9Kmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122540396"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:25:58 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, matthew.brost@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Subject: [i-g-t v7 1/4] lib/xe: Fix a comment error
Date: Wed, 19 Mar 2025 18:42:28 -0400
Message-Id: <20250319224231.1909393-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250319224231.1909393-1-oak.zeng@intel.com>
References: <20250319224231.1909393-1-oak.zeng@intel.com>
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

The timeout value of __xe_wait_ufence and xe_wait_ufence
returns the remaining time, not elapsed time. Fix it.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 6d8388918..a0d8c8f3d 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -496,7 +496,7 @@ void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
  *
  * Function compares @value with memory pointed by @addr until they are equal.
  *
- * Returns (in @timeout), the elapsed time in nanoseconds if user fence was
+ * Returns (in @timeout), the remaining time in nanoseconds if user fence was
  * signalled. Returns 0 on success, -errno of ioctl on error.
  */
 int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
@@ -532,7 +532,7 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
  * Function compares @value with memory pointed by @addr until they are equal.
  * Asserts that ioctl returned without error.
  *
- * Returns elapsed time in nanoseconds if user fence was signalled.
+ * Returns remaining time in nanoseconds if user fence was signalled.
  */
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		       uint32_t exec_queue, int64_t timeout)
-- 
2.26.3

