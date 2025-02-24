Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C78C021BB
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 17:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3215410E351;
	Mon, 24 Feb 2025 17:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEwejQtX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAE610E487
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 17:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740417856; x=1771953856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ernZvxtV77Xy8k3Ga9d1ecaj7dFDGTPdShTzWlbpZdY=;
 b=eEwejQtX5DOxvXY3n+4S9Wa3a92BqFgyUYY/biEQTvWo8neU1EFELF25
 vfSaTCVzlLAyl8UdrcHfiKnvaXbXoT3yI7XKHRATHK0kUuFFg1a3KS7LY
 DMF9KacSbcbBuC4IpWRrFiCgqfFb3vVmAbfAKllZxaHJmD3E6wTqBKRWf
 0hwr/C9vILrjxuN5/bZbhoXNL0cGhlXWVRsbZjulyBoYTtpkq9Do9QfSh
 rHEdFMUep2LCojWXobz1+PqV3B/I8k1P1emiZAFCJPFeVysZhqj9lzFVv
 sXYtJr+Hz8/3EFaAivhoCoN03HLCI5L2t+HSNwR1PZ2k8N7b+OtrC7wsD Q==;
X-CSE-ConnectionGUID: VVpFKYMRRKqZxw/oCcLVWg==
X-CSE-MsgGUID: ug2w7ATlR1SouswSvFjwmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41307440"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="41307440"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:24:15 -0800
X-CSE-ConnectionGUID: FKBYBCiWRkCnXmcsx9z3qA==
X-CSE-MsgGUID: pF45qowSS323sXNTB0tJ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117026022"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:24:14 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: [i-g-t v6 1/4] lib/xe: Fix a comment error
Date: Mon, 24 Feb 2025 12:40:07 -0500
Message-Id: <20250224174010.594192-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250224174010.594192-1-oak.zeng@intel.com>
References: <20250224174010.594192-1-oak.zeng@intel.com>
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

