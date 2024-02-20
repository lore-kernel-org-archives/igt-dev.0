Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D94DC48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 10:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0937510E311;
	Tue, 20 Feb 2024 10:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNcSh4HH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9059E10E2C0
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 10:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708424402; x=1739960402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wRU2stIOL9mqSCwQc6VVi1JuiFjjADfj/yvnyFwZRmQ=;
 b=NNcSh4HHDvGeEXIS33AVxCoZ0KXKLcLaXN/+H/mbA1jZJzcbhYsQ82SA
 KwXL78pKp0YR4RmMGCeybRmv6HMpm3ZzyKJ9sY9dqivYLZ4gh6/4C3VMF
 x7v+kqfe0hDAqzeYPdKp29ihPdzTDUM+IG+3aAqKgIOjYEsDzHv9wLUi4
 ocCJH9RPXaqYa1Srd67Vp01Oq934s63taHl+vtURcdR2Mxhxso1Xy1C8b
 gUQ2k5PY6ikPQLT0KRF0yPKogJBeBu6/t4Are/85O9bBWePTnXSebETyJ
 YSzzfjKu+0s3fPcfCw1LZjDESodXNY3H6gyq8f4ZAtNJZmhxh36OGYc20 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13923329"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="13923329"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 02:20:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; d="scan'208";a="35760629"
Received: from pwlazlyn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.80.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 02:20:01 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/3] tests/core_getversion: convert to subtest
Date: Tue, 20 Feb 2024 11:19:51 +0100
Message-ID: <20240220101953.64371-2-kamil.konieczny@linux.intel.com>
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

Create one basic subtest with the ioctl check.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getversion.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 9945c3855..6ec223eef 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -38,19 +38,17 @@
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
- * SUBTEST:
+ * SUBTEST: basic
+ * Description: Tests GET_VERSION ioctl of the first device.
  */
 
 IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
 		     "drmGetVersion() interface to it.");
 
-igt_simple_main
+static void check(int fd)
 {
-	int fd;
 	drmVersionPtr v;
 
-	fd = __drm_open_driver(DRIVER_ANY);
-	igt_assert_fd(fd);
 	v = drmGetVersion(fd);
 	igt_assert_neq(strlen(v->name), 0);
 	igt_assert_neq(strlen(v->date), 0);
@@ -59,5 +57,21 @@ igt_simple_main
 		igt_assert_lte(1, v->version_major);
 
 	drmFree(v);
-	drm_close_driver(fd);
+}
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = __drm_open_driver(DRIVER_ANY);
+		igt_assert_fd(fd);
+	}
+
+	igt_describe("Check GET_VERSION ioctl of the first drm device.");
+	igt_subtest("basic")
+		check(fd);
+
+	igt_fixture
+		drm_close_driver(fd);
 }
-- 
2.42.0

