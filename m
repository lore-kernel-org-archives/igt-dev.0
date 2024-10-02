Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E23CF31B4
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 11:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7E810E1FF;
	Wed,  2 Oct 2024 11:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHH7pSnU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB0410E1FF
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727868880; x=1759404880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JGT1zPky8d5oGCSOTaQkKluwM/+XrEXfUjWKApCkY4Q=;
 b=KHH7pSnUt4oqFytPX9HXoElcsyycNLq9FqXFK5UA/uvdftJL1TkAXzos
 D80Q7F8ePCFMfhwOAgrMGWKP+vSpodDvuZn2xPdgw2jbCQYDRoH6z65Nw
 EfZ++tZ5+XuBhZ+NJwXh4onQBkqsX9ly+hK0ekVaKb0jNUxUUoumAwUSO
 hgQlQ+p01ShpweINANLhkquYJdAZgYewcIUjo6R2MmZeJ9s+hMAkOCyiG
 JGcA8ZReBzuvgCCa0kl9Yptpk9tVgQc8mZfBpDVOaQ1lLPCZfPlN4ekrH
 uo6MJ7hYxkMzE2dQewOJdBaww/HTRUyo2pqYEo1wWGePzfB1CW0KgYOE6 w==;
X-CSE-ConnectionGUID: S8fgsVHPS5G5idg/G3SDvA==
X-CSE-MsgGUID: aUxwE6i0RqeHWPtFQ/CTjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="37695471"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="37695471"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:34:39 -0700
X-CSE-ConnectionGUID: foct/NA7Qjytzzf/hXjnxA==
X-CSE-MsgGUID: DYLyjVVPR5is1d3ImBQu8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="73569623"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.53])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:34:36 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t] tests: Update assertion in invalid-wait-zero-handles
Date: Wed,  2 Oct 2024 13:34:19 +0200
Message-ID: <20241002113418.24070-2-krzysztof.niemiec@intel.com>
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

The behavior of DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT has been changed in [1],
but the invalid-wait-zero-handles test has not been updated to mirror
this change. Fix the assert to check against 0 instead of -EINVAL.

[1] https://patchwork.freedesktop.org/patch/554042/

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/syncobj_timeline.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index 96d5d8b45..8e94380de 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -558,13 +558,12 @@ test_wait_bad_flags(int fd)
 }
 
 static const char *test_wait_zero_handles_desc =
-	"Verifies that waiting on an empty list of invalid syncobj handles is"
-	" rejected";
+	"Verifies that waiting on an empty list of syncobj handles returns 0";
 static void
 test_wait_zero_handles(int fd)
 {
 	struct drm_syncobj_timeline_wait wait = {};
-	igt_assert_eq(__syncobj_timeline_wait_ioctl(fd, &wait), -EINVAL);
+	igt_assert_eq(__syncobj_timeline_wait_ioctl(fd, &wait), 0);
 }
 
 static const char *test_wait_illegal_handle_desc =
-- 
2.45.2

