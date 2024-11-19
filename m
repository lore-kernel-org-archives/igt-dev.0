Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AD9D6204A
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 09:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E32810E00D;
	Tue, 19 Nov 2024 09:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVqfUYhx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762BA10E00D
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732007517; x=1763543517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KJhzsroI8Pz1gPPjpLCLM2BrO2SzztlPTHGe9019/pM=;
 b=KVqfUYhxb+c1DUZRgxGKMqnsrMUj6AX9cDKEjJ9t2+xMBF2HZbDR4IV/
 KwXKb7afBXJVeCFCgnDvtwHS95PVL3smuiVqnx2IkyWkAGKdLZoXY1fS/
 PX6/XB0hJtHa/EjhxVaiC5CyjWCeRkx1yjQvq3MVEvLoljAs3MkArSZpu
 qChsJe0cRqZrqyxXdqviZIIk96D37x8gWWfY9lN29i9senhrps43b10T5
 J2zcr3p4Egh2A2WXEVnAyDlOA1Yh4nb7BusH261tJTfP0Gbs28vUwSri0
 PuFDMU5zmxuG8goPTHr2e2euQ1c0U7XjTdXlbW/ZlGJi6VwofaklKSI5D w==;
X-CSE-ConnectionGUID: p7udwYHGQ+eiewOVVFqlaA==
X-CSE-MsgGUID: RVpngO9uQ3OSoVBQNjlkfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43063856"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="43063856"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 01:11:56 -0800
X-CSE-ConnectionGUID: 0YmYOQiFQ2SlPWPPomIGqg==
X-CSE-MsgGUID: wmSvxJWkTsa3hlOJ0SbRXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94430370"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 01:11:55 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t v2 0/1] tests/intel/xe_oa: Refactors related to OA
 buffer size
Date: Tue, 19 Nov 2024 14:34:04 +0530
Message-Id: <20241119090405.951437-1-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
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

Currently, the OA buffer size is hardcoded in IGT. This patch series
refactors it to get the default oa buffer size using 
DRM_XE_OBSERVATION_IOCTL_INFO ioctl.

This way we need not change the oa buffer size in IGT if there are any
changes with the default size on the kernel side.

Sai Teja Pottumuttu (1):
  tests/intel/xe_oa: Fetch OA buffer size from observation IOCTL

 tests/intel/xe_oa.c | 63 +++++++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 20 deletions(-)

-- 
2.34.1

