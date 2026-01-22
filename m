Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7215CC44536
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 06:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2676410E206;
	Thu, 22 Jan 2026 06:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecBba2QM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BC610E206
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 06:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769064130; x=1800600130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rv10aCUJdSxp1AvK3cEAjomR5okFd1+H6KY6paM+5JQ=;
 b=ecBba2QMHgailR9ZkSu+5MRN27FaLFRGgnIb1GKXRsCLPMPVqrPYthag
 Z8bQfyXOiKrDAsmApOdk5hQor9fgwcJqMXGJE7uiIvdiy+x3viUl3Yzrd
 ITuN3zzsUy4wwYkyk4pGkEB+pdVSHTuGXiidL4+Qr0ooeqO5uBmPt6GEf
 mqNWFLTB2zHtLJTvfNiYe8vP6+ZpaBALV20ewGgUy8+4nPvNnc6Fs72nm
 Cza5Mi62C5cxzydLwRF9CfkNpcrsvNyxXVp8QVFem6saeQzp9jUbQH9Xk
 7PKK2VWSHviqh7ShE1TfjSQGcMz4/B+FDMf2eX2HJux/A9++eI2Fqe8Yk w==;
X-CSE-ConnectionGUID: gC+GmJHJSwqYLK00SQ2bXA==
X-CSE-MsgGUID: K9ew6Z2BRbaKHkIEZxjuvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="74152298"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="74152298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 22:42:10 -0800
X-CSE-ConnectionGUID: Z0U+FY8rQIKpUdHPMjfuDA==
X-CSE-MsgGUID: eImGM1clRXmFDtrXEVu3TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="210807518"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 22:42:07 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v5 1/5] tools: Rename tools/gputop to tools/gputop.src
Date: Thu, 22 Jan 2026 12:06:58 +0530
Message-Id: <20260122063702.524450-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122063702.524450-1-soham.purkait@intel.com>
References: <20260122063702.524450-1-soham.purkait@intel.com>
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
---
 tools/{ => gputop.src}/gputop.c          |  0
 tools/gputop.src/meson.build             |  1 +
 tools/{gputop => gputop.src}/utils.c     |  0
 tools/{gputop => gputop.src}/utils.h     |  0
 tools/{gputop => gputop.src}/xe_gputop.c |  0
 tools/{gputop => gputop.src}/xe_gputop.h |  0
 tools/meson.build                        | 12 +++++++-----
 7 files changed, 8 insertions(+), 5 deletions(-)
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
index 8185ba160..abd1ebc09 100644
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
+	   install : true,
+	   install_rpath : bindir_rpathdir,
+	   dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
+	   install: true)
-- 
2.34.1

