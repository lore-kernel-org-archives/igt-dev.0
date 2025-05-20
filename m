Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A2DC3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 19:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860C610E575;
	Tue, 20 May 2025 19:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNs6POZ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B987310E525
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 19:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747768185; x=1779304185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXrV2EGgXvEm8bJqPJQXR2Kv5g/yiyL6kfCZJ3OEkco=;
 b=ZNs6POZ9W/onid5EhGSiYNjeohWng0h276UHR8KH8lAX8Y16VLqroRuI
 EU4WrCoiyjPrlji3LFk6VLuIbGRBkz+Y+Y8i9btSLKm24tN30UtTKJBxJ
 Yf/KZmAFqeWAg8agrSE4hcLZqfHO5S0ttBT/SeAu075L4xk+T7aHFClzM
 Qi8pAdRqsGrwLSu0risFmQGQADZytCxWHPeRnX2m3ZNgwhh1LqrVzLCmc
 /N+1FAEkKRoOWrDJg7tI1QvZdFNNWXJldc0PjlnSflzhjEg69mJhD8nzD
 tnt09jgD+2aZJL4tJAt2i1sQKLDxvDjQnrQWRaePMLlCnTUAN5mnqY2ZJ w==;
X-CSE-ConnectionGUID: NSSeCgQCQSmfsimMZe2c/g==
X-CSE-MsgGUID: QekbVvfUQq+GvAETfNInWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49420881"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49420881"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:09:44 -0700
X-CSE-ConnectionGUID: flZfKQNxRVGGsC5nDfcjwQ==
X-CSE-MsgGUID: RMD/fB/TReK/neuZEitxjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144524872"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:09:41 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 1/5] data: Move PNG images to new data directory
Date: Wed, 21 May 2025 00:39:07 +0530
Message-ID: <20250520190911.1727232-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520190911.1727232-1-ramanaidu.naladala@intel.com>
References: <20250520190911.1727232-1-ramanaidu.naladala@intel.com>
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
index 6f3a1150c..1d031b85c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -248,6 +248,7 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
+            '-DIGT_IMGDIR="@0@"'.format(imgdir),
 	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
 
     lib_intermediates += lib
diff --git a/meson.build b/meson.build
index 6a580bd7e..4f98b5a5f 100644
--- a/meson.build
+++ b/meson.build
@@ -291,6 +291,7 @@ vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
 mandir = get_option('mandir')
 pkgconfigdir = join_paths(libdir, 'pkgconfig')
 python3 = find_program('python3', required : true)
+imgdir = join_paths(build_root, 'data')
 
 if get_option('use_rpath')
 	# Set up runpath for the test executables towards libigt.so.
@@ -386,6 +387,7 @@ endif
 subdir('overlay')
 subdir('man')
 subdir('docs')
+subdir('data')
 
 message('Build options')
 message('=============')
diff --git a/tests/meson.build b/tests/meson.build
index 55bcf57ec..4c655ec90 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -526,11 +526,4 @@ if not meson.is_cross_build()
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

