Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2783BC282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 08:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D054510E3CC;
	Mon, 17 Mar 2025 08:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGfMc90N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A8E10E3CC
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742200299; x=1773736299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YxUt+6AnvsVdpyhe0i19oU/5VfmkmpEc3jsbfqOm6Io=;
 b=eGfMc90Nur8n9kwqplHp4GOHNR6MiC8egoqxWmiwfgOOvAqo6+Iru5P1
 GHqINt5YWkIIvoQJKRbZvM4FpYEghmJvP8bTuaJm8+1DjHPyWGSR3bKsf
 QyvYWtjANWhyc7/uVZe5jKLSpV5HLQqb7H29uJz4lHHXTLvFp8OLqa3g0
 ONqIwA4DmaLUnpRsEvqrCrekdzzzWZ4FoBMGZt+JTdAt0REzS+t1LR4ll
 48XtFI4Jykrn64iphUVF6Kx26K71t1mb4f8MEs61AIPmwb1oc7IsBo2DQ
 cdzLrj4qrt7nzf4YVGDpY0BdHOVSNo6qtd3SzGl5/BUbFN2JCKKtPwdeM w==;
X-CSE-ConnectionGUID: UocXQSbMRYeEIeDxpnGM0g==
X-CSE-MsgGUID: 9TfWoPQ1QmSQwSZ0liDT8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43166090"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="43166090"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 01:31:39 -0700
X-CSE-ConnectionGUID: 1hJaBwAwROKcIvqHjVExVQ==
X-CSE-MsgGUID: b8K+TSmLSc+q11YynUdhjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="127056564"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 01:31:37 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH <i-g-t> v1 0/2] Add support for Xe in runtime-pm
Date: Mon, 17 Mar 2025 13:58:21 +0530
Message-Id: <20250317082823.1631744-1-soham.purkait@intel.com>
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
  Add support for xe in runtime pm
  lib/igt_device_scan: Add driver field to igt_device_card struct

 lib/igt_device_scan.c |  4 ++++
 lib/igt_device_scan.h |  1 +
 tools/intel_pm_rpm.c  | 28 ++++++++++++++++------------
 3 files changed, 21 insertions(+), 12 deletions(-)

-- 
2.34.1

