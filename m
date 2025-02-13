Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4705FC0219D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 15:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08A810E3C0;
	Thu, 13 Feb 2025 15:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5LXc5HZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB3010E3C0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 15:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739460311; x=1770996311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ernZvxtV77Xy8k3Ga9d1ecaj7dFDGTPdShTzWlbpZdY=;
 b=g5LXc5HZCYNV/dUJYOQ4KlRZPbUja//DMkNNxcubNFJR0PD5D2xCe32o
 cxoaDA2Uv/0d4Y0opAb4pXZUui13Rb98Y6eNQwCHPsPYY1EsNL3cAYVSI
 zqhUU2VjMvKfoEHl5oqmgKj6+NzbaOi9SKG/565hKAC76H3pkFGnnXjuC
 6Yw7T1USg/7Ikk2RswkTy9qux4rBdjqI0ctIfYMAphNiKowEkBFeXQpUR
 8/OrWYpNP83/jf5bQs3iK8mMEqNtCqnaXKwcjesgHrMS8Mu1VhWMz9kMD
 xHtDDG3SP3H9QarwkgL0ceUEH5jMpfc9flypDQhzVsQnM/fgHGD4KmcP2 w==;
X-CSE-ConnectionGUID: xsRDKEl7Qp2XzSBfC7BEjQ==
X-CSE-MsgGUID: jzBJnqjyQo2obLO2cf1RaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57572633"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="57572633"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 07:25:10 -0800
X-CSE-ConnectionGUID: m4wYpaM8STCNxU/im9Q9uA==
X-CSE-MsgGUID: Qia4GE/fRXyoxrxq9iUnoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144120249"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 07:25:09 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	matthew.brost@intel.com
Subject: [i-g-t 1/4] lib/xe: Fix a comment error
Date: Thu, 13 Feb 2025 10:40:45 -0500
Message-Id: <20250213154048.273437-1-oak.zeng@intel.com>
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

