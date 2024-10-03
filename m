Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2BACF854E
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 02:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AA710E359;
	Thu,  3 Oct 2024 02:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLF9oFQg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5FC10E359
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 02:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727922935; x=1759458935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jayoZmPXrK7sZ9LGd5z5DZP/IIRSzMobwI1p6yUyR7o=;
 b=KLF9oFQgBVULetQitYxEPaxeV/WFxcORZ2iKGGCE1AtqFGbYEZjqpckn
 hBHrMqE2tswid823B4bEEiKqKORz/01um+pzvm1ZFcm0nQLksU+ybO8TY
 BkVCfXh4XW+9pTuugdm1CXM62BMfxOWznRgVeL+CBMggwbHUJ0pGWrc6Q
 Z6fDGhNXFOWTXD501dTHu7vRRcgv61qbqJRY3ni7yAlMRAJycOJF7OOI0
 ALjopZzD+ItgKbFdpnm1X3QaFt0rFVKP2WcJYgknzzOpveIVEhpW3tgxA
 +wYrS14zhDzeSWJ21svfXX+z44PT5gsr98ZVzeK25C2PVcdGd/JgUM5UA Q==;
X-CSE-ConnectionGUID: R2aBS3VpRtGIP6C7WV4rMw==
X-CSE-MsgGUID: IhBKV3PURjWx7mn4XgBw4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30902726"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="30902726"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 19:35:35 -0700
X-CSE-ConnectionGUID: LnFab0OEQBinL4l3w9IQYQ==
X-CSE-MsgGUID: J+X3t0V9Qty81JXubq5GFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="79053303"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 19:35:33 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 0/1] Backlight control on HDR-enabled eDP panels
Date: Thu,  3 Oct 2024 08:04:28 +0530
Message-Id: <20241003023429.1967339-1-santhosh.reddy.guddati@intel.com>
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

Validate backlight control by changing brightness on HDR enabled eDP
panels via sysfs.

Santhosh Reddy Guddati (1):
  tests/kms_hdr: Test brightness manipulation in HDR mode

 tests/kms_hdr.c | 85 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

-- 
2.34.1

