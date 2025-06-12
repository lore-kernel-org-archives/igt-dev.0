Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEC5C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 14:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460DE10E60F;
	Thu, 12 Jun 2025 14:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaiBKoSB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF4610E60F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749739241; x=1781275241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xKMxOiuM80/uApWpG31Huwcm2CzPhxVlGraj2L6lQak=;
 b=XaiBKoSBV2ECNl5CpaeywEqIXdXWzwVfxV6QI407J6vuYAUkwa25weMF
 y2Fclpaq+cySdgqHPk8uXtTmOd31aEcYq+oSh5EwiO9a6nCNVD5P5gKhs
 Ob6TvPzDPr1RmvliTbWacAv/W2abRJmDVi3EX4LhJ0i8yLEDIF1dFnb1E
 /gY8bejqFPboRNHM0g1l+EjPOC/Y1WrETEvD4uEc5mIk7l3wzl42XbbqA
 bl/UsNnOyI25rK8ymBTktq6RnJbFvb6+kmbkzdfgTrz8LBsE6HxPX9vAa
 8j4UufalJv6nFRx5gy+ooo5YZgpr2URdcdo06CSfQYFnaW/5Hbu6KqMBg g==;
X-CSE-ConnectionGUID: HzB6trVwSx6hmeKvmsd21g==
X-CSE-MsgGUID: xZg0wArGRZeDpphdYdIxMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69361580"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="69361580"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 07:40:41 -0700
X-CSE-ConnectionGUID: sxPvKwEOSXenQKa0DMpZ4w==
X-CSE-MsgGUID: XOXaduqqSWOCzmlx/ObRBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152308919"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa003.jf.intel.com with ESMTP; 12 Jun 2025 07:40:37 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t] include/android: Define gboolean as bool to resolve
 Android build error
Date: Thu, 12 Jun 2025 14:38:19 +0000
Message-ID: <20250612143819.8547-1-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
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

The function g_regex_match returns a gboolean, which is not defined in
the Android environment, leading to build failure. This commit
addresses the issue by typedef-ing gboolean to bool in the
Android-specific GLib header file.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 include/android/glib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/android/glib.h b/include/android/glib.h
index 8540d3514..e12aaeebb 100644
--- a/include/android/glib.h
+++ b/include/android/glib.h
@@ -29,6 +29,7 @@ typedef char gchar;
 typedef unsigned char guchar;
 typedef void GRegex;
 typedef int GRegexMatchFlags;
+typedef bool gboolean;
 
 static inline void g_clear_error(GError **error) { }
 static inline void g_error_free(GError *error) { }
-- 
2.49.0

