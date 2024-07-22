Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF43C3DA59
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 18:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EB710E272;
	Mon, 22 Jul 2024 18:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSSzWRwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF8089F27
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 18:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721673324; x=1753209324;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8l/7t9ZWfsLGX6o0apZaiCanI62Dig9IlQHkwTPmGP0=;
 b=ZSSzWRwxE+C/ye7VWvXbF6/De4YmTZYOlj3eYqLQxU3rYud1ekwSYq5E
 DhFrdJeBO7AUd5rfnRTGgqbdfjiQ+NvRvW1N3iIuUlHsV63buGz94Azad
 IHjb9U0p9tYNvltbVkt0zABtakF2Qj726+6oj5sr/4J/sr6rIrcKaFjaV
 1Z7dQC25l4ZpQfH2ttBgvL5AVlUHePNMGXkXVNtKzP7tLdcZWYhJUrk4X
 zKxYKbb+7KQkvsqX3G44ZNFZYAkB8IrgNmjlBUVD7zM2pmPETh4E5HqPa
 CRy3gUT45Bw/c3K30TAR3M2dX5UBmg9KGm71/7e8AqHp3pp0SLkgZa4cx A==;
X-CSE-ConnectionGUID: PdJGejV7Ts6JoMTCBP7o9w==
X-CSE-MsgGUID: UD3Hm+THQx6O7JvKx21iOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19134528"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="19134528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 11:35:23 -0700
X-CSE-ConnectionGUID: VpVCYCirQd+3thpT6unTSw==
X-CSE-MsgGUID: g8CoBYJkTLOOz0tS2h4Rjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="56259847"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 11:35:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t] tests/xe_query: Also allow IP version less than 20 for
 BMG media
Date: Mon, 22 Jul 2024 11:35:10 -0700
Message-ID: <20240722183511.1934050-1-matthew.d.roper@intel.com>
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

Since BMG has a media version of 13.01, MTL/ARL are no longer the only
cases where we'll see IP versions lower than 20.  Add one more exception
to the final GT IP version sanity check.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2238
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_query.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 84df24f49..c13613e0a 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -331,11 +331,16 @@ test_query_gt_list(int fd)
 				igt_assert_lte(1270, verx100);
 
 			/*
-			 * Aside from MTL/ARL, all version numbers should be
-			 * 20.00 or higher.
+			 * Aside from MTL/ARL and media on BMG, all version
+			 * numbers should be 20.00 or higher.
 			 */
-			if (!IS_METEORLAKE(dev_id))
-				igt_assert_lte(20, gt_list->gt_list[i].ip_ver_major);
+			if (IS_METEORLAKE(dev_id))
+				continue;
+			if (gt_list->gt_list[i].type == DRM_XE_QUERY_GT_TYPE_MEDIA &&
+			    IS_BATTLEMAGE(dev_id))
+				continue;
+
+			igt_assert_lte(20, gt_list->gt_list[i].ip_ver_major);
 		}
 	}
 }
-- 
2.45.2

