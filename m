Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CE0106F2EA
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 07:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4593910E9D6;
	Thu, 26 Mar 2026 07:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9EBckdv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605E710E9D6
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774511948; x=1806047948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mPeYwE+Gf6zufl3iJV0G3l7U2HmT3CrTAeF+9OgTJ8c=;
 b=j9EBckdvJ0XyAW8k6xkSd5jwLuJmWOx54zpC20VJrQ4ubk0YRD6YWdTs
 X0mL9HfNHNK5oUZtXgYZQGZYQb7El0Ba4tZWouHyuN1/gv5oT7D6GsP5m
 2e0L9b/lmM9onQrnBPCDPj1npgnOfQ4R6kqLiBQfp9RnMQkb6Fkp+o/rj
 YpUgIToBdw/btYuV3fKnoA8TxcFgnXBNHC0+eD5j3TB7gVj0Z5i05Wd7c
 p8C9Pjysl2hWV3zTy9lzcHKg+92V+uznzD6e0msaYxL/e7WgXwCPTjkn/
 nkbhXc3ORtv6PzEhzJVgC4eH3atpdmpdKAEgBBNX+6G5iIowe8N2bVHME Q==;
X-CSE-ConnectionGUID: QxgAwDbXS2KVBq2+LRWFJg==
X-CSE-MsgGUID: PEVmZ0KwRVCE8cmrNpvcFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75757718"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75757718"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:59:07 -0700
X-CSE-ConnectionGUID: VhjfndvMQyOUNfJWb3XQMA==
X-CSE-MsgGUID: ofBdec0+RpOv8ed+dwcX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="221623285"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:59:06 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 5/5] tests/intel-ci/i915.blocklist: Remove
 kms_chamelium_frames from i915 blocklist
Date: Thu, 26 Mar 2026 13:49:57 +0530
Message-ID: <20260326081957.860183-6-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326081957.860183-1-sowmiya.s@intel.com>
References: <20260326081957.860183-1-sowmiya.s@intel.com>
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

Remove igt@kms_chamelium_frames@hdmi-.*-planes-random
from i915 blocklist as we have a fix for it.

Fixes: https://patchwork.freedesktop.org/series/163296/
Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel-ci/i915.blocklist.txt | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index 1068e2e15..95eb9391c 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -89,17 +89,6 @@ igt@kms_frontbuffer_tracking@.*drrs.*
 ###############################################
 igt@kms_plane_scaling@.*downscale-factor-0-25.*
 ###############################################
-# Tends to generate invalid configurations
-# using CCS planes or configurations that
-# exceed HW capabilities resulting in sporadic
-# failure with -EINVAL.
-#
-# Maintaining extra constraints for Intel's HW
-# is too costly in comparison to the value
-# provided.
-###############################################
-igt@kms_chamelium_frames@hdmi-.*-planes-random
-###############################################
 # Broadcom
 ###############################################
 igt@vc4.*
-- 
2.48.1

