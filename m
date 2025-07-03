Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D34C83F09
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 07:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A6210E152;
	Thu,  3 Jul 2025 07:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="na0Kv1cM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E8710E152
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 07:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751529222; x=1783065222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q1ewPOJ6dJDKVvSdiheM/OTS2rc/SN1e6d+oWWviki8=;
 b=na0Kv1cMD/piVxgEAwqetywhjRrANk9VRfKKiTOu53MhBEMnyneaJdHI
 zAlko9EGCzzO/8SLLeCS3lFFtiSJn8GZIZRJZsglNugRh2w4ihU9D8ik9
 Ra8Fqqc+Dx4mazKhk34QYeBLOIjOeLmgo0TntXuWBpxzwukm9xqXV2sCX
 L3QxTiX83ybY+Qi5dOPDyeZiDXN5ViGOL4VIU0RJrJ6fW2u3hbbDFRt9H
 Ob5cJ6qofhT+sptlUTYPFZW9NBRkkBkXvgDObjcX4OQDvsV53z0kGiAIB
 2gTqpM5E22tdS334WaGWi7qhkBSpunMRsL7D5JHd4vgof0RKP14qLzRSE A==;
X-CSE-ConnectionGUID: 829GRT28T4Co+oOuiZclbQ==
X-CSE-MsgGUID: WrZU1wwkQvKn7vquXnPuaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71279207"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="71279207"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:53:41 -0700
X-CSE-ConnectionGUID: DftAUbuuSXOzWxr5+HSr5Q==
X-CSE-MsgGUID: Ez1mmwKATcKWnjRPoBcfWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153732162"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:53:40 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 1/4] data: Move PNG images to new data directory
Date: Thu,  3 Jul 2025 13:23:41 +0530
Message-ID: <20250703075344.95774-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703075344.95774-1-ramanaidu.naladala@intel.com>
References: <20250703075344.95774-1-ramanaidu.naladala@intel.com>
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

Placing png images inside "tests/" directory seems wrong, as these
are not source files. These images should ideally be in a directory
with other non-exec files, so creating a new "data/" directory to
store such non-exec files.

v2: Update commit message subject (Kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 {tests => data}/1080p-left.png  | Bin
 {tests => data}/1080p-right.png | Bin
 data/meson.build                |  11 +++++++++++
 {tests => data}/pass.png        | Bin
 lib/meson.build                 |   1 +
 meson.build                     |   2 ++
 tests/meson.build               |   7 -------
 7 files changed, 14 insertions(+), 7 deletions(-)
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
index 000000000..9490d20ac
--- /dev/null
+++ b/data/meson.build
@@ -0,0 +1,11 @@
+image_files = [
+  '1080p-left.png',
+  '1080p-right.png',
+  'pass.png',
+]
+
+foreach img : image_files
+      configure_file(output:img, input:img, copy:true)
+endforeach
+
+install_data(sources : image_files, install_dir : datadir)
diff --git a/tests/pass.png b/data/pass.png
similarity index 100%
rename from tests/pass.png
rename to data/pass.png
diff --git a/lib/meson.build b/lib/meson.build
index b0505190b..1ed50d796 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -274,6 +274,7 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
+            '-DIGT_IMGDIR="@0@"'.format(imgdir),
 	])
 
     lib_intermediates += lib
diff --git a/meson.build b/meson.build
index 468204cda..4efad72cf 100644
--- a/meson.build
+++ b/meson.build
@@ -294,6 +294,7 @@ vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
 mandir = get_option('mandir')
 pkgconfigdir = join_paths(libdir, 'pkgconfig')
 python3 = find_program('python3', required : true)
+imgdir = join_paths(build_root, 'data')
 
 if get_option('use_rpath')
 	# Set up runpath for the test executables towards libigt.so.
@@ -389,6 +390,7 @@ endif
 subdir('overlay')
 subdir('man')
 subdir('docs')
+subdir('data')
 
 message('Build options')
 message('=============')
diff --git a/tests/meson.build b/tests/meson.build
index 9b87a0d24..881b204a5 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -527,11 +527,4 @@ if not meson.is_cross_build()
 			output : 'gem_stress.testlist')
 endif
 
-image_files = [
-  '1080p-left.png',
-  '1080p-right.png',
-  'pass.png',
-]
-install_data(sources : image_files, install_dir : datadir)
-
 subdir('intel-ci')
-- 
2.43.0

