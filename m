Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB15C3DA45
	for <igt-dev@archiver.kernel.org>; Sat, 13 Jul 2024 07:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630B110E048;
	Sat, 13 Jul 2024 07:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHiJUAOz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A86E10E048
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Jul 2024 07:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720855361; x=1752391361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4dqm96V0jj8cnVXzJp5bGsNcyhCEI0cb10Jac3mloH4=;
 b=YHiJUAOz/wfM1dMdykFwYiPYh6xJeo51WmtH5VW3/SkXagM25e4koBxP
 AMmSR9o4/6FKG3bmr/JeLdOUQwte/MyS6nZRSuhIM7R6WTJP/CJ+C+dey
 YxuCBgR2lW6nFdDbhu5fzn4uRbgrS3YVWyVg9gKPuRZxJrrzEBHl6vddD
 Cp73yGdeWFMMvj6NTzAZSkuadHeRZkGAlfn5/ew6kgg7yMRWJf5xmOyix
 z/kbiePIa65/erIILo+EJ/qqG4s6t6RrgpoIhAoyCbP9CBkx5iH5JwfRm
 tUAQ+XsV+IeZrDXdqzotmYC4Oj3uLtTxY4KCrNsY5JbFTRAUV2QBkKq4z w==;
X-CSE-ConnectionGUID: x5R8o7nQQK2yD/nwtSw4rw==
X-CSE-MsgGUID: dfGoqiA9SbqKI9YyJJgTvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="22066996"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; d="scan'208";a="22066996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2024 00:22:40 -0700
X-CSE-ConnectionGUID: KdDhJEjHRuGlHUf4HHceXA==
X-CSE-MsgGUID: S8X/k+mNS5y0r0VpZm/ZQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; d="scan'208";a="48861336"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 00:22:38 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, suraj.kandpal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/2] Improvise-the-deep-pkgc
Date: Sat, 13 Jul 2024 12:56:44 +0530
Message-ID: <20240713072646.551590-1-ramanaidu.naladala@intel.com>
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

This patch will add the basic checks to enter pkgc10
and it will finetune the delay to enter deep-pkgc.

Naladala Ramanaidu (2):
  tests/intel/kms_pm_dc:Add basic checks achive deep-pkgc
  tests/intel/kms_pm_dc: Improvise the deep-pkgc

 tests/intel/kms_pm_dc.c | 49 ++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 15 deletions(-)

-- 
2.43.0

