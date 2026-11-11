Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58046606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WbTUzJ9H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FC110FB92;
	Wed, 11 Nov 2026 13:11:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1937710E97E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794402401; x=1825938401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CvtlKHqs9RcusagBi1VzFJbOBzg1vE1W9k5zM+9Rjk8=;
 b=WbTUzJ9HD/Uw2NyADrpC6eNmClYga5vj9mzQHvuEmK4VMkhJr9gXuQVV
 diOontnTBIpJXAh3M7dH4Qr/r3qFbBEHULH6fjG4udtZdTWCW/AVXU7Ym
 Gtn4m2Gk05qGaNZQj+BuDRKrm5AKR1qqchO+KJwbVo67uvHcaM5n86xbU
 SSibKct0JV+YYv/5xCZ9MbaLLnD4+xZuzGwHbkqumWzSJDyovtrONeFJC
 YJkuy1TlLznQEnG14zuYl8kAMDv8liYSUl10eUtZ2Fey63Krc5NsOk25h
 ov4uwwnvf2Biomuo/7sIhXTzAbPgUaIs/t74fGMqtIS08sD6fQAN1NlJx g==;
X-CSE-ConnectionGUID: JOox7pcZTZ6+rwhr8Uut3g==
X-CSE-MsgGUID: e1gvh1PgRmqRWnv3phvZ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3054402"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3054402"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:06:40 -0800
X-CSE-ConnectionGUID: UjXr4JpFTvWxzInX1bMfFw==
X-CSE-MsgGUID: j+ttdxxrTKW3mB6tp495Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8413389"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:06:38 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v8 02/10] lib/meson: Add libnl dependencies for DRM RAS support
Date: Wed, 11 Nov 2026 18:36:16 +0530
Message-Id: <20261111130624.1446908-3-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111130624.1446908-1-ravi.kishore.koppuravuri@intel.com>
References: <20261111130624.1446908-1-ravi.kishore.koppuravuri@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the required libnl Generic Netlink dependencies for DRM RAS Netlink
library support as optional

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Reviewed-by: Soham Purkait <soham.purkait@intel.com>
---
v8: Updated Meson build configuration to gracefully handle systems where libnl libraries are
    unavailable
v7: Changed the libnl dependency from mandatory to optional
---
 lib/meson.build | 5 +++++
 meson.build     | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 1fa4163c8..32d5029b8 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -164,6 +164,11 @@ lib_deps = [
 	zlib
 ]
 
+if have_libnl
+        lib_sources += 'igt_drm_ras_nl.c'
+        lib_deps += [libnl, libnl_genl]
+endif
+
 inc = [ inc, include_directories('vendor') ]
 
 if libtsi.found()
diff --git a/meson.build b/meson.build
index d7bbfd969..eec131375 100644
--- a/meson.build
+++ b/meson.build
@@ -408,6 +408,10 @@ endif
 build_testplan = get_option('testplan')
 build_sphinx = get_option('sphinx')
 
+libnl = dependency('libnl-3.0', required : false)
+libnl_genl = dependency('libnl-genl-3.0', required : false)
+have_libnl = libnl.found() and libnl_genl.found()
+
 subdir('scripts')
 
 subdir('lib')
-- 
2.34.1

