Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9FECDD543
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 16:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDA410E5EA;
	Wed, 18 Sep 2024 16:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfFYPBCJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9340A10E290
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726677392; x=1758213392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uj+KndKXf+fl9I9aGl7oppJI54dAh8CBhmHugXrdsgs=;
 b=hfFYPBCJwN24ugspv6HWumMGWL8uIuH1sF/G9daVRmO1DjbIVv6vAz7K
 fe9u0ec81uCS+xXFetA0U10gLZmOi9GLWoT8jEreuI9vB+hQAf1fXFdN7
 +8XUobba1ZLOL3dEOn8QUG+sMSxbtAxyq8iW66LY+H2ZVH1yx4ufOmgb1
 TQVbo3EmzG23OJGetZgUKLvym//zYJJukWRjIhW+uYFtojLyC4lF3AQk5
 ygO8/mITFjjeaZyBm1WDi4R5+rSxyzgy7VR+ndVA8T/zWDCSxG4qbv+NU
 0kv4nyjvu9MrG/XGfog3xinDNvCyjNttHbUTP/LfjQDcIYQ/JTotkgLfH Q==;
X-CSE-ConnectionGUID: m4RyoMWCRmWUBURo7AM7TQ==
X-CSE-MsgGUID: /tV+EdH0Q2aXPlDMz+SlgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29496276"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="29496276"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:31 -0700
X-CSE-ConnectionGUID: entXhcXPQOyOGvBceAUSNA==
X-CSE-MsgGUID: FnOHkjWKRU+fJGl324ntMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69235579"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 4/6] lib/igt_gt: Fallback on filenames in
 igt_open_forcewake_handle()
Date: Wed, 18 Sep 2024 09:36:27 -0700
Message-ID: <20240918163629.1186314-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240918163629.1186314-1-lucas.demarchi@intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_gt.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index c84368fbd..3df3fdb63 100644
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
+		return igt_debugfs_open(fd, fn[XE], O_RDONLY);
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

