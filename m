Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77763D0D169
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 18:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8D310E64F;
	Wed,  7 Jan 2026 18:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSqQ4s6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B04910E64F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767811347; x=1799347347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j6Tr7rAIJ3c6kdxL4lBWJs8qwxDdIHGdxHn0BQj5/ss=;
 b=DSqQ4s6RaV5WcNUxhWXWdmvDx66B1RiDEyjfjkOF5jeUVTU9EVr07e0E
 QJ7LfvR64wFk41A0RHbtJWMu3PqEJQs3eBbVNa+BPUjFXVIdhXJjUqU0l
 UPSdE1lRyqC9Omd1ffpOs/dGyCPfdiy/ymTJVVlQzjc48mh+wNHXRjZqw
 O0hJAYIY5mz1duWoRqa/Mg5RyY6W6ZRMUvGnNkiLwLqgAFqQUUnT+Cs9O
 t9jj8ZYuVezmGkps0UdFOQbsKoGvcchaxRleZt7iSzaAErLW1YLC2Gl+L
 291FYxshOSZFMxHrrnnaX/UakeoaPiMJGvtynOOTqB/4aAmbWIz4yqZjH A==;
X-CSE-ConnectionGUID: j/GsOXdNSAa67A99LoWaOQ==
X-CSE-MsgGUID: 1at7EwwYTwmyqRl5t8cXwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69236263"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69236263"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:42:27 -0800
X-CSE-ConnectionGUID: 9x57YYq8RneHkTkq/2UZyw==
X-CSE-MsgGUID: AZeZ+tlwT1Ksf2QrAL7akQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202199883"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:42:25 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 5/6] tools/gputop.src/meson: Change meson build files
 accordingly to generate the binary under tools.
Date: Thu,  8 Jan 2026 00:07:38 +0530
Message-Id: <20260107183739.84597-6-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107183739.84597-1-soham.purkait@intel.com>
References: <20260107183739.84597-1-soham.purkait@intel.com>
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

