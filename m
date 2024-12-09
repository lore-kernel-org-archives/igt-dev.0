Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25BAE7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 11:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEEA10E341;
	Mon,  9 Dec 2024 11:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gpc+AKWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FD410E6E8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 11:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733744615; x=1765280615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YTIoOkaJwWe6QwztFiAukUjVlA29OVvZUpWA5STXkrI=;
 b=Gpc+AKWTye8hd37Wl8S3XTZXd+WTKRIvefl8dCoFmowBNDitUbdkNet+
 L4IBBMzbHJDZQV9Fi4C7TFwGQtcs+3MChXzUF5ozWyge7m3V2dmXFQo8U
 uqgpQn7feAtq99k3S9MhZhJGT8AjeBiY3uexUOV1ttNGdLpyiE7eutLea
 ghX/rCZ28oVPtpaGXFWM37KF/dol3Vl3pyMB5CjuVxrPcsA/NtT9Ykiso
 gaKlDzyAhr5dyu5N/C/ph9TFN/LXuYtoiT90gbTU8he5WCBg3CxTPRmLv
 syg3B1TOAUgTtwtbNnzngU/VzgsH/jb1TQgTTjGejyILcbe3oKILWeSao Q==;
X-CSE-ConnectionGUID: AuqIWVvQQuay7cXic/GIJg==
X-CSE-MsgGUID: BdxQA19wSdCEVI/7Dw0j3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34182060"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34182060"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 03:43:34 -0800
X-CSE-ConnectionGUID: ociAFojuRWm8tnNiTOoTyQ==
X-CSE-MsgGUID: 1bWRmQEvRCW6bRpvN7hK6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99503134"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:43:33 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/9] Add new test to validate adaptive sharpness filter
Date: Mon,  9 Dec 2024 17:16:14 +0530
Message-Id: <20241209114623.1843033-1-swati2.sharma@intel.com>
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
 tests/kms_sharpness_filter.c                  | 754 ++++++++++++++++++
 tests/meson.build                             |   3 +
 5 files changed, 1022 insertions(+)
 create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
 create mode 100644 tests/kms_sharpness_filter.c

-- 
2.25.1

