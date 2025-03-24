Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614C5C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 15:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7A510E492;
	Mon, 24 Mar 2025 15:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EaXJLj8l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A32F10E492
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742830236; x=1774366236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kCbEQ9K7OEfDOdUdlvIbu+80TKCNvrp4FWVKRjugJiw=;
 b=EaXJLj8ltdYGR9oCkw9we4E7prXNjp1x5jdSzJiRKK1aNpBtFNrdhjzs
 6KRAfvLm3qbJWPSpPJCqICDJa5vdI3nMtJK2NfPRqwz7+aflYvoQ6J90b
 O7Oup/0NkQE9pHAZq3enNIlYZZKSD8gqaf1vELm0dCyanTgcVYeUj9N5f
 GTu8ey+Bw9UttNdObffh6s7frYdMx4lsC3nzs4nkLIuH2BfNXVbcBjrPf
 QacOFhwvI+VUi8szGpUXxQIppzmZMEOxYPx++ENWWdSypyz+462XFFEMH
 6RTas4L/Iv0uHh5EF5XP2stSOyi+kaaz3hyya9O4X1AjhNTNKUrh81Yu9 A==;
X-CSE-ConnectionGUID: 9Qsq2AklSEeqOVMTxHOJjQ==
X-CSE-MsgGUID: aFkUa/b3Q+KTa4ndZXpW5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47825157"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="47825157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:30:36 -0700
X-CSE-ConnectionGUID: 3G6qbFp9Q3aykUqYlYZFKA==
X-CSE-MsgGUID: aXtqsCXST321TjskI2dNDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="129143287"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.72])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:30:35 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/2] Prepare to remove xe_sysfs_driver_do()
Date: Mon, 24 Mar 2025 16:27:52 +0100
Message-ID: <20250324153023.2493741-1-francois.dugast@intel.com>
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

This is a first step to address this comment:
https://patchwork.freedesktop.org/patch/641321/?series=144466&rev=3#comment_1175344

v3: Resend for CI after applying Lucas' suggested nit

Francois Dugast (2):
  lib/igt_kmod: Allow igt_kmod_unbind() on a specific device
  lib/igt_sysfs: Remove XE_SYSFS_DRIVER_UNBIND

 lib/igt_kmod.c                   | 15 +++++++++++----
 lib/igt_kmod.h                   |  2 +-
 lib/igt_sysfs.c                  |  4 ----
 lib/igt_sysfs.h                  |  1 -
 tests/intel/xe_fault_injection.c |  2 +-
 5 files changed, 13 insertions(+), 11 deletions(-)

-- 
2.43.0

