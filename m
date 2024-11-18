Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1C5D49219
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 12:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694A810E0BF;
	Mon, 18 Nov 2024 12:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AItKhIgJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396CE10E4CA
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 12:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731933877; x=1763469877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/HXpg8WrhABBtNELDMdTbJIi3Xesh0PGeZjDL6y6L6U=;
 b=AItKhIgJlUck+DpKq6JdVwVj7jS4lwmITE7+BxpYIsQ7+CxHRuY652nt
 hJ4LLWP3G3BX+D7K0nHoBTtSTPqEEr+kf6HEkQijYRlnJpDmWbTKJS9k8
 yzQpUo0vRAExNjTTjc7Rz+bOWd0Dzk6l6INzL74c6+12mjNXq8H+mKkoP
 Yd4xYUKX7IIuTyQzbBQ5U855+NRhTCwRwRAiWj/TYe4NikUxYDhrZPFk0
 RAo7bTlzXc7rRhao6gWRldI1l+EAYX7MohpGIoYGo6/qQevULFW3K+Cfl
 l9zwbJW9PLxfHnhiZ8T4TW6jV89Q8WGJFyk8roHrcSZFV95cnzEwmaOfS g==;
X-CSE-ConnectionGUID: H/eF7RZoQY2LPQak3ePqnw==
X-CSE-MsgGUID: lgC3k1ZlTauCXzsZU2BD0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32038963"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32038963"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:44:37 -0800
X-CSE-ConnectionGUID: AfJ7ZiJeS/G8xBmD5cK6qQ==
X-CSE-MsgGUID: AzUZ/WcvQmejW2X14rZnjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89365015"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.159])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 04:44:35 -0800
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t 1/2] tests/syncobj_wait: Update
 invalid-wait-zero-handles test
Date: Mon, 18 Nov 2024 13:44:21 +0100
Message-ID: <20241118124422.11868-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241118124422.11868-1-krzysztof.niemiec@intel.com>
References: <20241118124422.11868-1-krzysztof.niemiec@intel.com>
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

This change mirrors [2] for the syncobj_wait test.

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

