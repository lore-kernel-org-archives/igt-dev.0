Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7017E65D25
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 05:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6B910EAC8;
	Fri, 22 Nov 2024 05:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8DO3J1C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4587710EAC8
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 05:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732253610; x=1763789610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=huCBUu2rGobohhyjjSI+lvAddJpLjD29V/AXWA4aLpE=;
 b=G8DO3J1C0fb+/jBZRRYwPv04EcXrcbAgY3JEs4xaWOJzaQEPgcgpKTA5
 w4O8p8E34RX6SJre+Gy81yxmfFO5lFu2XLWuYUJBcC1si2oTM61mVWKbz
 dgE/nTUBPzkwJAAEHcNR8lPoMJFMenM3On33mQ4JvwuicjwOMr8eRmfBn
 I4vGlaueCjvtiPX9hqT5rIl+T80UlRz4nVgMb341QaunS0eZY1qgM3lGE
 h1IY/vb+XCXvMTCpb55WCu96aKQjCZUa/LACPDatQivf9bV4OO3Q5rqyM
 GCvHFg7mvEFeIWC2Wp27d2bmKYoI0TAfW6g//L0jEo/5/sSAJ6az0cZCR Q==;
X-CSE-ConnectionGUID: Kt7u8hHIT/qK2zh0p7O8bQ==
X-CSE-MsgGUID: pVO5rHxnRIidUE9f1bYdyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43040401"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="43040401"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 21:33:30 -0800
X-CSE-ConnectionGUID: g5dW01fcRC2mVwVxwtS5Sg==
X-CSE-MsgGUID: e/bbb0z3TCSV+e3SAH6HCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="113753614"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2024 21:33:28 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, jeevan.b@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/2] HAX: Do not merge
Date: Fri, 22 Nov 2024 11:04:00 +0530
Message-Id: <20241122053400.1931176-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122053400.1931176-1-pranay.samala@intel.com>
References: <20241122053400.1931176-1-pranay.samala@intel.com>
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

