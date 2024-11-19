Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C871D60074
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 07:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2788910E13C;
	Tue, 19 Nov 2024 07:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwFpYN27";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2AB10E13C
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 07:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732002856; x=1763538856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KSh1C2nKIY0peSTK0COIxxUAPQF+rT7q7Mp7kytN4fI=;
 b=AwFpYN27jM4lcSATR/bZpdOQhLmN/9APLM0ioCw7kc1HxHrA0IJebzrE
 7y08b1X1epS9MeL839OEN1a9l1ovCmbjaafaQ40b+dfKepUD4+06HmXfM
 kHMueweWDzx6rMh3W1Jeg8TUXpiy7ravJv7NmlH9uHHsHn1yWyIZQgoEG
 pLvX1z/h9sAnMuhYTfbB9ZMSOLcToc2jeUlICbO0/O/QeF+HJOUeEqSEj
 XZwF2D9YteuoFY1oYaiYBoRcyzs/Ao90F+CrC7308Kj8zpnLFU86kbRS8
 pzT8iw7+UyoFERNK3wJyv+nBh2E8rYD9GIFjxY5NkAuWXfL5SjpCYODM4 A==;
X-CSE-ConnectionGUID: 4okHPL9PRBqJXCNb44oY/w==
X-CSE-MsgGUID: +taL1FgqSZGuMPeSSQKYLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32136135"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32136135"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 23:54:16 -0800
X-CSE-ConnectionGUID: uiUltrY8ThKzxZj9EDZVpw==
X-CSE-MsgGUID: bclWVrxgQbyP/8GiNJfrcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="90278702"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 23:54:14 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: [PATCH 1/5] data: create new data directory
Date: Tue, 19 Nov 2024 13:22:55 +0530
Message-ID: <20241119075259.3048734-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
References: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
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

From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>

Placing png images inside "tests/" directory seems wrong, as these
are not source files. These images should ideally be in a directory
with other non-exec files, so creating a new "data/" directory to
store such non-exec files.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 {tests => data}/1080p-left.png  | Bin
 {tests => data}/1080p-right.png | Bin
 data/meson.build                |   9 +++++++++
 {tests => data}/pass.png        | Bin
 lib/meson.build                 |   1 +
 meson.build                     |   2 ++
 tests/meson.build               |   6 ------
 7 files changed, 12 insertions(+), 6 deletions(-)
 rename {tests => data}/1080p-left.png (100%)
 rename {tests => data}/1080p-right.png (100%)
 create mode 100644 data/meson.build
 rename {tests => data}/pass.png (100%)

diff --git a/tests/1080p-left.png b/data/1080p-left.png
similarity index 100%
rename from tests/1080p-left.png
rename to data/1080p-left.png
diff --git a/tests/1080p-right.png b/data/1080p-right.png
similarity index 100%
rename from tests/1080p-right.png
rename to data/1080p-right.png
diff --git a/data/meson.build b/data/meson.build
new file mode 100644
index 000000000..415cf9b6b
--- /dev/null
+++ b/data/meson.build
@@ -0,0 +1,9 @@
+image_files = [
+  '1080p-left.png',
+  '1080p-right.png',
+  'pass.png',
+]
+
+foreach img : image_files
+      configure_file(output:img, input:img, copy:true)
+endforeach
diff --git a/tests/pass.png b/data/pass.png
similarity index 100%
rename from tests/pass.png
rename to data/pass.png
diff --git a/lib/meson.build b/lib/meson.build
index 3d459c7a3..6f8f479ff 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -238,6 +238,7 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
+	    '-DIGT_IMGDIR="@0@"'.format(imgdir),
 	])
 
     lib_intermediates += lib
diff --git a/meson.build b/meson.build
index 64f57f232..5ff646825 100644
--- a/meson.build
+++ b/meson.build
@@ -286,6 +286,7 @@ vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
 mandir = get_option('mandir')
 pkgconfigdir = join_paths(libdir, 'pkgconfig')
 python3 = find_program('python3', required : true)
+imgdir = join_paths(build_root, 'data')
 
 if get_option('use_rpath')
 	# Set up runpath for the test executables towards libigt.so.
@@ -381,6 +382,7 @@ endif
 subdir('overlay')
 subdir('man')
 subdir('docs')
+subdir('data')
 
 message('Build options')
 message('=============')
diff --git a/tests/meson.build b/tests/meson.build
index 2724c7a9a..61dc7ed34 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -508,11 +508,5 @@ if not meson.is_cross_build()
 			output : 'gem_stress.testlist')
 endif
 
-image_files = [
-  '1080p-left.png',
-  '1080p-right.png',
-  'pass.png',
-]
-install_data(sources : image_files, install_dir : datadir)
 
 subdir('intel-ci')
-- 
2.43.0

