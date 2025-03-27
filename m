Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AA9C36008
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 01:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE9F10E1D5;
	Thu, 27 Mar 2025 01:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTbbiaFC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28CF10E1D5
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 01:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743040318; x=1774576318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WRCYp8ZU3gzb4XoFqxsPotHfqhlGdbZJWeR1BRHpI00=;
 b=BTbbiaFCbyx+UqyUwcEslIJqAhe6SKcpV9EfAykeTWM9NtbkZuEAug1v
 oe+QLxMi8GR5kl7RsvLHG7+rnH5H1fdFOXzl+f3MG4anaViwMgMaKCE/r
 7oUBZXkdfBhd4gn6xMAoAgIOh4rQpJxMvRUV66NHhcVn71PaMGtEO/F78
 QRzlJtNEMeMya0wPMWgF7auaGFhQ8yDsp1d86MJESV6jD/x+n5rsBKmt4
 VCev4NHA0e8xaXCanORiKLldXHVJ/OQRCkvsD2Q58WQjBtxCB6QOUyF8p
 LQB4z8ruEcITatLUJNr9rQXGD+dRWjAH9WFfrU+GjXp0UAIAqO8168BDp A==;
X-CSE-ConnectionGUID: rAaG+oVgRkWKLQfzLUuqCQ==
X-CSE-MsgGUID: bUbiNGcHSF6JTPaQ1GE6qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55354182"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="55354182"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 18:51:58 -0700
X-CSE-ConnectionGUID: X0hiQIfTQR2/8Wnwj3xeZg==
X-CSE-MsgGUID: TBDRS/d+SeG2HHxSMP1dvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="125441383"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 18:51:55 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH 'i-g-t' v2 0/2] Add support for Xe in runtime-pm
Date: Thu, 27 Mar 2025 07:18:25 +0530
Message-Id: <20250327014827.1829635-1-soham.purkait@intel.com>
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

   Add support for runtime power management
for Xe driver.

Soham Purkait (2):
  lib/igt_device_scan: Add driver field to igt_device_card struct
  tools/intel_pm_rpm: Add support for xe in runtime pm

 lib/igt_device_scan.c |  4 ++++
 lib/igt_device_scan.h |  1 +
 tools/intel_pm_rpm.c  | 28 ++++++++++++++++------------
 3 files changed, 21 insertions(+), 12 deletions(-)

-- 
2.34.1

