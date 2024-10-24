Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BDCCE8E62
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 11:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E65710E900;
	Thu, 24 Oct 2024 11:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/GIXU9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FBD10E900
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729768671; x=1761304671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=opueIgpkTHtAwSkCTha2qZmOsySS4t8w/yYazeooCHU=;
 b=S/GIXU9WpERF6YcxltX2+iInooKqeZgB9cd2ZHfqU9gLfZyxquANGubu
 ctRUl+BydxVZjOr/OSAPaoVxP2qglTRolxq0U+am25uW/L9CkrARjU9AW
 mMhxLkdR6T6k9JOKmyuwhcbltqBmVQvjQZftqd0y6ROwasnysDUxdYGsb
 criDI4HjuCwEtUMv1jlH9WF5kyybMdTqv0rFoI+PtcbEAEzGcJi2kB+Ta
 y/Z0nwP7Tuf56Rfm9vGZG1q46hS1JwQc8rVNEHCONaBZnad+trPt/oTFe
 9hOiGJJA20Y5orHOvKyKuaWMQMdcWOV1EnqwGoRjeer9BXUwok7RbPthu A==;
X-CSE-ConnectionGUID: z/J6fmv/Q42led+dI/uqaA==
X-CSE-MsgGUID: ziZZhlG9QxCA9kYpHcFNaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28850464"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="28850464"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 04:17:51 -0700
X-CSE-ConnectionGUID: 39n8LcMdTrWlyou0f5VXkA==
X-CSE-MsgGUID: fQXoq7YwTJ6VUUTHoErKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="85341089"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 04:17:49 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/psr: fix documentation
Date: Thu, 24 Oct 2024 16:50:11 +0530
Message-Id: <20241024112011.1387980-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add missing mega feature for panel replay subtest.

Fixes: 31475ea8f ("tests/intel/psr: update documentation")
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_psr2_sf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index e9a8dc141..cd4226070 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -125,6 +125,7 @@
  * Functionality: plane, psr2, selective_fetch, fbc
  *
  * SUBTEST: fbc-pr-overlay-plane-update-continuous-sf
+ * Mega feature: Panel Replay
  * Description: Test that fbc with selective fetch works on overlay plane
  * Functionality: plane, pr, selective_fetch, fbc
  *
-- 
2.25.1

