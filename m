Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE679CDD552
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 19:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB8110E629;
	Wed, 18 Sep 2024 19:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9mjpwub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0046510E629
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 19:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726686990; x=1758222990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2jvMMlU+8T5uvCzR/HltRvm/uJOp1BuKbtgnk/EaPCY=;
 b=Q9mjpwubt03+BAL6Kw3fxmQSHuqryi1HI9TjzfH2GWkHPT3xPD1jo/av
 oc1vfKy74phtoz8/e1AdyKNDQeUIO2zq2uO7MVj8GUjrLNK3vVW5c8XXJ
 t4/K4Y3n8lvVXCdZ1LUoppP+5hkrGuD88b04jPB9kdUykw23vP3CoGu2R
 atlIKo7lKxDmOFI+5zxeI34Vw6I7g+9Hui5OnQxgPislLEFCxDKXKjPpC
 mqUSFZKH9R+za/e8JgBvkrok0XqugtPqVolhPmNckrGeRxdPBAjmQ0yoQ
 CIOjFVR09CUSUOp0ZvfTUyNApECwRQJVkbUyXWTtdjG5jGD85hVvJOSiH A==;
X-CSE-ConnectionGUID: 5wE76RkwSEisV+TDu5Y3ow==
X-CSE-MsgGUID: rVce2KqiRTW4D1Gtbny+Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36194944"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="36194944"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 12:16:30 -0700
X-CSE-ConnectionGUID: Pz/4p1zOQeGtqPkB3MPwqA==
X-CSE-MsgGUID: K2EtjF9WQsSwhR8Q5/L6Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="73795960"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 12:16:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v1.1] lib/igt_gt: Fallback on filenames in
 igt_open_forcewake_handle()
Date: Wed, 18 Sep 2024 12:16:26 -0700
Message-ID: <20240918191626.1194763-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240918163629.1186314-5-lucas.demarchi@intel.com>
References: <20240918163629.1186314-5-lucas.demarchi@intel.com>
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

If fd is -1, we don't know what file should be used for forcewake.
We could open the debugfs dir and figure out from there, but it's also
cheap to just handle a fallback approach. Ideally fd == -1 wouldn't be
passed and eventually this could be removed.

v2: Fix copy-and-paste error s/XE/I915/

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_gt.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index c84368fbd..4b096768f 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -502,17 +502,31 @@ void igt_stop_hang_helper(void)
  */
 int igt_open_forcewake_handle(int fd)
 {
-	const char *fn;
+	enum {
+		I915,
+		XE,
+	};
+	const char *fn[] = {
+		[I915] = "i915_forcewake_user",
+		[XE] = "forcewake_all",
+	};
 
 	if (getenv("IGT_NO_FORCEWAKE"))
 		return -1;
 
 	if (is_xe_device(fd))
-		fn = "forcewake_all";
-	else
-		fn = "i915_forcewake_user";
+		return igt_debugfs_open(fd, fn[XE], O_RDONLY);
+	if (is_i915_device(fd))
+		return igt_debugfs_open(fd, fn[I915], O_RDONLY);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(fn); i++) {
+		int ret = igt_debugfs_open(fd, fn[i], O_RDONLY);
+
+		if (ret >= 0)
+			return ret;
+	}
 
-	return igt_debugfs_open(fd, fn, O_RDONLY);
+	return -ENOENT;
 }
 
 #if defined(__x86_64__) || defined(__i386__)
-- 
2.46.1

