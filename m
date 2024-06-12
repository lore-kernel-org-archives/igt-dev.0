Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F86C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 07:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6528E10E7A6;
	Wed, 12 Jun 2024 07:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTe5G6LD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734B010E7B7
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 07:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718176289; x=1749712289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1fffs1lDQHAQnrhG4MOF08oPsmyCwQg2DOvNNnRSBBc=;
 b=TTe5G6LDFlr1ZXlCj/EBBPgwBvol2OuwkY5KJv1WWnVzVOgCQKx/nDV9
 TCUCrw20DeOZPJ7pkizDHbISncWw3Y24+C6Jl5YtzbbcyWlmKgspI+EJM
 DcE2sFewRjE9lNXG+9g1W9TOeLx7GfyFzK9a8CKI4OS5pu5WXzztobzXf
 OFwTQ2cBX1HXFxYjnHhnULT8bu7yz3Q8nyXMPIFDBdwQUhpE6N2512F4C
 Qv2gzLIls2Zj3uK+QJVp6+0KulZl1UFnASnor5+2JrnTtRn2f4Nzb++yh
 e8cgENYi0fEEyRbNsi+4EfmNOgBuokIRFAJFk1Cc85KLd5P47Ui6q10IE w==;
X-CSE-ConnectionGUID: pfQ9I4h4QsObPgE1n4YdzA==
X-CSE-MsgGUID: boIJzUQyTouNX1Ha+tourA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15092494"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="15092494"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:11:29 -0700
X-CSE-ConnectionGUID: zo/w8UwASJW34ha7ZHYMZA==
X-CSE-MsgGUID: H28qZrOWS1CNQtcC0nKwng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="62868019"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:11:27 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>, Emma Anholt <emma@anholt.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [i-g-t V2 2/3] tests/msm: Move MSM tests to new dir
Date: Wed, 12 Jun 2024 12:33:34 +0530
Message-ID: <20240612070335.3758500-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240612070335.3758500-1-bhanuprakash.modem@intel.com>
References: <20240612070335.3758500-1-bhanuprakash.modem@intel.com>
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

Move all MSM specific tests (tests/msm_*) to new dir
(tests/msm/msm_*).

Cc: Rob Clark <robdclark@chromium.org>
Cc: Helen Koike <helen.koike@collabora.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by:  Rob Clark <robdclark@chromium.org>
---
 meson.build           |  8 ++++++++
 tests/meson.build     | 19 ++-----------------
 tests/msm/meson.build | 16 ++++++++++++++++
 3 files changed, 26 insertions(+), 17 deletions(-)
 create mode 100644 tests/msm/meson.build

diff --git a/meson.build b/meson.build
index 701a5cc35..6ae3c2684 100644
--- a/meson.build
+++ b/meson.build
@@ -276,6 +276,7 @@ includedir = get_option('includedir')
 libdir = get_option('libdir')
 libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
 amdgpudir = join_paths(libexecdir, 'amdgpu')
+msmdir = join_paths(libexecdir, 'msm')
 panfrostdir = join_paths(libexecdir, 'panfrost')
 v3ddir = join_paths(libexecdir, 'v3d')
 vc4dir = join_paths(libexecdir, 'vc4')
@@ -316,6 +317,12 @@ if get_option('use_rpath')
 	endforeach
 	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
 
+	msm_rpathdir = '$ORIGIN'
+	foreach p : msmdir.split('/')
+		msm_rpathdir = join_paths(msm_rpathdir, '..')
+	endforeach
+	msm_rpathdir = join_paths(msm_rpathdir, libdir)
+
 	panfrost_rpathdir = '$ORIGIN'
 	foreach p : panfrostdir.split('/')
 		panfrost_rpathdir = join_paths(panfrost_rpathdir, '..')
@@ -343,6 +350,7 @@ else
 	bindir_rpathdir = ''
 	libexecdir_rpathdir = ''
 	amdgpudir_rpathdir = ''
+	msm_rpathdir = ''
 	panfrost_rpathdir = ''
 	v3d_rpathdir = ''
 	vc4_rpathdir = ''
diff --git a/tests/meson.build b/tests/meson.build
index 16896de99..122fbd07c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -314,14 +314,6 @@ intel_xe_progs = [
 	'xe_sysfs_scheduler',
 ]
 
-msm_progs = [
-	'msm_mapping',
-	'msm_recovery',
-	'msm_shrink',
-	'msm_submit',
-	'msm_submitoverhead',
-]
-
 chamelium_progs = [
 	'kms_chamelium_audio',
 	'kms_chamelium_color',
@@ -424,15 +416,6 @@ foreach prog : intel_progs
 	endif
 endforeach
 
-foreach prog : msm_progs
-	test_executables += executable(prog, join_paths('msm', prog + '.c'),
-				       dependencies : test_deps,
-				       install_dir : libexecdir,
-				       install_rpath : libexecdir_rpathdir,
-				       install : true)
-	test_list += prog
-endforeach
-
 if chamelium.found()
 	foreach prog : chamelium_progs
 		testexe = executable(prog,
@@ -457,6 +440,8 @@ endif
 
 subdir('amdgpu')
 
+subdir('msm')
+
 subdir('panfrost')
 
 subdir('v3d')
diff --git a/tests/msm/meson.build b/tests/msm/meson.build
new file mode 100644
index 000000000..74169b5b2
--- /dev/null
+++ b/tests/msm/meson.build
@@ -0,0 +1,16 @@
+msm_progs = [
+	'msm_mapping',
+	'msm_recovery',
+	'msm_shrink',
+	'msm_submit',
+	'msm_submitoverhead',
+]
+
+foreach prog : msm_progs
+	test_executables += executable(prog, prog + '.c',
+				       dependencies : test_deps,
+				       install_dir : msmdir,
+				       install_rpath : msm_rpathdir,
+				       install : true)
+	test_list += join_paths('msm', prog)
+endforeach
-- 
2.43.2

