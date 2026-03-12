Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A587FED2E1
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 07:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C045510E98D;
	Thu, 12 Mar 2026 07:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O634z7eM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9714110E98C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 07:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773301719; x=1804837719;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zNVCzVkKF0Cse1ZSPWeLgRu38oNQN0ngauzM9IMgG+w=;
 b=O634z7eMw1l5GiLYUzO7HLZsZX9RRlNlFTRDosiB6tAjHb/KjZXydNEI
 HUYO3WzWias3vaNh2NIJmsC1SnQ7BB73P7DcQslo988OKEEl3s4TPwSqm
 k7dpGAlq6lr+1+vDVHuqPpCbIB8EU+3gSblXwFyGq/E9yKT2dTrVZ/2V3
 ynx28Nul1gWjfZkA1fsAGNqu4yfL9DSkifFuPh8aFtFoRw88gzv3dtQAs
 XBn0s0yKsuQl6VpMgLgo6hlZ0AGA6+urZNMUbaNQ6VmxhUJHPx2VkCFVk
 8k8jB27OTz2/xgYgK4fJRejNmh9pTcRn7mqNb0rJlSAMtsf+Y9hOoAx1O A==;
X-CSE-ConnectionGUID: WBTuv2dcRRyX0DFwaDDf3g==
X-CSE-MsgGUID: JbLi9GW2T22PLbn65PaTvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="61962318"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="61962318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 00:48:38 -0700
X-CSE-ConnectionGUID: ssAOdHWHTVCrZWfnaum72A==
X-CSE-MsgGUID: vBC/EDChRKOqxW7s06pxiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225189276"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by orviesa004.jf.intel.com with ESMTP; 12 Mar 2026 00:48:37 -0700
From: Aditya Chauhan <aditya.chauhan@intel.com>
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t 2/2] tests/ci: Add NVL Display blocklist to
 meson.build
Date: Thu, 12 Mar 2026 13:18:32 +0530
Message-Id: <20260312074832.51575-3-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312074832.51575-1-aditya.chauhan@intel.com>
References: <20260312074832.51575-1-aditya.chauhan@intel.com>
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

Add NVL display blocklist to meson.build so that this can
be used in execution.

Fixes: 04db3b26c52b ("intel-ci: Add NVL display blocklist")
Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index a1e9dff55..2e40b2179 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -26,6 +26,7 @@ intelci_files = [
   'xe.ptl.core.blocklist.txt',
   'xe.ptl.display.blocklist.txt',
   'xe.nvl.core.blocklist.txt',
+  'xe.nvl.display.blocklist.txt',
   'xe.sriov-vf.blocklist.txt',
   'xe-sriov-vf.blocklist.txt',
   'xe.sriov-vm.blocklist.txt',
-- 
2.34.1

