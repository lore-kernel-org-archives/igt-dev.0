Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F182AC5DF9C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 16:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E36F10E161;
	Mon, 24 Aug 2026 16:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0hxLqX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D6210E15F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787589727; x=1819125727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fl8RGSIm/ZVX2EiyGQJZT9u2KPlKaDFR4yNLus+Kkj4=;
 b=W0hxLqX1G7DE49K8EZEi5NBwaJNHxjSTp9B0pZT2RsGphDBU/mHOchQs
 8G2Q5rAHCsOr7pGH4lz6EnyNHT6+JV6zhmU3Gf3dD0eSc8JPA2O+XZYz0
 RjoE41nl+VB2opQg3u9F+KooPy34kZcWoHQC8A2Zoo7XVy0UzeMsBZBfn
 LmVvHbSUIH7jt/1fGqp6nxiYWzUlnp6ukLYY4EqdP0KyjMVOG9eZtFDd2
 msPRe3i2NOld9ZiSm/FE279S6d6lpSIMygYrEbhpNiROXKBjf6NQtNbmL
 IyeFIZJhuleZjaUCiSugwJqGisq6xC1/UVNmPYzj76p/Q+pP+zhHRODlr Q==;
X-CSE-ConnectionGUID: lUFf70sDTH+1iYMJIEJ2og==
X-CSE-MsgGUID: CLhEUeHtQ4ytURPSUfMDgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88105677"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="88105677"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:42:06 -0700
X-CSE-ConnectionGUID: 8A29k4eCSF+ufVgJEfDK/w==
X-CSE-MsgGUID: sytH1N47SDCtCf14ZekGwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="268993374"
Received: from unknown (HELO rkoppura-Z790I-AORUS-ULTRA.iind.intel.com)
 ([10.190.239.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:42:05 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 02/10] lib/meson: Add libnl dependencies for DRM RAS support
Date: Mon, 24 Aug 2026 22:11:25 +0530
Message-Id: <20260824164133.129138-3-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
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

