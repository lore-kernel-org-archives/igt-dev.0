Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16CDCD6E60
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 16:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7364A10F2D4;
	Tue,  2 Jun 2026 16:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FeIVDoy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5331610F2D4
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780416117; x=1811952117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tD/YTZYmJhGhJp7Rtz10+R3CIRQWxbbGa9tGQXrEnbk=;
 b=FeIVDoy8M45hUd2P1kLl2uYW5gjGBWmBDwCYK+l1Fj7I926eva3/WORi
 psFAtYCqmaqQcM641BZYkLN5IjeCWlWGL6dKOsG3YObKn6y5dHMUT13Sd
 bWMdDlwRZKT6VWlU1waEoYXn0ljAu3AQ5ybaUFFdK2cQbn6UUoL2/pBSh
 6IBbGIKMsqilRc+a7BoLMOh9lOlOK/KPVUGb2bcV+JmFq3j972OPfTQ5s
 hrWot+K2jAAlDc5/AlcSurhSOj4qB6yXeEDhFCuDbiVxEpnqMi6KObWwJ
 JVc/3+b/uPiJRiWYCpkY67RYkScuvyn6XdqZrCdMwWrsXcqIq0HUp30pt Q==;
X-CSE-ConnectionGUID: T4FzFtZRSumKQNI8/h1g4A==
X-CSE-MsgGUID: VKzYA4xrSN+Wkx3DmEs1kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81267454"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="81267454"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 09:01:56 -0700
X-CSE-ConnectionGUID: QN2mj7q8T8++nNZiMjOuWw==
X-CSE-MsgGUID: /UeO+3OFSaOd807nqS9o0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="248236957"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 09:01:55 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH] lib/xe/xe_query: Add xe_for_each_gt_with_type iterator
Date: Tue,  2 Jun 2026 18:01:49 +0200
Message-ID: <20260602160149.971895-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add xe_for_each_gt_with_type() to iterate only over GTs of selected
type.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/xe/xe_query.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 8815c6c66..a11dd623d 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -103,6 +103,9 @@ struct xe_device {
 	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
 	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
 	     igt_unique(__mask) &= ~(1ull << __gt))
+#define xe_for_each_gt_with_type(__fd, __gt, __typemask) \
+	xe_for_each_gt(__fd, __gt) \
+		for_if((__typemask) & BIT(xe_gt_type(__fd, __gt)))
 #define xe_for_each_tile(__fd, __tile) \
 	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
 	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
-- 
2.43.0

