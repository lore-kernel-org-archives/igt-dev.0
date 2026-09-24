Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCBBC98311
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 09:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B026710F3DB;
	Thu, 24 Sep 2026 09:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUkjgT9e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA0310F3DB
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790242510; x=1821778510;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+9GprJ6nG2fWD5t6bprrNAmfJIjrxtXC2UumQSe1fYg=;
 b=bUkjgT9egivyMoUb3Mx30Lob9Y+zIU2ClpC2c1frky0/swYe1iPEygHw
 fmYyaBeETRn5sI3TGpdWj90T1dR7o9MEKwqCsoLBVwdV7NUpJIJ18c4NV
 RgJecCoCrF36lyYclcuBCw1/p7IW8uURt5bHNzocUQFVjpcHRd2D9vHT4
 5+3hbtTFVSnkIRYR0eE80zNrl+p9zW41w10HG8UYFlriDRDLsjyFNH5Yy
 6jB90SenvA5Gt9D88DYqPFFjC25P9ob5teX5b165mbZW7/31C8rcBNISw
 SPJfJfJ1hLMu6aQMygtAZDoZIgPtM0O7B0yPfUaEjpPn5xNUDXfwFPbOg g==;
X-CSE-ConnectionGUID: 5dEpB3g2S56naqAbG6aygw==
X-CSE-MsgGUID: aB2AahcaTgOd0xUJaNgXjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="107393164"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="107393164"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 02:35:10 -0700
X-CSE-ConnectionGUID: gcPmSSUVTXiX63st5NZzlw==
X-CSE-MsgGUID: 5+rLzMqgRWm7Z1Mg9VUUqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="301908766"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 02:35:09 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t] meson: Bump meson version to 1.3.0
Date: Thu, 24 Sep 2026 11:35:04 +0200
Message-ID: <20260924093504.81036-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Bump meson version to 1.3.0.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/206
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 data/meson.build            | 4 +++-
 lib/meson.build             | 4 ++--
 meson.build                 | 2 +-
 runner/testdata/meson.build | 7 +++----
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/data/meson.build b/data/meson.build
index 9490d20ac..8898c27e3 100644
--- a/data/meson.build
+++ b/data/meson.build
@@ -1,3 +1,5 @@
+fs = import('fs')
+
 image_files = [
   '1080p-left.png',
   '1080p-right.png',
@@ -5,7 +7,7 @@ image_files = [
 ]
 
 foreach img : image_files
-      configure_file(output:img, input:img, copy:true)
+	fs.copyfile(img)
 endforeach
 
 install_data(sources : image_files, install_dir : datadir)
diff --git a/lib/meson.build b/lib/meson.build
index f3e6d9669..66558d5d3 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -218,7 +218,7 @@ if libdrm_amdgpu.found()
 	if llvm_mc_prog.found()
 		add_project_arguments('-DAMDGPU_LLVM_ENABLED', language : ['c'])
 		lib_sources += ['amdgpu/shaders/amd_llvm_asm.c']
-		message('Found ' + llvm_mc_prog.path() + ' enabling runtime AMDGPU ISA assembly')
+		message('Found ' + llvm_mc_prog.full_path() + ' enabling runtime AMDGPU ISA assembly')
 	else
 		lib_sources += ['amdgpu/shaders/amd_llvm_asm_stub.c']
 		message('llvm-mc not found: using stub implementation (tests will skip)')
@@ -295,7 +295,7 @@ foreach f: iga64_assembly_sources
 	iga64_codes_targets += custom_target(name,
 		input: [ f + '.gen.iga64_codes.c', libiga64_asms.extract_objects(f) ],
 		output: name,
-		depend_files: [ 'iga64_macros.h', generate_iga64_codes.path() ],
+		depend_files: [ 'iga64_macros.h', generate_iga64_codes.full_path() ],
 		command: [ 'env', 'IGT_SRCDIR=@SOURCE_ROOT@', generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT0@', '@INPUT1@' ],
 		console: true,
 	)
diff --git a/meson.build b/meson.build
index 980fb6421..b05385795 100644
--- a/meson.build
+++ b/meson.build
@@ -7,7 +7,7 @@ project('igt-gpu-tools', 'c',
           'buildtype=debugoptimized',
         ],
 	license : 'MIT',
-	meson_version : '>=0.52.1')
+	meson_version : '>=1.3.0')
 
 if get_option('b_ndebug') != 'false'
 	error('Building without -Db_ndebug=false is not supported')
diff --git a/runner/testdata/meson.build b/runner/testdata/meson.build
index 1f8225918..574067cdb 100644
--- a/runner/testdata/meson.build
+++ b/runner/testdata/meson.build
@@ -1,3 +1,4 @@
+fs = import('fs')
 
 testdata_progs = [ 'successtest',
 		   'no-subtests',
@@ -17,10 +18,8 @@ foreach prog : testdata_progs
 					   install : false)
 endforeach
 
-configure_file(input : 'test-blacklist.txt',
-	       output : 'test-blacklist.txt', copy : true)
-configure_file(input : 'test-blacklist2.txt',
-	       output : 'test-blacklist2.txt', copy : true)
+fs.copyfile('test-blacklist.txt')
+fs.copyfile('test-blacklist2.txt')
 
 testdata_list = custom_target('testdata_testlist',
 			      output : 'test-list.txt',
-- 
2.55.0

