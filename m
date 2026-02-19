Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EA6E9A04C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 09:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424A510E26E;
	Thu, 19 Feb 2026 09:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFv+3AVD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB76810E26E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771494838; x=1803030838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ubbzLo7kcIymvTdPiBZP7j01Ul6MbStEOvlB9PSmgk=;
 b=WFv+3AVDWCp7GwpQjmMb5gNzJMkatpjQHO7aGISmpPQ0OIKjgvhZ2ek4
 3yJ+hZ08drCnQ8Fxv0Jv4G1bfZWoh8O5WbirwPX7rJevuY6qHg+KGpA9x
 2NwMhWCyflPPej2FFVlBKY++6FDV0lu8Ihzfo2lXxAIcuKsM/dxm+0FVx
 tOCVOGV5x2EX5VmHetpfF4d9GCpHRZDRz4AzRyv1yyIhg6sO1eFOTl6LH
 5cMbBpDjdMifz/B9b3WLqQOKOYYYqi8fuiR8MUJODSDiq1AF+Dlyy7xdK
 b5fDhEXY6QxVwpTHZOwUu5iThVyASIbmtNlU4Kt7fi9Nx6cPJTA9CrStB w==;
X-CSE-ConnectionGUID: saze8N26Qte2s1CQFyzhMw==
X-CSE-MsgGUID: N54dJKG7QeOiQYGKxz59kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="82901418"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="82901418"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:53:58 -0800
X-CSE-ConnectionGUID: fHR2Fa3GQI2ZQ+Bd08ezmw==
X-CSE-MsgGUID: AGwLVn69SzugL6CSY0V4lg==
X-ExtLoop1: 1
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:53:56 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com, vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v8 1/5] tools: Rename tools/gputop to tools/gputop.src
Date: Thu, 19 Feb 2026 15:18:00 +0530
Message-Id: <20260219094804.835429-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219094804.835429-1-soham.purkait@intel.com>
References: <20260219094804.835429-1-soham.purkait@intel.com>
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

