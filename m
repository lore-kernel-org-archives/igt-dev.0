Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE9AE7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 14:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BD810E4B7;
	Mon,  9 Dec 2024 14:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTezw1GG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356F310E4B7
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733754282; x=1765290282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j/TPHCW7tTMN9bGDM7TXSAaugaLVvVynrNDrnfmz9YY=;
 b=FTezw1GG9qMBRofJ0XoqrlLkNO7EkcyUah7VdiRHarm5yynHNXRayxx3
 NILYD1rSfHvjBhTO52LzLCAnHWK0XvGmYWQHeKoQY8wmYV7XYs8RkZgHY
 vcZ6dz6kOp/qMK5B3ZkHwJYJq6hksJy+OJrQycSPbtkmdcoNOmpNoOi5d
 cQP/TU6uV6WLeBKx5tdPoUNXW64mUscRCs0TOx4c/blijzVZSMfKFv32k
 L2UyCwXsndNKRi1w6wyaRj910rtq8pyHssaNSA8YNTLlabMq5m2jQAmEU
 tLSUigeb9F5WjySHfSyMPutTO/DbiYDNkD2qizicN+akYOpZQQ/UtS54f A==;
X-CSE-ConnectionGUID: ROox4/jdRy2LXd+RyuJ9cg==
X-CSE-MsgGUID: KR6yQoJQRXO3dd57gjQVJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33969005"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="33969005"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:24:42 -0800
X-CSE-ConnectionGUID: 9DnxvXXqRtehiP4LemcRKQ==
X-CSE-MsgGUID: QxogCLhAR1G9q2XYDX2fow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="94776231"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:24:40 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, marcin.bernatowicz@linux.intel.com,
 michal.wajdeczko@intel.com, pawel.sikora@intel.com
Subject: [PATCH i-g-t v4 4/4] tools/vmtb: Install VMTB with IGT build system
Date: Mon,  9 Dec 2024 15:24:23 +0100
Message-Id: <20241209142423.2718734-5-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20241209142423.2718734-1-adam.miszczak@linux.intel.com>
References: <20241209142423.2718734-1-adam.miszczak@linux.intel.com>
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

Integrate VMTB into the IGT build system: introduce a new meson
build option 'vmtb' to enable VMTB sources installation
in a libexec directory by default:
   /usr/local/libexec/igt-gpu-tools/vmtb/

VMTB is not enabled in a default IGT meson configuration,
to build and install it, use the following command:
   meson build -Dvmtb=enabled && ninja -C build install

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 meson.build       | 2 ++
 meson_options.txt | 5 +++++
 tools/meson.build | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/meson.build b/meson.build
index 64f57f232..0f26f95c8 100644
--- a/meson.build
+++ b/meson.build
@@ -91,10 +91,12 @@ build_docs = get_option('docs')
 build_tests = not get_option('tests').disabled()
 build_xe = not get_option('xe_driver').disabled()
 build_xe_eudebug = get_option('xe_eudebug').enabled()
+build_vmtb = get_option('vmtb').enabled()
 with_libdrm = get_option('libdrm_drivers')
 
 build_info = ['Build type: ' + get_option('buildtype')]
 build_info += 'Build Xe EU debugger test framework: @0@'.format(build_xe_eudebug)
+build_info += 'Build VM Test Bench: @0@'.format(build_vmtb)
 
 inc = include_directories('include', 'include/drm-uapi', 'include/drm-uapi-experimental', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
 
diff --git a/meson_options.txt b/meson_options.txt
index c410f9b77..e23402b36 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -47,6 +47,11 @@ option('xe_eudebug',
        value : 'disabled',
        description : 'Build library and tests for Xe EU debugger')
 
+option('vmtb',
+       type : 'feature',
+       value : 'disabled',
+       description : 'Build VM Test Bench')
+
 option('libdrm_drivers',
        type : 'array',
        value : ['auto'],
diff --git a/tools/meson.build b/tools/meson.build
index 48c9a4b50..38b04851c 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -113,6 +113,10 @@ if libudev.found()
 			install : true)
 endif
 
+if build_vmtb
+	install_subdir('vmtb', install_dir: libexecdir)
+endif
+
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
-- 
2.39.1

