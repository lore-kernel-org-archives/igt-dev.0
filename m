Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D028C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 13:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9048810E66F;
	Tue, 25 Jun 2024 13:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wg9V/oyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E403110E66B
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719323650; x=1750859650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MGC0dxhC4vCQodCm3kKCD3bQqmDfcwUUQtcQ21qCSnM=;
 b=Wg9V/oyhT3oyR3RK/BxRAJGw8cN8TncMA2D9CNxk4Fl3cI/qXGwURnI8
 s+BvFs7luGEingLng3BsB21rvnOtZfR7945ul/eT/k5ekXpF1Op1n4ZnS
 2fsYfeoidG+N8VnXsnZcK2L3e39oHwgc/q9G5dsFRIip0/8815ivEXvde
 KaT6Mzrk8/i+svKKHMOZgvSZU8g+9UPzEmAGc2mcw7dBqAXBhwqkUMs6S
 /DmmQRzlVK4JoSfnBaSP2Iahrr2Ihd2I7W3I7Y9wPV/bpXpcQiFc1/T7p
 8rkSbFRid/bWZj+r4xDAcf/Ku2a05R/Go0RGg4YNiqS98LnI0JS3swQEk Q==;
X-CSE-ConnectionGUID: dxfIzQU4S76MXFo9avu/zw==
X-CSE-MsgGUID: gbWayfGESsikmj9+FHh36Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16486686"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16486686"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 06:54:09 -0700
X-CSE-ConnectionGUID: HQbU+HdCTMiCpLxim9/LpA==
X-CSE-MsgGUID: whGHfFHsQhOtcCqM2pB+1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48644173"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 06:54:09 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/3] tests/chamelium: fixes for chamelium tests
Date: Tue, 25 Jun 2024 19:36:02 +0530
Message-Id: <20240625140605.1420518-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

add support for xe driver in i915_hpd_storm_ctl debugfs cleanup
Prefer HDMI connector over DP for chamelium_color tests

Kunal Joshi (3):
  lib/igt_debugfs: handle xe driver as well
  tests/chamelium/kms_chamelium_color: plug ports before starting the
    test
  tests/chamelium/kms_chamelium_color: prefer HDMI port for color tests
    to avoid DP FSM failures

 lib/igt_debugfs.c                     |  2 +-
 tests/chamelium/kms_chamelium_color.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.25.1

