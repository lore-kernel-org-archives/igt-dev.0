Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2C6CA0EED
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 21:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F4310E4D4;
	Mon, 18 Aug 2025 21:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJLDjPtd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049E910E4D1
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 21:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755553473; x=1787089473;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UyuRZdprhL4HVADa2YKgDK/s8uVF4rHZtWScvHcMM30=;
 b=gJLDjPtdKAoYmrZPYZUlguOLTLl4APgN+R7Y8J6niBPFf1A6cviYTG+x
 ORobcyWmKWk+eJOh4rKVVb0HyX2GHktkDsXwZEJfHKmiAOJjbYC6ibLx5
 VeGXUYKeODUsjdwESo7mfMOsVjSZd2mYPq+By7aqJOyxYKZxvSRBOpH9z
 xfgGe369+wpiWdi2go34/ZhV61K8EdNDfw+oWqf0cL+CBX+o5BsjZ3ECp
 ItYcwODWPA3C409Zk50972avFj3Ecg1Z9dy70y3XyVEgLgcQry9AauuEh
 lJoms2BznGMarO02oIOwctVOkAg+RLRlYXq01p1/f2vkc4DpRm4mQ+7oi g==;
X-CSE-ConnectionGUID: VH4sm6lyQeuf0pk7wHDaKQ==
X-CSE-MsgGUID: 65wDg4FeTc+/52+/81rKYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57645315"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57645315"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:44:32 -0700
X-CSE-ConnectionGUID: y8PChFgpReyh81yYM/bzBw==
X-CSE-MsgGUID: 8LSpSDg+R8q632AUD+vv1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="198539706"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:44:30 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Improving Timing Precision for simulation
 Environments
Date: Tue, 19 Aug 2025 03:14:29 +0530
Message-ID: <20250818214431.1331399-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Refined the legacy cursor test by incorporating display frame
duration and timing tolerance adjustments, leading to more
accurate validation of rendering synchronization with expected
refresh intervals.

Naladala Ramanaidu (2):
  lib/igt_kms: Add helper to measure vblank sequence difference
  tests/kms_cursor_legacy: Improve timing accuracy in legacy cursor test

 lib/igt_kms.c             | 21 +++++++++++++++++++++
 lib/igt_kms.h             |  1 +
 tests/kms_cursor_legacy.c | 18 +++++++++++++++++-
 3 files changed, 39 insertions(+), 1 deletion(-)

-- 
2.43.0

