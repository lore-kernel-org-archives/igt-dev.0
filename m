Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F572C67861
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 11:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F592112537;
	Tue,  9 Apr 2024 11:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1PT7Gpp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC714112CC8
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 11:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712661580; x=1744197580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+hEQH16MfZ5r74BA8zY3t1Ww+ZDwbveCS2PDnV99ZVU=;
 b=i1PT7GppMMTsWMbJT2ISjJBa8+72spp/LKJtWiUOZLTRksIYED+/CkcB
 4XQUBgNwq68zSH9/2A+hd/Zpw2wwx2uXteUGyi+zIFTu8mSL1oTQ/h11W
 +KozYWlqGz2nSKBsf5z7XgK/4F5Qs9cz9tONFtTETB4Upge0zhG6uALnd
 TC3hvOJTshl0cj2vIcc3178LArPCb5MSQ8oEd4FqbKiAV5R5pDbs2tqY/
 sc6LpMSsZhwXHF1bqWDfFuN1vBY7jAuBzL7+LmorXj7tjsgxCfB/rKgC9
 bj7me2hNczbb+YOiSAm0ARBFPmmx2K8r++by98AEXElFgz+7Lf2rwuEs5 Q==;
X-CSE-ConnectionGUID: CTitN93QSfKy9I5noUsTBg==
X-CSE-MsgGUID: 4MAy3G1FTAqjegcX+lJj2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7839723"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7839723"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:19:40 -0700
X-CSE-ConnectionGUID: 6xsUsDDbQhKVLAVFP6axxg==
X-CSE-MsgGUID: YW8Ai+23SXqZ6emJ4hd1Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20640470"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:19:39 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 1/5] tests/intel: Add missing Sub-category for
 xe_waitfence
Date: Tue,  9 Apr 2024 11:19:11 +0000
Message-Id: <20240409111915.2842477-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
References: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
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

Add missing Sub-category for xe_waitfence subtests.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
---
 tests/intel/xe_waitfence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 071e67bd6..45378d95d 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -140,6 +140,7 @@ waitfence(int fd, enum waittype wt)
 /**
  * TEST: Negative test for wait ufence ioctl
  * Category: Software building block
+ * Sub-category: Synchronization
  * Functionality: waitfence
  * Test category: negative test
  *
-- 
2.34.1

