Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45FFCA1016
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 16:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9201710E559;
	Mon,  8 Sep 2025 16:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HwNWewHc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDB910E559
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757347661; x=1788883661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1BSiJHg4nuk5K2cFwc54HQv5WUn3q/vDEEh4ZKvLqgE=;
 b=HwNWewHcOZeFLQSbIE9VN52S1pugVxHNcCc6GHM6e+CVH4BmGjox3kcB
 NcsJ0IQMboZOnwiBSjBg8RD0INo4htyw4NFRXbQgdeykzXKXuKQV7yMgQ
 yNcKnZ62d1jWAHVxwQHMmtjkFLA+SsQI8408pPuxXOlymH44Ibnw76cSZ
 EcE7uaGy/ElQNLe4WG2zTTvjHWfHgJ0/r/KOIlRfkScgaz74PthDMJJ5/
 N99QS+3qIDZ9XeEBHp1HaiDRoHTUCdtVKXRx5Fq8r02AyM3nJcf6HU/n2
 Vu7NIi6u0kInG1hQpUnWTloALwWk6cXD2VovrW70s/rGHDptv5LfJ4zSJ Q==;
X-CSE-ConnectionGUID: mtPm5JKHQcSknwjHr8M+jA==
X-CSE-MsgGUID: 7K66MYOqQGOtwypu19lHdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59718408"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59718408"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 09:07:40 -0700
X-CSE-ConnectionGUID: rylV+7QgQeaUjrDcMlF0oA==
X-CSE-MsgGUID: hl7kNFmsSuy5XCgZX/MSTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="173284559"
Received: from unknown (HELO localhost) ([172.28.180.168])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 09:07:37 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 1/2] =?UTF-8?q?lib/xe/xe=5Fquery:=20Don=E2=80=99t=20?=
 =?UTF-8?q?assume=20sequential=20GT=20IDs=20in=20xe=5Fgt=5Ftype()?=
Date: Mon,  8 Sep 2025 18:07:22 +0200
Message-Id: <20250908160723.1723178-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250908160723.1723178-1-marcin.bernatowicz@linux.intel.com>
References: <20250908160723.1723178-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Replace direct gt_list indexing with drm_xe_get_gt() and check
gt_mask before use. This ensures xe_gt_type() works with real
GT IDs instead of assuming list index == uapi ID, consistent
with other helpers.

Fixes: 3bb0c49ac668 ("lib/xe/xe_query: Add xe_gt_type() and xe_is_main_gt() helpers")

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 lib/xe/xe_query.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 9b88cce8d..17045f3fb 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -927,12 +927,15 @@ bool xe_has_media_gt(int fd)
 uint16_t xe_gt_type(int fd, int gt)
 {
 	struct xe_device *xe_dev = find_in_cache(fd);
+	const struct drm_xe_gt *xe_gt;
 
 	igt_assert(xe_dev);
-	igt_assert_f(gt >= 0 && gt < xe_number_gt(fd),
-		     "gt %d out of range [0..%d)\n", gt, xe_number_gt(fd));
+	igt_assert(xe_dev->gt_mask & BIT(gt));
+
+	xe_gt = drm_xe_get_gt(xe_dev, gt);
+	igt_assert(xe_gt);
 
-	return xe_dev->gt_list->gt_list[gt].type;
+	return xe_gt->type;
 }
 
 /**
-- 
2.31.1

