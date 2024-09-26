Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DD8CDE00E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 14:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298E010EB6A;
	Thu, 26 Sep 2024 14:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEfPn9CU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A801010EB6A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727361803; x=1758897803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=obpNA7KZA+eA325oIlemPkH2peBFtTxQ8UsLPp6F67w=;
 b=GEfPn9CUsC2UVKPq57HQmipfNhiVSwlTDwQXwBTlxAIfLGuJoQQ5ofve
 1eZmTCkdg3Z0SAE1Yz91gvbw7DQOB1OsQDoelfQKlYfUM94K+zBwwkGZb
 rkcRlRmFv8ImADU99T18KeQLx0NIBNj+Kz25Yj1XtjF2NxRPk1OhfqIOv
 wSqqFz9hAX8gGg6O9kKOsHqFxGzfRCHbGoLQdzLFma3o0ahTMAQ9bbyP2
 gbATVQ15zxHITgFVtLLYcVbl6EkgJJZutavtUswW0VLKpYIZQcKjhdLyh
 xbSotGKtet8zo9CaFtZ9a84iVfmn5w5d5R0+atyTowFmR8E+HeNL3oDEV g==;
X-CSE-ConnectionGUID: 3SJtIhZwS2KIhLc57A4Z9g==
X-CSE-MsgGUID: rc/0AS7jSJen+VBA58QZFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37046246"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="37046246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:43:22 -0700
X-CSE-ConnectionGUID: E9bsq77GRoyB9bTDhWCg+A==
X-CSE-MsgGUID: R3y52XueRVCywunBqcuz2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72256492"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 07:43:21 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v6 0/4] Add new test to validate adaptive sharpness
 filter
Date: Thu, 26 Sep 2024 20:15:56 +0530
Message-Id: <20240926144600.1212192-1-swati2.sharma@intel.com>
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
 tests/kms_sharpness_filter.c                  | 748 ++++++++++++++++++
 tests/meson.build                             |   3 +
 5 files changed, 1026 insertions(+)
 create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
 create mode 100644 tests/kms_sharpness_filter.c

-- 
2.25.1

