Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFDBD68BFC
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 06:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF0110E1F9;
	Mon, 18 Nov 2024 06:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQHZtxCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7726C10E1F9
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 06:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731911984; x=1763447984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nOFvCoWsgdOQ7M8HUYnHPc9zferQvDM3FZZyDnCstlk=;
 b=PQHZtxCXORPlOM2l8x4eCVWBcqjUfIBMxr8ug48xbWxxflGcxiiPP9/s
 mnAud3HLRBpgYNAcd4a0/wduXkGfwa8xNeCGM3P553PN0XSx1lIwFaQRV
 pDiOKRVr77qTn6no1JsxlDZdrTakUOX8fenmGjZ5NOMnzSmpPm6ZbGEs7
 0lanBTeYQWsvU5+P1/P3gPEEoEokdSmthRNHFcU7u3BLi5Rx9ssmH86wR
 XdlS/e/Fnhw/niieqXPBfGlo79WIx0NQnmsZcTP78Q/H2uTQYur/L++2F
 uJ2p14HdX4fKXzuWazNBCZIdTN6/i3lXQFSvzh0Qwem6t7u9lBRviaA51 A==;
X-CSE-ConnectionGUID: 5Wv2K+5OSCuMF6tkQyH6/g==
X-CSE-MsgGUID: fA/yTlRuQ5yujI+aJv6UEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31948717"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31948717"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 22:39:44 -0800
X-CSE-ConnectionGUID: A4gzdHtNTpG81ozHc1kTeA==
X-CSE-MsgGUID: PDFpTiR4Q7qx6WIHU8NoOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89564353"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 22:39:42 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t 0/2] tests/intel/xe_oa: Refactors related to OA buffer
 size
Date: Mon, 18 Nov 2024 12:02:21 +0530
Message-Id: <20241118063223.3974722-1-sai.teja.pottumuttu@intel.com>
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
refactors it to get the oa buffer size using DRM_XE_OBSERVATION_IOCTL_INFO 
ioctl.

This way we need not change the oa buffer size in IGT if there are any 
changes with the default size on the kernel side.

Sai Teja Pottumuttu (2):
  tests/intel/xe_oa: Fetch OA buffer size from observation IOCTL
  tests/intel/xe_oa: Replace hardcoded OA buffer size assumptions

 tests/intel/xe_oa.c | 67 +++++++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 21 deletions(-)

-- 
2.34.1

