Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348B7C2BA1A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 12:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD74F89C5E;
	Tue, 18 Jun 2024 12:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekcqcYEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CA789C5E
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 12:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718712742; x=1750248742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3EJWiG/2MyaNzn7YQXeI3pGrz8456xd1ripnSCsi0fU=;
 b=ekcqcYEXxqTJ+X9slkRScQNKvog4gFBeONmuEY1jtk8CE31J+P6H3UKo
 AYromYdVYhxkwjL8xPjewVMQTudpDjuHbqZLFV+xExt1U9QFVv9bLcUom
 56HTJ8t7VWwoDURYRDB3IDhP6T8Iz9N1t3b+7tb1HMUQgNd0HZRK3nvPm
 CtgiS89CZhMWkjwenOzQQclJQ2l+mYttZlk+1KkWvpZsyoEv/TNOLTOKv
 q1NB0qvcY5LWHbZS+NjiZAC5RnaQ8ZeqlSlqrM4vQlDYWy+3H3gYNxRpl
 O6d5emwNrd2LL74IAV3RcufHmqrPLdfPP1mIyqe7HS/NEmry7bMx+CHYM g==;
X-CSE-ConnectionGUID: KYXck4ZyT+aZUqRq9e7UMw==
X-CSE-MsgGUID: uTWc+uArQ0q2ouGnvF1jCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26214533"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26214533"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 05:12:21 -0700
X-CSE-ConnectionGUID: jTPmnN5HS+WDstRkMijUwg==
X-CSE-MsgGUID: 0GLhigwCRnqY1mV5KePhvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46071794"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa004.fm.intel.com with ESMTP; 18 Jun 2024 05:12:20 -0700
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	"Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
	Naladala@freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/kms_3d: "1080p-left.png": No such file or
 directory fix
Date: Tue, 18 Jun 2024 17:46:37 +0530
Message-ID: <20240618121638.231181-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_core.c                   |   9 +++++++--
 lib/igt_core.h                   |   4 ++--
 lib/meson.build                  |   1 +
 meson.build                      |   1 +
 tests/{ => data}/1080p-left.png  | Bin
 tests/{ => data}/1080p-right.png | Bin
 tests/data/meson.build           |   8 ++++++++
 tests/{ => data}/pass.png        | Bin
 tests/meson.build                |   8 ++------
 9 files changed, 21 insertions(+), 10 deletions(-)
 rename tests/{ => data}/1080p-left.png (100%)
 rename tests/{ => data}/1080p-right.png (100%)
 create mode 100644 tests/data/meson.build
 rename tests/{ => data}/pass.png (100%)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3ff3e0392..daef37c64 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3237,7 +3237,7 @@ void igt_reset_timeout(void)
 }
 
 FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
-		       const char* filename)
+		       const char* igt_imgdir,const char* filename)
 {
 	char path[PATH_MAX];
 	FILE *fp;
@@ -3249,7 +3249,12 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
 		fp = fopen(path, "r");
 	}
 	if (!fp) {
-		snprintf(path, sizeof(path), "./%s", filename);
+                snprintf(path, sizeof(path), "%s/%s", igt_imgdir, filename);
+                fp = fopen(path, "r");
+        }
+
+	if (!fp) {
+		snprintf(path, sizeof(path), "./data/%s", filename);
 		fp = fopen(path, "r");
 	}
 
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 084d94da7..c13711902 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1427,7 +1427,7 @@ static inline uint32_t igt_seconds_elapsed(struct timespec *start)
 void igt_reset_timeout(void);
 
 FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
-		       const char* filename);
+		       const char* igt_imgdir, const char* filename);
 /**
  * igt_fopen_data:
  * @filename: filename to open.
@@ -1436,7 +1436,7 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
  * then from build directory, and finally from current directory.
  */
 #define igt_fopen_data(filename) \
-	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, filename)
+	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR,IGT_IMGDIR, filename)
 
 int igt_system(const char *command);
 int igt_system_quiet(const char *command);
diff --git a/lib/meson.build b/lib/meson.build
index e2f740c11..9e210f26c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -226,6 +226,7 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
+            '-DIGT_IMGDIR="@0@"'.format(imgdir),
 	])
 
     lib_intermediates += lib
diff --git a/meson.build b/meson.build
index ab44aadb1..20fd70632 100644
--- a/meson.build
+++ b/meson.build
@@ -282,6 +282,7 @@ vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
 mandir = get_option('mandir')
 pkgconfigdir = join_paths(libdir, 'pkgconfig')
 python3 = find_program('python3', required : true)
+imgdir = join_paths(build_root,'tests','data')
 
 if get_option('use_rpath')
 	# Set up runpath for the test executables towards libigt.so.
diff --git a/tests/1080p-left.png b/tests/data/1080p-left.png
similarity index 100%
rename from tests/1080p-left.png
rename to tests/data/1080p-left.png
diff --git a/tests/1080p-right.png b/tests/data/1080p-right.png
similarity index 100%
rename from tests/1080p-right.png
rename to tests/data/1080p-right.png
diff --git a/tests/data/meson.build b/tests/data/meson.build
new file mode 100644
index 000000000..01af4b48c
--- /dev/null
+++ b/tests/data/meson.build
@@ -0,0 +1,8 @@
+image_files = [
+  '1080p-left.png',
+  '1080p-right.png',
+  'pass.png',
+]
+install_data(sources : image_files, install_dir : imgdir)
+install_data(sources : image_files, install_dir : datadir)
+
diff --git a/tests/pass.png b/tests/data/pass.png
similarity index 100%
rename from tests/pass.png
rename to tests/data/pass.png
diff --git a/tests/meson.build b/tests/meson.build
index 758ae090c..b4a92e997 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -467,6 +467,8 @@ subdir('vc4')
 
 subdir('vmwgfx')
 
+subdir('data')
+
 gen_testlist = find_program('generate_testlist.sh')
 test_list_target = custom_target('testlist',
 	      output : 'test-list.txt',
@@ -505,11 +507,5 @@ if not meson.is_cross_build()
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

