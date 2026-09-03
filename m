Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3E0C624D4
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 07:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F31A10F438;
	Thu,  3 Sep 2026 07:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gw7P864H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011ED10F427
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 07:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788420854; x=1819956854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OOUMUNPGB1jy8KmTSRWqpgstriP1ApmTiLbb3vib5jc=;
 b=Gw7P864HUzmh7h2HzZNr78aOjmTrLqElJmiUrey4u3rJ4uwdzTrEXBtM
 QuZFdrTMLLd4OQjR+W/KXabiSzmeN/G8sqfKUqLQxWbGbhOIAzukYDOsn
 KbVaZl2wvGwV1myle3fAYgMPPEGiOg4Qa1BqO8+Mt/J6mJSgcIu6twv1i
 gR8PdJGwZAgdntZRwZAB4AkDcniFsfeTx1AyzIDxfvnJbZUveshiP6QAZ
 dLk0mZfSk8dWvoBRL6EgyhwJ1s21kZ/I+ec1sIRnbb3Aomz7+WGqeOA8i
 5NTa2ddwby7yQD2qD/yPqHkTxw0DNNgxYjoLyYM1wgr4hhPa+tRDGXM6m w==;
X-CSE-ConnectionGUID: 2fPERHSNTfSCuM7v+h92Cg==
X-CSE-MsgGUID: sXHLsAjsTfyq8RhIopg31w==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88655708"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88655708"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:13 -0700
X-CSE-ConnectionGUID: Kv+5ZbS5SN2bzdciISviCg==
X-CSE-MsgGUID: T/5k2b8ySlKBDrVQh4DKhg==
X-ExtLoop1: 1
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:10 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Jadav Raag <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 02/10] lib/meson: Add libnl dependencies for DRM RAS support
Date: Thu,  3 Sep 2026 13:03:27 +0530
Message-Id: <20260903073335.339540-3-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
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

Cc: Purkait Soham <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Jadav Raag <raag.jadav@intel.com>
Cc: Nilawar Badal <badal.nilawar@intel.com>
Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 lib/meson.build | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 4af346b43..7248bbc2d 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -141,6 +141,13 @@ lib_sources = [
 	'vendor/uwildmat/uwildmat.c',
 ]
 
+libnl = declare_dependency(dependencies : [
+	dependency('libnl-3.0', required : true),
+	dependency('libnl-genl-3.0', required : true),
+	dependency('libnl-cli-3.0', required : true),
+	dependency('libnl-utils', required : false),
+])
+
 lib_deps = [
 	cairo,
 	glib,
@@ -148,6 +155,7 @@ lib_deps = [
 	libdrm,
 	libdw,
 	libkmod,
+        libnl,
 	libpci,
 	libudev,
 	math,
-- 
2.34.1

