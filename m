Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C6ED5AE79
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 09:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0215010E7E1;
	Thu,  7 Nov 2024 09:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDDc+3p3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768DB10E7E1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730973178; x=1762509178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MtXyb0EJEG/3TR0pgcFMgtvJDQ3pMgS8+MdPVLQSDCs=;
 b=KDDc+3p329zdYKFlsjSesx9ekPqv7YFI2dWUHNah3ZPm4e2HsMhOZbNL
 SVx213vHXq+FqHmXFjTycfmJE60O0Q5iyOcMdF/xQDmC9Jo6rn2tuxqFU
 XWGUqwqTVS1/QiFN3U0hlzVplp2AgEmgABcy2pa9g0IkV8Wwyb5KbcCce
 /L/bgwvFGBMRTrUZpiEF2Ql0txwrhjvho4Okk/Ozlol+DWU74lA0AFV68
 tpLBgmUqe78uqgArL0mqIVmFjxu+h0w6HDQP63l4MmbkU8VKCSlCn3aeL
 OPvmRnqGCBiFDWaGOYfMzcBYV8zs1VyMuU6yGsrzDPt7DpGIxWoFNY2Cg g==;
X-CSE-ConnectionGUID: llu14wmtSh+uYKIIAT/6Ng==
X-CSE-MsgGUID: LegNVIpHSkCrHdyTf2nQGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30229375"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="30229375"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 01:52:58 -0800
X-CSE-ConnectionGUID: EBBHpfhrR4OIKz2kKCPOSw==
X-CSE-MsgGUID: ZJfQY5VGQ6GQ0ChrQcSD+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="89844730"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa005.jf.intel.com with ESMTP; 07 Nov 2024 01:52:56 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v8 2/3] HAX: Do not merge
Date: Thu,  7 Nov 2024 15:23:25 +0530
Message-Id: <20241107095326.1842621-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107095326.1842621-1-pranay.samala@intel.com>
References: <20241107095326.1842621-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..7f54eda16 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..8b70164f6 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.34.1

