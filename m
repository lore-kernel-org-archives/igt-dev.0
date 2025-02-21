Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F73C021B5
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 16:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFA610EB06;
	Fri, 21 Feb 2025 16:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1Ivn2kY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F7010EB0A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 16:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740156775; x=1771692775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PdxjoLDLSa70KdMnKZ8TqXk/7mvChg4TvKQTBU32CyU=;
 b=j1Ivn2kYPsMHChbhVlT6y2Fu0FCNMrrlBfltBF2tGxcf+LJpp7wJUo+I
 xC8gHAZjSUp/4GTdkSUNF1oLv9CTD4dxSNe+WG4JX1lMBCdtD19Tf0SDG
 fCCphprU9KvM75Tervkftm/Jff8N5iwTzzm0i7taXWFaYG8x462EpOkYk
 9UOvXbHOVEsZHo1JTGXN99VD+rbdq/S0tsYgfvdy6ddRZD6TpFH8jVmll
 dYIt//H2jtsNG3PVjv0G1dfX3CiRJZVPtZFMe7V8qQWzNzZo8A/dW0wUa
 TW6V764ZPYBiYCFvlNBWTS00k8AyBX5kuTslsEPur9swGbgS3kZdoVxDR w==;
X-CSE-ConnectionGUID: NRy1xTQgSiO6F+GePHjAEQ==
X-CSE-MsgGUID: /CnCkZaWTdSauJAXVQudFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41186752"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41186752"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:55 -0800
X-CSE-ConnectionGUID: PvdM3NAIR2iH6GHpnQwhTw==
X-CSE-MsgGUID: GLAT8py7QKi38Pxn1JTZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120517635"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:53 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 11/11] lib/igt_frame: Use igt_dynamic_subtest_name()
Date: Fri, 21 Feb 2025 22:27:49 +0530
Message-Id: <20250221165749.460347-12-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221165749.460347-1-swati2.sharma@intel.com>
References: <20250221165749.460347-1-swati2.sharma@intel.com>
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

For dumped images, print dynamic subtest name too.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_frame.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/lib/igt_frame.c b/lib/igt_frame.c
index 45523a79f..ff3597718 100644
--- a/lib/igt_frame.c
+++ b/lib/igt_frame.c
@@ -63,19 +63,22 @@ static void igt_write_frame_to_png(cairo_surface_t *surface, int fd,
 	char path[PATH_MAX];
 	const char *test_name;
 	const char *subtest_name;
+	const char *dynamic_subtest_name;
 	cairo_status_t status;
 	int index;
 
 	test_name = igt_test_name();
 	subtest_name = igt_subtest_name();
+	dynamic_subtest_name = igt_dynamic_subtest_name();
 
 	if (suffix)
-		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s-%s.png",
-			 igt_frame_dump_path, test_name, subtest_name, qualifier,
-			 suffix);
+		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s-%s-%s.png",
+			 igt_frame_dump_path, test_name, subtest_name,
+			 dynamic_subtest_name,  qualifier, suffix);
 	else
-		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s.png",
-			 igt_frame_dump_path, test_name, subtest_name, qualifier);
+		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s-%s.png",
+			 igt_frame_dump_path, test_name, subtest_name,
+			 dynamic_subtest_name, qualifier);
 
 	igt_debug("Dumping %s frame to %s...\n", qualifier, path);
 
@@ -110,6 +113,7 @@ void igt_write_compared_frames_to_png(cairo_surface_t *reference,
 	char *id;
 	const char *test_name;
 	const char *subtest_name;
+	const char *dynamic_subtest_name;
 	char path[PATH_MAX];
 	int fd = -1;
 
@@ -120,13 +124,16 @@ void igt_write_compared_frames_to_png(cairo_surface_t *reference,
 
 	test_name = igt_test_name();
 	subtest_name = igt_subtest_name();
+	dynamic_subtest_name = igt_dynamic_subtest_name();
 
 	if (id)
-		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s.txt",
-			 igt_frame_dump_path, test_name, subtest_name, id);
+		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s-%s.txt",
+			 igt_frame_dump_path, test_name, subtest_name,
+			 dynamic_subtest_name, id);
 	else
-		snprintf(path, PATH_MAX, "%s/frame-%s-%s.txt",
-			 igt_frame_dump_path, test_name, subtest_name);
+		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s.txt",
+			 igt_frame_dump_path, test_name, subtest_name,
+			 dynamic_subtest_name);
 
 	fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
 	igt_assert(fd >= 0);
-- 
2.25.1

