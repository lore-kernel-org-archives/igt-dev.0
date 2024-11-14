Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4F5D6A221
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 19:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFF710E359;
	Thu, 14 Nov 2024 19:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRVusq2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19C510E093
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 19:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731611025; x=1763147025;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kmfT6KXernlNKKm0nGIgUGRaCX40Vrb/k0571wlAeuM=;
 b=VRVusq2AW03AbLBgxUZl0qet8YFP1r45n/NTEqCDPf+WIPWfC+o7lSm0
 1hTbXv1Lqy+wE7IzZy8+jrzNx2MD/yMZslourJ/hXLcrEbnw64+nPf64K
 G4q8hpdAHEgfJ+2dHI15fiflWF4Z/h/cmumEwPG4YWWP5piQt/SmjXuQo
 6U0yQADXz083iq7spI5k/1W926n5ZE8neZ2EJWht9owTAgJuYxUkGYogN
 LoaORs0kw+nXQc70o8hbMh0YHRniahb7n2q8TRRqQQBEszgOMnIqme/hA
 MEB17Hv3eFHT7uBuc+4sG57HJXCA5V3KCDBlAYb1C5q1bdzv1CRUDgBAO w==;
X-CSE-ConnectionGUID: x7EDgKw7TC6jZ5IAv6uNbA==
X-CSE-MsgGUID: 50gToat5R3qdsNXR22HHsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34442563"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34442563"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:44 -0800
X-CSE-ConnectionGUID: 7OkFKtkbRx6QWrNxZuNEIQ==
X-CSE-MsgGUID: SN9w869cQzm1l2efpeE4/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93242107"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 4/9] XE3: tests/intel/xe_pat: extend for xe3
Date: Thu, 14 Nov 2024 11:03:34 -0800
Message-Id: <20241114190339.3885752-5-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
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

From: Matthew Auld <matthew.auld@intel.com>

Same pat_index modes should apply as for xe2. Matches the kernel.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 tests/intel/xe_pat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index b0b3ad8a7..1322df349 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -110,7 +110,7 @@ static void pat_index_all(int fd)
 
 	for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
 	     pat_index++) {
-		if (intel_get_device_info(dev_id)->graphics_ver == 20 &&
+		if (intel_get_device_info(dev_id)->graphics_ver >= 20 &&
 		    pat_index >= 16 && pat_index <= 19) { /* hw reserved */
 			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
@@ -854,7 +854,7 @@ static uint8_t get_pat_idx_wt(int fd, bool *compressed)
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
 	if (compressed)
-		*compressed = intel_get_device_info(dev_id)->graphics_ver == 20;
+		*compressed = intel_get_device_info(dev_id)->graphics_ver >= 20;
 
 	return intel_get_pat_idx_wt(fd);
 }
-- 
2.25.1

