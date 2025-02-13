Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF53AC021A0
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 22:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE8F10E076;
	Thu, 13 Feb 2025 22:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuIP0+Nj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4742C10E076
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 22:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739484691; x=1771020691;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ernZvxtV77Xy8k3Ga9d1ecaj7dFDGTPdShTzWlbpZdY=;
 b=AuIP0+Njo7ssHhRLg+98JDK/UPB44dbs2RCg5/cspQkKb34U22s4N/PA
 gmfkOIxCTdsa589nq8XwJgs/YKqPRFj7uDX/aLQY75suvtAZLJxHIu9A0
 uJ4hg0VIV61gKg/OQU1bdva9lImkTOccZS5JQiNrP8HM2WEqRm54MZZYQ
 FLMFFB3OSepv8M3gHtXrr3K9uyFGyeS45/d7FKjqY0KnipO+QuqSBesOl
 ABW4UOrmLJeTPQ1YL93z4TGx37WUzxd6tZA/L5pb2qS/w4GPWh/G1jU15
 CAPeeYD1us2zU9aFMg/2KKO6K4jGgY4aqy4AmNy/Ws6Wjp4hFWIWzILvA A==;
X-CSE-ConnectionGUID: Vv4vaNH7T8GbMeZeP+aQ/Q==
X-CSE-MsgGUID: Gf4dzvEXSISdC9GcU+YHRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39920733"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="39920733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:11:30 -0800
X-CSE-ConnectionGUID: 3gArSr/wQ/6XmfkxmUJCqA==
X-CSE-MsgGUID: zLeaVoHOQsWi+Ud2JERKew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136509083"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:11:29 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	matthew.brost@intel.com
Subject: [i-g-t 1/4] lib/xe: Fix a comment error
Date: Thu, 13 Feb 2025 17:27:02 -0500
Message-Id: <20250213222705.275364-1-oak.zeng@intel.com>
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

