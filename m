Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEA1CF6497
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 07:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C7110E039;
	Mon, 30 Sep 2024 07:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TeCopz/k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D5810E039
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 07:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727682874; x=1759218874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kxbu0XgFtHTGz70YXhbklXEfsdcKQrxpRjwpAq7Js6M=;
 b=TeCopz/knhN4IFUIwHqYizmabH9siF3tky4APTKEb2iI8NZ53+p/Gh0/
 RYGasGGOf6Fd9VivtBqBlcMq/D62L9v0SaXrcHc6tC3H9m09EVyh1WOCk
 i6duaM8bAO7144eSQ5uACuFZcqvmSow5NARYdAYiS6Mpu6DbrVRUWkuOl
 oBJCdMFbppwIa3FTVIGd6CnCG/wpsdpfmrAy+0n06oTok4CD3VQqZHzFj
 wjSE1QJp/+dSRDdH+eOlLIrmzDMdrQ3F3TbpB/vOlocBNgbkcaHblcdr2
 3uh2MlAMfyTMFlkh/6wHIgECWJR7jT35ComfTbTrgntowL0nljm2raWEq Q==;
X-CSE-ConnectionGUID: 11FUR4p+Q86bUyrLlDBt7A==
X-CSE-MsgGUID: 0/LujR4MRO+vrVZqz3VWvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26851965"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26851965"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 00:54:33 -0700
X-CSE-ConnectionGUID: eeyqmVm/TqO3zuS6TlAwzw==
X-CSE-MsgGUID: 6eD7wrDnQaeaYPW+9kYswg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="73260888"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 00:54:31 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/1] Async flip with atomic commit
Date: Mon, 30 Sep 2024 13:23:38 +0530
Message-Id: <20240930075339.1022305-1-santhosh.reddy.guddati@intel.com>
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

 tests/kms_async_flips.c | 154 ++++++++++++++++++++++++++++++++++------
 1 file changed, 133 insertions(+), 21 deletions(-)

-- 
2.34.1

