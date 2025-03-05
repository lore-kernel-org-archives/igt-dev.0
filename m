Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE43C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 10:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BE210E06E;
	Wed,  5 Mar 2025 10:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlXpm0y8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3700110E06E
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 10:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741170584; x=1772706584;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FSTw2B6JWLoj+ws0xHMTqHcL8Qe7aXGREaRP85pUivE=;
 b=RlXpm0y8wDw+hkEtCl3rE6kzzmke1kjiwm1k2k0HSpL7fgm5GELHxiAE
 NgnQ9DhtE7+jgF5xSO2kQoXpRBlGLwF5Ceo2nNslaC3MobtyxvaDnA0tG
 EA10Yq1dwaKqI0xOyJWYnjJsrZ7whoUo+Eug1A2jatVC0m5o0a+qIwbzU
 hZMN2rwb81+ClbXce/knuc46At/ncP1/RMqKeN/AfvJyQjY6ZN8Lrv+gg
 JNdu+TPIS7bRgHxRNG8N6pAFTTqkJenkSSByF6/D+llD1DybfSFXhnYgJ
 xUjmBtphOaMylE4rJIGJAa6MP4Z3HDxQMI+FEZJDJDMvPQqX0p1kVU6Rx Q==;
X-CSE-ConnectionGUID: VpvEq261Tcunykvh+gV6UA==
X-CSE-MsgGUID: 2wwoUtO0RYO8lX/q7vj9/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53116521"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="53116521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:29:44 -0800
X-CSE-ConnectionGUID: 32FPUIGwRQKGXG3R5ja6MQ==
X-CSE-MsgGUID: TNZe3gtwSPq/4U6vTdZQsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="119323881"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.55])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:29:42 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH i-g-t 0/2] FBC dirty rect tests
Date: Wed,  5 Mar 2025 12:28:40 +0200
Message-ID: <20250305102855.137224-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

FBC dirty rect tests.

List of tests used to check fbc dirty rect feature

Santhosh Reddy Guddati (1):
  tests/intel/kms_dirty_fbc: Add kms_dirty_fbc test for DIRTYFB ioctl
    with fbc

Vinod Govindapillai (1):
  RFC FBC dirty rect tests

 tests/intel/kms_fbc_dirty_rect.c | 652 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 653 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

-- 
2.43.0

