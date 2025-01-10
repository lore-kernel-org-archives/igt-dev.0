Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20650E77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 06:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19FE10EFE3;
	Fri, 10 Jan 2025 06:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7QPtB2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467FF10EFDE
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736491187; x=1768027187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rFeXO+Ne3IrYwToM3qK9Tu0bagWgkPMbpxpyga5MFVc=;
 b=f7QPtB2K+3HBhVSJNBm7dc27hhj/DLuibukj0u5eqAU00M5uffR/la+U
 AbRt6Dwl3AGuGDJ2d2tc5fgU+rgwo3w7sQLbktCPKqQcYCXfV2+FAWpyc
 EDxI1TwqzmmRakA2N6hXD6te2w1XS9j4xkVfOENydZ9bOHjB+ZEAlDnoJ
 pKVry5zAKtDgt1Ma7Uh5MxwikA2ayhiigu/W4zfquqQlXoiX4wheyYAMJ
 1qCX2dGcncRoveniaGat81dUXwdYfgjNY+y24SzggmvAbWs5EjgP8HxIu
 HvXnrRPfgPR+LXkOlFlAPlL5QMlSTxvIem+2RT8AjfkSHbOgmPyi9BmKY g==;
X-CSE-ConnectionGUID: JEdE1mO2SvGy+rpka715Ew==
X-CSE-MsgGUID: dqiT4i3nQFavtgJnjpkI1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36800574"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36800574"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 22:39:47 -0800
X-CSE-ConnectionGUID: 52UZLVw9RoWhPpZ7hWfsbQ==
X-CSE-MsgGUID: wFVgzfhUTeuELDM2rhRJoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104526775"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 22:39:46 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/2] Support for IN_FORMATS_ASYNC plane property
Date: Fri, 10 Jan 2025 12:09:07 +0530
Message-Id: <20250110063909.34042-1-santhosh.reddy.guddati@intel.com>
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

Use IN_FORMATS_ASYNC property to get list of async modifiers

Santhosh Reddy Guddati (2):
  lib/igt_kms: Add support to retrieve async modifiers
  tests/kms_async_flips: use in_formats_async for async modifiers

 lib/igt_kms.c           | 42 ++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h           |  7 ++++++-
 tests/kms_async_flips.c |  4 ++--
 3 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.25.1

