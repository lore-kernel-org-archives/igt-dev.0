Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C77CF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 07:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF3410E38F;
	Mon, 23 Sep 2024 07:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k0+pxPqi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD6010E38F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 07:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727075271; x=1758611271;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KCwzl/pNHHpYrUgVJbDJM8PgT00jx59lA/dbe8L7oDE=;
 b=k0+pxPqii1ukiqiG2v1Fg8YqmQtezCxWAvvlZZodRWyqAvMRUWaS0Lf+
 OrJ5lKpJef4ZAQekwReQkFIBrcJtXnZ82353itF6NZf5ztvpf9Fkp7nab
 dgJmfvoWEQyaA7HxkN54ReI036jIDbO3aJsTdnB4RnUG6rmxSJVAJwgjn
 TLZ0yvfD1knptzP+QplN0CHWCYjslK1YJrfgUuskKTHE9lVqsaAr/SF9f
 arNmUQVUNpiXZ8AbTvIqoR0qczhHRiSzhSY0PnmTTm5BeXcC8WC4ojZTK
 1lBN5/uUZs0e6bUZgknIm//5BjqZpXHqWyMarkF3kAutDh0ruJgYn7yVN g==;
X-CSE-ConnectionGUID: bCXv+vn+TgWmSo6cutmDmA==
X-CSE-MsgGUID: w0f4pTLqRduF2QyM4YkEfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25956129"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25956129"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:07:51 -0700
X-CSE-ConnectionGUID: nz4dd5+zQ2G58OodNfncXw==
X-CSE-MsgGUID: 3Js2TDRCRK64Y/fyt3z+lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71799130"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 00:07:50 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/6] data: create new data directory
Date: Mon, 23 Sep 2024 12:40:18 +0530
Message-Id: <20240923071023.1170127-2-swati2.sharma@intel.com>
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

From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>

Placing png images inside "tests/" directory seems wrong, as these
are not source files. These images should ideally be in a directory
with other non-exec files, so creating a new "data/" directory to
store such non-exec files.

Signed-off-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
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
index c3556a921..544c8caaf 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -236,6 +236,7 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
+	    '-DIGT_IMGDIR="@0@"'.format(imgdir),
 	])
 
     lib_intermediates += lib
diff --git a/meson.build b/meson.build
index 0d06721b4..472c38c51 100644
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
index e5d8852f3..7f8c755c6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -503,11 +503,5 @@ if not meson.is_cross_build()
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
2.25.1

