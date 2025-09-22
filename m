Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9051BCAC5AC
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 07:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A17810E3CD;
	Mon, 22 Sep 2025 07:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koB90vYK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF02710E3CD
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758526098; x=1790062098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dErs0654vIb+7wnBB/CJp/ib27ib6NpC4yfGB6YC46U=;
 b=koB90vYK86YwHsEMpGhb01kIlsRC+F4de2lVtwok+EJ8SFKDwQWvzfQi
 TzIo+3ITT0DUKHIGSvgTNT1xrHsHzjJOOTJKhACknHZmlA5msh8lP2Sqe
 AD0iSGPxex1wlewIvhHu13W5CLWu2NzTj5Y7+usywpPAwssXZqrNZIbrb
 16/MXmDb6p6rA4rSAqctKyErCTJYrxAU4RE8VpXVM+HmbbUdTyz1dsQvc
 kfXPjUy7/6VVAJ001QeAeKSUnZXPbjn0zkgZbyI58lnHE04Kd7flHQ1Ep
 hnSIPj53Iwk54BsO/v2taAkIcx0Jerdgl48bdRyB/JNg+6maiwbhqVQ8p A==;
X-CSE-ConnectionGUID: O3Hi42NRQjWtLrKxjA/7/g==
X-CSE-MsgGUID: iG3Cl4qCRMK6If394WHXqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60708123"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60708123"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 00:28:18 -0700
X-CSE-ConnectionGUID: Rp80VpPvQ2SZ3af2oIkKVQ==
X-CSE-MsgGUID: IuiFgnYdThq7ZvjdGKt0tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176013563"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:28:17 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_vrr: remove check for PR support in sink
Date: Mon, 22 Sep 2025 13:14:01 +0530
Message-Id: <20250922074401.2494339-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250922074401.2494339-1-kunal1.joshi@intel.com>
References: <20250922074401.2494339-1-kunal1.joshi@intel.com>
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

LOBF can be enabled on sinks that do not support PR
as well.

Bspec: 71041
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d47a148c5..ce75c7123 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -967,12 +967,6 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 			return false;
 		}
 
-		if (!psr_sink_support(data->drm_fd,
-				      data->debugfs_fd, PR_MODE, NULL)) {
-			igt_info("LOBF not supported\n");
-			return false;
-		}
-
 		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
 		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
 			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
-- 
2.25.1

