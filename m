Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8206D49207
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8AC10E143;
	Tue, 19 Nov 2024 05:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1dTY7br";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879C110E143
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731993360; x=1763529360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hq7GZuENmSv+iirSTfCYj9ylViZwYHBklGZNZJsLpXU=;
 b=J1dTY7brLqurTvSgNcOrWo1K9W+FT83wqAlLdBDkDI2qkadzSab7Epx4
 d3i54dFtyn/3Z9aKUbynGcJUUs1AN/efFoBnIWLwQw5p1LommMrdLS0YL
 mHr1ejPwDSkfOwoyIisFFzNg33gzjikjGPiC/Rue8/PxyviS1bxiVMS2f
 VQP5777oWxOzZUprbdcZWHcsOYHnegGZzzRRVLcKw1cLt2N55KFNekBlg
 6lflgUej8AW/a1KLnMOT43EDYoK7Svu21lTipjc2XDOtHyqwtUOJNfm8Y
 iIJibQFiJhKfxoe9b4nOiSa+Ydwj+vrzs7NG7SkFvTJ6kUX35HiS+Zww3 A==;
X-CSE-ConnectionGUID: 6wrDPk4eTDKCs314Cf2NWw==
X-CSE-MsgGUID: +cDMTNBeTlagLny9V8ce5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54473739"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54473739"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:16:00 -0800
X-CSE-ConnectionGUID: P22lvolVQkOOv5B33bHz6w==
X-CSE-MsgGUID: ziZVFjYqRNa9vXbhIVeCwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89366701"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 21:15:57 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 0/2] tests/kms_async_flips: Skip Async flips on
 joiner output
Date: Tue, 19 Nov 2024 10:41:40 +0530
Message-Id: <20241119051142.2272779-1-santhosh.reddy.guddati@intel.com>
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

Async flips are disallowed with joiner, but the test commit still
goes through and causes failures. Update the tests to skip on
joiner outputs.

Remove this check when the support is enabled in KMD.

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: Skip async flips on joiner output
  lib/igt_kms: Add igt_is_joiner_mode

 lib/igt_kms.c           | 29 +++++++++++++++++++++++++++++
 lib/igt_kms.h           |  2 +-
 tests/kms_async_flips.c | 18 ++++++++++++++++--
 3 files changed, 46 insertions(+), 3 deletions(-)

-- 
2.34.1

