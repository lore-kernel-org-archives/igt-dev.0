Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A621E9D83B
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 06:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF1B10E1DA;
	Mon,  6 Apr 2026 06:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+86UBcZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3967710E023
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 06:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775455899; x=1806991899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ubbzLo7kcIymvTdPiBZP7j01Ul6MbStEOvlB9PSmgk=;
 b=X+86UBcZriBGCR/Toocn7lrnLL8bOMi1/xtai6O7vLn/ZGtxBLuWs2ZR
 ha9EptNXFDc9FnNJN38bn+rAyW8d6IVMvh8G3hOmIGWAPY8Ub6xFIpWRk
 UcCze/IvsyQHr8pemqVUJjti9KHIs2XtT238EgYi470dukU7+F2aPDh9q
 +81BDSposkHHJXZ5bx9hD2grl/BLg/SC1Y6eX4EcB3brEdUjfncKlF1Zg
 2m2fjmp+Dxl4latvV7oVXXrVKZVbUBvsHNTd8n8Me5xQXa/5mSTVq0BsZ
 N1X3K+IKOnzvZLiYo6MfJ/gWXOxc9DY8nJobVma+CTiAv1ZVgzPjGhpMC Q==;
X-CSE-ConnectionGUID: 9cf4NqC4Q82hTc3QL7tA0g==
X-CSE-MsgGUID: rpVRjqOAQPixNsrSfq4cLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76421188"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76421188"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:11:38 -0700
X-CSE-ConnectionGUID: mA27pICJRQWhYvFCp9eTVw==
X-CSE-MsgGUID: W5enRArIRsO8Rd24ZlQX1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="226968729"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:11:35 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 tvrtko.ursulin@igalia.com, tursulin@ursulin.net, lucas.de.marchi@gmail.com
Subject: [PATCH i-g-t v10 1/5] tools: Rename tools/gputop to tools/gputop.src
Date: Mon,  6 Apr 2026 11:34:24 +0530
Message-Id: <20260406060428.2734117-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260406060428.2734117-1-soham.purkait@intel.com>
References: <20260406060428.2734117-1-soham.purkait@intel.com>
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

The GPUTOP source directory is renamed to gputop.src
under tools/ path.

v1:
 - Add meson build files accordingly to generate
   the binary under tools. (Kamil)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/{ => gputop.src}/gputop.c          |  0
 tools/gputop.src/meson.build             |  1 +
 tools/{gputop => gputop.src}/utils.c     |  0
 tools/{gputop => gputop.src}/utils.h     |  0
 tools/{gputop => gputop.src}/xe_gputop.c |  0
 tools/{gputop => gputop.src}/xe_gputop.h |  0
 tools/meson.build                        | 11 ++++++-----
 7 files changed, 7 insertions(+), 5 deletions(-)
 rename tools/{ => gputop.src}/gputop.c (100%)
 create mode 100644 tools/gputop.src/meson.build
 rename tools/{gputop => gputop.src}/utils.c (100%)
 rename tools/{gputop => gputop.src}/utils.h (100%)
 rename tools/{gputop => gputop.src}/xe_gputop.c (100%)
 rename tools/{gputop => gputop.src}/xe_gputop.h (100%)

diff --git a/tools/gputop.c b/tools/gputop.src/gputop.c
similarity index 100%
rename from tools/gputop.c
rename to tools/gputop.src/gputop.c
diff --git a/tools/gputop.src/meson.build b/tools/gputop.src/meson.build
new file mode 100644
index 000000000..ec39f4c7a
--- /dev/null
+++ b/tools/gputop.src/meson.build
@@ -0,0 +1 @@
+gputop_src = files('gputop.c')
diff --git a/tools/gputop/utils.c b/tools/gputop.src/utils.c
similarity index 100%
rename from tools/gputop/utils.c
rename to tools/gputop.src/utils.c
diff --git a/tools/gputop/utils.h b/tools/gputop.src/utils.h
similarity index 100%
rename from tools/gputop/utils.h
rename to tools/gputop.src/utils.h
diff --git a/tools/gputop/xe_gputop.c b/tools/gputop.src/xe_gputop.c
similarity index 100%
rename from tools/gputop/xe_gputop.c
rename to tools/gputop.src/xe_gputop.c
diff --git a/tools/gputop/xe_gputop.h b/tools/gputop.src/xe_gputop.h
similarity index 100%
rename from tools/gputop/xe_gputop.h
rename to tools/gputop.src/xe_gputop.h
diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..521607a4c 100644
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
@@ -123,3 +118,9 @@ endif
 subdir('i915-perf')
 subdir('xe-perf')
 subdir('null_state_gen')
+
+subdir('gputop.src')
+executable('gputop', sources : gputop_src,
+	   install : true,
+	   install_rpath : bindir_rpathdir,
+	   dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],)
-- 
2.34.1

