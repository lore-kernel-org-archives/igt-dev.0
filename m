Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70506D6ED32
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 13:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8B610E959;
	Thu, 21 Nov 2024 13:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTHW+aT2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FBC10E959
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732196475; x=1763732475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rVJGvYaBM97zc1HP6PmDqPOxVgheRgzMWDcplCwjiLg=;
 b=jTHW+aT2owafdRWQgWk5kJ2WPn0Q8SE3CYrCMmMlWWgkTNwbfqs9vTqb
 IXAO4t42MoGA3kOY9p+apA5j2DNRxvzm/PK+W7Xt6LrLTtuQU5kzho5zH
 hHj9NHDyqZuqQz5LbQSAffcA6PncU2fD3WnW9SA3zMEP1zELBd0c3ag9Z
 TdaHUaTdMK8V2Ns0Q3L3JruJLWbBVAaUcNtH7rY0Tlo5nQ0m4S9BbOyI6
 KSXQ2sW0uyyfUCEeKt9fgjKLbDIei189fAQnsclnCvn2C1PBvY75y8eOE
 W5FnezGrAY//7YOeZEfM468cJfkUJohdFbsHDy5cKfyZT8+PTApnL/lRs w==;
X-CSE-ConnectionGUID: TbBki5UHSfqj5gyaZoThHA==
X-CSE-MsgGUID: vUab3S8/QwWoWoseSiYqcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54809148"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="54809148"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 05:41:15 -0800
X-CSE-ConnectionGUID: gd4d6RgmSOmq0mHwUe4TYg==
X-CSE-MsgGUID: wB31kLQ+QI2MQhqHuXZObw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="90192539"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 05:41:14 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/5] data: create new data directory
Date: Thu, 21 Nov 2024 19:09:54 +0530
Message-ID: <20241121133958.3382633-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241121133958.3382633-1-ramanaidu.naladala@intel.com>
References: <20241121133958.3382633-1-ramanaidu.naladala@intel.com>
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

