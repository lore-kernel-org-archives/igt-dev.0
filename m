Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0909C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 08:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A6010E78A;
	Thu, 23 Jan 2025 08:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brkyV2e+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3708210E78A
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 08:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737619910; x=1769155910;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2ucTXJgSGffYrgGso4rrMuo8uoLn/XPiV/A2E32BvXQ=;
 b=brkyV2e+PMAP169lZHsAYdAj2ONStLD19DIUxu01bXUdzRJ8/E6T6oio
 zGiCIyCilnncg+w4qcDTQggwqxpXkhj4peOtOVSOf4acCG8bNu44UDeH0
 iUNGs85mgb8o83jP9dBn/LNEDVvvISAzzXM38U0kuuNnE7tfcrP4ByiFR
 L2EA733pv8UpWLroplCdAOQx7z0xYjBrskBqy0RyZFNk3pWH3AxFketgo
 sXF24rH7EYGe+ToMMOiG+XAbWdztkXS+VkW4ZkKu4U+ogyyxSknsRorgk
 ZEIAB/TpFKzxtPtGEdZGN31c9R9X8S5c2KSO/GGc4EQXF3lQg0/ransJ4 Q==;
X-CSE-ConnectionGUID: gioErnrrR6uq0uGJ4vri9Q==
X-CSE-MsgGUID: hqoNjtxzQxu8w5CRM8MDSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38272070"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="38272070"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 00:11:50 -0800
X-CSE-ConnectionGUID: MbitDcJUS56Ond/mcpOWEQ==
X-CSE-MsgGUID: 2kHoBRhmQr2oNluQIiXFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="107201756"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 00:11:48 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 0/1] RFC tests/intel/kms_frontbuffer_tracking:
 Introduce plane-fbc-dr test
Date: Thu, 23 Jan 2025 13:40:13 +0530
Message-Id: <20250123081014.120066-1-santhosh.reddy.guddati@intel.com>
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

Use the FP_DAMAGE_CLIPS property of the plane for non psr modes
and fill the damaged rectangles on the plane with framebuffer
coordinates and verify that fbc dirty ctl is enabled.

Santhosh Reddy Guddati (1):
  tests/intel/kms_dirty_fbc: Add kms_dirty_fbc test for DIRTYFB ioctl
    with fbc

 tests/intel/kms_dirty_fbc.c | 236 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 2 files changed, 237 insertions(+)
 create mode 100644 tests/intel/kms_dirty_fbc.c

-- 
2.34.1

