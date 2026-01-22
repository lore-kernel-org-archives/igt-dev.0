Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012ADC44536
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 08:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C3810E950;
	Thu, 22 Jan 2026 08:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOCaRJZ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EE710E94C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769071876; x=1800607876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H4UJOcyxs/6unbAUEGTWepim70y8jlkr78uaLEYVL2E=;
 b=aOCaRJZ4zTWIor/Nr79HLSTXuUgBNo3jpKDzk0dvUZq73Elto6GpRPZh
 GKtuBXjkQc7d+v9dZKtOIvtywiDXhR2wMD8X5nKndHR0zhwIFG8xYLdAT
 Tq5g5UfqmhShslOKuUMfRsa875EcSynAhX4EBJX+vogeCGMSA24YiOG/F
 eoWtyZxr0Ibo74U4FvgreD90KfJdaY7Xa+S/WL72FgzgGE5tMju9bIcIS
 BQfEZcJhKyu+FvV8gGHxOSYT8LGdDm2jHtCUFQbpnzZNzSSffQPTSOBWW
 aEV8jd2oS6/3uRAOPGO85s0LQK/8HDDNRFvRIM2DUnxKbPw4Uj6yiz0hT Q==;
X-CSE-ConnectionGUID: aU41mCu6RHyFu0gPZ6oyeg==
X-CSE-MsgGUID: fa5CoPodQ4i0RvFX74vjSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70031105"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="70031105"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:50:35 -0800
X-CSE-ConnectionGUID: /Hmu0SuqSd6gj4MUCS1i6g==
X-CSE-MsgGUID: /OpAMhjBQQSytqDQuzfLMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="244280480"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:50:32 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v5 1/5] tools: Rename tools/gputop to tools/gputop.src
Date: Thu, 22 Jan 2026 14:15:22 +0530
Message-Id: <20260122084526.538837-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122084526.538837-1-soham.purkait@intel.com>
References: <20260122084526.538837-1-soham.purkait@intel.com>
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

