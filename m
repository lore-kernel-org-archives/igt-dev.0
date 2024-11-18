Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBF4D43FE6
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 08:18:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105FC10E43D;
	Mon, 18 Nov 2024 08:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EML8t7wX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3856210E444
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 08:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731917886; x=1763453886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=huCBUu2rGobohhyjjSI+lvAddJpLjD29V/AXWA4aLpE=;
 b=EML8t7wXA92IfPkWr7coqA0qP3KobyxZBwCDJHnX/sYFe2FCGgcoiQK4
 /B0YXeJUf1wVIYM+IhVHE2/0MyTjM1NFzvI24qWBqhcCzMLb/pKWbBZJP
 8lPPHVWgr/qS77d0BgFTvSzxQkMrC9WkIcoOoC5suHfjHHXDklvcRVmO5
 IGlhNWpc9doqsycE8g7MNAFW2Z6WBl1cZW6oQjGPFPyOJU/DJt3ojhh4T
 9qa5Ej3Tl1jTYdlg0eftRTZtue/tpWMuqWAhUqq7Ewj0061YS5yD6GwlJ
 f4+M2EuOdTH7JU2MYLRIssr6ni0z3WvDbzGO80Mvh6DwbyheX62YhiHmM w==;
X-CSE-ConnectionGUID: xIimIBf2RuiMBXsfKFKAZQ==
X-CSE-MsgGUID: Utf7U3J5RoC7LVMk3ORA2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="19474123"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="19474123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 00:18:06 -0800
X-CSE-ConnectionGUID: Bw1b2hLVRryszury1O02jw==
X-CSE-MsgGUID: WVRviVHFSyS7rfSu6frEmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="94098458"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa005.jf.intel.com with ESMTP; 18 Nov 2024 00:18:05 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 2/2] HAX: Do not merge
Date: Mon, 18 Nov 2024 13:48:29 +0530
Message-Id: <20241118081828.1895925-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118081828.1895925-1-pranay.samala@intel.com>
References: <20241118081828.1895925-1-pranay.samala@intel.com>
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
 tests/intel-ci/fast-feedback.testlist    | 5 +++++
 tests/intel-ci/xe-fast-feedback.testlist | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..00d2d6729 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,11 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 727be9230..20c4e9d81 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,11 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip
+igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.34.1

