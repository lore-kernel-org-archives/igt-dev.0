Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267C0D0D157
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 18:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28DD10E649;
	Wed,  7 Jan 2026 18:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJQ4yc5+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F61810E649
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767810780; x=1799346780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j6Tr7rAIJ3c6kdxL4lBWJs8qwxDdIHGdxHn0BQj5/ss=;
 b=mJQ4yc5+mbtUoc0d3SRL/IgC44siWGWkwH6YpbmQH+xCiCAymEA0z8E9
 PFOYZGhmk/zJ4su9vBLiL8Cdf3TuFK6GnAQNLabM5DeWCud9UMSFVbq6M
 aqFW+AF5MlnGEvw2D//mh4upCDjtkUVaZYD2oUArpzjdnkkE1DthRREZC
 uSwJCa433k+puyMlcdBpbjVRtWA9WuaS4nxYSprF4CguUAVNDwhie6dmy
 0ekHOAlfPHwwfUNlAhUzjYj2weLEDVFCfXNQ89EkjGSOIZPX5MoLItZGm
 OfOgSrM2MdIzh3HXQjC5eqJ0LxtPpBvNsZ+J4nPb9RcoPXTJZ8MGXmTiR A==;
X-CSE-ConnectionGUID: gKLXNOnWR2CJkp6u9TxZZg==
X-CSE-MsgGUID: zlHmrnHSQBiNo39HYKIzlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80549474"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="80549474"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:32:59 -0800
X-CSE-ConnectionGUID: i6p4R6jHT36dNTz57HMTcQ==
X-CSE-MsgGUID: gZAcC9P2SjOxmj2WgcDP0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207846081"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:31:39 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 5/6] tools/gputop.src/meson: Change meson build files
 accordingly to generate the binary under tools.
Date: Wed,  7 Jan 2026 23:56:53 +0530
Message-Id: <20260107182654.84173-6-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107182654.84173-1-soham.purkait@intel.com>
References: <20260107182654.84173-1-soham.purkait@intel.com>
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

Meson build files are changed to generate the binary under tools
directory.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop.src/meson.build |  1 +
 tools/meson.build            | 12 +++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)
 create mode 100644 tools/gputop.src/meson.build

diff --git a/tools/gputop.src/meson.build b/tools/gputop.src/meson.build
new file mode 100644
index 000000000..e95657fca
--- /dev/null
+++ b/tools/gputop.src/meson.build
@@ -0,0 +1 @@
+gputop_src = files('gputop.c', 'utils.c', 'xe_gputop.c')
diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..db1a3ebfc 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -70,11 +70,6 @@ if libudev.found()
 		   install : true)
 endif
 
-executable('gputop', 'gputop.c',
-           install : true,
-           install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
-
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
 	   dependencies : tool_deps,
@@ -123,3 +118,10 @@ endif
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
+
+subdir('gputop.src')
+executable('gputop', sources : gputop_src,
+           install : true,
+           install_rpath : bindir_rpathdir,
+           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
+	   install: true)
-- 
2.34.1

