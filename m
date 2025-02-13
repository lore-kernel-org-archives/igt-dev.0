Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94208C021A0
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 02:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C9110E24D;
	Thu, 13 Feb 2025 02:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrj0aRYf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA2B10E1C0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 02:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412222; x=1770948222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ernZvxtV77Xy8k3Ga9d1ecaj7dFDGTPdShTzWlbpZdY=;
 b=nrj0aRYfyksnsi/6zT+EtQ1fVpQ/CB2NK8ZL8ykCGB9Sy/I6mhHd05Aw
 pqrevtznQpP6qO+CPb2RnidpyHRN2R5GZHrb5XSiabBSCSyPhxkGNQwZp
 zcLxLY5awygdgqYo2ZGVjSVg7kj64c+8Fh87SKskivYfjglX43RdQJfNB
 v3Vq5rkFNwQmSDHr0l5/0G8RXLo4gWXLpL+gIuJopfroIPsUSPgBfJ/sg
 CVWPVFWWXpdAUpMtixpDgw/N+XZADoN7OXO15+BHRniTMhNEmJN9L+um4
 JKWrFAsIaaVKwxcsPKKyL5QOdXGk58meeO60figKu3EzknqVyIoWxZEaG w==;
X-CSE-ConnectionGUID: utWJ6fqkQ7eKgGo3lY2bxQ==
X-CSE-MsgGUID: eObsz8+rR1KyD3w/jQF06Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39329682"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="39329682"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:03:41 -0800
X-CSE-ConnectionGUID: OR2nRxNeSjOVc74bjDQ6sA==
X-CSE-MsgGUID: fYcr+0VFSwyAt00maRp5FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="112856251"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:03:41 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	matthew.brost@intel.com
Subject: [i-g-t 1/4] lib/xe: Fix a comment error
Date: Wed, 12 Feb 2025 21:19:12 -0500
Message-Id: <20250213021915.264978-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

The timeout value of __xe_wait_ufence returns the
remaining time, not elapsed time. Fix it.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 lib/xe/xe_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 6d8388918..028102aa2 100644
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
-- 
2.26.3

