Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E10606A321
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 17:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xp+3wx6i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BE210E228;
	Tue, 24 Nov 2026 17:54:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1E810E228
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795542791; x=1827078791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=frH+iTcQgZsGq2G3XdbLAWxoKq1/nK+Liy8xEIOvC2o=;
 b=Xp+3wx6iEf6dyN8DO2WSbQ33OJteA79jVfxdywrcsU46TttC9wqH1bIE
 EfJfUC/GmRHVSJvkDyh+WLwI8XMGoXXkiFqNabN/NsDeGNkIiIp4r+NKz
 bExYOf8GY7MQn0jqp0IosFROv4wmeHqwREpTr3QA5u4OEJiSk2VKV5ysv
 ZHq5huUIUk8KsMIvGMhvttAAC4IuoVJZenUJoqw7IhMcc96x8KeJw5oQC
 lQxgmszhhZNcG945bkDPmGIymELjHc9mjQ5GUShP8oFayCYCO7hNjlSnQ
 r13ZD5Omj8C7lHNFiIUxoAf7EfdbgEMfYpIl37+vzGcISnxRXKowcPQAp Q==;
X-CSE-ConnectionGUID: CtZyFFh9RLqW32+3XEXvNA==
X-CSE-MsgGUID: OKt8hmJYTvSDBiCrU9bbWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4413516"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4413516"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:16:38 -0800
X-CSE-ConnectionGUID: 7ktDw9F5Tcqa+Ixgrv4JUg==
X-CSE-MsgGUID: NeHkZPKlR/G/VMZNOLNoqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11488966"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 09:15:25 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mark Yacoub <markyacoub@google.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v1] meson: Bump meson version to 1.0.1
Date: Tue, 24 Nov 2026 18:15:08 +0100
Message-ID: <20261124171508.113620-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bump meson version to 1.0.1 and update minimal version used in
fedora Dokerfile. Also, update some old deprecated functions with
a new ones.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mark Yacoub <markyacoub@google.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 Dockerfile.build-fedora     | 2 +-
 data/meson.build            | 4 +++-
 lib/meson.build             | 4 ++--
 meson.build                 | 2 +-
 runner/testdata/meson.build | 7 +++----
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/Dockerfile.build-fedora b/Dockerfile.build-fedora
index aacc6a87c..9da9b6819 100644
--- a/Dockerfile.build-fedora
+++ b/Dockerfile.build-fedora
@@ -47,6 +47,6 @@ RUN dnf install -y findutils
 
 # Meson version switching shenanigans
 RUN dnf install -y python3-pip
-RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/43/9a/e0bcec70d290986c6265d32e0a2d16ace7ef38f58aa5a65308967129d094/{meson-0.52.1.tar.gz}"
+RUN curl -o "/usr/src/#1" "https://files.pythonhosted.org/packages/e4/3b/4e1f9e860191d4999fcb9000d36dfaf2460f2e2ce493a3bfc9b56b382209/{meson-1.0.1.tar.gz}"
 
 RUN dnf clean all
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
index 3ed1369b5..2aceb383b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -224,7 +224,7 @@ if libdrm_amdgpu.found()
 	if llvm_mc_prog.found()
 		add_project_arguments('-DAMDGPU_LLVM_ENABLED', language : ['c'])
 		lib_sources += ['amdgpu/shaders/amd_llvm_asm.c']
-		message('Found ' + llvm_mc_prog.path() + ' enabling runtime AMDGPU ISA assembly')
+		message('Found ' + llvm_mc_prog.full_path() + ' enabling runtime AMDGPU ISA assembly')
 	else
 		lib_sources += ['amdgpu/shaders/amd_llvm_asm_stub.c']
 		message('llvm-mc not found: using stub implementation (tests will skip)')
@@ -301,7 +301,7 @@ foreach f: iga64_assembly_sources
 	iga64_codes_targets += custom_target(name,
 		input: [ f + '.gen.iga64_codes.c', libiga64_asms.extract_objects(f) ],
 		output: name,
-		depend_files: [ 'iga64_macros.h', generate_iga64_codes.path() ],
+		depend_files: [ 'iga64_macros.h', generate_iga64_codes.full_path() ],
 		command: [ 'env', 'IGT_SRCDIR=@SOURCE_ROOT@',
 			   'IGT_IS_CROSS_BUILD=@0@'.format(meson.is_cross_build().to_int()),
 			   generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT0@', '@INPUT1@' ],
diff --git a/meson.build b/meson.build
index eec131375..30ee65973 100644
--- a/meson.build
+++ b/meson.build
@@ -7,7 +7,7 @@ project('igt-gpu-tools', 'c',
           'buildtype=debugoptimized',
         ],
 	license : 'MIT',
-	meson_version : '>=0.52.1')
+	meson_version : '>=1.0.1')
 
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

