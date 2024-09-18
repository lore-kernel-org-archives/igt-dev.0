Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CCDCDD549
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 16:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E0A10E5F3;
	Wed, 18 Sep 2024 16:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hw7TxAkG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E7710E5EA
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726677391; x=1758213391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f28MAWLX+ttsCyJPXCFDTSINILQkOPfJ/e7E/b2snkU=;
 b=hw7TxAkGQHQeTOCuoYAQumusFtBk7WzV34YIkGmKOcsubiTj0VlnSfAu
 v8jmleF4begdDKzrrb+qeWvgHDHJF7a7eobpZX3HNa/pGdQxveRA0+g5P
 94Kf0pyHfFj/anIjlWU5u9iMXNfnNqGq8a/cBQfTQrY28M5Ji+mOJ+H3A
 Nqv8CCmh8cc+m1k5jFYWOceeimW0QfKz90zvNA1YKzyYOucFGOvStRgGR
 Iw7mZX42SbbHOmK+IT5i5XgIn+01Mfk4sZAGnIim0hY/oSNBSAthGb8KR
 dRNfGw/3Cm/jFhQock5xJKCZ/HgP+g/R5lH6OLLjOcDA1yIeKKVX5TcgK A==;
X-CSE-ConnectionGUID: RWMeVLguTgma5OSe75Cq8g==
X-CSE-MsgGUID: a6untxJWTYCgO4sHpjJtqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29496275"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="29496275"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:31 -0700
X-CSE-ConnectionGUID: JN4yGIYdRmqj4u5HvgKwlw==
X-CSE-MsgGUID: ySEOdbJrR2GklhUqiKGlcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69235575"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:36:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/6] lib/igt_gt: Make igt_open_forcewake_handle()
 xe-compatible
Date: Wed, 18 Sep 2024 09:36:26 -0700
Message-ID: <20240918163629.1186314-4-lucas.demarchi@intel.com>
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

xe uses a different file to hold forcewake. Make
igt_open_forcewake_handle() compatible.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_gt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index d831d2448..c84368fbd 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -502,9 +502,17 @@ void igt_stop_hang_helper(void)
  */
 int igt_open_forcewake_handle(int fd)
 {
+	const char *fn;
+
 	if (getenv("IGT_NO_FORCEWAKE"))
 		return -1;
-	return igt_debugfs_open(fd, "i915_forcewake_user", O_RDONLY);
+
+	if (is_xe_device(fd))
+		fn = "forcewake_all";
+	else
+		fn = "i915_forcewake_user";
+
+	return igt_debugfs_open(fd, fn, O_RDONLY);
 }
 
 #if defined(__x86_64__) || defined(__i386__)
-- 
2.46.1

