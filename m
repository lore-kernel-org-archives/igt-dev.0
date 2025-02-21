Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69732C021B4
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 00:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2114510E9FC;
	Fri, 21 Feb 2025 00:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6HOS9tf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E035810E9FC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 00:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740097576; x=1771633576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ernZvxtV77Xy8k3Ga9d1ecaj7dFDGTPdShTzWlbpZdY=;
 b=G6HOS9tfCcOW6cD/4bwnbqxQtjAnsHm6+aqOISPQkWC8xiTuDHY7E+sJ
 gYDBKuazx0qYesUMku3G/rqPWny4xcgYqOmpUqjyCsVAEpLZE5AV2vXk8
 BRGuSzxQDMr/TDw1vLCjIsd5TCarkEMa1PgP4qFRXu5ONjVVjuWLFVOB/
 uWgLPHk7gtzJwARIV33eUlVTR4D5Hvd9/euiU1C6VDq2E6dtdU8yOfNWI
 tg2NMvLbPwfXuW6lwLIh5TO7JfnuP5BbcShgxO9xBYgHsCRT30rsuZh2h
 AdBZ8mnhmVUqwA33cEyMXx96MEoiJ5/GUPfqUmyBO3//lBS7a78XEPBBO w==;
X-CSE-ConnectionGUID: pI/jx6fcTWGLrvXvrFBs6Q==
X-CSE-MsgGUID: CY3b3ZWQQxW7yQo3bHp6Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44548839"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="44548839"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:26:15 -0800
X-CSE-ConnectionGUID: jYI9fkQxSDWBqAoqF+mOcQ==
X-CSE-MsgGUID: nRWxF4D3TEmSyCOFoOG6uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115408280"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:26:14 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: [i-g-t v4 1/4] lib/xe: Fix a comment error
Date: Thu, 20 Feb 2025 19:41:59 -0500
Message-Id: <20250221004202.369505-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250221004202.369505-1-oak.zeng@intel.com>
References: <20250221004202.369505-1-oak.zeng@intel.com>
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

