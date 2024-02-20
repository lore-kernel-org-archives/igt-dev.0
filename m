Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F44AC48BC4
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 10:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA4510E2C0;
	Tue, 20 Feb 2024 10:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbM3FbpZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2928510E2C0
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708424406; x=1739960406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FiONRBEZhxsfhtUIMUu1fErrxaObyh58/h3mlIltVqQ=;
 b=jbM3FbpZrSM4n5LFphmeEoDSRXjEsFDhsZ6Yw/xu2UTibkAqtUnCBeCC
 dL9vjS9UosBlH/UhzkeWemrzFl9L3hDNZqiZEK31RqcqFuS1XSWJOEIsA
 zDbfI3ni4bnfFkei06x+w+mE6tyDyWGBiZOxxoWi09Mykmc6b7hLifP7R
 vIynUnnmwetcryvrjzcl6Cz/OZk5NGMj6cs8EIFLnyyeutiBVFxf2BP3y
 Wonq1xR1hUe93EUs3MKvI2Sf06K136suZ+2mwrvqrTipr+MJ7YEXXo3aF
 t4Ff5/3IrdZNpaUWCE7u4aXPs0GlPPbVRHpoFqJNUGBz2hGyyONksIuVC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13923334"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="13923334"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 02:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="35760636"
Received: from pwlazlyn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.80.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 02:20:05 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/3] tests/core_getversion: print version info
Date: Tue, 20 Feb 2024 11:19:52 +0100
Message-ID: <20240220101953.64371-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240220101953.64371-1-kamil.konieczny@linux.intel.com>
References: <20240220101953.64371-1-kamil.konieczny@linux.intel.com>
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

Add printing of version information to basic subtest.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getversion.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 6ec223eef..8b95e2ce4 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -45,7 +45,7 @@
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
 		     "drmGetVersion() interface to it.");
 
-static void check(int fd)
+static void check(int fd, char *dst, int len)
 {
 	drmVersionPtr v;
 
@@ -56,11 +56,15 @@ static void check(int fd)
 	if (is_i915_device(fd))
 		igt_assert_lte(1, v->version_major);
 
+	snprintf(dst, len, "%s v%d.%d %s %s", v->name, v->version_major,
+		v->version_minor, v->date, v->desc);
+	dst[len - 1] = 0;
 	drmFree(v);
 }
 
 igt_main
 {
+	char info[256];
 	int fd;
 
 	igt_fixture {
@@ -69,8 +73,10 @@ igt_main
 	}
 
 	igt_describe("Check GET_VERSION ioctl of the first drm device.");
-	igt_subtest("basic")
-		check(fd);
+	igt_subtest("basic") {
+		check(fd, info, sizeof(info));
+		igt_info("0: %s\n", info);
+	}
 
 	igt_fixture
 		drm_close_driver(fd);
-- 
2.42.0

