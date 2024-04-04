Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEECCD1284
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 15:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C13E10E31D;
	Thu,  4 Apr 2024 15:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PxzADbVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489C010E31D
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712246018; x=1743782018;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=USqu38E4eY692ES+TyEM7HDxkh268N+Sow3r1Xzi4PM=;
 b=PxzADbVfazxCaJ0bctPO3k0+vn2QiqbLGprZKAheL27EfZveMBWV8vwZ
 jmiZmj/f/O3T+jen84SIPi4/9+qWMPA9wB24qVLa8na4x5/jRQ8a/1IIS
 f3UOjgRNybxDOhNSTFr8E7hjj3xaU2veu2WLqj/fgKH0htVib5kmpBW3N
 bZkwsdQszgtqQNmaT9VqDoHAPXSJx9W4XmTde4j2nchI//z+5uYH1cwqL
 //oJAzQ8JhYCKwM9xHjQ5glgSRdYHk7zWOMXiOYfBvd+p0Xo6DfO0HX/j
 yO0iNIa33yUme2lkcbTVXPTtTxygYW/nHGA9USe490m/4ZN/qMzbOG94C g==;
X-CSE-ConnectionGUID: U8PBGUMVRHyKJ89c+o0u+g==
X-CSE-MsgGUID: YfCLvur6RqeND1ux64vfGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7777553"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7777553"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:53:27 -0700
X-CSE-ConnectionGUID: UnceBHG6QxKKOJYrV16E5w==
X-CSE-MsgGUID: p+jgsUbsRye7Xs7Jy70boQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="19423956"
Received: from unknown (HELO localhost) ([10.245.246.95])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:53:25 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_queue_property: move skip into
 subtest
Date: Thu,  4 Apr 2024 17:53:20 +0200
Message-ID: <20240404155320.98116-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

Skips in fixture are safe to use just after begin of igt_main()
when they be working for all subtests. Later on, when used in
fixture they can mislead developers reading logs, so move one
into respective subtest.

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_queue_property.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 57baae305..21c51bae5 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -234,13 +234,14 @@ igt_main
 	igt_subtest_group {
 		igt_fixture {
 			sys_fd = igt_sysfs_open(xe);
-			igt_require(sys_fd != -1);
-			close(sys_fd);
+			if (sys_fd != -1)
+				close(sys_fd);
 		}
 
 		for (int i = 0; i < count; i++) {
 			for (typeof(*tests) *t = tests; t->name; t++) {
 				igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
+					igt_require(sys_fd != -1);
 					xe_for_each_gt(xe, gt) {
 						int engines_fd = -1;
 						int gt_fd = -1;
-- 
2.42.0

