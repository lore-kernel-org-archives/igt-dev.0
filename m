Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C54E77179
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 21:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F0F10F1D2;
	Fri,  6 Dec 2024 21:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4I/GTJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DF710F1CF
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733520604; x=1765056604;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=m5H3S4wAyC0Ay93dFtNmFcJIZDoSOPonnmqOrirXO2E=;
 b=l4I/GTJdYkLCZyFTI1B+LXaVMt148Kcjxm1su9TX5Ho4kgtMypW50+Yo
 EYYJbyPzXd/78jRo+1KEWyPONxOC3Xzz8KBXm07kbBt6qPhVKINUoeARk
 6qsGxbdlwIFqH2KCYlTm82f527GOxZlG48CpOq8wHWbFbq0J62QxxJuXp
 eTdsUmzdlGcg18Ui2U9koC0z1v//QjwVlKXhpF5CPCI8/cZgF+RqpOW8T
 WDlC64vDBwE4257nVT+n24bCi2+Knadc7TN/RPM/tSe6PlgdMNf/yB0dY
 juN/3b2xl8xuV8YLeRwnUHRqJsVQwNIK9zmpxfe9XVNXwaMWRb5FA97aF Q==;
X-CSE-ConnectionGUID: ja/BL6EtSZa8sThwq/RCMw==
X-CSE-MsgGUID: 3UWQMXvvQICcTZ5bZKLdUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="51304470"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="51304470"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
X-CSE-ConnectionGUID: GmtwcTLdTRaV8t/j43oV2A==
X-CSE-MsgGUID: 0qig4mN4SqCbuwy7eM594A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="95306724"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 3/8] XE3: tests/intel/xe_pat: extend for xe3
Date: Fri,  6 Dec 2024 13:27:43 -0800
Message-Id: <20241206212748.2101217-4-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
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
Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
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

