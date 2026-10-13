Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4704CCC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E325F10E5E5;
	Tue, 13 Oct 2026 19:09:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A291C10E5E5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918447; x=1823454447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6t68Qq0DIXCTJXquQTgqlSqHgKuIsmic+aURhXbp+Nc=;
 b=euBuuwA/pZlPNNIxvs+nRIkp2jiYb7gwSTmvNmtmj5aXLDjAJr8ZGhBr
 xjnTmOyYILFx2SURLoALUowXM3ChTM73VNgM+vz41Ir3gvyj1W+EEX83U
 uuiIxJ0XCGF2R/KOpmre5Bw8XKKmjFpOpiEDCd0JD/Vixbevg9Fl7lRj9
 rdMBM3aObPFYebBhXiS8jnvp5tNRqrwaF83tc1aPj+y34jQcb8PZuKFQh
 8ZaCKEK4UfxABsUc0L7TckFOrBvoF+/1PQKHeRdn9YQjnZFowo0aW8bHQ
 eizJfwvVapcK9yUcFdpPpMJt7YiiyslAe7lfDOsnXguKdDvC6A7f4Gwff g==;
X-CSE-ConnectionGUID: EZ12Lp5GT1OFnOhudbna/w==
X-CSE-MsgGUID: DbGsvx67TfGk6d1ztfjj1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687220"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687220"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:27 -0700
X-CSE-ConnectionGUID: ID9uJ1SCSuq9LYMsDkbuSw==
X-CSE-MsgGUID: N3DDYOf9Qoqvd1OmWS2l1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004448"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:24 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 02/10] lib/meson: Add libnl dependencies for DRM RAS support
Date: Wed, 14 Oct 2026 00:36:43 +0530
Message-Id: <20261013190651.897241-3-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
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

Add the required libnl Generic Netlink dependencies for DRM RAS Netlink
library support.

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v5: Removed libnl-cli and libnl-utils packages from dependencies (Soham)
---
 lib/meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 4af346b43..df3046f46 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -141,6 +141,11 @@ lib_sources = [
 	'vendor/uwildmat/uwildmat.c',
 ]
 
+libnl = declare_dependency(dependencies : [
+	dependency('libnl-3.0', required : true),
+	dependency('libnl-genl-3.0', required : true),
+])
+
 lib_deps = [
 	cairo,
 	glib,
@@ -148,6 +153,7 @@ lib_deps = [
 	libdrm,
 	libdw,
 	libkmod,
+        libnl,
 	libpci,
 	libudev,
 	math,
-- 
2.34.1

