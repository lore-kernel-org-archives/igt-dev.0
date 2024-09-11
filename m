Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B266EE57CF
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 20:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A7A10EA94;
	Wed, 11 Sep 2024 20:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKq/gU9P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D06610EA94
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726086283; x=1757622283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=okJzqhK38n8tA7lSYCQmgLhA4jpOtGmp3TfWDQsY3Qg=;
 b=HKq/gU9PQPNjt4YP/Je2ki7zmu9HChUuMxW1jaqR8Iaz7wZx6ShjIDNb
 MiImy8WmvuOZj4EkojJodFNkyxnGswdckpUzkEBPSEcWeYj0jG31WAfJp
 u3CUCFNCobtwp8CEmYKtGQGvKYIpGdvZcL0mxDrabBRFwkMoQEQO2tQHd
 d54yTr3h71uxKajnXLFw+zm1rTjCp30AVMg1bM5iRQL0euBDY2qjouY8l
 OyGz9+PZRlFZ5Nj+81LsRMXTTeTvExTLIstLWOYdsCkfol2xMc3ZNCQ5T
 zGaY4BFsiZO8pWLHcAjrR9OgopmGzG/IpoKrO6AlHNcKBpAxwYkPKUv4/ A==;
X-CSE-ConnectionGUID: Sv13ldvtSnSkayQZnGm0BA==
X-CSE-MsgGUID: udRHlAU/SEaftwrTZYorEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35503414"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="35503414"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:24:43 -0700
X-CSE-ConnectionGUID: Lh+4Y0QUTRSOOovEtE/iPA==
X-CSE-MsgGUID: optWZzMdTZ+4soN6HtdzcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="72078273"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 13:24:41 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 0/2] tests/intel/kms_psr: DP2.1 PR IGT Fixes
Date: Thu, 12 Sep 2024 01:54:06 +0530
Message-ID: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
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

This patch set contains fixes for DP2.1 Panel Replay issues we have
found while debugging the code. These issues are related to DP2.1
monitor always being MST. Also wrong usage of SRD_STATUS and
PSR2_STATUS registers are fixed.

Naladala Ramanaidu (2):
  lib/igt_psr: Remove SRD status change check for DP2.1 Panel Replay
  lib/igt_psr: Fix PR state check for DisplayPort connectors

 lib/igt_psr.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

-- 
2.43.0

