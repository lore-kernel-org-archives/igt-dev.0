Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4539C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 15:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663A410ECBF;
	Fri,  7 Jun 2024 15:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4ljvXxm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D2110ECB7
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 15:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717774617; x=1749310617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bAZWuwOOzDtNRzxiOV/JbaZjYqPrVG0iG66vk7DXX7M=;
 b=Q4ljvXxmuREoIkt3qFUNWxdaEiqrPYxDlbkZISCy0/NFSP+LWJp1sqku
 BWkV2UtkxG/TI7sJ3/4xqceRp2VLvnGoj0T+VvNajIokdNUDlmHmMzDhw
 KDwTKKl7uYnultAZgIAUEvTfpgjRBHpzHC0A3NSyg3QUJBo6ar4cHdVk4
 y134AYacFqtdzLnCHdb+d5B4D5d2o2nOkRluI5XoPwkccapXV628+rDcu
 99MxoHzTWnB0f6TFgfsPYrA6X4vMbgCCyBuS8pNKIgDfVD6J1WRV4EDAt
 MHBvsvLYp7Zsv2DJ7pCYhxhrTlWE+LDGGLj+oVlGAgrgFDh58RuMhRBcx g==;
X-CSE-ConnectionGUID: fir3ZDOgSJGkTjHDqrs/nA==
X-CSE-MsgGUID: 2MyCu4CMSjCcq9WLIhaVbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14620079"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14620079"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:57 -0700
X-CSE-ConnectionGUID: 6Vj39aICTduzRrIVpx1O0g==
X-CSE-MsgGUID: EDg5fgWETCiqReO5b8aEjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38805268"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:57 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 6/7] tests/core_hotunplug: Fix device close
Date: Fri,  7 Jun 2024 17:36:18 +0200
Message-ID: <20240607153629.52596-7-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
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

Use __drm_device_close for closing a drm device, as for Xe driver
it needs to call additional function.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_hotunplug.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index ddf11bb00..3b0135fc8 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -146,7 +146,11 @@ static int close_device(int fd_drm, const char *when, const char *which)
 		return fd_drm;
 
 	local_debug("%sclosing %sdevice instance\n", when, which);
-	return local_close(fd_drm, "Device close failed");
+	errno = 0;
+	if (igt_warn_on_f(__drm_close_driver(fd_drm), "Device close failed\n"))
+		return -errno;	/* (never -1) */
+
+	return -1;	/* success */
 }
 
 static int close_sysfs(int fd_sysfs_dev)
-- 
2.43.0

