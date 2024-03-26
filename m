Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444D3CD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2D210E8B0;
	Tue, 26 Mar 2024 09:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C65duWm1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3A210E8B0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445411; x=1742981411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FL27kAInS1UsYOvS/kDNfXSp+xAMZLnhIFbCLDxYyWw=;
 b=C65duWm1O0dKXUlGquHuLvB5CHNYSXZr6EljelKc6n4CYzQae9bkIZMo
 JTwfJYJyG4RFzAXTELGsvfG2OO+rOnsAmveJxfWIkXh2cH8VXOXIZU9A1
 YiGBNWp4b28Ao/ePJCV9IiSm5W7YFmAnXiH9F4SkEbksTqiigUfTH5SFi
 4LMis7nCOilqMfqVvi6UhEHoqGw71igKv/Ls26xgBctRP7+uaqdhER0mB
 IaUeuhAo3bl9qpIpgHHzyadz+4Nd3TwACLLj5BwbOQxxo9mkAgdEeUHXp
 WeQMuyyh++9AP/8lWgHLTX8l/XgsszrSwsQ9BwRAkoWVyyI7dnVpHYzAH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6378673"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6378673"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15965046"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:08 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 06/13] tests/intel: Move drm_fdinfo to driver
 subcategory
Date: Tue, 26 Mar 2024 09:29:00 +0000
Message-Id: <20240326092907.1979345-7-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
References: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
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
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

