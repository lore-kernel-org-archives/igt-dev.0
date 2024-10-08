Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ED6CF0427
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 21:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788E810E08E;
	Tue,  8 Oct 2024 21:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNHvnowG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3640010E08E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 21:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728421469; x=1759957469;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tNSJhXq5Jk1JqOE2SvVq64xpr/R65ZXngd0MG76j7lY=;
 b=cNHvnowGYUDoyDIiRWzDCb5u9j4TQMAwygCG6M/ggy2MWQkfsDoIFLvU
 T0Wnp0cm7q7eSwMq1zd3krw5dwBGXMmFXz4coTrYAUn7pR8xlBA6N2BWZ
 arIo+fvMCgXtUEv/fe/I8nhyJNo2aeisy8CxN9uRxrTj8PSqclBu40l2N
 v4HHCD511rPawnPRb78bX4MwAxsUVqLuNUDt4BYDcYxnLWpbfyIbHdtct
 O/RSEt7ZwLH4z/Wgfbb7V1IYgwwP+v3kCl8ywjXQyTGS4uFKsUjJp5CZF
 JaYmUXLmpST/+TXfVO4MNf5dwaLWRzPIV+uigoDrZwtihbdqCTvmK5sME w==;
X-CSE-ConnectionGUID: DkcZehlNRoW7ib2439IBxA==
X-CSE-MsgGUID: RG4bJbgHS8CHfTMarChNJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27116234"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27116234"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:04:29 -0700
X-CSE-ConnectionGUID: ZY1KEByHRSm2tvKEd/yNSQ==
X-CSE-MsgGUID: SD3HznSnT7aoFWe1fcYJjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="76095415"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:04:28 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, kamil.konieczny@linux.intel.com,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_tlb: Print tlb inval counts on failure
Date: Tue,  8 Oct 2024 22:21:46 +0200
Message-ID: <20241008202146.993745-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Print tlb inval counts on failure with igt_assert_lt_u64()

Cc: kamil.konieczny@linux.intel.com
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_tlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
index 8104e45d8..15d89931c 100644
--- a/tests/intel/xe_tlb.c
+++ b/tests/intel/xe_tlb.c
@@ -116,7 +116,7 @@ static void tlb_invalidation(int fd, struct drm_xe_engine_class_instance *eci)
 	tlb_pos = xe_gt_stats_get_count(fd, eci->gt_id, stat);
 	igt_assert_eq(data1->data, value1);
 	igt_assert_eq(data2->data, value2);
-	igt_assert(tlb_pos > tlb_pre);
+	igt_assert_lt_u64(tlb_pre, tlb_pos);
 
 	syncobj_destroy(fd, sync[0].handle);
 	syncobj_destroy(fd, syncobj);
-- 
2.46.0

