Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16167D3DEA9
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 19:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B431210E970;
	Fri, 18 Oct 2024 19:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8ikoU0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2673F10E970
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 19:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729278225; x=1760814225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mayJ22Nwa4dzb1xOqIfEQgoJ7dAoRXpqJeC/eca5o14=;
 b=D8ikoU0UArkZ/7wraFsmqtQp+Bvf5GAJXsXZqTlHA1bRsVLNJ9B68/uy
 hrK9Vursy0McNearIgfZQDt/Vr0AfLbmUEKUl/ccC2KTu7cQqmPytQtNm
 Dqt5x6rl3q1VcKeCJUxLkExTSs1clng9JU/V1OEE0I8ZwebA+qbCJSvtd
 1oWhj8p0Mdd7/GND/6ybAJrt1efPhYTt7vXoPZPSQdNfin0wVgvPswXuQ
 +0e2iECK2BD8W2E6ltHd0pxpp3AvmS8MVl9E1DY9dxu96RFRJIIteaqjL
 kqLf52WP/+P1axoYRaJeOP0i70RY5TWmgEItJYoGCOCDvZo4k024fgeTo Q==;
X-CSE-ConnectionGUID: aDINtv/LSgqVkGx4EOyqGw==
X-CSE-MsgGUID: zl/2H9vUQTScSfipvl06JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40218778"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="40218778"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 12:03:44 -0700
X-CSE-ConnectionGUID: KLynrGafTA6HS17vJydMAQ==
X-CSE-MsgGUID: u6Yr1hxwReS0VPJNGRyMtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="102247810"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 12:03:43 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v7 0/4] Add new test to validate adaptive sharpness
 filter
Date: Sat, 19 Oct 2024 00:36:23 +0530
Message-Id: <20241018190627.1367970-1-swati2.sharma@intel.com>
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

New test is added to validate adaptive sharpness filter on
LNL platform. Pipe scaler is repurposed to perform a portion
of this work. This means pipe scaling will be unavailable while
the sharpening function is being used. The other scaler can be
used for plane scaler.

In this series, attempt is made to validate adaptive sharpness
solution which helps in improving the image quality. For this new
CRTC property is added. The user can set this property with desired
sharpness strength value with 0-255. A value of 1 representing
minimum sharpening strength and 255 representing maximum
sharpness strength. A strength value of 0 means no sharpening or
sharpening feature disabled.

KMD: https://patchwork.freedesktop.org/series/138754/

Swati Sharma (4):
  lib/igt_kms: Added "sharpness strength" as crtc property
  lib/igt_kms: Added func() to return scaling mode name string
  tests/kms_sharpness_filter: Add adaptive sharpness filter test
  tests/chamelium/kms_chamelium_sharpness_filter: Add adaptive sharpness
    chamelium filter test

 lib/igt_kms.c                                 |  23 +
 lib/igt_kms.h                                 |   2 +
 .../kms_chamelium_sharpness_filter.c          | 250 ++++++
 tests/kms_sharpness_filter.c                  | 750 ++++++++++++++++++
 tests/meson.build                             |   3 +
 5 files changed, 1028 insertions(+)
 create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
 create mode 100644 tests/kms_sharpness_filter.c

-- 
2.25.1

