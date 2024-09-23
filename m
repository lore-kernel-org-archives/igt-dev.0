Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4F6CF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 07:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07DD10E38D;
	Mon, 23 Sep 2024 07:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYFWqRiy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B6E10E38D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727075303; x=1758611303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s+SXHd3xa3PrAm3B4K6djd7JnaKiC4cPoJZvZfpLEK0=;
 b=BYFWqRiy5LQT5c3HvVOULlxKzJ3IZHlj/H8K+0O6rySO5XuWpXk+XIZm
 klSLlz2sHPbUvD0A1zmNnXZHs2j7Q0gp92o1kk0Ndps6hnUJiv7AzvgJG
 nm+iTOStj+NLYdVx+O3P4sqQvxzFrfX0PwuTGhF43/RYqam+DZhV3Ox6+
 rAKC4ArftAzRc2hw7p2WfnxfKgDO2MEHHj2TOkzhLzW1bZ0NQH1dQ/C7h
 u4LZzYmtgv69eiKeXMsyHNW93LXQa9G7xqrSxO+YmLEr+6uWo1epMOyU4
 grgcEOZbDm0+FFKwE//SpP8hpK5AeZaU/C8PqpqcPiy4wMFGwk/19IMlH g==;
X-CSE-ConnectionGUID: SyMDd8biSbq+gdxlwoUiGw==
X-CSE-MsgGUID: bXSynlwhTmOfvyo/31mQeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25956284"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25956284"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:08:20 -0700
X-CSE-ConnectionGUID: 9EBm4tSBQEOnqTHW1sTsLg==
X-CSE-MsgGUID: cxJvU2u6SLi0i7zJ1c79Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71799230"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 00:08:12 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 6/6] meson: Add sharpness tool
Date: Mon, 23 Sep 2024 12:40:23 +0530
Message-Id: <20240923071023.1170127-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923071023.1170127-1-swati2.sharma@intel.com>
References: <20240923071023.1170127-1-swati2.sharma@intel.com>
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

From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

Make changes in tools/meson.build to build sharpness tool.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tools/meson.build | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/meson.build b/tools/meson.build
index df26c4b95..2128c605f 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -66,6 +66,17 @@ if libudev.found()
 		   install : true)
 endif
 
+executable('intel_sharpness_tool', 'intel_sharpness_tool.c',
+           dependencies : tool_deps,
+           c_args : [
+	      '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
+	      '-DIGT_SRCDIR="@0@"'.format(srcdir),
+	      '-DIGT_IMGDIR="@0@"'.format(imgdir),
+	      '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0])
+            ],
+          install_rpath : bindir_rpathdir,
+          install : true)
+
 executable('gputop', 'gputop.c',
            install : true,
            install_rpath : bindir_rpathdir,
-- 
2.25.1

