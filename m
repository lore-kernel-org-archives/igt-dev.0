Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F90C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 14:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C9110E222;
	Mon,  5 Aug 2024 14:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq+n8pe9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236EB10E22A
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 14:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722868662; x=1754404662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X7aqDd/F3Yy/2XIbIhdRVpMdaTLAkibuL7+0p56KYqw=;
 b=Oq+n8pe9T+0dPqtLHLCPo6oo+SuKyUR4RmpS/AEGeEnt7yBiaP8R0vTA
 HeKXlWQiUqLidXICypgdNHfwsOufOP5MhAy01VhAHulJO9tEwP+fVpJQj
 ZbF58JuudSBlBnAOVvrAHctOR0pPACh3RQyaBnIkogKTdmF4xElQHqJi2
 IWXHUdJT2R6TLOPvD6ZgpSkSb0oNrwJLmLGq0fmIXHdXnfwxeu7gRHJ2H
 QTPMMWQ7vVT1jLqf6oBDavQQBsq7q45dE5XpNRjrcS2QSklUko5+yE41U
 xeEj/2XoX2xvulRWsqMGoP5LPyp/mfvt1MgBU1seWQTVokPqJCrunINzx Q==;
X-CSE-ConnectionGUID: zXqas0KUSDio+8o45xAXHQ==
X-CSE-MsgGUID: 56GhBrpITw6WuQKmTp8Gqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24702283"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="24702283"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:42 -0700
X-CSE-ConnectionGUID: d4wNeAQDRrK3ryNkA3BQlA==
X-CSE-MsgGUID: swJYgUWXR12ChcyvArYbuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56755045"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:41 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2 5/8] tests/core_hotunplug: Fix device close
Date: Mon,  5 Aug 2024 16:37:08 +0200
Message-ID: <20240805143713.76034-6-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
References: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
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

Use __drm_close_driver() for closing a drm device, as it was
opened with __drm_open_driver() function.

v2: update description

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/core_hotunplug.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index cc715a234..b66d5e4cf 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -142,7 +142,11 @@ static int close_device(int fd_drm, const char *when, const char *which)
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

