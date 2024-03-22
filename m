Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C86CC47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED03410E938;
	Fri, 22 Mar 2024 12:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/gIl9d6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C19410E9C5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111340; x=1742647340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cpvPuysSPwTlDgGNY4yALGNC+/mDVVV9y+cAUM6qc/M=;
 b=S/gIl9d6AP4WVCsQB1UzMDvhIROx+Ekysj1O/DM8jV6zKG1sNHP1AADQ
 oLPx5OqsqdZJYJaBZFoJzAhTt3dFYu6RyeyrLBtwTqQa2/XJVzC4COApB
 J49m5jVdKXEGGapA1DeReyRXQPfAiDKGs1xmd+BZFciPOQ5jNn6ks5B6U
 oVwNFk78lQrDus9osaY71U0Mp9X5tzspv9+ru/JB7Paoz11Ip+WuGSdLl
 jXSiCQ3Fi8MLmjlt+2sGDGrRlX1vyEAqXWfvlTxLcWEco2mrlCUpLYOWR
 FKJxpYeEhT3iDrsiF4Byq+TpcjA1IJ7ECqgSa0b3y7v5iK/aK1DueAJAk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9919356"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="9919356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19585941"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:18 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 05/12] tests/intel: Move drm_fdinfo to driver subcategory
Date: Fri, 22 Mar 2024 12:41:01 +0000
Message-Id: <20240322124108.1825345-7-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
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

On Xe drm_fdinfo test is in
     Sub-category: driver
     Functionality: Per client memory statistics
Let's use the same for drm_fdinfo in i915.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel/drm_fdinfo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
index a10c9fffc..61c66079e 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/drm_fdinfo.c
@@ -37,8 +37,8 @@
  * TEST: drm fdinfo
  * Description: Test the i915 drm fdinfo data
  * Feature: client busyness
- * Functionality: client_busyness
- * Sub-category: FDinfo
+ * Functionality: Per client memory statistics
+ * Sub-category: driver
  * Category: Desktop client
  *
  * SUBTEST: all-busy-check-all
-- 
2.34.1

