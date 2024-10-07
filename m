Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A63CFB43F
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 10:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5636689E36;
	Mon,  7 Oct 2024 10:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9sx/AeI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D11F89E36
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728296793; x=1759832793;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4wAmAG2KvOgBfvIbCtNJHqTPnGor3UTvMQlbXyndMAI=;
 b=l9sx/AeId2S0HpO2iPnYrOzF8FAmtINdPAq8c584A7C1d/rVbd+IBgR8
 bo+CSGneAoB8L9/P2SbDf1y1+d421meh+VQwjRYrETYPfH7osJOoDGJfN
 gyUQVFvuKGNSC4NonrwQeGDC0/sx2umrEeZrK+usBOUwZeEpjryALCwYT
 I/hVb3NJ+Js34W1+IYd5v2bS7MwWtiXmsF3OVl26pIkxCnoCxuhXjAG0f
 3x62upSHzGJ6Ac0KA5PY/mhRUQCPkFztJNQDAxMkcasIkmdOUkfRRGwjU
 IRR5OcjBvbN+BRov37QwvNGbq9RI7QpSal6BkEn1RdxL+t/wEJ84vF4np A==;
X-CSE-ConnectionGUID: 7UwhsKEzQsq9fHeTTauSEg==
X-CSE-MsgGUID: b0qKkSHZR7GKa8R09z/IBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38091296"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="38091296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 03:26:32 -0700
X-CSE-ConnectionGUID: C1Y09/5+Q7mI2jT+FqzVkg==
X-CSE-MsgGUID: 3JSNYv/KTKyN4Kcz6FPLqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="80216952"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.158])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 03:26:31 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2] tests/syncobj_timeline: Update
 invalid-wait-zero-handles test
Date: Mon,  7 Oct 2024 12:26:12 +0200
Message-ID: <20241007102611.23544-2-krzysztof.niemiec@intel.com>
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
change. Fix the assert to check against 0 instead of -EINVAL.

v2: Change the test name to wait-zero-handles (drop the invalid- prefix)
    and correctly update the test description.

[1] https://patchwork.freedesktop.org/patch/554042/

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/syncobj_timeline.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index 96d5d8b45..a77896ec1 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -242,9 +242,6 @@
  * SUBTEST: invalid-wait-illegal-handle
  * Description: Verifies that waiting on an invalid syncobj handle is rejected
  *
- * SUBTEST: invalid-wait-zero-handles
- * Description: Verifies that waiting on an empty list of invalid syncobj handles is rejected
- *
  * SUBTEST: multi-wait-all-available-signaled
  * Description: Verifies waiting on a list of timeline syncobjs
  *
@@ -427,6 +424,9 @@
  *
  * SUBTEST: wait-for-submit-snapshot
  * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
+ *
+ * SUBTEST: wait-zero-handles
+ * Description: Verifies that waiting on an empty list of syncobj handles is accepted
  */
 
 IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
@@ -558,13 +558,12 @@ test_wait_bad_flags(int fd)
 }
 
 static const char *test_wait_zero_handles_desc =
-	"Verifies that waiting on an empty list of invalid syncobj handles is"
-	" rejected";
+	"Verifies that waiting on an empty list of syncobj handles is accepted";
 static void
 test_wait_zero_handles(int fd)
 {
 	struct drm_syncobj_timeline_wait wait = {};
-	igt_assert_eq(__syncobj_timeline_wait_ioctl(fd, &wait), -EINVAL);
+	igt_assert_eq(__syncobj_timeline_wait_ioctl(fd, &wait), 0);
 }
 
 static const char *test_wait_illegal_handle_desc =
@@ -1711,7 +1710,7 @@ igt_main
 		test_wait_bad_flags(fd);
 
 	igt_describe(test_wait_zero_handles_desc);
-	igt_subtest("invalid-wait-zero-handles")
+	igt_subtest("wait-zero-handles")
 		test_wait_zero_handles(fd);
 
 	igt_describe(test_wait_illegal_handle_desc);
-- 
2.45.2

