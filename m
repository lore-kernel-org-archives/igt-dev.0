Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8302E7716B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 08:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9186610E498;
	Wed,  4 Dec 2024 08:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+jSOTiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EC510E498
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733300615; x=1764836615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j5jwFleCraOLhJ2e2t+Thp0hobqT1NUauNwdd1KFTkA=;
 b=F+jSOTiY3Nkc/wlX3LwmdUxzeH1Kqi/qmQRzPRJAsScbiZCg//lrkTHQ
 FBZbbYQzle8xm+oHKr7r2kumg6qvQuS0pSwmWXYhu3B36bXuNXtZA09Rf
 YReUuYaW1fTHl/mOLaVFMIRDVQ+svHnysHZC56tpAt4Vv89H1aI3X2QXB
 V1puyVMBHTdJ7XaJ4wl/hRKvYylTg2nNeJvP/h8niADHGdSDNK5KV3IcQ
 /vzrsvO0phYIYG4fPTCXhJVvpQScbEB8ihL4CzGrzeS3AgRBHgvPFTbUb
 VmcHO2TiX7bR7LT4cHT4If6f/LneV6W4hvxvonaZh+IAw8Y2TDHz7GlGJ A==;
X-CSE-ConnectionGUID: ozanjAJHTaqiR6PF6XcHEg==
X-CSE-MsgGUID: hsvrwhLpSrOBDlkmUA2eWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44163530"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44163530"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 00:23:34 -0800
X-CSE-ConnectionGUID: 4SyTH3T+SmWbzbKhysqqXw==
X-CSE-MsgGUID: uEMFD+5ASOCfWdhWVdmp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98768687"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 00:23:34 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v9 0/9] Add new test to validate adaptive sharpness
Date: Wed,  4 Dec 2024 13:56:18 +0530
Message-Id: <20241204082627.1800617-1-swati2.sharma@intel.com>
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


Swati Sharma (9):
  lib/igt_kms: Add "sharpness strength" as crtc property
  lib/igt_kms: Add func() to return scaling mode name string
  tests/kms_sharpness_filter: Add adaptive sharpness basic filter tests
  tests/kms_sharpness_filter: Add toggle subtest
  tests/kms_sharpness_filter: Add filter-tap subtest
  tests/kms_sharpness_filter: Add dpms/suspend subtests
  tests/kms_sharpness_filter: Add scaler subtests
  tests/kms_sharpness_filter: Add invalid subtests
  tests/chamelium/kms_chamelium_sharpness_filter: Add basic test

 lib/igt_kms.c                                 |  23 +
 lib/igt_kms.h                                 |   2 +
 .../kms_chamelium_sharpness_filter.c          | 240 ++++++
 tests/kms_sharpness_filter.c                  | 755 ++++++++++++++++++
 tests/meson.build                             |   3 +
 5 files changed, 1023 insertions(+)
 create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
 create mode 100644 tests/kms_sharpness_filter.c

-- 
2.25.1

