Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9DEC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 15:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5BB10E8CB;
	Thu,  1 Aug 2024 15:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lAlY1Ccl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701BF10E8CB
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722524902; x=1754060902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8KEvSn55EtwQDQvZbujAESmmAcqAosv+7eMyPWc1ibs=;
 b=lAlY1Cclph/XNsNFkV1PmiApRwrMp72IOEzEoVOsq8IsLVtyjXv+1fOw
 m2LNpEOtxkuC0LvZbatD1xiE/m38d3sQA3FAqTaMCGrlT5Ym2cx6GSFUu
 NivMMHODHcA8wU0mjN7TDcsf4y5DYhEshXsUBA6aq4nYBI1+lvEtKJvWE
 YWfj2ANtC7QyuNlKVaVKTzo/Hf0k33TRYIFHvWgQphgbgCMqVkgAq/IO0
 1eBmm1ZZCbmFnkiVubw+pzjLfUJDK1/EiBuNhBcCaJQ+yjZWPQ2UPbNIv
 4riJQbkdvfn86d2w/ILfRJ4q6xCrXplWtLKUTdAwUvm37WQA6C3C9/kAk w==;
X-CSE-ConnectionGUID: Iw6E1D5ZS/qFd4gDDI3BbQ==
X-CSE-MsgGUID: Ef+W7FhWRCmDJD15GZTpmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31135534"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="31135534"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:07:22 -0700
X-CSE-ConnectionGUID: cVtACZbPTmqwp+GMLmIymg==
X-CSE-MsgGUID: BwpULOjCT5mjSpgclOlEGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59712559"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by fmviesa004.fm.intel.com with ESMTP; 01 Aug 2024 08:07:20 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t, v5 2/2] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_sysfs_preempt_timeout
Date: Thu,  1 Aug 2024 20:37:37 +0530
Message-Id: <20240801150737.3700254-3-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
References: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Adding this to check Bat runs directly to check test success before full
run

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..4ba90e2dd 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.34.1

