Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED34BE77198
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A9010E31E;
	Tue,  7 Jan 2025 20:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxCWHAmU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737C510E31E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736280487; x=1767816487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yPGBg+pNhI6woRhFc0ZfFepTnLTy3mrcJvQeDIXaPAc=;
 b=mxCWHAmUEhaScY4V8SSlclTlSSy6Um1f9O1MTJIqIq4VJN25Sm/CA6eL
 kItPSPr6B+HbvmZajIOrShl4ulE5pRfi2qkW+qQiOeHcDeuZL0wu9WXWA
 /S/zHjeAtQkolIerf3WvvZnVw9WjKJw6d73FlO6CJ2kPgZ3NHgnc/Z9Fz
 LeWppTLcY/zJCZkybn+Fbp0+fm7f7WVLGFD8yWBadbGyMgkg/hnTQubbe
 WEM5V9GzG8agBYYR86LBr+kQ7ui4T6CiEMyzPgJEHhIpkwwa1i/UZLwQv
 l2vOGStU6K8aOr0sRxiAIMEeWpLpMGFUOIy4Zw9RxWkh6VfVwVkwQgFxJ w==;
X-CSE-ConnectionGUID: 6nGxLwVdSfCMw1gvSl+MGg==
X-CSE-MsgGUID: BtDa84wnS66M8HIjUjCOcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36367054"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36367054"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:08:07 -0800
X-CSE-ConnectionGUID: 5D1lL3yERoaS+d/wODJTxg==
X-CSE-MsgGUID: P1/Z2QOMRUaE+n3L2RD6ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="102688340"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 12:08:04 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 1/5] data: Move PNG images to new data directory
Date: Wed,  8 Jan 2025 01:36:10 +0530
Message-ID: <20250107200614.963199-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
References: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
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
---
 {tests => data}/1080p-left.png  | Bin
 {tests => data}/1080p-right.png | Bin
 data/meson.build                |  11 +++++++++++
 {tests => data}/pass.png        | Bin
 lib/meson.build                 |   1 +
 meson.build                     |   2 ++
 tests/meson.build               |   6 ------
 7 files changed, 14 insertions(+), 6 deletions(-)
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
index 1704ed1e1..afa09ae02 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -240,6 +240,7 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
+	    '-DIGT_IMGDIR="@0@"'.format(imgdir),
 	])
 
     lib_intermediates += lib
diff --git a/meson.build b/meson.build
index 8b2a2a64a..6779465b3 100644
--- a/meson.build
+++ b/meson.build
@@ -293,6 +293,7 @@ vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
 mandir = get_option('mandir')
 pkgconfigdir = join_paths(libdir, 'pkgconfig')
 python3 = find_program('python3', required : true)
+imgdir = join_paths(build_root, 'data')
 
 if get_option('use_rpath')
 	# Set up runpath for the test executables towards libigt.so.
@@ -388,6 +389,7 @@ endif
 subdir('overlay')
 subdir('man')
 subdir('docs')
+subdir('data')
 
 message('Build options')
 message('=============')
diff --git a/tests/meson.build b/tests/meson.build
index 89bba6454..a8d875d36 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -510,11 +510,5 @@ if not meson.is_cross_build()
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

