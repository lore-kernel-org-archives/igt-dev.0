Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F057CD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 08:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FA310EEC3;
	Wed, 17 Jun 2026 08:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+7Rgl4S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2081510EEBC
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 08:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781685354; x=1813221354;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cXS6dauPn+cxWwbbpy2J1PD1w1VGlQO/3+0JLyBpUrA=;
 b=R+7Rgl4Sem7PWUEAcGdHp2njvg/rdJRUJFTmOF51fMw42ePFXi3xgtdi
 KUMTFZ1ndAeqZcHGtViIJTF0HmIzj3S01oQMhxtHUlAXbWScKsBCqCp0X
 bGMQJmezJmaddFVJKzw5+GeAm3Zublfh6xnwLj82pCELS9FrrK9MmQeG6
 YICu/xVnbloO95RAtrKf2/8h2EolOHgbz394qevdYdtv3z4wa5wkTa7hv
 6JoSsvC7i3iEKGUxmeYecbkfgqMMTrS2EUvaUWUU8aZgZrZ1HAOutxL7k
 fG0mBD9ZYcv4xe4DJMuWTHpsgzdU5A6dgff6Y8/IGMkNMcjEMpa/CoXip Q==;
X-CSE-ConnectionGUID: BQ8ip8aRQDOoyMj9NBJoXg==
X-CSE-MsgGUID: OUtWesY5ROS0LmClPWKIfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="85030545"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="85030545"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 01:35:54 -0700
X-CSE-ConnectionGUID: yYHEwSEKRMyMoIYuXrMkKw==
X-CSE-MsgGUID: U1FOH+zkR6uc+ApQe1kn4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="272069445"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa001.fm.intel.com with ESMTP; 17 Jun 2026 01:35:52 -0700
From: priyanka.dandamudi@intel.com
To: ramadevi.gandi@intel.com, niranjana.vishwanathapura@intel.com,
 igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 1/2] tests/intel/xe_exec_multi_queue: Rename MultiQ to
 Multi-Queue in docs
Date: Wed, 17 Jun 2026 14:05:51 +0530
Message-ID: <20260617083549.1347431-5-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617083549.1347431-4-priyanka.dandamudi@intel.com>
References: <20260617083549.1347431-4-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Update the test documentation in xe_exec_multi_queue to use
consistent "Multi-Queue" terminology instead of "MultiQ".

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index d9d648b022..84e0750b4e 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -6,8 +6,8 @@
 /**
  * TEST: Basic tests for exec functionality with multi-queue feature
  * Category: Core
- * Mega feature: MultiQ
- * Sub-category: MultiQ tests
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
  * Functionality: multi-queue
  */
 
-- 
2.43.0

