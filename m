Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D09C9830E
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 00:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01BA10E272;
	Sat, 17 Jan 2026 00:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dj2iMCUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC0A10E26B
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 00:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768608358; x=1800144358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5u8Ux0++yYGCM1FuSPvyyRJQ1EWXbsGXXQZWj5EXfmA=;
 b=dj2iMCUGYNis37buPphZpyP7qS3BLURKk14uPB6i1GT04upegxJ2Ez8/
 qSDPt8UU2H9ASDvKTPbrpRPiOZw11xD4lTEWNLfDifInT/sW041aBDLc9
 B4q9yWm969vXl3GGLMVFBV/APKsipOklD5KG0ooE6Om+78KlZS3COL3Tq
 fdiRKzIByOqSr1swyy4Qod+cysvJWoaHFDhMymtBYNA8A0KjgQC2ajPCS
 hOE9Usnzj3yAA2CKvix6IUEqH+8odq9gbqR7IdiC4R4DXOTfvZzTTavZ1
 pmcLWEzKodFeSgMBi0OTHPGtMSKLxDXGrW6u0Ffmq7lDwWYcfxbmCGrxU A==;
X-CSE-ConnectionGUID: kL1W5nvWRhWxiY4hPILyhg==
X-CSE-MsgGUID: fINpEy+KRkWF+hI2vwzdBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73556388"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="73556388"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 16:05:58 -0800
X-CSE-ConnectionGUID: MKJG9f/tTpirXY/sgVSmJw==
X-CSE-MsgGUID: AODqANmLR8agORnDrXxi3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="210237909"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.54.82])
 by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 16:05:57 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 4/5] lib/xe/xe_legacy: munmap BO before closing fd
Date: Sat, 17 Jan 2026 00:04:55 +0000
Message-Id: <20260117000456.26207-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260117000456.26207-1-shuicheng.lin@intel.com>
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <20260117000456.26207-1-shuicheng.lin@intel.com>
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

Unmap the mapped BO before returning in the CLOSE_FD path.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 lib/xe/xe_legacy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 6c0ed56c9..95246ea92 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -177,6 +177,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			for (i = 0; i < n_exec_queues; i++)
 				xe_exec_queue_destroy(fd, exec_queues[i]);
 		}
+		munmap(data, bo_size);
 		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
-- 
2.34.1

