Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB78D5CCB3
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 14:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C9C10E7AD;
	Wed, 30 Oct 2024 14:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yz2M8TMa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7C810E7AD
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 14:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730299997; x=1761835997;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zibfesmrlw9uHhdU090MqXnJ55+LfK3fQgfT8JeeOsQ=;
 b=Yz2M8TMapjc9igbgs8aS+Ti2NbYEclnXdNXnLHuQMPBAsLVLeWyUMNpZ
 /qvfG576I1A/XZtGakYoNd37zMAWXZqpJQetJ8rBxJIzkuBVKKrvjd6c4
 wgS9kxsmxJ0QqVz1uQoden8fon1P+TsgDmePCLJeB0HTr5sfTcv+tG1LX
 2GGWpG7Mrz7LAPPa1VSdVb069tihH/NRnq+jgd8bycejjeqyTttVBXsui
 +OApC6IpvgFdJ0iuhgr49GD1JJ+Or+l0dYWig+rum+i2lXn/jNyq1qC9f
 SJlhpX00Bby2ts00TdI8Xekvu2BQH9oWnaYWX1Bk/zAZqR9BaoZUYqsxe w==;
X-CSE-ConnectionGUID: UwK5AeeGTkKkSerPNRgUrQ==
X-CSE-MsgGUID: 7phoogE/T1y1qtrzq+YKSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30155057"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30155057"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 07:53:17 -0700
X-CSE-ConnectionGUID: JbCJGpJsS9abIFh54rzRXA==
X-CSE-MsgGUID: nQfHia5IRqGSyi9pMSpONw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="119787865"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 07:53:16 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t] tests/syncobj_wait: Update invalid-wait-zero-handles
 test
Date: Wed, 30 Oct 2024 15:48:22 +0100
Message-ID: <20241030144821.35043-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

The behavior of DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT has been changed in [1]
to accept empty lists of syncobj handles, but the
invalid-wait-zero-handles test has not been updated to mirror this
change. Fix the assert to check against 0 instead of -EINVAL, and rename
the test to wait-zero-handles as this is no longer an invalid scenario.

This change mirrors [2], but for the syncobj_wait test.

[1] https://patchwork.freedesktop.org/patch/554042/
[2] https://patchwork.freedesktop.org/patch/618483/

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/syncobj_wait.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index be7e67163..e5f251205 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -80,8 +80,6 @@
  *
  * SUBTEST: invalid-wait-illegal-handle
  *
- * SUBTEST: invalid-wait-zero-handles
- *
  * SUBTEST: multi-wait-all-for-submit-signaled
  *
  * SUBTEST: multi-wait-all-for-submit-submitted
@@ -177,6 +175,8 @@
  * SUBTEST: wait-for-submit-delayed-submit
  *
  * SUBTEST: wait-for-submit-snapshot
+ *
+ * SUBTEST: wait-zero-handles
  */
 
 IGT_TEST_DESCRIPTION("Tests for the drm sync object wait API");
@@ -297,7 +297,7 @@ static void
 test_wait_zero_handles(int fd)
 {
 	struct drm_syncobj_wait wait = { 0 };
-	igt_assert_eq(__syncobj_wait(fd, &wait), -EINVAL);
+	igt_assert_eq(__syncobj_wait(fd, &wait), 0);
 }
 
 static void
@@ -918,7 +918,7 @@ igt_main
 	igt_subtest("invalid-wait-bad-flags")
 		test_wait_bad_flags(fd);
 
-	igt_subtest("invalid-wait-zero-handles")
+	igt_subtest("wait-zero-handles")
 		test_wait_zero_handles(fd);
 
 	igt_subtest("invalid-wait-illegal-handle")
-- 
2.45.2

