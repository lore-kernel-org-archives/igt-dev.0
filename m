Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1C6D6ED11
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 11:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD4B10E3F3;
	Thu, 21 Nov 2024 11:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTd+3gLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E691010E3F3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 11:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732190355; x=1763726355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rbxFxy6q+St+5Nt3q7wWQnK+Xc5aieQfNVYNr4Clt7U=;
 b=VTd+3gLs+ntPvUrcGi/m4qDcGlr9NPl1nDGcJ76vRoEQs/vJqGI4gGpQ
 dOHZstJbl6Rv7vPcFCi3JtA/e5rLEFPaoswxfQDltR875evk3wtwEd6nT
 +08GTe3nhPN3FvS/fJPmcuQUjbnWMdaFUTpWc/BEW6/wq8ypSehFtLEt9
 sgCBJfa1I642HuC19fOsyHFKPs4WrupGS4TSxbYwXMIhii9lDhru4x+AY
 Wq13ERaW4enTojy2WACVACsdGBcjOgmmDvUUzWiVwcC6q0+h0L3LMzhRX
 lZ5QSfx9eh8NQXDBHZD/3ioYOk8XJDzPDK7NBJsaekxdHrUaQXGs5t/BE g==;
X-CSE-ConnectionGUID: mHkfDVswRRCmpHUR7hQl+g==
X-CSE-MsgGUID: Mb9IjhMhRne8z8n/j3uedA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="19888104"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="19888104"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 03:59:14 -0800
X-CSE-ConnectionGUID: tKvw0AgIQW645TpiiLRApw==
X-CSE-MsgGUID: uoU4HChoQp6vTZVdCyV+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="113504155"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 03:59:13 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH v4 0/1] Async flip with atomic commit
Date: Thu, 21 Nov 2024 17:24:50 +0530
Message-Id: <20241121115451.2917187-1-santhosh.reddy.guddati@intel.com>
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

This patch introduces new subtests to validate async flips with atomic
path

Santhosh Reddy Guddati (1):
  tests/kms_async_flips: subtests to validate async flips on atomic path

 tests/kms_async_flips.c | 173 ++++++++++++++++++++++++++++++++++------
 1 file changed, 147 insertions(+), 26 deletions(-)

-- 
2.34.1

